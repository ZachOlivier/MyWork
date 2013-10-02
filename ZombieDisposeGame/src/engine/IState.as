package engine 
{
	import flash.display.Stage;

	public interface IState 
	{
		function start()	:void;
		function update()	:void;
		function end()		:void;
	}

}