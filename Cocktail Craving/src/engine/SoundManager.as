package engine
{
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.net.SharedObject;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	final public class SoundManager 
	{
		private static var audioList: Dictionary;	
		
		
		/// Static Class CTOR
		{
			audioList = new Dictionary();
		}
		
		
		/// CTOR
		public function SoundManager()
		{
		}
		
		/**
		 * Adds an audio clip to be managed.
		 * By creating an audioclip beforehand, callback can be added, removed, etc....
		 * @param	audioClip
		 */
		public static function add( audioClip:AudioClip ):void 
		{
			audioList[ audioClip.SoundClass ] = audioClip;;
		}
		
		
		/// Play a loaded clip
		public function play( SoundClass:Class ):void
		{
			var audioClip:AudioClip = audioList[ SoundClass ];
			if ( audioClip == null ) {
				out("Cannot play missing sound.");
				return;
			}
			
			if ( audioClip.isMusic && audioClip.isPlaying )
				return;
			
			audioClip.play();
		}
		
		
		/// Is a sound playing?
		public function isPlaying( SoundClass:Class ):Boolean 
		{
			var audioClip:AudioClip = audioList[ SoundClass ];
			return ( audioClip && audioClip.isPlaying );		// is not null and set to playing?
		}
		
		
		/**
		 * Stop playing a sound, or all of the sounds.
		 * @param	soundClass	If null then all sounds are turned off, otherwise the class for this sound is turned off.
		 */
		public function stop( SoundClass:Class = null ):void
		{
			var audioClip:AudioClip;
			
			// If NULL is passed in, turn off all playing sounds.
			if ( SoundClass == null ) 
			{
				for each( audioClip in audioList )
					if ( audioClip.isPlaying )
						audioClip.stop();
			}
			else
			{
				audioClip = audioList[ SoundClass ];
				if ( audioClip != null ) {
					audioClip.stop();
				}
				else {
					warn("Unable to stop unknown sound class.");
				}
			}
		}
	}
}
