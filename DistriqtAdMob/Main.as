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
			stage.addEventListener(MouseEvent.CLICK,activateBanner);
		}

		private function activateBanner(event:MouseEvent):void
		{
			AdvertsDistriqt.isSupported();
			AdvertsDistriqt.showAdvert();
		}
	}
}