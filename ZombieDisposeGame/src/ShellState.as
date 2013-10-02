package  
{
	import engine.*;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;

	
	public class ShellState implements IState
	{
		
		
		public function ShellState()
		{
		}
		
		
		public function start():void
		{
			var tf		:TextField;
			
			tf = maketf();
			tf.text = "  Welcome to Zombie Dispose Game!";
			tf.y = 10;
			Display.ui.addChild( tf );
			
			var button:Sprite = makeButton( "Kill Some Zombies", clickPlay );
			Display.ui.addChild( button );
			button.x = 20;
			button.y = Display.height - 150;
		}
		
		
		public function update():void
		{
		}
		
		
		public function end():void
		{
			Display.clear();
		}
		
		
		public function clickPlay( button:ButtonPure ):void
		{
			State.current = new GameState();
		}
		
		
	}
}