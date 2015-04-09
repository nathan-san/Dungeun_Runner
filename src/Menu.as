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
	
	public class Menu extends Sprite
	{
		[Embed(source="../img/title.png")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		
			public function Menu()
			{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			 this.scaleX = this.scaleY = 1.5;
			 this.x = 20;
			 this.y = 70;
			}
			
			
			private function init(e:Event = null):void
			{
			bgImage = new BackgroundImage();
			addChild(bgImage);
			this.addEventListener(Event.ENTER_FRAME, loop)
			
			}
			private function loop(e:Event):void
			{
				//
			}
			public function keyDown(e:KeyboardEvent):void
			{
				if (e.keyCode == 32) {
					removeChild(this);
				}
			}
	}

}