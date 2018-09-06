package
{
	import dataManager.SavedDatas2;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.System;
	
	public class savedDataTest extends Sprite
	{
		
		private var vec:Vector.<dataVec> ; 
		
		public function savedDataTest()
		{
			super();
			
			
			SavedDatas2.setUp();
			trace("Saved data for hi is : "+SavedDatas2.load("hi"));
			TimeTracer.tr(1);
			SavedDatas2.save('by','text by');
			TimeTracer.tr(1.1);
			//SavedDatas2.save('hi','text by2');
			SavedDatas2.save('by','text by2');
			SavedDatas2.save('by','text by3');
			SavedDatas2.save('by','text by4');
			SavedDatas2.save('by','text by5');
			SavedDatas2.save('by','text by6');
			SavedDatas2.save('hi','Helo is daatc');
			SavedDatas2.save('hi','not Hle');
			
			
			trace("Saved data for hi is : "+SavedDatas2.load("by"));
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN,loadHiAgain);
			
			return ;
			var porMC:MovieClip = Obj.get("por_mc",this);
			var khaMC:MovieClip = Obj.get("kha_mc",this);
			vec = new Vector.<dataVec>();
			
			porMC.addEventListener(MouseEvent.MOUSE_DOWN,porHafeze);
			khaMC.addEventListener(MouseEvent.MOUSE_DOWN,khaHafeze);
			
		/*	SavedDatas2.save('hi','text hi');
			SavedDatas2.save('hi','text hi2');
			SavedDatas2.save('hi','text hi3');
			SavedDatas2.save('hi','text hi4');
			SavedDatas2.save('hi','text hi5');
			SavedDatas2.save('hi','text hi6');*/
			/*for(var i = 0 ; i<500 ; i++)
			{
				SavedDatas2.save(i.toString(),'text'+i);
			}*/
			/*for(i = 0 ; i<100 ; i++)
			{
				trace("Saved data is : "+SavedDatas2.load(i.toString()));
			}*/
			TimeTracer.tr(1);
		}
		
		protected function loadHiAgain(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			trace("Hi is : "+SavedDatas2.load("hi"));
		}
		
		protected function khaHafeze(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			var veItem:dataVec = new dataVec();
			veItem.data = '';
			for(var i = 0 ; i<5000000 ; i++)
			{
				veItem.data+=String.fromCharCode(30+Math.floor(60*Math.random()));
			}
			vec.push(veItem);
			trace("Hafeze pored");
		}
		
		protected function porHafeze(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			vec.pop();
			trace("Hafeze khalied");
			System.gc();
			System.gc();
			return ;
			System.pauseForGCIfCollectionImminent();
			System.pauseForGCIfCollectionImminent();
		}
	}
}