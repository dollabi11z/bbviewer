package objects 
{
	import mx.collections.ArrayCollection;
	/**
	 * ...
	 * @author 
	 */
	public class BookmarkObject 
	{
			[ Bindable ]
			public var id:String;
			[ Bindable ]
			public var category:String;
			[ Bindable ]
			public var label:String;
			[ Bindable ]
			public var desc:String;
			[ Bindable ]
			public var url:String;
			[ Bindable ]
			public var seek:Number;
			//allow classes to store custom data when working with a bookmark
			public var data:Object = new Object();
	}

}