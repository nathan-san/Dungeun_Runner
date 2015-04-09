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
	public class mainMenu extends Sprite
	{
		
		private var menu:Menu;
		private var main:Main;
		private var background:Background;	
		private var backMusic:Sound;
		private var load:URLRequest;
		private var myChannel:SoundChannel;
			public function mainMenu():void
			{
				
				if (stage) init();
				else addEventListener(Event.ADDED_TO_STAGE, init);
				
			}
			
			private function init(e:Event = null):void
			{	
				var backMusic:Sound = new Sound(new URLRequest("../img/menu.mp3")); 
				myChannel = backMusic.play();
				menu = new Menu();
				background = new Background();
				
				addChild(background);
				addChild(menu);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				
				var masker:Masker = new Masker();
				addChild(masker);
				this.mask = masker;       
			}
			public function checkStuff(e:Event):void
			{
				
			}
			
			public function keyDown(e:KeyboardEvent):void
			{
				if (e.keyCode == 32) {
					myChannel.stop();
					removeEventListener(Event.ADDED_TO_STAGE, init);
					removeChild(menu);
					removeChild(background);
					menu = null;
					
					main = new Main();
					addChild(main);
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
					stage.addEventListener(Event.ENTER_FRAME, checkStuff);
				}
			}
			
	}
}