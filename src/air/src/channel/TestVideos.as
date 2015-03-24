package channel 
{
	/**
	 * ...
	 * @author 
	 */
	public class TestVideos extends Channel
	{
		import objects.StreamObject;
		import objects.ChannelCategory;
		import objects.AlternateAngleObject;
		import objects.BookmarkObject;
		
		private static var data:Object = {
			label: "Test Videos",
			categories: [
				{ id: "hls", label: "Apple HLS (.m3u8)" },
				{ id: "hds", label: "Adobe HDS (.f4m)" },
				{ id: "mss", label: "Microsoft Smooth Streaming (.ism)" },
				{ id: "other", label: "Other" }
			],
			streams: [
				{ category: "hls", label: "HLS: Bip Bop", url: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8" },
				{ category: "mss", label: "MSS DASH: Elephants Dream 1080p", url: "http://wams.edgesuite.net/media/MPTExpressionData01/ElephantsDream_1080p24_IYUV_2ch.ism/manifest(format=mpd-time-csf)" },
				{
					category: "mss",
					label: "MSS DASH: Big Buck Bunny 1080p",
					url: "http://wams.edgesuite.net/media/MPTExpressionData02/BigBuckBunny_1080p24_IYUV_2ch.ism/manifest(format=mpd-time-csf)",
					bookmarks: [
						{
							id: 1,
							category: "Common",
							label: "Seek test",
							desc: "This is a seek test 60 seconds into the video",
							seek: 60
						}
					]
				},
				{ category: "hds", label: "Adobe F4M: Http Live Stream", url: "http://multiformatlive-f.akamaihd.net/z/demostream_1@2131/manifest.f4m" },
				{ category: "other", label: "RTMP: Dynamic Streaming VOD", url: "http://mediapm.edgesuite.net/osmf/content/test/smil/elephants_dream.smil" },
				{ category: "hds", label: "Adobe F4M: Http Streaming VOD", url: "http://zerihdndemo-f.akamaihd.net/z/h264/darkknight/darkknight.smil/manifest.f4m" },
				{ category: "other", label: "Progressive FLV", url: "http://mediapm.edgesuite.net/strobe/content/test/AFaerysTale_sylviaApostol_640_500_short.flv" }
			]
		}

		public function TestVideos()
		{
			loadChannelData( data );
		}
		
	}

}