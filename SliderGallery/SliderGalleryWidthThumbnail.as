package
{
	import appManager.displayContent.SliderController_thumbnails;
	import appManager.displayContent.SliderGallery;
	import appManager.displayContent.SliderImageItem;
	import appManager.displayContentElemets.LightImage;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	
	public class SliderGalleryWidthThumbnail extends Sprite
	{
		private var sliderMC:SliderGallery ;
		
		private var sliderController:SliderController_thumbnails ;
		
		public function SliderGalleryWidthThumbnail()
		{
			super();
			
			/*
			var light1:LightImage = new LightImage();
			this.addChild(light1);
			var light2:LightImage = new LightImage();
			light2.x = 200 ;
			this.addChild(light2);
			
			var imageURL:String = "http://www.jqueryscript.net/images/jQuery-Plugin-For-Stacked-Polaroid-Image-Gallery-Photopile.jpg?"+new Date().time ;
			
			light1.setUp(imageURL,false,200);
			light2.setUp(imageURL,false,200);
			
			Obj.remove(light1);*/
			
			
			sliderMC = Obj.findAllClass(SliderGallery,this)[0];
			sliderController = Obj.findThisClass(SliderController_thumbnails,this);
			
			var time:Number = 0;//new Date().time ;
			
			var images:Vector.<SliderImageItem> = new Vector.<SliderImageItem>();
			images.push(new SliderImageItem("http://www.jqueryscript.net/images/jQuery-Plugin-For-Stacked-Polaroid-Image-Gallery-Photopile.jpg?"+time));
			images.push(new SliderImageItem("http://www.designdazzling.com/wp-content/uploads/2009/12/free-flash-polaroid-gallery.jpg?"+time));
			images.push(new SliderImageItem("http://uwcmahindracollege.org/themes/site_themes/uwc/content_images/slide-gallery-001.jpg?"+time));
			images.push(new SliderImageItem("http://www.capsontiles.com/images/Gallery.jpg?"+time));
			images.push(new SliderImageItem("http://www.artgallery.nsw.gov.au/media/thumbnails/uploads/rotator_images/H_yiribana1.jpg.835x341_q85_crop.jpg?"+time));
			
			sliderMC.addEventListener(MouseEvent.CLICK,theImageIs);
			//sliderMC.setUp(images);
			
			var fakePreLoder:MovieClip = new MovieClip();
			fakePreLoder.graphics.beginFill(0xff0000);
			fakePreLoder.graphics.drawCircle(0,0,10);
			
			sliderController.setUp(images,sliderMC,0,10000,fakePreLoder);
		}
		
		protected function theImageIs(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			trace("CurrentSelectedImage : "+sliderMC.getCurrentSelectedImage());
		}
	}
}