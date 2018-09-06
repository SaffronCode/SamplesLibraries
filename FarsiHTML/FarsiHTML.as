package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class FarsiHTML extends Sprite
	{
		private var tex:MovieClip,
					textT:TextField;
		
		private var textT2:TextField ;
					
		public function FarsiHTML()
		{
			super();
			
			//trace(text2.htmlText);
			
			tex = Obj.get('text',this);
			textT = Obj.get("text",tex);
			textT2 = Obj.get("text2",this);
			
			textT2.htmlText = '<font color="#0"><A href="http://www.google.com">www.google.com//:http</A>3 ﻡﻼﺳ</font><FONT COLOR="#CCCC00">2ﻡﻼﺳ</FONT>ﻡﻼﺳ'
			
			TextPutter.onTextArea(textT,('سلام<FONT COLOR="#CCCC00">سلام2</FONT>سلام3 http://www.google.com'),true,false,false,0,true,true,0,true);
			
		}
	}
}