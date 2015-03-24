package objects 
{
	/**
	 * ...
	 * @author 
	 */
	public class VideoDataObject 
	{
		[Bindable]
		public var url:String;
		[Bindable]
		public var isProgressive:Boolean;
		[Bindable]
		public var playing:Boolean;
		[Bindable]
		public var seeking:Boolean;
		[Bindable]
		public var paused:Boolean;
		[Bindable]
		public var buffering:Boolean;
		[Bindable]
		public var currentTime:Number;
		[Bindable]
		public var bufferTime:Number;
		[Bindable]
		public var duration:Number;
		[Bindable]
		public var displayTime:String;
		[Bindable]
		public var isDynamicStream:Boolean;
		[Bindable]
		public var autoDynamicStreamSwitch:Boolean;
		[Bindable]
		public var currentDynamicStreamIndex:Number;
		[Bindable]
		public var numDynamicStreams:Number;
		[Bindable]
		public var bitratesForDynamicStreams:Array = new Array();
	}

}