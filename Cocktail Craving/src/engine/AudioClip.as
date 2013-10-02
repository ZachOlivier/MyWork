package engine 
{
	import flash.display.BitmapDataChannel;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	/**
	 * Holds one or more instances of an audio clip (sound FX or music) being played.
	 */
	final public class AudioClip implements IDisposable
	{		
		public var SoundClass		: Class;					// Used as key in manager
		public var isMusic			: Boolean;
		
		private var sound			: Sound;
		private var channels		: Vector.<SoundChannel>;	// Channels used to play the sound
		private var finishCallbacks	: Vector.<Function>;		// Callback(s) to make when sound done playing
		
		
		/**
		 * CTOR
		 * @param	SoundClass	Sound class to instantiate for noise.
		 * @param	isMusic		Whether or not this sound is considered "music".
		 */
		public function AudioClip( SoundClass:Class, isMusic:Boolean = false)
		{	
			this.SoundClass		= SoundClass;
			this.sound			= new SoundClass();
			this.isMusic		= isMusic;
			this.channels		= new Vector.<SoundChannel>();
			finishCallbacks 	= new Vector.<Function>();
		}
		
		
		/// Psuedo-Destructor
		public function dispose():void 
		{
			var len:int = channels.length;
			for (var i:int = 0; i < len; ++i ) 
			{
				channels[i].stop();
				channels[i].removeEventListener( Event.SOUND_COMPLETE, onSoundComplete, false);
			}
			channels = null;
			finishCallbacks = null;		// note callbacks are not made if sounds are stopped via dispose!
		}
		
		
		/**
		 * A callback to make when the sound is finished playing.
		 * @param	func	Function to call.
		 */
		public function addFinishCallback( func:Function ):void 
		{
			finishCallbacks.push( func );
		}
		
		
		/// Play the associated sound.
		public function play():void 
		{	
			// Loop alot if the sound playing is music, otherwise no loops.
			var channel:SoundChannel = sound.play(0, isMusic ? 9999 : 0 );
		
			// Keep a hold of the channel we receive from Flash; also listen for the sound to complete.
			channels.push( channel );
			channel.addEventListener( Event.SOUND_COMPLETE, onSoundComplete, false, 0, true );
		}
		
		
		/// Immediate stop.
		public function stop():void 
		{
			for each( var sc:SoundChannel in channels )
				sc.stop()
				
			channels = new Vector.<SoundChannel>();
		}
		
		
		// Cleanup and callback
		private function onSoundComplete( e:Event ):void
		{	
			// Find the sound channel in our local collection and remove it.
			var channel:SoundChannel	= SoundChannel( e.target );
			var index:int 				= channels.indexOf( channel );
			channels.splice( index, 1 );
			
			channel.removeEventListener( Event.SOUND_COMPLETE, onSoundComplete, false );

			// If there are any callbacks set, raise them now.
			var len:int = finishCallbacks.length;
			for ( var i:int = 0; i < len; ++i ) 
			{
				finishCallbacks[i].call();
			}			
		}
		
		
		/// If the channels collection has anything in it, then at least one sound it playing.
		public function get isPlaying():Boolean 
		{ 
			return channels.length > 0; 
		}
 	}
}