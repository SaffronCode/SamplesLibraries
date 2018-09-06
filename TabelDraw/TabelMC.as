package
{
	import diagrams.dataGrid.DataGrid;
	import diagrams.table.Table;
	import diagrams.table.TableContent;
	import diagrams.table.TableTitleValue;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	
	public class TabelMC extends MovieClip
	{
		public function TabelMC()
		{
			super();
			var titleVal:TableTitleValue = new TableTitleValue();
			titleVal.addHorizontalTitle('helo',0);
			titleVal.addHorizontalTitle('melo',1);
			titleVal.addHorizontalTitle('chelo',2);
			titleVal.addVerticalTitle('hi',0);
			titleVal.addVerticalTitle('bye',2);
			titleVal.addVerticalTitle('why',3);
			var contentVal:TableContent = new TableContent();
			contentVal.addData(0,0,'0,0');
			contentVal.addData(0,1,'0,1',0xff0000);
			
			var tabl:Table = new Table(new Rectangle(0,0,550,400),titleVal,contentVal,0xffbb00,true,false);
			//this.addChild(tabl);
			
			var sampleObject:MovieClip = Obj.get("item_mc",this);
			
			var ME:MovieClip = this ;
			
			var tim:Timer = new Timer(100);
			tim.start();
			tim.addEventListener(TimerEvent.TIMER,function(e){
				ME.removeChildren();
				var grid:DataGrid = new DataGrid(10,10,550,400,0xffbb00,0);
				/*grid.addContent(new DataGrid(4,4,50,50,0xffee00,0,sampleObject),0,0);
				grid.addContent(new DataGrid(6,2,50,50,0xffee55,0),4,0);
				grid.addContent(new DataGrid(6,2,50,50,0xff0000,0));
				grid.addContent(new DataGrid(1,1,50,50,0x55ff00,0));*/
				const WW:uint = 2 ;
				for(var i:int = 0 ; i<50 ; i++)
				{
					grid.addContent(new DataGrid(Math.floor(Math.random()*WW)+1,Math.floor(Math.random()*WW)+1,50,50,Math.floor(Math.random()*0xffffff),-1,i==1?sampleObject:null));
				}
				ME.addChild(grid);
			});
		}
	}
}