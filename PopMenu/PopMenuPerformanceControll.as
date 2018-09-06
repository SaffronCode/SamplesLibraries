package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	
	import popForm.PopMenuContent;
	
	public class PopMenuPerformanceControll extends Sprite
	{

		private var cont:PopMenuContent;
		public function PopMenuPerformanceControll()
		{
			super();
			var buttons:Array = [] ;
			
			for(var i = 0 ; i<1000 ; i++)
			{
				buttons.push('سلامسلامسلامسلام'+Math.random().toString());
			}
			cont = new PopMenuContent('',null,buttons);
			
			stage.addEventListener(MouseEvent.CLICK,openMenu);
		}
		
		protected function openMenu(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			var tim:Number = getTimer();
			PopMenu1.popUp('salam',null,cont);
			trace("It tooks : "+(getTimer()-tim));
		}
	}
}