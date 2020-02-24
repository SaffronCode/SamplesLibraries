package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import sliderMenu.SliderManager;
	import contents.displayPages.LinkItem;
	
	public class SlideMenuLeft extends Sprite
	{
		public function SlideMenuLeft()
		{
			super();
			
			var sceollMC:MovieClip = Obj.get("scroll_mc",this);
			var rmMenu:MovieClip = Obj.get("rm_mc",this);
			SliderManager.setMenu(sceollMC,121,SliderManager.LEFT_MENU,true,true);
			//SliderManager.setMenu(rmMenu,121,SliderManager.RIGHT_MENU,true,false);
				//sceollMC.visible = false ;
			//SliderManager.setMenu(rmMenu,120,SliderManager.RIGHT_MENU,true,true);
			//SliderManager.setMenu(rmMenu,120,SliderManager.RIGHT_MENU,true,false);
				rmMenu.visible = false ;

				LinkItem
		}
	}
}