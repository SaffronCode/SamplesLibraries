package
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	public class Main extends MovieClip
	{
		private var textTF:TextField ;
		
		public function Main()
		{
			super();
			
			textTF = Obj.get("text_txt",this);
			
			Unicode.estesna = '-[]»«":';
			Unicode.forceToEnglish = ',،';
			Unicode.splitters = ['.',' ','-',':',':'] ; 
			UnicodeStatic.detectArabicScript = true ;
			Unicode.smartTextAlign = true ;
			
			textTF.text = UnicodeStatic.convert('س 1.432 پ');
		}
	}
}