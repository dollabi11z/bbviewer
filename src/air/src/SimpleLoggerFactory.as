package 
{
	import org.osmf.logging.Logger;
    import org.osmf.logging.LoggerFactory;
	
	/**
	 * ...
	 * @author HANGIL LEE
	 */
	public class SimpleLoggerFactory extends LoggerFactory
	{
		
		public function SimpleLoggerFactory() 
		{
			super();
		}
		
		override public function getLogger(category:String):org.osmf.logging.Logger
        {
            return new SimpleLogger(category);
        }
	}

}