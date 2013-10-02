package utils 
{
	import flash.display.Sprite;
	import flash.display.Stage;

	
	/**
	 * Globally accessible information about the display (aka: stage)
	 */
	public class Display 
	{
		static public var width	: uint;
		static public var height: uint;
		
		static public var game	: Sprite;
		static public var ui	: Sprite;
		

		static public function init( stage:Stage ):void
		{
			// Set the global display properties.
			width 	= stage.stageWidth;
			height	= stage.stageHeight;
			
			// Create sprites for all pieces of the game to draw to; and one for instructions.
			game	= new Sprite();
			ui		= new Sprite();
			
			// Adding ui last so it will be draw later than anything
			// put on the game layer.
			stage.addChild( game );
			stage.addChild( ui );
		}
	}

}