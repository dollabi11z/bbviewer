package objects 
{
	/**
	 * ...
	 * @author 
	 */
	public class VideoDataObject 
	{
		public var playing:Boolean;
		public var seeking:Boolean;
		public var paused:Boolean;
		public var buffering:Boolean;
		public var currentTime:Number;
		public var bufferTime:Number;
		public var duration:Number;
		public var displayTime:String;
		public var isDynamicStream:Boolean;
		public var autoDynamicStreamSwitch:Boolean;
		public var currentDynamicStreamIndex:Number;
		public var numDynamicStreams:Number;
		public var bitratesForDynamicStreams:Array = new Array();
	}

}