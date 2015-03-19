package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author niels
	 */
	
	public class Main extends Sprite 
	{
		private var background:Background;
		private var player:PlayerMovement = new PlayerMovement();
		private var cel:Ceiling;
		private var ground:Ground;
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			background = new Background();
			cel = new Ceiling();
			ground = new Ground();
			
			addChild(background);
			addChild(cel);
			addChild(ground);
			// entry point
			
			player.x = 10;
		   player.y = 350;
		   addChild(player);
		   stage.addEventListener(Event.ENTER_FRAME, checkStuff);
		   stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			
		}
		
		
		private function init(e:Event = null):void 
		  {
		   removeEventListener(Event.ADDED_TO_STAGE, init);
		  }
		  
		  public function checkStuff(e:Event):void
		  {
		   player.adjust();
		  }

		  public function keyDown(e:KeyboardEvent):void
		  {
		   if (e.keyCode == 32 && player.y+player.height/2==player.floor){
			player.grav = -15;
		   }
  }
		
	}
	
}