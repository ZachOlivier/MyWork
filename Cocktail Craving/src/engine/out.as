package engine 
{
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public function out( msg:String ):void 
	{
		Systems.console.add( msg );
		trace( msg );
	}
}