package
{
	import darkBox.DarkBox;
	import darkBox.ImageFile;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.StageVideoEvent;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.media.StageVideo;
	import flash.media.StageVideoAvailability;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.dns.AAAARecord;
	import flash.utils.ByteArray;
	
	import mx.utils.Base64Decoder;
	import mx.utils.Base64Encoder;
	
	import stageManager.StageManager;
	
	import videoPlayer.myVideoPlayer;
	
	import videoShow.VideoClass;
	import videoShow.VideoEvents;
	
	public class VideoCmera extends Sprite
	{
			
		private var vidFile:File ;
		
		private var videoDisplay:VideoClass ;
		
		private var camMC:MovieClip ;
		private var cam2MC:MovieClip ;
		private var cam3MC:MovieClip ;
		
		private var sampleBitmap:Bitmap;

		private var sv:StageVideo;
		
		
		public function VideoCmera()
		{
			super();
			
			StageManager.setUp(stage,0,0,false);
			
			
			/*var nc:NetConnection = new NetConnection();
			nc.connect(null);
			var ns:NetStream = new NetStream(nc);
			ns.client = this;
			
			if(true && StageVideoAvailability.AVAILABLE)
			{
				sv = stage.stageVideos[0];
				sv.addEventListener(StageVideoEvent.RENDER_STATE, onRender);
				sv.attachNetStream(ns);
				trace('available');
			} 
			else 
			{
				var vid:Video = new Video(1371, 771);
				addChild(vid);
				vid.attachNetStream(ns);
				trace('not');
			}
			
			ns.play('vid.mp4');
			return ;*/
			
			trace("Version 6");
			camMC = Obj.get("cam_mc",this);
			cam2MC = Obj.get("cam2_mc",this);
			cam3MC = Obj.get("cam3_mc",this);
			camMC.addEventListener(MouseEvent.MOUSE_DOWN,onClicked);
			cam2MC.addEventListener(MouseEvent.MOUSE_DOWN,onClicked2);
			cam3MC.addEventListener(MouseEvent.MOUSE_DOWN,onClicked3);
			//stage.addEventListener(MouseEvent.MOUSE_DOWN,saveVideo);
			//saveVideo(null);
			
			videoDisplay = new VideoClass(300,300);
			this.addChild(videoDisplay);
			
			sampleBitmap = new Bitmap();
			this.addChild(sampleBitmap);
			sampleBitmap.x = 200;
			sampleBitmap.y = 200;
			
			videoDisplay.addEventListener(VideoEvents.VIDEO_LOADED,playVideo);
			
			var vidFile:File = File.applicationDirectory.resolvePath("vid.mp4");
			var otherLocation:File = File.documentsDirectory.resolvePath("vid.mp4");
			vidFile.copyTo(otherLocation,true);
			//var vidFile2:File = new File("cdn.tabnak.ir/files/fa/news/1395/3/18/601986_353.mp4");
			//trace("is exist?"+vidFile2.exists);
			if(false && otherLocation.exists)
			{
				videoDisplay.loadThiwVideo(otherLocation.nativePath,true,NaN,NaN,null,false);//"http://cdn.tabnak.ir/files/fa/news/1395/3/18/601986_353.mp4"
			}
			
			videoDisplay.loadThiwVideo("http://as8.asset.aparat.com/aparat-video/a_b2cmk88m84j9n2mkn42j32l8092mm7k4lmm306650006-492y__921dc.mp4");
			
			//DarkBox.setUp(new Rectangle(0,0,550,400));
		}
	
	
		private function onRender(e:StageVideoEvent):void
		{
			sv.viewPort = new Rectangle(0, 0, 1371, 771);
		}
	
		
		protected function onClicked3(event:MouseEvent):void
		{
			var items:Vector.<ImageFile> = new Vector.<ImageFile>();
			items.push(new ImageFile('http://as5.asset.aparat.com/aparat-video/a_35dl23g6mkjjknljno7nkl3lnjj20l3l8l7k67753018-503y__93ba6.mp4','',4,false));
			
			DarkBox.show(items);
		}
		
		protected function playVideo(event:Event):void
		{
			trace("Video ready");
			videoDisplay.play();
		}
		
		/*protected function saveVideo(event:MouseEvent):void
		{
			var fileByte:ByteArray = new ByteArray();
			var byte:Base64Decoder = new Base64Decoder();
			byte.decode(savedVideo);
			fileByte = byte.toByteArray() ;
			
			vidFile = File.documentsDirectory.resolvePath('vid.mp4') ;
			FileManager.seveFile(vidFile,fileByte,false);
			
			vid = new VideoClass();
			this.addChild(vid);
			vid.loadThiwVideo(vidFile.url,true);
			
			trace("File saved with lenght of "+fileByte.length);
		}*/
		
		protected function onClicked(event:MouseEvent):void
		{
			Obj.remove(videoDisplay);
			videoDisplay = new VideoClass();
			this.addChild(videoDisplay);
			trace("Open camera");
			
			DeviceImage.getVideoCamera(onVideoReady);
		}
		
		protected function onClicked2(event:MouseEvent):void
		{
			Obj.remove(videoDisplay);
			videoDisplay = new VideoClass();
			this.addChild(videoDisplay);
			
			DeviceImage.loadVideo(onVideoReady,File.applicationDirectory.resolvePath("vid.mp4"));
		}
		
		private function onVideoReady():void
		{
			trace("Video is ready : ");
			
			var tempFile:File = File.createTempFile() ;
			
			FileManager.seveFile(tempFile,DeviceImage.videoBytes,false);
			
			//sampleBitmap.bitmapData = DeviceImage.imageBitmapData.clone(); 
			
			videoDisplay.loadThiwVideo(tempFile.url,true);
		}
	}
}