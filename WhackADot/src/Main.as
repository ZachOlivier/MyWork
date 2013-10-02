package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	
	
	/// Game to "whack" a dot/box by clicking on it
	public class Main extends Sprite 
	{	
		// -- CONSTANTS --
		
		private const FLASH_FRAMES		:int = 5;	// # of frames flashing a color when successfully clicking
		private const POINTS_PER_CLICK	:int = 10;	// # of points per successful click
		private const TIME_READY		:int = 2000;
		private const TIME_SET			:int = 3000;
		private const TIME_GO			:int = 4000;
		

		// -- MEMBERS --
		
		private var score		:int = 0;
		private var nextAppear	:int = 0;
		private var threshold	:int = 1500;
		private var bgFlashBlue	:int = 0;
		private var bgFlashRed	:int = 0;
		
		// Click variable to change from a box to a dot
		public var click		:int = 0;
		
		// Textfield variable to show the current score
		public var tfScore:TextField = new TextField();
		
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			nextAppear = threshold * 2;
			addEventListener( Event.ENTER_FRAME, onFrame );
		}
		
		
		/// Called once every frame
		private function onFrame( e:Event ):void
		{
			var now:int = getTimer();	// get the # of milliseconds since program started
			graphics.clear();			// remove anything on the screen (that was drawn into this sprite's vector graphics layer.)
			
			// Show a text field that displays the current score
			tfScore.defaultTextFormat 	= new TextFormat( "Arial", 17 );
			tfScore.autoSize 			= TextFieldAutoSize.CENTER;
			tfScore.text = "Score : " + score;
			
			addChild(tfScore);
			
			/// Use conditionals for a street-light start, flashing and dot spawning logic
			if ( now < TIME_READY )
			{
				graphics.beginFill( 0xff0000 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
			}
			else if ( now < TIME_SET )
			{
				graphics.beginFill( 0xffff00 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
			}
			else if ( now < TIME_GO )
			{
				graphics.beginFill( 0x00ff00 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
			}
			else
			{
				stage.addEventListener( MouseEvent.CLICK, missedClick );
				
				// Only create a new dot if the time is past when it's suppose to next appear.
				if ( now > nextAppear )
				{
					// Shrink the threshold, which determins how soon the next dot will appear.
					threshold -= 50;
					
					// When the timer ends, remove the current score text field
					if ( threshold < 1 )
					{
						removeChild( tfScore );
					}
					
					// If threshhold is less than half a second, don't create any more dots
					// as the game is about to end...
					if ( threshold < 500 )
					{
						// Make sure last dot is gone before showing game over
						if ( numChildren == 0 )
						{
							removeEventListener( Event.ENTER_FRAME, onFrame ); 	// stop frame updates
							gameOver();											// perform game over actions
							return;
						}
					}
					else
					{
						switch ( click )
						{
						case 0:
						// Make new dot to click...
						var dot :Dot = new Dot( this );
						addChild( dot );
						dot.x = Math.random() * stage.stageWidth;
						dot.y = Math.random() * stage.stageHeight;
						
						// Compute when the next dot will appear after this one.
						nextAppear = now + threshold;
						
						click++;
						
						break;
						
						case 1:
						// Make new box to click...
						var box :Box = new Box( this );
						addChild( box );
						box.x = Math.random() * stage.stageWidth;
						box.y = Math.random() * stage.stageHeight;
						
						// Compute when the next box will appear after this one.
						nextAppear = now + threshold;
						
						click--;
						
						break;
						}
					}
				}
			}
			
			// If a flash is suppose to be up on the screen for a correct click...
			if ( bgFlashBlue > 0 ) 
			{
				// reduce the # of frames flash should occur.
				bgFlashBlue--;
				
				// draw a giant rectangle the complete size of the screen
				graphics.beginFill( 0x0000ff );
				graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight );
				graphics.endFill();
			}
			
			// If a flash is suppose to be up on the screen for a missed click...
			if ( bgFlashRed > 0 ) 
			{
				// reduce the # of frames flash should occur.
				bgFlashRed--;
				
				// draw a giant rectangle the complete size of the screen
				graphics.beginFill( 0xff0000 );
				graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight );
				graphics.endFill();
			}
		}
		
		
		/// Show game over information
		private function gameOver() :void
		{
			// Create text field (assume system has Arial font installed.)
			var tf:TextField 		= new TextField();
			tf.defaultTextFormat 	= new TextFormat( "Arial", 64 );
			tf.autoSize 			= TextFieldAutoSize.CENTER;
			tf.text 				= "Score: " + score;
			addChild( tf );
			
			// Center text field
			tf.x = (stage.stageWidth * 0.5) - (tf.textWidth * 0.5);
			tf.y = (stage.stageHeight * 0.5) - (tf.textHeight * 0.5);
		}
		
		// Lower the score if the player misses a Dot when clicking, flash red
		public function missedClick( e:MouseEvent ):void {
			score -= POINTS_PER_CLICK;
			bgFlashRed = FLASH_FRAMES;
		}
		
		/// Add to score, setup a blue flash to occur
		public function addToScore():void {
			score += POINTS_PER_CLICK;
			bgFlashBlue = FLASH_FRAMES;
		}
		
	}
	
}