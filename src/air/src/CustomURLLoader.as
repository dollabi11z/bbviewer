package
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/*
	 * CustomURLLoader handles the request of url downloads
	 * It doesn't make the request until you call the download() method
	 */
	public class CustomURLLoader extends URLLoader
	{
		private var listener:Function;
		private var request:URLRequest
		public var desc:String;
		public var url:String;
		public var object:Object;
		
		public function CustomURLLoader(desc:String, url:String, listener:Function)
		{
			request = new URLRequest(url);
			this.desc = desc;
			this.url = url;
			this.listener = listener;
			super(request);
			addEventListener(Event.COMPLETE, listener);
		}
		
		public function download():CustomURLLoader
		{
			Main.logger.log ("CustomURLLoader: downloading " + desc + " at: " + url);
			load(request);
			return this;
		}
		
		override public function load(request:URLRequest):void
		{
			super.load(request);
		}
		
		
	}
}