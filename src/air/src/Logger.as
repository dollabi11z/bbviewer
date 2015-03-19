package
{
    import flash.system.System;
	
    public class Logger
    {
		import flash.filesystem.FileStream;
		import flash.filesystem.File;
		import flash.filesystem.FileMode;
		
		private var LOGFILE:String = "logfile.txt";
		
		private var fs:FileStream = new FileStream();
		private var f:File;
		
		public var isEnabled:Boolean = false;
		
        public function Logger()
        {	
			f = new File(File.applicationStorageDirectory.nativePath);
			f = f.resolvePath(LOGFILE);
		}
		
        public function log(whatToLog : String) : void
        {
			var now : Date = new Date();
            var dif : Number;
            var returnString : String;
            
            returnString = now.toLocaleDateString() + " " + now.toLocaleTimeString() + ": ";
            returnString += whatToLog;
			returnString += "\r\n";
			trace(returnString);
			
			if (isEnabled) writeToFile(returnString);
        }

		private function writeToFile(whatToWrite : String) : void
		{	
			fs.open(f, FileMode.APPEND);
			fs.writeUTFBytes(whatToWrite);
			fs.close();
		}

    }
}