package engine 
{
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public function warn( msg:String ):void 
	{		
		Systems.console.add( msg );
		trace( "2:" + msg );
	}
}