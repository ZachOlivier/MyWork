package  
{
	import engine.*;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;

	
	public class LoseState implements IState
	{
		
		
		public function LoseState()
		{
		}
		
		
		public function start():void
		{
			var tfLose		:TextField;
			var tfScore		:TextField;
			
			tfLose = maketf();
			tfLose.text = "  Zombies Devoured Your Corpse!";
			tfLose.y = 10;
			Display.ui.addChild( tfLose );
			
			tfScore = maketf();
			tfScore.text = "  Your Score : " + Global.score;
			tfScore.y = 245;
			Display.ui.addChild( tfScore );
			
			var button :Sprite;
		
			button = makeButton("Try Again?", clickBack );
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
			
			Global.level = 1;
			
			Global.score = 0;
		}
		
		
		public function clickBack( button:ButtonPure ):void
		{
			State.current = new ShellState();
		}
		
		
	}
}