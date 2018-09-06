package
{
	import contents.LinkData;
	import contents.PageData;
	import contents.rollingList.RollingList;
	
	import flash.display.Sprite;
	
	public class RollEffect extends Sprite
	{
		public function RollEffect()
		{
			super();
			var list:RollingList = Obj.findThisClass(RollingList,this);
			var page:PageData = new PageData();
			for(var i:int = 0 ; i<100 ; i++)
			{
				var link:LinkData = new LinkData();
				link.name = i+''+i+''+i+''+i+''+i+''+i+''+i+''+i;
				page.links1.push(link);
			}
			list.setUp(page);
		}
	}
}