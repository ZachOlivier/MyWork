package engine 
{
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Zach Olivier
	 */
	
	public interface IState 
	{
		function start()	:void;
		function update()	:void;
		function end()		:void;
	}
}