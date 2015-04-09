package tools
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.System;
	import flash.text.TextField;
	/**
	* ...
	* @author erwin
	*/
	public class PerformanceTester extends Sprite
	{
		private var msg:String = "TMU: ";
		private var t:TextField;
		
			public function PerformanceTester()
			{
			addEventListener(Event.ENTER_FRAME, loop);
			t = new TextField();
			addChild(t);
			t.text = msg;
			}
			
			private function loop(e:Event):void
			{
			t.text = msg + " " + System.totalMemory;
			}
	}
}