package 
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class Cocktail extends Sprite
	{	
		public var halfWidth	:Number = 20;
		public var halfHeight	:Number = 28;
		
		public var color		:int 	= 0;
		
		public var isDisposed	:Boolean = false;
		
		public var thisCocktail	:Bitmap;
		
		
		// CTOR
		public function Cocktail()
		{
			// Get a random number between 0 and 4 for color
			color = ( Math.random() * 4 );
			
			// Set the color based on the random number
			if ( color == 0 )
			{
				thisCocktail = new Resources.BlueCocktail();
			}
			else if ( color == 1 )
			{
				thisCocktail = new Resources.GreenCocktail();
			}
			else if ( color == 2 )
			{
				thisCocktail = new Resources.PurpleCocktail();
			}
			else if ( color == 3 )
			{
				thisCocktail = new Resources.RedCocktail();
			}
			else if ( color == 4 )
			{
				thisCocktail = new Resources.YellowCocktail();
			}
			
			// Resize the bitmap and add it to the sprite cocktail
			thisCocktail.width = halfWidth * 2;
			thisCocktail.height = halfHeight * 2;
			addChild( thisCocktail );
		}
	}
}