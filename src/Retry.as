package  
{
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Retry extends Sprite
	{
		[Embed(source="../img/retry.jpg")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		
			public function Retry()
			{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			private function init(e:Event = null):void
			{
			bgImage = new BackgroundImage();
			addChild(bgImage);
			
			}
			
			
	}

}