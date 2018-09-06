package
{
	import contents.TextFile;
	
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.LocationChangeEvent;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	import stageManager.StageManager;
	
	import otherPlatforms.tablighan.TablighanBanner;
	
	import spark.primitives.Rect;
	
	public class Main extends MovieClip
	{

		private var sw:StageWebView;

		private var areaMC:Rectangle;

		private var targetFile:File;
		public function Main()
		{
			StageManager.setUp(stage,0,0,true)			
			super();
			
			
			areaMC = (Obj.get("small_mc",this) as MovieClip).getBounds(this) ;
			//areaMC.x = areaMC.y = 0 ;
			
			var mainFile:File = File.applicationDirectory.resolvePath("feed.htm"); 
			targetFile = mainFile.clone();// File.documentsDirectory.resolvePath('htmlfile.htm');
			//mainFile.copyTo(targetFile,true);
			
			trace("Is file copied?? "+targetFile.nativePath+" ? "+targetFile.exists);
			
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE,showBannerAgain);
			
			//showBannerAgain();
			
		}
		
		protected function showBannerAgain(event:Event=null):void
		{
			if(sw!=null)
			{
				sw.stage = null ;
				sw.dispose();
				sw = null ;
				trace("Clean the stage");
				//return ;
			}
			
			
			trace("Reload");
			
			sw = new StageWebView(false);
			sw.addEventListener(LocationChangeEvent.LOCATION_CHANGE,controllLocationChange);
			sw.addEventListener(LocationChangeEvent.LOCATION_CHANGING,controllLocationChanging);
			
			sw.viewPort = areaMC ;
			sw.stage = stage ;
			
			//TablighanBanner
			
			//targetFile.nativePath
			//"http://api.tablighon.com/api/feed?HostId=1d9163b3-fd60-415a-be59-6e92f832ff22"
			sw.loadURL("http://tablighon.com/Uploads/1654ea7e-a2d8-416b-8056-c780aab363ec.mp4");//
			//sw.loadString(TextFile.load(File.applicationDirectory.resolvePath("feed.htm")));//
			sw.mediaPlaybackRequiresUserAction = true ;
		}
		
		protected function controllLocationChanging(event:LocationChangeEvent):void
		{
			trace("Location changing : "+sw.location+" vs "+event.location);
		}
		
		protected function controllLocationChange(event:LocationChangeEvent):void
		{
			trace("Location change : "+sw.location+" vs "+event.location);
		}
	}
}