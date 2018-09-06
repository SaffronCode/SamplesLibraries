package
{
	import contents.LinkData;
	import contents.PageData;
	import contents.displayPages.DynamicLinks;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class main extends MovieClip
	{
		private var dynamicLink:DynamicLinks ;
		
		public function main()
		{
			super();
			
			dynamicLink = Obj.findThisClass(DynamicLinks,this);
			
			var page:PageData = new PageData();
			for(var i:int = 0 ; i<200 ; i++)
			{
				page.links1.push(new LinkData());
			}
			
			stage.addEventListener(MouseEvent.CLICK,function(e)
			{
				dynamicLink.setUp(page);
			});
		}
	}
}