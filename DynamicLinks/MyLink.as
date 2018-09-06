package
{
	import contents.displayPages.LinkItem;
	
	public class MyLink extends LinkItem
	{
		public function MyLink(mouseChildAccept:Boolean=false, searchForElements:Boolean=true)
		{
			super(mouseChildAccept, searchForElements);
		}
		
		override public function setIndex(index:uint):void
		{
			this.gotoAndStop(index+1);
		}
	}
}