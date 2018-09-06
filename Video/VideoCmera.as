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
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.dns.AAAARecord;
	import flash.utils.ByteArray;
	
	import mx.utils.Base64Decoder;
	import mx.utils.Base64Encoder;
	
	import videoPlayer.myVideoPlayer;
	
	import videoShow.VideoClass;
	import videoShow.VideoEvents;
	import videoShow.StageVideo;
	
	public class VideoCmera extends Sprite
	{
			
		private var vidFile:File ;
		
		private var videoDisplay:VideoClass ;
		
		private var camMC:MovieClip ;
		private var cam2MC:MovieClip ;
		private var cam3MC:MovieClip ;
		
		private var sampleBitmap:Bitmap;
		
		private var stageWeb:StageWebView;
		public function VideoCmera()
		{
			super();
			trace("Version 6");
			camMC = Obj.get("cam_mc",this);
			cam2MC = Obj.get("cam2_mc",this);
			cam3MC = Obj.get("cam3_mc",this);
			camMC.addEventListener(MouseEvent.MOUSE_DOWN,onClicked);
			cam2MC.addEventListener(MouseEvent.MOUSE_DOWN,onClicked2);
			cam3MC.addEventListener(MouseEvent.MOUSE_DOWN,onClicked3);
			//stage.addEventListener(MouseEvent.MOUSE_DOWN,saveVideo);
			//saveVideo(null);
			
			videoDisplay = new VideoClass();
			this.addChild(videoDisplay);
			
			sampleBitmap = new Bitmap();
			this.addChild(sampleBitmap);
			sampleBitmap.x = 200;
			sampleBitmap.y = 200;
			
			
			videoDisplay.addEventListener(VideoEvents.VIDEO_LOADED,playVideo);
			//videoDisplay.loadThiwVideo("http://as5.asset.aparat.com/aparat-video/a_35dl23g6mkjjknljno7nkl3lnjj20l3l8l7k67753018-503y__93ba6.mp4",true);
			
			DarkBox.setUp(new Rectangle(0,0,550,400));
		}
		
		protected function onClicked3(event:MouseEvent):void
		{
			var items:Vector.<ImageFile> = new Vector.<ImageFile>();
			//items.push(new ImageFile('http://as5.asset.aparat.com/aparat-video/a_35dl23g6mkjjknljno7nkl3lnjj20l3l8l7k67753018-503y__93ba6.mp4','',4,false));
			var videoFile:File = File.applicationDirectory.resolvePath('vid.mp4') ;
			items.push(new ImageFile("http://185.83.208.175:8036//UploadImages/original/b64ae087-1bd2-4ed7-9883-a091ea8616b5.mp4",'',4,false));//videoFile.url
			
			if(videoFile.exists)
			{
				DarkBox.show(items);
			}
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
			var vid:StageVideo = new StageVideo(100,100);
			this.addChild(vid);
			vid.loadThiwVideo("http://185.83.208.175:8036//UploadImages/original/b64ae087-1bd2-4ed7-9883-a091ea8616b5.mp4");
			return ;
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
			
		//	DeviceImage.loadVideo(onVideoReady,File.applicationDirectory.resolvePath("vid.mp4"));
			stageWeb = new StageWebView()
			stageWeb.viewPort = new Rectangle(0,0,550,400)
			stageWeb.stage = this.stage	
			stageWeb.addEventListener(Event.COMPLETE, loadMP4WebWiewCompleted, false, 0, true);
			var _path:File = File.applicationDirectory.resolvePath("vid.mp4")
				
		//	var _pathCopy : File = File.createTempFile();
		//	_path.copyTo(_pathCopy, true);  
			//stageWeb.loadURL(_pathCopy.nativePath);
				
			//stageWeb.loadURL(_path.nativePath)
			stageWeb.loadURL("http://185.83.208.175:8036//UploadImages/original/b64ae087-1bd2-4ed7-9883-a091ea8616b5.mp4")
						
		}
		
		protected function loadMP4WebWiewCompleted(event:Event):void
		{
			// TODO Auto-generated method stub
			trace('load MP4 WebWiew Completed')
			trace('load MP4 WebWiew Completed')
			trace('load MP4 WebWiew Completed')
			trace('load MP4 WebWiew Completed')
			trace('load MP4 WebWiew Completed')
			trace('load MP4 WebWiew Completed')
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