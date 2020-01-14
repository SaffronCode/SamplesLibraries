package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import nativeClasses.advert.AdvertsDistriqt;
	public class Main extends MovieClip
	{
		public function Main()
		{
			super();
			AdvertsDistriqt.setUp("ca-app-pub--------------------------");
			stage.addEventListener(MouseEvent.CLICK,controlGooglePlay);
		}

		private function controlGooglePlay(event:MouseEvent):void
		{
			AdvertsDistriqt.fullScreenBanner("ca-app-pub--------------------------",false);
			stage.removeEventListener(MouseEvent.CLICK,controlGooglePlay);
			stage.addEventListener(MouseEvent.CLICK,activateBanner);
		}

		private function activateBanner(event:MouseEvent):void
		{
			AdvertsDistriqt.isSupported();
			AdvertsDistriqt.fullScreenBanner("ca-app-pub--------------------------");
		}
	}
}