package 
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public class Resources
	{
		// My cocktail bitmaps
		[Embed(source = "bitmaps/blueCocktail.png")]
		public static var BlueCocktail	:Class;
		
		[Embed(source = "bitmaps/greenCocktail.png")]
		public static var GreenCocktail	:Class;
		
		[Embed(source = "bitmaps/purpleCocktail.png")]
		public static var PurpleCocktail:Class;
		
		[Embed(source = "bitmaps/redCocktail.png")]
		public static var RedCocktail	:Class;
		
		[Embed(source = "bitmaps/yellowCocktail.png")]
		public static var YellowCocktail:Class;
		
		// My other bitmaps
		[Embed(source = "bitmaps/winScreen.png")]
		public static var WinScreen		:Class;
		
		[Embed(source = "bitmaps/table.png")]
		public static var Table			:Class;
		
		[Embed(source = "bitmaps/drunkLose.png")]
		public static var DrunkLose		:Class;
		
		[Embed(source = "bitmaps/cocktailParty.png")]
		public static var CocktailParty	:Class;
		
		// My drunk meter bitmaps
		[Embed(source = "bitmaps/drunkZero.png")]
		public static var DrunkZero		:Class;
		
		[Embed(source = "bitmaps/drunkOne.png")]
		public static var DrunkOne		:Class;
		
		[Embed(source = "bitmaps/drunkTwo.png")]
		public static var DrunkTwo		:Class;
		
		[Embed(source = "bitmaps/drunkThree.png")]
		public static var DrunkThree	:Class;
		
		[Embed(source = "bitmaps/drunkFour.png")]
		public static var DrunkFour		:Class;
		
		[Embed(source = "bitmaps/drunkFive.png")]
		public static var DrunkFive		:Class;
		
		[Embed(source = "bitmaps/drunkSix.png")]
		public static var DrunkSix		:Class;
		
		[Embed(source = "bitmaps/drunkSeven.png")]
		public static var DrunkSeven	:Class;
		
		[Embed(source = "bitmaps/drunkEight.png")]
		public static var DrunkEight	:Class;
		
		[Embed(source = "bitmaps/drunkNine.png")]
		public static var DrunkNine		:Class;
		
		[Embed(source = "bitmaps/drunkTen.png")]
		public static var DrunkTen		:Class;
		
		[Embed(source = "bitmaps/tooDrunk.png")]
		public static var TooDrunk		:Class;
		
		
		// My player bitmaps
		[Embed(source = "bitmaps/mouthOpen.png")]
		public static var MouthOpen		:Class;
		
		[Embed(source="bitmaps/mouthClosed.png")]
		public static var MouthClosed	:Class;
		
		
		// My sounds
		[Embed(source = "sounds/badCocktail.mp3")]
		public static var BadCocktail	:Class;
		
		[Embed(source = "sounds/goodCocktail.mp3")]
		public static var GoodCocktail	:Class;
		
		[Embed(source = "sounds/loseGame.mp3")]
		public static var LoseGame		:Class;
		
		[Embed(source = "sounds/mouthClose.mp3")]
		public static var MouthClose	:Class;
		
		[Embed(source = "sounds/mouthOpen.mp3")]
		public static var OpenMouth		:Class;
		
		[Embed(source = "sounds/youWin.mp3")]
		public static var YouWin		:Class;
		
		[Embed(source = "sounds/gameMusic.mp3")]
		public static var GameMusic		:Class;
		
		
		// My function for adding sound to the game
		static public function init():void
		{
			SoundManager.add( new AudioClip( BadCocktail, false ) );
			SoundManager.add( new AudioClip( GoodCocktail, false ) );
			SoundManager.add( new AudioClip( LoseGame, false ) );
			SoundManager.add( new AudioClip( MouthClose, false ) );
			SoundManager.add( new AudioClip( OpenMouth, false ) );
			SoundManager.add( new AudioClip( YouWin, false ) );
			SoundManager.add( new AudioClip( GameMusic, true ) );
		}
	}
}