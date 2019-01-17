package
{
	import darkBox.DarkBox;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class Main extends MovieClip
	{
		public function Main()
		{
			super();
			
			DarkBox.setUp(new Rectangle(0,0,stage.stageWidth,stage.stageHeight));
			DarkBox.setDistriqtId();
			stage.addEventListener(MouseEvent.CLICK,openDarkBox);
		}
		
		protected function openDarkBox(event:MouseEvent):void
		{
			if(!DarkBox.isOpen())
			{
			}
		}
	}
}