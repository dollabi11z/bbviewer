package channel 
{
	import mx.collections.ArrayCollection;
	import mx.collections.XMLListCollection;
	/**
	 * ChannelInterface
	 * 
	 * The ChannelInterface is an interface that allows BBViewer to pull in content from various locations,
	 * to make it available in the Adobe Air player.
	 * 
	 * An interface should be able to be a class ( or a url with the use of an api?) that provides information
	 * about how to access the content that is contained in the interface.
	 * 
 	 * Remote objects can stand in for Channel classes using an API:
	 * 
	 * Master channel list included
	 * Additional channel lists can be added via url
	 * 	http://domain/channels
	 *  	returns a channel json containing a list of possible streams
	 *  
	 *  streams can either be a url, or provide the api to know how to handle the stream:
	 *  { id="mystream", label="My Stream", url: "http://some_manifest.m3u8" } 
	 *  { id="mystream", label="My Stream API", api: "http://channelapi" }
	 * 
	 * http://channelurl/load
	 * returns {
	 *   channel_name: "My Stream",
	 *   supports_alternate_angles: true,
	 *   content: { // content here }
	 * }
	 * 
	 * http://channelurl/request/10/options
	 * 	returns the url and details to access stream 
	 * 
	 * ...
	 * @author 
	 */
	public class Channel
	{
		public function getChannelName():String
		{
			return "";
		}
		
		public function getContent():Object {
			return null;
		}
		
		public function supportsAlternateAngles():Boolean {
			return false;
		}
		
		public function getAlternateAngles():ArrayCollection
		{
			return null;
		}
		
		public function onContentRequest():void
		{
			
		}
		
		public function supportsBookmarks():void
		{
			
		}
		
		public function supportsCalendar():void
		{
			
		}
		
		public function isLive():Boolean
		{
			return false;
		}
		
		public function liveStartDate( dt:Object ):void
		{
			
		}
	}

}