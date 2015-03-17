package 
{
	/**
	 * ...
	 * @author 
	 */
	public class Helper 
	{
		import org.osmf.events.MediaFactoryEvent;
		import org.osmf.media.DefaultMediaFactory;
		import org.osmf.media.PluginInfoResource;
		import com.akamai.osmf.AkamaiAdvancedStreamingPluginInfo;
		import com.microsoft.azure.media.AdaptiveStreamingPluginInfo;
		import org.denivip.osmf.plugins.HLSPluginInfo;
		import org.osmf.youtube.YouTubePluginInfo;

		public static var pluginFactory:Object;
		
		public static function loadAdaptivePlugins():void
		{
			if ( pluginFactory == null )
			{
				pluginFactory = {}
				pluginFactory.hds = new DefaultMediaFactory();
				pluginFactory.hds.addEventListener( MediaFactoryEvent.PLUGIN_LOAD, onPluginLoaded );
				pluginFactory.hds.addEventListener( MediaFactoryEvent.PLUGIN_LOAD_ERROR, onPluginError );
				pluginFactory.hds.loadPlugin( new PluginInfoResource( new AkamaiAdvancedStreamingPluginInfo() ) );
				
				pluginFactory.hls = new DefaultMediaFactory();
				pluginFactory.hls.addEventListener(MediaFactoryEvent.PLUGIN_LOAD, onPluginLoaded);
				pluginFactory.hls.addEventListener(MediaFactoryEvent.PLUGIN_LOAD_ERROR, onPluginError);
				pluginFactory.hls.loadPlugin(new PluginInfoResource(new HLSPluginInfo()));
				
				pluginFactory.mss = new DefaultMediaFactory();
				pluginFactory.mss.addEventListener(MediaFactoryEvent.PLUGIN_LOAD, onPluginLoaded);
				pluginFactory.mss.addEventListener(MediaFactoryEvent.PLUGIN_LOAD_ERROR, onPluginError);
				pluginFactory.mss.loadPlugin(new PluginInfoResource(new AdaptiveStreamingPluginInfo()));
				
				pluginFactory.yt = new DefaultMediaFactory();
				pluginFactory.yt.addEventListener(MediaFactoryEvent.PLUGIN_LOAD, onPluginLoaded);
				pluginFactory.yt.addEventListener(MediaFactoryEvent.PLUGIN_LOAD_ERROR, onPluginError);
				pluginFactory.yt.loadPlugin(new PluginInfoResource(new YouTubePlugin().pluginInfo));

			}
		}
		
		private static function onPluginLoaded( event:MediaFactoryEvent ):void
		{
			trace( "Adaptive plugin loaded" );
		}
		
		private static function onPluginError( event:MediaFactoryEvent ):void
		{
			trace( "Error loading adaptive plugin" );
		}
		
		public static function convertToHHMMSS($seconds:Number):String
		{
			var s:Number = $seconds % 60;
			var m:Number = Math.floor(($seconds % 3600 ) / 60);
			var h:Number = Math.floor($seconds / (60 * 60));
			 
			var hourStr:String = (h == 0) ? "" : doubleDigitFormat(h) + ":";
			var minuteStr:String = doubleDigitFormat(m) + ":";
			var secondsStr:String = doubleDigitFormat(s);
			 
			return hourStr + minuteStr + secondsStr;
		}
		
		public static function doubleDigitFormat(num:uint):String
		{
			if (num < 10)
			{
				return ("0" + num);
			}
			return String(num);
		}

	}

}