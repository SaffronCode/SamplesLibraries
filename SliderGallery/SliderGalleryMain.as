package
{
	import appManager.displayContent.SliderGallery;
	import appManager.displayContent.SliderImageItem;
	import appManager.displayContentElemets.Image;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class SliderGalleryMain extends Sprite
	{
		private var slideGallery:SliderGallery

		private var images:Vector.<SliderImageItem>;
		
		public function SliderGalleryMain()
		{
			super();
			
			slideGallery = Obj.findThisClass(SliderGallery,this);
			
			//slideGallery.addEventListener(Event.CHANGE,imageChanged);
			trace("Slider Gallery is : "+slideGallery);
			
			images = new Vector.<SliderImageItem>(); 
			
			images.push(new SliderImageItem("01.jpg"));
			images.push(new SliderImageItem("02.jpg"));
			images.push(new SliderImageItem("03.jpg"));
			images.push(new SliderImageItem("04.jpg"));
			images.push(new SliderImageItem("05.jpg"));
			images.push(new SliderImageItem("06.jpg"));
			
			slideGallery.setUp(images,0,0);
			
			var nextMC:MovieClip = Obj.get("next_mc",this);
			var preveMC:MovieClip = Obj.get("preve_mc",this);
			
			nextMC.addEventListener(MouseEvent.CLICK,nextImage);
			preveMC.addEventListener(MouseEvent.CLICK,prevImage);
			
			slideGallery.addEventListener(MouseEvent.CLICK,openLink);
		}
		
		protected function openLink(event:MouseEvent):void
		{
			trace("*** **** Open the link")
		}
		
		protected function imageChanged(event:Event):void
		{
			trace("Selected image is changed : " +slideGallery.getCurrentSelectedImage());
			if(slideGallery.getCurrentSelectedImage()==4)
			{
				slideGallery.setUp(images);
			}
		}
		
		protected function prevImage(event:MouseEvent):void
		{
			slideGallery.preve();
		}
		
		protected function nextImage(event:MouseEvent):void
		{
			slideGallery.next();
		}
	}
}