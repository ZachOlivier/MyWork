package  
{
	import engine.*;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;

	
	public class WinState implements IState
	{
		
		
		public function WinState()
		{
		}
		
		
		public function start():void
		{
			var tfWin		:TextField;
			var tfScore		:TextField;
			
			tfWin = maketf();
			tfWin.text = "  Congrats, You Survived And Got Rescued!";
			tfWin.y = 10;
			Display.ui.addChild( tfWin );
			
			tfScore = maketf();
			tfScore.text = "  Your Score : " + Global.score;
			tfScore.y = 245;
			Display.ui.addChild( tfScore );
			
			var button :Sprite;
		
			button = makeButton("Kill More Zombies", clickBack );
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