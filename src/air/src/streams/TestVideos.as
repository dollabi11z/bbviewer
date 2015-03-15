package streams 
{
	/**
	 * ...
	 * @author 
	 */
	public class TestVideos implements ChannelInterface
	{
		private static var channelStreams:Object = [
			{ label: "HLS: Bip Bop", url: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8" },
			{ label: "MSS DASH: Elephants Dream 1080p", url: "http://wams.edgesuite.net/media/MPTExpressionData01/ElephantsDream_1080p24_IYUV_2ch.ism/manifest(format=mpd-time-csf)" },
			{ label: "MSS DASH: Big Buck Bunny 1080p", url: "http://wams.edgesuite.net/media/MPTExpressionData02/BigBuckBunny_1080p24_IYUV_2ch.ism/manifest(format=mpd-time-csf)" },
			{ label: "Adobe F4M: Http Live Stream", url: "http://multiformatlive-f.akamaihd.net/z/demostream_1@2131/manifest.f4m" },
			{ label: "RTMP: Dynamic Streaming VOD", url: "http://mediapm.edgesuite.net/osmf/content/test/smil/elephants_dream.smil" },
			{ label: "Adobe F4M: Http Streaming VOD", url: "http://zerihdndemo-f.akamaihd.net/z/h264/darkknight/darkknight.smil/manifest.f4m" },
			{ label: "Progressive FLV", url: "http://mediapm.edgesuite.net/strobe/content/test/AFaerysTale_sylviaApostol_640_500_short.flv" }
		];

		public function getName():String
		{
			return "Test Video Streams";
		}
		 
		public function getStreams():Object
		{
			return channelStreams;
		}
		
	}

}