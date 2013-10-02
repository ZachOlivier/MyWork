package  
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class IntroState implements IState
	{
		private var drunkMeter			:DrunkMeter;
		private var player				:Player;
		
		
		// Don't add to this CTOR
		public function IntroState()
		{
		}
		
		
		// When the game changes to this state, add this once
		public function start():void
		{
			// Make sure the console is not visible
			Display.console.visible = false;
			
			// Create my drunk meter, place it, size it and add them to the display
			drunkMeter = new DrunkMeter();
			drunkMeter.x = 150;
			drunkMeter.width = 350;
			Display.ui.addChild( drunkMeter );
			
			// Create my player, place it, size it and add it to the display
			player = new Player();
			player.width = 80;
			player.height = 96;
			player.y = Display.height / 2;
			Display.ui.addChild( player );
			
			// Create my text fields, place them and add them to the display
			var tfRedScore:TextField = maketf();
			tfRedScore.text = "RED " + Global.redScore + " / 10";
			tfRedScore.x = 620;
			tfRedScore.y = 0;
			Display.ui.addChild( tfRedScore );
			
			var tf:TextField = maketf();
			tf.text = "Drunk Meter ^^^^^, Don't Drink Too Much!";
			tf.x = 95;
			tf.y = 80;
			Display.ui.addChild( tf );
			
			tf = maketf();
			tf.text = "Hold 'W' or Arrow Up to move up";
			tf.x = 95;
			tf.y = 170;
			Display.ui.addChild( tf );
			
			tf = maketf();
			tf.text = "Hold 'S' or Arrow Down to move down";
			tf.x = 95;
			tf.y = 220;
			Display.ui.addChild( tf );
			
			tf = maketf();
			tf.text = "SPACE or Left Click to open/close mouth";
			tf.x = 95;
			tf.y = 270;
			Display.ui.addChild( tf );
			
			tf = maketf();
			tf.text = "Objective : Drink ONLY 10 Red Cocktails!";
			tf.x = 95;
			tf.y = 370;
			Display.ui.addChild( tf );
			
			tf = maketf();
			tf.text = "Try the controls out now!";
			tf.x = 95;
			tf.y = 470;
			Display.ui.addChild( tf );
			
			// Create my button, place it and add it to the display
			var button:Sprite = makeButton( "    I've Got This!", initiateGame );
			button.x = 250;
			button.y = Display.height - 70;
			Display.ui.addChild( button );
		}
		
		
		// Constantly update this state until the game changes states
		public function update():void
		{
			// Update the player
			player.update();
		}
		
		
		// When the game goes to a new state
		public function end():void
		{
			// Clear the display
			Display.clear();
		}
		
		
		// My function for sending the game to the shell state
		public function initiateGame( button:ButtonPure ):void
		{
			State.current = new ShellState();
		}
	}
}