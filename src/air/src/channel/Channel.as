package channel 
{
	import com.adobe.serialization.json.JSON;
	import mx.collections.ArrayCollection;
	import mx.collections.XMLListCollection;
	import objects.VideoDataObject;
	/**
	 * The Channel class allows BBViewer to pull in content from various locations,
	 * to make it available in the Adobe Air player.
	 * 
	 * An extended Channel class (i.e. TestVideos) loads channel data with included streams, and its functions will be called
	 * allowing it to modify the url, seek time and more from different user interactions (onStreamStart, onLoadBookmark,
	 * onAngleChange, etc)
	 * 
	 * The RemoteChannel class can load channel data from json. In the future, external json channels may also be able
	 * to handle interactions through the use of an API.
	 * 
	 * ...
	 * @author 
	 */
	public class Channel
	{
		import objects.StreamObject;
		import objects.ChannelCategory;
		import objects.AlternateAngleObject;
		import objects.BookmarkObject;
		
		[Bindable]
		public var label:String;
		[Bindable]
		public var categories:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var filteredStreams:ArrayCollection = new ArrayCollection();
		protected var streams:ArrayCollection = new ArrayCollection();
		
		//assist in reading json
		public function readJson( data:String ):Object
		{
			return com.adobe.serialization.json.JSON.decode( data );
		}
		
		//load channel data from json
		public function loadChannelJson( content:String ):void
		{
				loadChannelData( com.adobe.serialization.json.JSON.decode(content) );
		}
		
		//load channel data from object
		public function loadChannelData( data:Object ):void
		{
			this.label = data.label;
			Main.logger.log( "Loading Channel Data: " + data.label );

			//load channel categories
			categories.removeAll();
			if ( data.categories != null )
			{
				Main.logger.log( "   categories: " + data.categories.length );
				for each( var cat:Object in data.categories )
				{
					var sc:ChannelCategory = new ChannelCategory();
					sc.channel = this;
					sc.id = cat.id;
					sc.label = cat.label;
					categories.addItem( sc );
				}
			}

			if ( data.streams != null )
			{
				var count:Number = 0;
				Main.logger.log( "   streams: " + data.streams.length );
				for each( var stream:Object in data.streams )
				{
					count++;
					Main.logger.log( "      stream " + count + ": " + stream.label );
					var so:StreamObject = new StreamObject();
						so.channel = this;
						so.id = stream.id;
						so.category = stream.category;
						so.label = stream.label;
						so.desc = stream.desc;
						so.url = stream.url;
						if ( stream.angles != null )
						{
							Main.logger.log( "         angles: " + stream.angles.length );
							for each( var angle:Object in stream.angles )
							{
								var sa:AlternateAngleObject = new AlternateAngleObject();
								sa.id = angle.id;
								sa.label = angle.label;
								so.angles.addItem( sa );
							}
						}
						if ( stream.bookmarks != null )
						{
							Main.logger.log( "         bookmarks: " + stream.bookmarks.length );
							for each( var bookmark:Object in stream.bookmarks )
							{
								var sb:BookmarkObject = new BookmarkObject();
								sb.id = bookmark.id;
								sb.category = bookmark.category;
								sb.label = bookmark.label;
								sb.desc = bookmark.desc;
								sb.url = bookmark.url;
								sb.seek = bookmark.seek;
								sb.data = bookmark.data;
								so.bookmarks.addItem( sb );
							}
						}
						streams.addItem( so );
				}
				filterStreams("");
			}
		}

		//filter stream list based on selected subchannel
		public function filterStreams( category:String = "" ):void
		{
			filteredStreams.removeAll();
			for each( var item:StreamObject in streams )
			{
				if ( category == null || category == "" ||  item.category.toLowerCase() == category.toLowerCase() ) filteredStreams.addItem( item );
			}
		}
		
		//allow classes to modify stream object or perform initialization
		public function onStreamStart( stream:StreamObject ):void
		{
			
		}
		
		//allows classes to modify stream url based on the bookmark being loaded
		public function onLoadBookmark( stream:StreamObject, bookmark:BookmarkObject ):void
		{
			stream.seek = bookmark.seek;
		}
		
		public function onAngleChange( stream:StreamObject, angle:AlternateAngleObject ):void
		{
			
		}
		
		//allows classes to update the display text
		public function onUpdateDisplayText( stream:StreamObject, player:VideoDataObject ):String
		{
			return player.displayTime;
		}
		
		//onURLRequest
		//requiresAuth
		//supportsFlashbacks
		//supportsCalendar
		//supportsThumbPreviews
		//onRequestThumbPreview
		//isLive
		//calendarStartDate
		//calendarEndDate
	}

}