/*
 * ExtendedNativeWindow is an extension of NativeWindow so we can handle multiple window instances from our application.
 * It is the window that will hold the 'AppWindow' instance, and is created automatically when the user requests a
 * new window.
 */
package 
{
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.events.Event;
	import mx.events.*;
	import mx.managers.WindowedSystemManager;
	import mx.core.UIComponent;
	
	[Event(name="creationComplete", type="mx.events.FlexEvent")] 
	
	public class ExtendedNativeWindow extends NativeWindow
	{
		private var _systemManager:WindowedSystemManager;
		private var _content:UIComponent;
		
		public function ExtendedNativeWindow(initOptions:NativeWindowInitOptions = null)
		{
			//* Call the base class constructor
			super(initOptions);
			//* Add in a listener for the Activate event - this is where we add in the content
			addEventListener(Event.ACTIVATE, windowActivateHandler);
			//* Add in a close listener so we can tidy up when the window closes
			addEventListener(Event.CLOSE, closeWindowHandler);
			
		}
		
		//* Custom function to allow the content to be passed into the window
		public function addChildControls(control:UIComponent):void 
		{
			_content = control;	
		}
		
		//* This handler actually adds the content to the NativeWindow
		private function windowActivateHandler(event:Event):void 
		{
			//* Process the event
			event.preventDefault();
			event.stopImmediatePropagation();
			removeEventListener(Event.ACTIVATE, windowActivateHandler);
			
			//* Create the children and add an event listener for re-sizing the window
			if(stage) 
			{
				//* create a WindowedSystemManager to hold the content
				if(!_systemManager) 
				{
					//* Add an event listener for closing the window
					_content.addEventListener(CloseEvent.CLOSE, contentCloseHandler);
					//*	Create a system manager
					_systemManager = new WindowedSystemManager(_content);
				}
				
				//* Add the content to the stage
				stage.addChild(_systemManager);
				
				//* Dispatch a creation complete event
				dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
				
				//* Add in a resize event listener
				stage.addEventListener(Event.RESIZE, windowResizeHandler);
			}
		}
		
		//* Resizes the content in response to a change in size
		private function windowResizeHandler(event:Event):void 
		{
			_content.width = stage.stageWidth;
			_content.height = stage.stageHeight;
		}

		//* Receives a close event from the NativeWindow content
		private function contentCloseHandler(event:Event):void
		{
			this.close();
		}
		
		//* Tidy everything up when the window closes
		private function closeWindowHandler(event:Event):void 
		{
			removeEventListener(Event.RESIZE, windowResizeHandler);
			_systemManager.removeChild(_content);
			stage.removeChild(_systemManager);
			_content = null;
			_systemManager = null;
		}
	}
}