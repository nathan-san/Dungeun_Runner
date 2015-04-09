package
{
import flash.events.TimerEvent;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import flash.net.URLRequest;
import flash.utils.Timer;
import flash.events.TimerEvent;
import flash.events.KeyboardEvent;
import flash.display.MovieClip;
import tools.PerformanceTester;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.media.SoundChannel;
/**
* ...
* @author niels, nathan en yosha
*/
	public class Main extends Sprite
	{
		
		private var background:Background;
		private var cel:Ceiling;
		private var animations:Vector.<Animation>;
		private var pauzeTimer:Timer;
		private var scoreboard:ScoreBoard;
		private var anim:Animation;
		private var lava:Magma;
		private var gArray:Array;
		private var sArray:Array;
		private var grounded:Boolean;
		private var mainretry:mainRetry;
		private var axe:Axe;
		private var backMusic:Sound;
		private var myChannel:SoundChannel;
		
		//public var gamePlay = true;
	
			public function Main():void
			{
				
				if (stage) init();
				else addEventListener(Event.ADDED_TO_STAGE, init);
				
			}
			
			private function init(e:Event = null):void
			{		
				var backMusic:Sound = new Sound(new URLRequest("../img/Hans.mp3")); 
				myChannel = backMusic.play();
				background = new Background();
				addChild(background);
				
				
				lava = new Magma();
				addChild(lava);
				gArray = new Array;
				sArray = new Array;
				var extraw:int = 0;
				
				
				//begin platform
				var d:Ground2 = new Ground2();
				d.x = w * 400 +extraw;
				gArray.push(d);
				addChild(d);
				extraw += 340;
				
				//level random generated met vallen.
				for (var w:int = 0; w < 100; w++) {
					var m:Number = Math.random();
					
					if (m > 0.6)
					{
						var b:Ground = new Ground();
						b.x = w * 400 +extraw;
						gArray.push(b);
						addChild(b);
						
					}
					else if (m<0.4)
					{
						
						var d:Ground2 = new Ground2();
						d.x = w * 400 +extraw;
						gArray.push(d);
						addChild(d);
						extraw += 340;
						if (m < 0.3)
						{
							axe = new Axe();
							axe.x = w * 400 + extraw;
							sArray.push(axe);
							addChild(axe);
							
							
						}
					}
					else
					{
						var a:Ground3 = new Ground3();
						a.x = w * 400 +extraw;
						extraw += 700;
						if (m > 0.4 && m <0.55)
						{
							axe = new Axe();
							axe.x = w * 400 + extraw -550;
							sArray.push(axe);
							addChild(axe);
							
							axe = new Axe();
							axe.x = w * 400 + extraw -100;
							sArray.push(axe);
							addChild(axe);
						}
						
						gArray.push(a);
						addChild(a);
						
						
					}
				}
				
				
				cel = new Ceiling();
				addChild(cel);
				scoreboard = new ScoreBoard();
				addChild(scoreboard);

				removeEventListener(Event.ADDED_TO_STAGE, init);
				stage.addEventListener(Event.ENTER_FRAME, checkStuff);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				// entry point
				animations = new Vector.<Animation>();
				
				for (var i:int = 0; i < 1; i++)
				{
					anim = new Animation(new SpriteSheet.RunSheet(),1,5, 5, 100, 120,0,300);
					addChild(anim);
					anim.x = 100;
					anim.y = 350;
					anim.animate();
				}
				
				var performancetest:PerformanceTester = new PerformanceTester();
				addChild(performancetest);
					
				pauzeTimer = new Timer(100,0);
				pauzeTimer.addEventListener(TimerEvent.TIMER, onReload);
				
				pauzeTimer.start();
				
				
				var masker:Masker = new Masker();
				addChild(masker);
				
				this.mask = masker;          
				
				
			}
			
			private function keyDown(e:KeyboardEvent):void
			{
				if (e.keyCode == 32 && anim.y+anim.height/2==anim.floor && grounded == true){
					anim.grav = -30;
				}
			}
			
			public function checkStuff(e:Event):void
			{
				anim.adjust();
				
				
				
				
				var length:int = gArray.length =sArray.length;
				var hitNothing:Boolean = true;
				
				
				//colliding functies voor ground en axes
				for (var i:int = 0; i < length; i++) 
				{
					if (anim.hitTestObject(sArray[i]))
					{
						dead();
					}
					if (anim.hitTestObject(gArray[i]))
					{
						hitNothing = false;
						
					}
				}
				
				if (hitNothing) { anim.floorValue = 600; grounded = false; }
				else { anim.floorValue = 435; grounded = true }
				
				
				//bij lava dus dood.
				if (anim.y >= 445 && anim.y<= 500)
				{
				
				dead();
				}
				
			}
			
			//dood functie die naar retry scherm gaat (mainRetry).
			public function dead():void
			{
				myChannel.stop();
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				removeEventListener(Event.ADDED_TO_STAGE, init);
				stage.removeEventListener(Event.ADDED_TO_STAGE, checkStuff);
				
				
				
				mainretry = new mainRetry();
				addChild(mainretry);
				
			}
			
			private function onReload(e:TimerEvent):void 
			{
				scoreboard.score ++;	
			}
			
			
			
	}
}