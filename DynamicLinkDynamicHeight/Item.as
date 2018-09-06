package
{
	import contents.displayPages.LinkItem;
	
	public class Item extends LinkItem
	{
		public function Item(mouseChildAccept:Boolean=false, searchForElements:Boolean=true)
		{
			super(mouseChildAccept, searchForElements);
			
			var W:Number = this.width ;
			var H:Number = this.height ;
			
			this.removeChildren() ;
			
			this.graphics.beginFill(0xffffff*Math.random()) ;
			this.graphics.drawRect(0,0,W,H+H*2*Math.random()) ;
		}
	}
}