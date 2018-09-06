package
{
	import appManager.displayContentElemets.TextParag;
	
	import flash.display.Sprite;
	
	public class fewLines extends Sprite
	{
		public function fewLines()
		{
			super();
			
			trace("Hi");
			var myParag:TextParag = Obj.findThisClass(TextParag,this);
			myParag.setUp("معاون دانشجویی دانشگاه از کلیه دانشجویان واجد شرایط به منظور شرکت در بیست و پنجمین دوره جشنواره دانشجوی نمونه سال ۱۳۹۵ دعوت کرد."
				,true,true,false,false,false,false,false,true,true,false,true,0,true);
		}
	}
}