package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import sliderMenu.SliderManager;
	
	public class scrollSample extends Sprite
	{
		private var scrollMC:MovieClip ;
		
		public function scrollSample()
		{
			super();
			
			SliderManager
			
			scrollMC = Obj.get("scroll_mc",this);
			
			var leftToRightScroll:Boolean = false ;
			
			new ScrollMT(scrollMC,new Rectangle(scrollMC.x,scrollMC.y,scrollMC.width,300),null,!rightToLeftScroll,rightToLeftScroll);
		}
	}
}
