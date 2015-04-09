package
{
/**
* ...
* @author Nathan Nieuwenhuizen
*/
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
	public class Ground2 extends Sprite
	{
		[Embed(source="../img/ground5.png")]
		private var BackgroundImage:Class;
		private var speed:Number = -9*1.5;
		private var bgImage:Bitmap;
		
		public function Ground2()
		{
		this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
		
			bgImage = new BackgroundImage();
			addChild(bgImage);
			
			this.y = 465;
			this.addEventListener(Event.ENTER_FRAME, loop)
		}
		
		
		
		
		private function loop(e:Event):void
		{
			this.x += speed;
		}
	}
}