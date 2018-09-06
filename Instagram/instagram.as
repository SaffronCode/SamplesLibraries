package
{
	import diagrams.calender.MyShamsi;
	import diagrams.instagram.InstaDataValue;
	import diagrams.instagram.InstaTitleValue;
	import diagrams.instagram.Instagram;
	import diagrams.instagram.InstagramConstants;
	import diagrams.instagram.InstagramData;
	import diagrams.instagram.InstagramTitles;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class instagram extends Sprite
	{
		public function instagram()
		{
			super();
			
			InstagramConstants.VTitle_Font = "B Yekan Regular" ;
			var insta:Instagram = new Instagram(new Rectangle(0,0,550,400));
			this.addChild(insta);
			
			var titleValue:InstagramTitles = new InstagramTitles();
			for(var i:int = 0 ; i<9 ; i++)
			{
				titleValue.addHTitle(new InstaTitleValue(i,i.toString()));
			}
			//for(i = 0 ; i<10 ; i++)
			//{
				titleValue.addVTitle(new InstaTitleValue(0,'0'));
				//titleValue.addVTitle(new InstaTitleValue(100,'100'));
			//}
			
			var diagramData:InstagramData = new InstagramData("Customers",0xff0000,1);
			diagramData.addData(new InstaDataValue(0,0));
			diagramData.addData(new InstaDataValue(1,2));
			diagramData.addData(new InstaDataValue(2,0));
			diagramData.addData(new InstaDataValue(3,5));
			diagramData.addData(new InstaDataValue(4,4));
			diagramData.addData(new InstaDataValue(5,2));
			diagramData.addData(new InstaDataValue(6,0));
			diagramData.addData(new InstaDataValue(7,0));
			diagramData.addData(new InstaDataValue(8,1));
			
			insta.addTitleList(titleValue);
			insta.addDiagramData(diagramData);
		}
	}
}