package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import contents.alert.Alert;
	
	import darkBox.DarkBox;
	import darkBox.ImageFile;
	
	
	import stageManager.StageManager;
	
	public class Main extends MovieClip
	{
		public function Main()
		{
			super();
			trace("Hi");
			
			//Alert.show(">>>"+com.distriqt.extension.mediaplayer.events.MediaPlayerEvent.LOADING);
			
			StageManager.setUp(stage);
			
			DarkBox.setUp(new Rectangle(0,0,stage.stageWidth,stage.stageHeight));
			DarkBox.setDistriqtId("432e0d058519842bb02cf42842ff56fc15817a04bkqlAzmoY81y+4aJlbmcgxSJy5pTpuM4UrOP0WPvdTL7kLZpBBcPO/pY4AZKyws+D+op3xwHY0VZsT2FVgVVfcr5Pwlr5JqO8pxBPw26NV/hsRrxDQhAyv/O40KqHz+3i7okANWeU6If8dWjlAuk6uwFi94Qet1m2IAp0HmoKdqCDkekMORsaB2qwSG+YN+gToi5WKnzkiOWCrWNjlNf1y+h7tMYa84cvfN/nyldzjVVfwbyXKx0NgBUGbC2MtEeCzU0QmQSvwQ6em5uV8NxigYuFocyIaZ1PNG4BUzxsuCmoamhZpEG3akQBzETKErzgl+OsfzxppSl0nFZ73qSaQ==");
			stage.addEventListener(MouseEvent.CLICK,openDarkBox);
		}
		
		protected function openDarkBox(event:MouseEvent):void
		{
			if(!DarkBox.isOpen())
			{
				var images:Vector.<ImageFile> = new Vector.<ImageFile>();
				//images.push(new ImageFile("https://media.wired.com/photos/59324c6958b0d64bb35d0c57/master/pass/lego-bricks-ft.jpg","Image"));
				images.push(
					new ImageFile(
						"http://quranlms.mteamtest.ir/UploadImages/NewsVideo/News_Video69256a.mp4|http://quranlms.mteamtest.ir/UploadImages/NewsVideo/Medium/News_Video69256a.mp4|http://quranlms.mteamtest.ir/UploadImages/NewsVideo/Small/News_Video69256a.mp4"
						,"Video",ImageFile.TYPE_VIDEO,false)
					/*new ImageFile(
						"https://stream3.asset.filimo.com/aparat-video/52eb2175ff3459de39177e5fa6973e6413885179-720p__22438.mp4"
						+"|"+
						"https://stream3.asset.filimo.com/aparat-video/52eb2175ff3459de39177e5fa6973e6413885179-360p__22438.mp4"
						+"|"+
						"https://stream3.asset.filimo.com/aparat-video/52eb2175ff3459de39177e5fa6973e6413885179-144p__22438.mp4"
						,"Video",ImageFile.TYPE_VIDEO,false)*/
				);
				DarkBox.show(images);
			}
		}
	}
}