package
{
	import flash.display.MovieClip;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	
	import fileBrowser.FileBrowser2;
	
	import netManager.urlSaver.URLSaver;
	import netManager.urlSaver.URLSaverEvent;
	
	public class FileBrowser extends MovieClip
	{
		public function FileBrowser()
		{
			super();
			//Download file
			var fileSaver:URLSaver = new URLSaver();
			fileSaver.addEventListener(URLSaverEvent.LOADING,showPercent);
			fileSaver.addEventListener(URLSaverEvent.LOAD_COMPLETE,fileDownloaded);
			trace("*** Start file downlading");
			fileSaver.load("https://sample-videos.com/audio/mp3/crowd-cheering.mp3");
		}
		
		private function showPercent(e:URLSaverEvent):void
		{
			trace(e.precent);
		}
		
		private function fileDownloaded(e:URLSaverEvent):void
		{
			trace("Load completed");
			//You could change the buttons label as you need
			FileBrowser2.setUp(1,1,1,1);
			FileBrowser2.browsToSave(e.loadedBytes,"fileName.mp3");
		}
	}
}