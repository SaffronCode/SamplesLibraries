package  {
	
	import flash.display.MovieClip;
	import diagrams.dataGrid.DataGrid;
	
	
	public class DataGridMain extends MovieClip {
		
		
		public function DataGridMain() {
			super();
			
			var grid:DataGrid = new DataGrid(10,8,550,400);
			grid.addContent(null,0,0,1,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,1,0,1,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,2,0,1,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,0,1,1,-1,Math.floor(Math.random()*0xffffff));//You dont need to set X and Y position, it can detect the free places for you
			grid.addContent(null,0,0,1,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,0,1,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,0,1,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,0,1,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,0,2,1,-1,Math.floor(Math.random()*0xffffff));
			
			grid.addContent(null,0,1,9,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,9,1,1,7,-1,Math.floor(Math.random()*0xffffff));
			
			grid.addContent(null,0,2,1,1,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,2,2,2,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,2,2,2,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,2,2,2,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,2,2,2,-1,Math.floor(Math.random()*0xffffff));
			
			grid.addContent(null,0,3,1,1,-1,Math.floor(Math.random()*0xffffff));
			
			grid.addContent(null,0,4,3,3,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,4,4,4,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,4,2,2,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,4,2,2,-1,Math.floor(Math.random()*0xffffff));
			grid.addContent(null,0,6,3,1,-1,Math.floor(Math.random()*0xffffff));
			
			this.addChild(grid);
		}
	}
	
}
