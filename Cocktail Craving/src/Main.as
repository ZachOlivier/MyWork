package 
{
	import engine.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import net.hires.utils.Stats;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class Main extends Sprite
	{
		public function Main():void
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/**
		 * Initialize sub-systems, set initial state, and kick off game loop
		 */
		public function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Initialize my resources and stage
			Resources.init();
			Systems.init( stage );
			
			// Remember to comment this out for presenting!
			//addChild( new Stats() );
			
			// Make sure the game is reset
			Global.drunk = 0;
			Global.redScore = 0;
			
			State.current = new IntroState(); // Change to Intro State!
			
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		
		/**
				  Main GAME LOOP!
				  
				#
			  ##
		     ##
		   ####
		    ##########################
		   ##   ####################
		   #      ################
		            ############
				      ########
					     ##
			             ##
			             ##
			             ##
				    ############
		 */
			
		 
		private function update( e:Event ):void
		{
			Time.update();
			Input.update();
			State.update();
			
			Systems.console.update();
		}
	}
}