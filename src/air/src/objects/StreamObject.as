package objects 
{
	import channel.Channel;
	import mx.collections.ArrayCollection;
	/**
	 * ...
	 * @author 
	 */
	public class StreamObject 
	{
			[ Bindable ]
			public var channel:Channel;
			[ Bindable ]
			public var id:String;
			[ Bindable ]
			public var category:String;
			[ Bindable ]
			public var label:String;
			[ Bindable ]
			public var desc:String;
			[ Bindable ]
			public var url:String;
			[ Bindable ]
			public var seek:Number;
			[ Bindable ]
			public var angles:ArrayCollection = new ArrayCollection();
			[ Bindable ]
			public var bookmarks:ArrayCollection = new ArrayCollection();
			
			//player data is stored
			[Bindable]
			public var player:VideoDataObject;
			
			//allow classes to store custom data when working with the current stream
			public var data:Object = new Object();
			
			public function start():void
			{
				//defer stream start to the channel so it can handle loading the stream
				( channel as Channel ).onStreamStart( this );
			}
	}

}