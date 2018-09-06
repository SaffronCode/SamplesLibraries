package
{
	import contents.ImageData;
	import contents.PageData;
	
	import flash.desktop.NativeApplication;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	
	import photoEditor.PhotoEdit;
	import photoEditor.StampButton;
	
	public class Naghashi extends Sprite
	{
		public function Naghashi()
		{
			super();
			
			PhotoEdit.setUp(new Rectangle(0,0,1024,768));
			
			
			var stamps:Vector.<File> = new Vector.<File>();
			stamps.push(File.applicationDirectory.resolvePath("images1.png"));
			stamps.push(File.applicationDirectory.resolvePath("images2.png"));
			
			PhotoEdit.addStamps(stamps);
			
			PhotoEdit.Edit("D://test.jpg",onImageChanged);
			
			//stage.addEventListener(MouseEvent.CLICK,addStampButton);
			
			var page:PageData = new PageData();
			for(var i = 0 ; i<10  ; i ++)
			{
				page.images.push(new ImageData());
			}
			trace(page.export());
		}
		
		protected function addStampButton(event:MouseEvent):void
		{
			var stamp:StampButton = new StampButton();
			stamp.x = stage.mouseX;
			stamp.y = stage.mouseY;
			
			stage.addChild(stamp);
		}
		
		private function onImageChanged():void
		{
			NativeApplication.nativeApplication.exit(0);
		}
	}
}