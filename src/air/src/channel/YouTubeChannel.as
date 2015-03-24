package channel 
{
	import objects.StreamObject;
	/**
	 * ...
	 * @author 
	 */
	public class YouTubeChannel extends Channel 
	{
		import flash.events.Event;
		private var ytchannel:String;
			
		public function YouTubeChannel( channel:String, label:String = null ) 
		{
			ytchannel = ( label != null ) ? label : channel;
			var url:String = "https://gdata.youtube.com/feeds/api/videos?q=" + channel + "&v=2&alt=jsonc&order_by=published";
			var loader:CustomURLLoader = new CustomURLLoader("YouTube channel download", url, onReceiveChannel ).download();
		}

		private function onReceiveChannel( event:Event ):void
		{
			var loader:CustomURLLoader = ( event.target as CustomURLLoader );
			var json:Object = readJson( loader.data );

			var data:Object = new Object();
			data.label = "YouTube ( " + ytchannel + ")";
			for each( var item:Object in json.data.items )
			{
				categories.addItem( item.category );
				var s:StreamObject = new StreamObject();
					s.id = item.id;
					s.label = item.title;
					s.desc = item.description;
					s.url = item.content['5'];
				streams.addItem( s );
			}
			loadChannelData( data );
		}
	}
}