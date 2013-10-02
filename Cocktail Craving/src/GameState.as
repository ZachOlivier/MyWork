package  
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class GameState implements IState
	{
		private const COCKTAIL_BASE		:int = 4;
		
		public var speed				:int = 7;
		
		public var canMiss				:Boolean;
		
		public var tfRedScore			:TextField = maketf();
		
		private var drunkMeter			:DrunkMeter;
		private var cocktail			:Cocktail;
		private var player				:Player;
		
		private var cocktails			:Vector.<Cocktail>;
		
		
		// Don't add to this CTOR
		public function GameState()
		{
		}
		
		
		// When the game changes to this state, add this once
		public function start():void
		{
			// Play the game music
			Systems.sound.play( Resources.GameMusic );
			
			// Place the red score field and add it to the display
			tfRedScore.x = 620;
			tfRedScore.y = 0;
			Display.ui.addChild( tfRedScore );
			
			// Create my tables, place them, size them and add them to the display
			var table:Bitmap = new Resources.Table;
			table.width = Display.width - 92;
			table.x = 92;
			table.y = 50;
			Display.background.addChild( table );
			
			table = new Resources.Table;
			table.width = Display.width - 92;
			table.x = 92;
			table.y = 190;
			Display.background.addChild( table );
			
			table = new Resources.Table;
			table.width = Display.width - 92;
			table.x = 92;
			table.y = 330;
			Display.background.addChild( table );
			
			table = new Resources.Table;
			table.width = Display.width - 92;
			table.x = 92;
			table.y = 470;
			Display.background.addChild( table );
			
			// Send the first 4 cocktails and write to the console
			newRound();
			Systems.console.add( "Four New Cocktails!" );
			
			// Create my player, place it, size it and add it to the display
			player = new Player();
			player.y = ( Display.height / 2 );
			Display.main.addChild( player );
			
			// Create my cocktail, place it, size it and add it to the display
			drunkMeter = new DrunkMeter();
			drunkMeter.x = 150;
			drunkMeter.width = 350;
			Display.ui.addChild( drunkMeter );
		}
		
		
		// Constantly update this state until the game changes states
		public function update():void
		{
			// Change the blur effect for both the main layer and the background layer ( the player, cocktails and tables )
			Display.main.filters = [ new BlurFilter ( Global.drunk, Global.drunk ) ];
			Display.background.filters = [ new BlurFilter ( Global.drunk, Global.drunk ) ];
			
			// Change the text when the score increases
			tfRedScore.text = "RED " + Global.redScore + " / 10";
			
			// Get the length of cocktails vector
			var len		:int = cocktails.length;
			
			// Update each cocktail
			for ( var i:int = 0; i < len; i++ )
			{
				cocktail = cocktails[i];
				
				cocktail.x -= speed;
			}
			
			// Update the player and drunk meter
			player.update();
			drunkMeter.update();
			
			// Check each cocktail
			for ( i = len - 1; i >= 0; i-- )
			{
				cocktail = cocktails[i];
				
				// If a cocktail hits the player and its mouth is open, and the cocktail is red
				if ( player.isColliding( cocktail ) && player.mouthOpen == true && cocktail.color == 3 )
				{
					// Remove the cocktail
					Display.main.removeChild( cocktail );
					cocktails.splice( i, 1 );
					
					// Play a good sound and write to the console
					Systems.sound.play( Resources.GoodCocktail );
					Systems.console.add( "You Drank A Red Cocktail!" );
					
					// Increase the cocktails speed
					speed += 3;
					
					// It's OK if another red cocktail is missed
					canMiss = false;
					
					// Change the drunk meter and score
					Global.drunk += 1;
					Global.redScore += 1;
				}
				
				// If a cocktail hits the player and its mouth is open, and the cocktail isn't red
				else if ( player.isColliding( cocktail ) && player.mouthOpen == true && cocktail.color != 3 )
				{
					// Remove the cocktail
					Display.main.removeChild( cocktail );
					cocktails.splice ( i, 1 );
					
					// Play a bad sound and write to the console
					Systems.sound.play( Resources.BadCocktail );
					Systems.console.add( "You Drank A Cocktail That Wasn't Red!" );
					
					// Increase the cocktails speed more than if they got a red cocktail
					speed += 6;
					
					// Change the drunk meter more than if they got a red cocktail
					Global.drunk += 2;
				}
				
				// If a red cocktail gets past the player and he didn't get a red cocktail this round
				else if ( cocktail.x < -60 && cocktail.color == 3 && canMiss == true )
				{
					// Play a lose sound
					Systems.sound.play( Resources.LoseGame );
					
					// Go to the lose state for missing a red cocktail and write to console
					youLoseMiss();
					Systems.console.add( "You Must Have Missed A Red Cocktail!" );
				}
				
				// If a cocktail gets past the player and off the stage
				else if ( cocktail.x < -160 )
				{
					// Remove the cocktail
					Display.main.removeChild( cocktail );
					cocktails.splice( i, 1 );
				}
			}
			
			// As soon as the cocktails are all removed
			if ( cocktails.length == 0 )
			{
				// Send 4 more cocktails and write to the console
				newRound();
				Systems.console.add( "Four New Cocktails!" );
			}
			
			// If the player got all of the correct cocktails
			if ( Global.redScore == 10 && Global.drunk == 10 )
			{
				// Play a win sound
				Systems.sound.play( Resources.YouWin );
				
				// Go to the win state and write to console
				youWin();
				Systems.console.add( "Congratulations, You Win!" );
			}
			
			// If the player got any of the wrong cocktails
			else if ( Global.redScore == 10 && Global.drunk > 10 )
			{
				// Play a lose sound
				Systems.sound.play( Resources.LoseGame );
				
				// Go to the lose state for getting too drunk and write to console
				youLoseDrunk();
				Systems.console.add( "You Drank Too Much!" );
			}
		}
		
		
		// When the game goes to a new state
		public function end():void
		{
			// Clear the display
			Display.clear();
			
			// Stop the music
			Systems.sound.stop( Resources.GameMusic );
		}
		
		
		// My function for creating 4 new cocktails
		public function newRound():void
		{
			// Make sure the player has to get at least 1 red cocktail per round
			canMiss = true;
			
			// Get a cocktail and make a new vector of cocktails
			var cocktail:Cocktail;
			cocktails = new Vector.<Cocktail>();
			
			// Create 4 new cocktails
			for ( var i:int = 0; i < COCKTAIL_BASE; i++ )
			{
				// Create a cocktail and add it to the vector of cocktails
				cocktail = new Cocktail();
				cocktails.push( cocktail );
				
				// Put the cocktail into the display
				Display.main.addChild( cocktail );
				
				// Place the cocktail's x at a random position between 800 and 900
				cocktail.x = 800 + ( Math.random() * 100 );
				
				// Place each cocktail in the correct y position
				if ( i == 0 )
				{
					cocktail.y = 60;
				}
				else if ( i == 1 )
				{
					cocktail.y = 200;
				}
				else if ( i == 2 )
				{
					cocktail.y = 340;
				}
				else if ( i == 3 )
				{
					cocktail.y = 480;
				}
			}
		}
		
		
		// My function for sending the game to the win state
		public function youWin():void
		{
			State.current = new WinState();
		}
		
		
		// My function for sending the game to the drunk lose state
		public function youLoseDrunk():void
		{
			State.current = new DrunkLoseState();
		}
		
		
		// My function for sending the game to the miss lose state
		public function youLoseMiss():void
		{
			State.current = new MissLoseState();
		}
	}
}