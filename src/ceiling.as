package
{
/**
* ...
* @author Nathan Nieuwenhuizen
*/
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;

	public class Ceiling extends Sprite
	{
	[Embed(source="../img/ceiling2.png")]
	private var BackgroundImage:Class;
	private var speed:Number = -10*1.5;
	private var bgImage:Bitmap;
	
		public function Ceiling()
		{
		this.addEventListener(Event.ADDED_TO_STAGE, init);
		this.x = 0;
		}
		
		private function init(e:Event = null):void
		{
		bgImage = new BackgroundImage();
		addChild(bgImage);
		this.addEventListener(Event.ENTER_FRAME, loop)
		}
		
		private function loop(e:Event):void
		{
		this.x += speed;
			if (this.x < -1200)
			{
			this.x = 0;
			}
		}
	}
}