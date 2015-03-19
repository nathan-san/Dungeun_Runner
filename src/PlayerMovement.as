package 
{
	 import flash.display.Bitmap;
	 import flash.display.Sprite;
	 import flash.display.MovieClip;
	 import flash.events.Event;
	 
	 /**
	  * ...
	  * @author ...
	  */
	 public class PlayerMovement extends MovieClip 
		 {
		  [Embed(source="../img/ground4.png")]
		  private var PlayerImage:Class;
		  private var plImage:Bitmap;
		  
		  public var grav:int = 0;
		  public var floor:int = 400;
		  
		  public function PlayerMovement() 
		  {
				this.addEventListener(Event.ADDED_TO_STAGE, init);
		  }
		  
		  private function init(e:Event = null):void
		  {
			   plImage = new PlayerImage(); 
			   addChild(plImage);
		  }
		  
		  public function adjust():void
		  {
			   this.y += grav;
			   if(this.y+this.height/2<=floor)
					grav++;
			   else{
					grav = 0;
					this.y = floor - this.height / 2;
			}
		 }
	  
	 }
}