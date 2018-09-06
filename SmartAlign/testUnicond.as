package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class testUnicond extends Sprite
	{
		public function testUnicond()
		{
			var textMC:TextField = Obj.get("text",this);
			var text2MC:TextField = Obj.get("text2",this);
			
			Unicode.smartTextAlign = true ;
			
			textMC.text = UnicodeStatic.convert("ایران 44 - 169 ع 64",false);
			text2MC.text = UnicodeStatic.convert("218A-33003811-76D613-14/10-64169-میر علائی ",false);
			text2MC.text = UnicodeStatic.convert("سلام-1b",false);
		}
	}
}