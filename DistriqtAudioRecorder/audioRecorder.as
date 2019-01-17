package
{
	import com.distriqt.extension.audiorecorder.*;
	import com.distriqt.extension.audiorecorder.events.*;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.text.TextField;
	
	public class audioRecorder extends Sprite
	{

		private var txt:TextField;
		
		public function audioRecorder()
		{
			super();
			
			;
			txt = new TextField;
			this.addChild(txt);
			txt.mouseEnabled = false ;
			txt.width = stage.stageWidth ;
			txt.height = stage.stageHeight ;
			txt.scrollV++;
			
			
			stage.addEventListener(MouseEvent.CLICK,authRequest);
		}
		
		private function log(str:String):void
		{
			txt.appendText(str+'\n') ;
		}
		
		
		public function authRequest(e:*=null):void
		{
			stage.removeEventListener(MouseEvent.CLICK,authRequest);
			switch (AudioRecorder.service.authorisationStatus())
			{
				case AuthorisationStatus.AUTHORISED:
					log( "authorised" );
					break;
				
				case AuthorisationStatus.SHOULD_EXPLAIN:
				case AuthorisationStatus.NOT_DETERMINED:
					AudioRecorder.service.addEventListener( AuthorisationEvent.CHANGED, authChangedHandler );
					AudioRecorder.service.requestAuthorisation();
					break;
				
				case AuthorisationStatus.DENIED:
				case AuthorisationStatus.RESTRICTED:
				case AuthorisationStatus.UNKNOWN:
					log( "denied or restricted" );
			}
			stage.addEventListener(MouseEvent.CLICK,start);
		}
		
		private function authChangedHandler( event:AuthorisationEvent ):void
		{
			log( "authChangedHandler( " + event.status + " )" );
		}
		
		
		private var _file:File = File.userDirectory.resolvePath("recording.m4a");
		
		public function start(e:*=null):void
		{
			stage.removeEventListener(MouseEvent.CLICK,start);
			log("save on : "+_file.nativePath);
			if (AudioRecorder.service.hasAuthorisation())
			{
				var options:AudioRecorderOptions = new AudioRecorderOptions();
				options.filename = _file.nativePath;
				
				var success:Boolean = AudioRecorder.service.start( options );
				
				log("start(): " + success );
			}
			else
			{
				log( "Not authorised for start" );
			}
			stage.addEventListener(MouseEvent.CLICK,stop);
		}
		
		public function stop(e:*=null):void
		{
			if (AudioRecorder.service.hasAuthorisation())
			{
				var success:Boolean = AudioRecorder.service.stop();
				log("stop(): " + success );
				
				//				AudioRecorder.service.removeEventListener( AudioRecorderEvent.START, audioRecorderEventHandler );
				//				AudioRecorder.service.removeEventListener( AudioRecorderEvent.COMPLETE, audioRecorderEventHandler );
				//				AudioRecorder.service.removeEventListener( AudioRecorderEvent.PROGRESS, audioRecorderEventHandler );
			}
			else
			{
				log( "Not authorised for stop" );
			}
			stage.addEventListener(MouseEvent.CLICK,start);
		}
		

	}
}