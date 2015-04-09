package
{
/**
* ...
* @author Nathan Nieuwenhuizen
*/
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;

	public class Magma extends Sprite
	{
	[Embed(source="../img/magma.png")]
	private var BackgroundImage:Class;
	private var speed:Number = -8*1.5;
	private var bgImage:Bitmap;
	
		public function Magma()
		{
		this.addEventListener(Event.ADDED_TO_STAGE, init);
		this.x = 0;
		this.y = 420;
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