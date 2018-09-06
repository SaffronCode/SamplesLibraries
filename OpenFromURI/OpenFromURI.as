package
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.events.InvokeEvent;
	import flash.text.TextField;
	import flash.utils.getTimer;
	
	public class OpenFromURI extends Sprite
	{
		private var textTF:TextField ;
		
		public function OpenFromURI()
		{
			super();
			
			textTF = new TextField();
			this.addChild(textTF);
			textTF.width = 550 ;
			textTF.height = 400 ;
			textTF.embedFonts = false ;
			textTF.text = "Here is the Invoke arguments place...";
			
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, onInvoke);
		}
		
		private function onInvoke (e:InvokeEvent):void{
			textTF.text = String("Invoked ("+getTimer()+"): "+e.arguments);
		}
	}
}