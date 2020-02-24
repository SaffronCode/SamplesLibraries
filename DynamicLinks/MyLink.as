package
{
	import contents.displayPages.LinkItem;
	import contents.LinkData;
	
	public class MyLink extends LinkItem
	{
		public function MyLink(mouseChildAccept:Boolean=false, searchForElements:Boolean=true)
		{
			super(mouseChildAccept, searchForElements);
		}
		
		override public function setUp(linkData:LinkData):void
		{
			this.gotoAndStop(getIndex()+1);
		}
	}
}