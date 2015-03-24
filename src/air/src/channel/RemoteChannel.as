package channel 
{
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONDecoder;
	import flash.events.Event;
	import mx.collections.ArrayCollection;
	/**
	 * ...
	 * @author 
	 */
	public class RemoteChannel extends Channel
	{
		import objects.ChannelCategory;
		import objects.StreamObject;
		import objects.AlternateAngleObject;
		
		private var remoteUrl:String;
		
		public function RemoteChannel( url:String ) 
		{
			remoteUrl = url;
			var loader:CustomURLLoader = new CustomURLLoader("Remote channel download", remoteUrl, onReceiveChannel ).download();
		}
		
		private function onReceiveChannel( event:Event ):void
		{
			var loader:CustomURLLoader = ( event.target as CustomURLLoader );
			try
			{
				loadChannelJson( loader.data );
			} catch ( err:Error )
			{
				Main.logger.log( "Error parsing data for channel: " + remoteUrl );
			}
		}
	}

}