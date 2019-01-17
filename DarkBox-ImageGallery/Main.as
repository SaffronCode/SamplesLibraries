package
{
	import darkBox.DarkBox;
	import darkBox.ImageFile;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import stageManager.StageManager;
	
	public class Main extends MovieClip
	{
		public function Main()
		{
			super();
			
			StageManager.setUp(stage);
			
			DarkBox.setUp(new Rectangle(0,0,stage.stageWidth,stage.stageHeight));
			DarkBox.setDistriqtId();
			stage.addEventListener(MouseEvent.CLICK,openDarkBox);
		}
		
		protected function openDarkBox(event:MouseEvent):void
		{
			if(!DarkBox.isOpen())
			{
				var images:Vector.<ImageFile> = new Vector.<ImageFile>();
				images.push(new ImageFile("https://media.wired.com/photos/59324c6958b0d64bb35d0c57/master/pass/lego-bricks-ft.jpg","Image"));
				DarkBox.show(images);
			}
		}
	}
}