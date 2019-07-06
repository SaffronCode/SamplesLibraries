package
{
	import animation.SpriteSheetMovieClip;
	import appManager.mains.AppWithContent;
	import contents.Contents;
	import contents.displayPages.DynamicLinks;
	import darkBox.DarkBox;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import notification.NotificationEvent;
	import photoEditor.PhotoEdit;
	import popForm.PopMenu;
	import restDoaService.RestDoaService;
	import saffronEvents.UserEvent;
	import sliderMenu.SliderManager;
	import stageManager.StageManager;
	

	
	public class SampleProject extends AppWithContent
	{
		private var slider_Menu:MovieClip;
		
		public function SampleProject()
		{

			DynamicLinks.deltaY = 0;
			super(true, false, true, false, false, true, true, true, false, 1, true, false, true, true, false);

			slider_Menu = Obj.get("sliderMenu_mc", this);
			StageManager.add("menu_css",0,-1);
			StageManager.add("mainMenuTitle_css",0,-1)
			StageManager.add("sliderMenu_mc", 0, -1);
			StageManager.add("intro_css", 0, -1);
			
			
			
			DarkBox.setUp(new Rectangle(0, Contents.config.deltaStageRect.height / -2, 768, Contents.config.stageRect.height))
			
			RestDoaService.setUp(Contents.config.domain);
			
			

			/* UnicodeStatic.detectArabicScript=true;
			Unicode.convertToArabicNumber= true;
			Unicode.estesna = Unicode.estesna+'،'; */

			/* ScrollMT.showScrollEfect(false);	
			ScrollMT.fadeTheCursel = true;
			ScrollMT.cursolAlpha = 0; */
			
			var stageVisibleArea:Rectangle = StageManager.stageVisibleArea;
			PhotoEdit.setUp(stageVisibleArea, false)
			
			PopMenu.backEnable(Contents.lang.t.back);
			PopMenu.staticCanselEnabled([Contents.lang.t.back]);
			PopMenu1.makeHeightDynamic(StageManager.stageRect.height, 1024);
			SliderManager.setMenu(slider_Menu, 496, SliderManager.RIGHT_MENU, true,true);
			//stage.addEventListener(MouseEvent.CLICK, clickStage);
		
		}
		
		
		protected function clickStage(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			//trace('obj event target :',Obj.displayObjectInfo(event.target as DisplayObject));
		}
		
	}
}