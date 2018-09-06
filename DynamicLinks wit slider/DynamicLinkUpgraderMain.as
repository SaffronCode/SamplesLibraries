package
{
	import contents.LinkData;
	import contents.PageData;
	import contents.displayPages.DynamicLinks;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class DynamicLinkUpgraderMain extends MovieClip
	{
		public function DynamicLinkUpgraderMain()
		{
			super();
			var links:DynamicLinks = Obj.findThisClass(DynamicLinks,this);
			//links.showStepByStep = true ;
			var page:PageData = new PageData();
			for(var i = 0 ; i<10 ; i++)
			{
				page.links1.push(new LinkData());
			}
			links.setUp(page);
			
			trace("Dyanic links upgraded");
		}
	}
}