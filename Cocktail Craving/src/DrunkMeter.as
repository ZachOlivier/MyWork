package 
{
	import engine.Systems;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class DrunkMeter extends Sprite
	{
		public var drunkMeter:Bitmap;
		
		
		// CTOR
		public function DrunkMeter()
		{
			// Set the drunk meter and add the bitmap to the sprite drunk meter
			drunkMeter = new Resources.DrunkZero;
			addChild( drunkMeter );
		}
		
		
		// Update the drunk meter when called
		public function update():void
		{
			// Depending on how drunk the player is
			switch ( Global.drunk )
			{
				// Change the drunk meter
				case 0 :
					drunkMeter = new Resources.DrunkZero;
					addChild( drunkMeter );
					break;
				case 1 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkOne;
					addChild( drunkMeter );
					break;
				case 2 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkTwo;
					addChild( drunkMeter );
					break;
				case 3 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkThree;
					addChild( drunkMeter );
					break;
				case 4 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkFour;
					addChild( drunkMeter );
					break;
				case 5 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkFive;
					addChild( drunkMeter );
					break;
				case 6 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkSix;
					addChild( drunkMeter );
					break;
				case 7 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkSeven;
					addChild( drunkMeter );
					break;
				case 8 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkEight;
					addChild( drunkMeter );
					break;
				case 9 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkNine;
					addChild( drunkMeter );
					break;
				case 10 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.DrunkTen;
					addChild( drunkMeter );
					break;
				case 11 :
					removeChild( drunkMeter );
					drunkMeter = new Resources.TooDrunk;
					addChild( drunkMeter );
					break;
			}
		}
	}
}