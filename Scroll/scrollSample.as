package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import sliderMenu.SliderManager;
	
	public class scrollSample extends Sprite
	{
		private var scrollMC:MovieClip ;
		private var scroll2MC:MovieClip ;
		private var scrollrtlMC:MovieClip ;
		
		public function scrollSample()
		{
			super();
			
			SliderManager
			
			scrollMC = Obj.get("scroll_mc",this);

			new ScrollMT(scrollMC,new Rectangle(scrollMC.x,scrollMC.y,scrollMC.width,300),null,true,false);
			
			scroll2MC = Obj.get("scroll2_mc",this);
			new ScrollMT(scroll2MC,new Rectangle(scroll2MC.x,scroll2MC.y,300,scroll2MC.height),null,false,true,true);
			
			scrollrtlMC = Obj.get("scrollrtl_mc",this);
			new ScrollMT(scrollrtlMC,new Rectangle(scrollrtlMC.x-300,scrollrtlMC.y,300,scrollrtlMC.height),null,false,true,true,false,true);

		}
	}
}
