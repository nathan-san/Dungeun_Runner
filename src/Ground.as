package  
{
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	public class Ground extends Sprite 
	{
		[Embed(source="../img/ground6.png")]
		private var BackgroundImage:Class;
		private var speed:Number = -9;
		private var bgImage:Bitmap;
		
		public function Ground() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		private function init(e:Event = null):void
		{
			for (var i:int = 0; i <= 0; i++)
			{
				bgImage = new BackgroundImage(); 
				addChild(bgImage);
				this.x = i*this.width +50;
				this.y = 460;
			}
			this.addEventListener(Event.ENTER_FRAME, loop)
		}
		private function loop(e:Event):void
		{
			this.x += speed;
		}
		
	}

}