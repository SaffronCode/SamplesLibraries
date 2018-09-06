package
{
	import diagrams.calender.MyShamsi;
	
	import flash.display.Sprite;
	
	public class dateTester extends Sprite
	{
		public function dateTester()
		{
			var date:Date = ServerDate.serverDateToDate("7/19/2016 5:23:12 PM");
			trace(date);
			//trace(date.date);
			var shamsi:MyShamsi = MyShamsi.miladiToShamsi(date);
			//var date2:Date = new Date(2016,6,19,17,23,12);
			//date2.date = 20 ;
			trace(shamsi);
			//trace("date2 : "+date2);
		}
	}
}