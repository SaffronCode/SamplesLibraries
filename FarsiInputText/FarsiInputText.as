package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.MovieClip;
	import stageManager.StageManager;
	import sliderMenu.SliderManager;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import contents.alert.Alert;
	import flash.events.FocusEvent;
	import flash.text.TextFieldType;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import appManager.mains.AppWithContent;
	import com.mteamapp.StringFunctions;
	
	public class FarsiInputText extends Sprite
	{
		public function FarsiInputText()
		{
			StringFunctions.generateLinks()
			super();
			StageManager.setUp(stage);
			StageManager.add("text_container_mc",0,1);
			var textContainerMC:MovieClip = Obj.get("text_container_mc",this);
			var textField:TextField = Obj.findThisClass(TextField,textContainerMC);
			FarsiInputCorrection.setUp(textField);

			var sliderMC:MovieClip = Obj.get("slider_mc",this);
			SliderManager.setMenu(sliderMC,sliderMC.width,SliderManager.RIGHT_MENU,false,true);


			this.graphics.lineStyle(0,0);
			var Y:Number = 0 ;
			while(Y<this.stage.stageHeight*2)
			{
				this.graphics.moveTo(0,Y);
				this.graphics.lineTo(this.stage.stageWidth,Y);
				Y+=20;
				var tf:TextField = new TextField();
				this.addChild(tf);
				tf.selectable = false ;
				tf.text = Y.toString();
				tf.y = Y ;
			}

			AppWithContent

			//stage.addEventListener(FocusEvent.Fo,checkFocusedItem);
			//this.addEventListener(Event.ENTER_FRAME,checkFocusedItem)

			//stage.addEventListener(FarsiInputCorrectionEvent.TEXT_FIELD_SELECTED,checkFocusedItem);
			//stage.addEventListener(FarsiInputCorrectionEvent.TEXT_FIELD_CLOSED,noFocusedText);
		}

		/*private function noFocusedText(e:FarsiInputCorrectionEvent):void
		{
			trace("Focused out");
			root.y = 0 ;
			if(stageMask!=null)
			{
				stageMask.visible = false ;
			}
		}

		private var stageMask:Sprite ;

		private function checkFocusedItem(e:FarsiInputCorrectionEvent):void
		{
			trace("Event distatched");
			var focucedTF:TextField = e.textField;
			var keyBoardHeight:Number = stage.softKeyboardRect.height ;
			//Debug line
				if(DevicePrefrence.isPortrait())
					keyBoardHeight = 400 ;
			if(keyBoardHeight>0)
			{
				var extraHeight:Number = 100 ;//100

				var stageScale:Number = stage.fullScreenWidth/stage.stageWidth ;
				keyBoardHeight = keyBoardHeight*stageScale+extraHeight*stageScale;
				var stageFullscreenH:Number = StageManager.stageVisibleArea.height;
				var textFieldBottomBasedOnRoot:Number = focucedTF.getBounds(root).bottom ;
				var textFeildBottom:Number = textFieldBottomBasedOnRoot+StageManager.stageDelta.height/2;

				
				if(stageMask==null)
				{
					stageMask = new Sprite();
					stageMask.graphics.beginFill(stage.color&0x00ffffff);//stage.color
					stageMask.graphics.drawRect(0,0,StageManager.stageRect.width,keyBoardHeight)
				}
				stageMask.visible = true ;
				(root as DisplayObjectContainer).addChild(stageMask);
				stageMask.y = textFieldBottomBasedOnRoot;//stage.stageHeight;//StageManager.stageVisibleArea.bottom;

				trace("stageScale : "+stageScale);
				trace("keyBoardHeight : "+keyBoardHeight);
				trace("stageFullscreenH : "+stageFullscreenH);
				trace("textFeildBottom : "+textFeildBottom);
				trace("focucedTF.getBounds(root) : "+focucedTF.getBounds(root));
				trace("StageManager.stageDelta.height : "+StageManager.stageDelta.height);

				root.y = Math.round(-1*Math.max(0,keyBoardHeight - ( stageFullscreenH - textFeildBottom ))*2)/2;
			}
			else
			{
				root.y = 0 ;
			}
		}*/

		override public function set y(value:Number):void
		{
			trace(value);
			super.y = value ;
		}

		private function showScale(e:Event):void
		{
			root.y = -1*(stage.softKeyboardRect.height*(stage.fullScreenWidth/stage.stageWidth)+200);
		}

		
	}
}