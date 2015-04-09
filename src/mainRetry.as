package
{
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.media.SoundChannel;

/**
* ...
* @author niels
*/
	public class mainRetry extends Sprite
	{
		
		private var retry:Retry;
		private var main:Main;
		private var backMusic:Sound;
		private var myChannel:SoundChannel;
		//public var gamePlay = true;
	
			public function mainRetry():void
			{
				
				if (stage) init();
				else addEventListener(Event.ADDED_TO_STAGE, init);
				
			}
			
			private function init(e:Event = null):void
			{
				var backMusic:Sound = new Sound(new URLRequest("../img/dead.mp3")); 
				//myChannel = backMusic.play();
				retry = new Retry;
				addChild(retry);
				removeEventListener(Event.ADDED_TO_STAGE, init);
				
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDawn);
				
				var masker:Masker = new Masker();
				addChild(masker);
				
				this.mask = masker;       
			}
			
			public function keyDawn(e:KeyboardEvent):void
			{
				if (e.keyCode == 32) {
					myChannel.stop();
					removeEventListener(Event.ADDED_TO_STAGE, init);
					removeChild(retry);
					retry = null;
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDawn);
					main = new Main();
					addChild(main);
					
				}
			}
			
	}
}