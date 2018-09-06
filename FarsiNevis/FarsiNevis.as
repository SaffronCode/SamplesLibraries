package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.getTimer;
	
	public class FarsiNevis extends Sprite
	{
		private var textMC:MovieClip,
					textTXT:TextField ;

		private var matn:String;
		
		private var inTXT:TextField ;
		
		private var recter:Sprite ;
		
		private var mozX:Number ;
		
		private var lastW:Number ;
		
		public function FarsiNevis()
		{
			super();
			
			recter = new Sprite();
			this.addChild(recter);
			recter.alpha = 0.5 ;
			recter.mouseChildren = recter.mouseEnabled =false ;
			
			//textMC = Obj.get('text_mc',this);
			textTXT = Obj.get('text_txt',this);
			inTXT = Obj.get("in_txt",this);
			inTXT.addEventListener(Event.CHANGE,drawTEext);
			//matn = "پس از موفقیت نسبی برخی کمپین‌ها از جمله «بین خطوط برانیم»، کمپین «من رکیک نیستم» در قالب هشتگی با همین عنوان در فضای مجازی راه اندازی شد تا از طریق فرهنگ‌سازی با گسترش هتاکی در فضای مجازی مقابله شود و توهین در اینترنت به عنوان بستر آزاد برای چنین رفتارهایی، به حداقل ممکن کاهش یابد اما آیا این کمپین موفق خواهد بود؟ به گزارش «تابناک»؛ یکی از حواشی فضای مجازی که همواره استمرار داشته، هتاکی‌های مکرر در این عرصه است؛ هتاکی‌هایی که بعضاً تحت عنوان شوخی و محض خنده صورت می‌پذیرد و عمدتاً به صورت انفرادی و در برخی موارد نیز به صورت دسته‌جمعی نمود می‌یابد. این نمود معمولاً تنها زمانی پررنگ می‌شود که خطاب به چهره‌های بین‌المللی و ملی باشد و سایر فحاشی‌های معمول روزانه انعکاس رسانه‌ای ندارد. اکنون کمپینی تحت عنوان «من رکیک نیستم» به راه افتاده تا با تکیه بر تجربه‌های نسبتاً موفق پیشین از جمله کمپین «بین خطوط برانیم» که تا حدودی در فضای اجتماعی تاثیرگذار بود، با جو کنونی در فضای مجازی ایران مقابله کرد و از شدت فحاشی‌ و توهین‌ها در این بستر کاست و بستر آنلاین را به سمت و سویی سوق داد که با ساده انگاری از کنار توهین عبور نکرد و قبح جدی هتاکی، رویه معمول کنونی تغییر دهد. البته به زعم برخی ناظران این کمپین نتیجه عمیقی نخواهد داشت و هوشنگ گلمکانی، منتقد پیشکسوت سینما یکی از این ناظران است که درباره کمپین «من رکیک نیستم» نیز موضع گیری کرده و چنین تعبیر کرده که بسیاری از رفتارهای غلط در جامعه ایرانی قابل رفع نیست و اگر قابل رفع بود، آنها در اولویت بودند و در واقع به نوعی تاکید می‌‌کند که نمی‌توان به سادگی از فحاشی گذر کرد! سردبیر مجله فیلم در این باره نوشته است: «کمپینی درست شده با عنوان من رکیک نیستم برای مقابله با فحاشی در فضای مجازی و شبکه‌‌های اجتماعی. به عنوان یک تجربه، کار بدی نیست؛ یعنی ضرری که ندارد اما بعید است ثمری داشته باشد. بعید است کاربران فحش ندانند فحاشی بد است! اما فحاشی می‌کنند به هزار و یک دلیل. مثل خیلی از ویژگی‌ها و اعمال بد و منفی دیگر، وگرنه می‌شود کمپین‌های دیگری هم راه انداخت؛ مثلا کمپین من بد نیستم، من دزد نیستم، من متعصب نیستم، من حسود نیستم و انواع کمپین‌های مشابه.» سردبیر مجله فیلم در این باره نوشته است: «کمپینی درست شده با عنوان من رکیک نیستم برای مقابله با فحاشی در فضای مجازی و شبکه‌‌های اجتماعی. به عنوان یک تجربه، کار بدی نیست؛ یعنی ضرری که ندارد اما بعید است ثمری داشته باشد. بعید است کاربران فحش ندانند فحاشی بد است! اما فحاشی می‌کنند به هزار و یک دلیل. مثل خیلی از ویژگی‌ها و اعمال بد و منفی دیگر، وگرنه می‌شود کمپین‌های دیگری هم راه انداخت؛ مثلا کمپین من بد نیستم، من دزد نیستم، من متعصب نیستم، من حسود نیستم و انواع کمپین‌های مشابه.» اشاره گلمکانی یادآور توجیه صادق هدایت نویسنده ایرانی است، که گفته بود: «فحش، یکی از اصول ایجاد تعادل در آدمیزاد است. اگر فحش نباشد آدم دق می کند! از تعداد و نوع فحش در هر زبانی می شود از اوضاع مردمی که در یک ناحیه زندگی می کنند سردرآورد و رابطه بین آنها را کشف کرد. زبان فارسی اگر هیچ نداشته باشد فحش آبدار زیاد دارد. ما که بر سر این ثروت عظیم نشسته ایم چرا ولخرجی نکنیم؟!»" ;
			//matn = matn+matn+matn+matn ;
			
			//putTexxts(null);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN,startRe);
			
		}
		
		private function startRe(e):void
		{
			mozX = stage.mouseX ;
			lastW = textTXT.width ;
			startResize(e);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,startResize);
			stage.addEventListener(MouseEvent.MOUSE_UP,function()
			{
				stage.removeEventListener(MouseEvent.MOUSE_MOVE,startResize);
			});
		}
		
		protected function startResize(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			textTXT.width = lastW+stage.mouseX-mozX;
			//UnicodeStatic.htmlText(textTXT,inTXT.text,false,false,true);
			drawTEext(null);
			event.updateAfterEvent();
			
		}
		
		protected function drawTEext(event:Event):void
		{
			trace("textTXT.defaultTextFormat.indent : "+JSON.stringify(textTXT.defaultTextFormat,null,' '));
			UnicodeStatic.htmlText(textTXT,inTXT.text,false,false,true);
			var rect:Rectangle;
			try
			{
				rect = textTXT.getCharBoundaries(0);
				trace("rect :"+rect);
				recter.graphics.clear();
				recter.graphics.beginFill(0xff0000);
				recter.graphics.drawRect(textTXT.x+rect.x,textTXT.y+rect.y,rect.width,rect.height);
				
				rect = textTXT.getCharBoundaries(textTXT.text.length-1);
				trace("rect :"+rect+' vs '+textTXT.y);
				//recter.graphics.clear();
				recter.graphics.beginFill(0x00ff00);
				recter.graphics.drawRect(textTXT.x+rect.x,textTXT.y+rect.y,rect.width,rect.height);
			}catch(e){};
			trace("TextWidth: "+textTXT.textWidth);
			trace("Textfield width : "+textTXT.width);
		}
		
		protected function putTexxts(event:MouseEvent):void
		{
			/*var tf:TextFormat = textTXT.defaultTextFormat ;
			tf.align = TextFormatAlign.LEFT;
			//textTXT.defaultTextFormat = tf ;
			//textTXT.setTextFormat(tf);
			tf = textTXT.defaultTextFormat ;
			tf.align = TextFormatAlign.JUSTIFY;
			textTXT.defaultTextFormat = tf ;*/
			//textTXT.setTextFormat(tf);
			var mant2:String = "Thanks to the tremendous advancement of science in the field of imaging techniques, an ancient Egyptian mummy has been discovered with marks of. Thanks to the tremendous advancement of science in the field of imaging techniques, an ancient Egyptian mummy has been discovered with marks of. Thanks to the tremendous advancement of science in the field of imaging techniques, an ancient Egyptian mummy has been discovered with marks of. Thanks to the tremendous advancement of science in the field of imaging techniques, an ancient Egyptian mummy has been discovered with marks of." ;
			UnicodeStatic.detectArabicScript = true ;
			UnicodeStatic.htmlText(textTXT,mant2,false,false,false);
				
			//var farsiMatn:String = UnicodeStatic.convert(matn);
			//var tim:uint = getTimer();
			//TextPutter.onTextArea(textTXT,matn,true);
			//trace("Time  : "+(getTimer()-tim));
			//textTXT.text = UnicodeStatic.convert(matn);
		}
	}
}