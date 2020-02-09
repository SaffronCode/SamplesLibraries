package
{
	import flash.display.MovieClip;
	import appManager.displayContent.SliderGallery;
	import appManager.displayContent.SliderImageItem;
	public class Main extends MovieClip
	{
		public function Main()
		{
			super();

			var slider:SliderGallery = Obj.findThisClass(SliderGallery,this);

			var images:Vector.<SliderImageItem> = new Vector.<SliderImageItem>();
			images.push(new SliderImageItem(null,'',null,new SliderElement()))
			images.push(new SliderImageItem(null,'',null,new SliderElement()))
			images.push(new SliderImageItem(null,'',null,new SliderElement()))
			slider.setUp(images)
		}
	}
}