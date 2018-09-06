package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class FarsiInputText extends Sprite
	{
		public function FarsiInputText()
		{
			super();
			var textField:TextField = Obj.findThisClass(TextField,this);
			FarsiInputCorrection.setUp(textField);
		}
	}
}