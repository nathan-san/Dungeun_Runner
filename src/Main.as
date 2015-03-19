package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author niels
	 */
	public class Main extends Sprite 
	{
		private var background:Background;
		private var cel:ceiling;
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			background = new Background();
			cel = new ceiling();
			addChild(background);
			addChild(cel);
			// entry point
			
		}
		
	}
	
}