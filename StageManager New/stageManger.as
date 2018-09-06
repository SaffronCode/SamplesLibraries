package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.setTimeout;
	
	import stageManager.StageManager;
	import stageManager.StageManagerEvent;
	
	public class stageManger extends Sprite
	{
		var debuggerText:TextField ;
		
		public function stageManger()
		{
			super();
			
			debuggerText = new TextField();
			debuggerText.width = stage.stageWidth ;
			debuggerText.height = stage.stageHeight ;
			debuggerText.mouseEnabled = false ;
			debuggerText.textColor = 0x00ff00 ;
			
			this.addChild(debuggerText);
			
			StageManager.eventDispatcher.addEventListener(StageManagerEvent.STAGE_RESIZED,function(e){
				debuggerText.appendText('\n'+StageManager.stageRect.toString()
				)});
			trace("Listener ades");
			StageManager.setUp(stage,0,0,false,false,root);
			StageManager.add("l_u_css",-1,-1,false,false);
			StageManager.add("r_u_css",1,-1,false,false);
			StageManager.add("l_d_css",-1,1,false,false);
			StageManager.add("r_d_css",1,1,false,false);
			
			debuggerText.appendText("\n"+StageManager.stageRect.toString()) ;
			
			
			//setTimeout(function(){debuggerText.appendText('\n'+StageManager.stageRect.toString())},1000);
			
			trace("??? : ");
		}
	}
}