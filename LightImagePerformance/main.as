package  {
	
	import flash.display.MovieClip;
	import appManager.displayContentElemets.LightImage;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	
	
	public class main extends MovieClip {
		
		var myImage:LightImage ;
		var myImage2:LightImage ;
		public function main() {
			super();
			

			myImage = Obj.findAllClass(LightImage,this)[0];
			myImage2 = Obj.findAllClass(LightImage,this)[1];

			stage.addEventListener(MouseEvent.MOUSE_DOWN,loadImage);
		}
		
		private function loadImage(e:MouseEvent):void
		{
			//http://lorempixel.com/1500/1500/sports/3/
			myImage.setUp("d:/test.jpg?"+new Date().time,false,0,0,0,0,true);
			myImage2.setUp("d:/test.jpg?1"+new Date().time,false,0,0,0,0,true);
			trace("*************************************************************");
		}
	}
	
}
