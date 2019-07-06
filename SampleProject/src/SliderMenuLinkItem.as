package ui.pages.slider
{//ui.linkItem.SliderMenuLinkItem
	import appManager.displayContentElemets.LightImage;
	import appManager.displayContentElemets.TitleText;
	import appManager.event.AppEvent;
	import appManager.event.AppEventContent;
	import contents.PageData;
	import contents.alert.Alert;
	import mainClass.core.MagEventManager;
	import mainClass.webservice.service.GetGroupById;
	import mainClass.webservice.service.GroupsList;
	import mainClass.webservice.service.NewsList;
	import popForm.Hints;
	import restDoaService.RestDoaEvent;
	
	import contents.Contents;
	import contents.LinkData;
	import contents.displayPages.LinkItem;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.getTimer;
	
	import mainClass.core.Manager;
	import mainClass.core.UserManager;
	
	import sliderMenu.SliderManager;
	
	public class SliderMenuLinkItem extends LinkItem
	{
		private var _titleMc:TitleText;
		private var _image:LightImage;
		public var service_getGroupById:GetGroupById;
		private var service_newsList:NewsList;
		private var linkData:LinkData;
		
		public function SliderMenuLinkItem(mouseChildAccept:Boolean = false, searchForElements:Boolean = true)
		{
			super(mouseChildAccept, searchForElements);
			_titleMc = Obj.findThisClass(TitleText, this)
			_image = Obj.findThisClass(LightImage, this)
		
		}
		
		override public function setUp(linkData:LinkData):void
		{
			myLinkData = linkData
			if (_titleMc != null)
			{
				_titleMc.setUp(linkData.name)
			}
			if (_image != null)
			{
				_image.setUp(linkData.iconURL)
			}
			this.addEventListener(Event.REMOVED_FROM_STAGE, unLoad)
			service_getGroupById = new GetGroupById(true, true);
			service_getGroupById.addEventListener(RestDoaEvent.SERVER_RESULT, mainItemsLoaded);
			service_getGroupById.addEventListener(RestDoaEvent.SERVER_RESULT_UPDATE, mainItemsLoaded);
			service_getGroupById.addEventListener(RestDoaEvent.CONNECTION_ERROR, noNetToLoadNews);
		}
		
		private function unLoad(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, unLoad);
			service_getGroupById.cansel();
		}
		
		private function noNetToLoadNews(e:RestDoaEvent):void
		{
			service_getGroupById.reLoad(5000);
		}
		
		override public function imSelected(event:MouseEvent = null):void
		{
			if (myLinkData.id == "")
			{
				return;
			}
			if (myLinkData.id == 'home')
			{
				changeLevel(myLinkData.id, 0);
				return
			}
			if (myLinkData.id == 'exit')
			{
				SliderManager.hide();
				Hints.ask('', "آیا برای خروج از حساب کاربری اطمینان دارید؟", onDownExitAsk);
				return
			}
			if (myLinkData.id == 'girls')
			{
				service_getGroupById.load("1030");
				return
			}
			if (myLinkData.id == 'sports')
			{
				service_getGroupById.load("1031");
				return
			}
			if (myLinkData.id == 'places')
			{
				service_getGroupById.load("1032");
				return
			}
			if (myLinkData.id == 'live')
			{
				service_getGroupById.load("1033");
				return
			}
			if (myLinkData.id == 'fifa')
			{
				service_getGroupById.load("1034");
				return
			}
			if (myLinkData.id == 'best')
			{
				service_getGroupById.load("1035");
				return
			}
			if (myLinkData.id == 'rules')
			{
				service_getGroupById.load("1062");
				return
			}
			if (myLinkData.id == 'share')
			{
				Manager.share.shareText(".اپلیکیشن مجله ورزشی را از لینک زیر دریافت نمایید", Contents.config.domain);
				SliderManager.hide();
				return
			}
			
			changeLevel(myLinkData.id, -1);
		}
		
		private function onDownExitAsk():void
		{
			
			Manager.userManager.dispatchEvent(new MagEventManager(MagEventManager.LOGOUT));
		}
		
		private function changeLevel(id_p:String, level_p:int):void
		{
			var linkdata:LinkData = new LinkData();
			linkdata.id = id_p;
			linkdata.level = level_p;
			this.dispatchEvent(new AppEventContent(linkdata));
		}
		
		public function mainItemsLoaded(e:RestDoaEvent):void
		{
			if (service_getGroupById.data.ErrorId == 0)
			{
				if (service_getGroupById.data.Result[0].Id == 1062)// rulesPage
				{
					service_newsList = new NewsList(true, true);
					service_newsList.addEventListener(RestDoaEvent.SERVER_RESULT, newsLoaded);
					service_newsList.addEventListener(RestDoaEvent.SERVER_RESULT_UPDATE, newsLoaded);
					service_newsList.addEventListener(RestDoaEvent.CONNECTION_ERROR, noNetToLoadNewsList);
					service_newsList.load(1062,0,1);
					return;
				}
				if (service_getGroupById.data.Result[0].GroupsCount == 0)
				{
					linkData = new LinkData();
					linkData.dynamicData = service_getGroupById.data.Result[0];
					linkData.id = "newsCategory";
					this.dispatchEvent(new AppEventContent(linkData));
				}
				else
				{
					var nextPage:PageData = Contents.getPage("SubGroupPage").clone();
					nextPage.dynamicData = service_getGroupById.data.Result[0];
					nextPage.id = nextPage.id + "" + service_getGroupById.data.Result[0].Id; //SubGroupPage38
					Contents.addSinglePageData(nextPage);
					
					linkData = new LinkData();
					linkData.id = nextPage.id;
					this.dispatchEvent(new AppEventContent(linkData));
				}
			}
			else
			{
				Hints.show(service_getGroupById.data.ErrorTitle, true, 0);
			}
		}
		
		private function noNetToLoadNewsList(e:RestDoaEvent):void 
		{
			service_newsList.reLoad(5000);
		}
		
		private function newsLoaded(e:RestDoaEvent):void 
		{
			var nextPage:PageData = Contents.getPage("newsDetail").clone();
			nextPage.dynamicData = service_newsList.data.Result[0];
			nextPage.id = nextPage.id + "" + service_newsList.data.Result[0].Id; //SubGroupPage38
			Contents.addSinglePageData(nextPage);
			
			linkData = new LinkData();
			linkData.id = nextPage.id;
			this.dispatchEvent(new AppEventContent(linkData));
			
		}
	
	}
}