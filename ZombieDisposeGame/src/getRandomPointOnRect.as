package  
{
	import flash.geom.Point;
		
	function getRandomPointOnRect( width:int, height:int ) :Point
	{
		var point	: Point = new Point();
		var max		: int = (width * 2) + (height * 2);
		var i		: int = Math.floor(Math.random() * max);
		
		if ( i < width )
			point.x = i;
		else if ( i < width * 2 )
		{
			point.x = i * 0.5;
			point.y = height;
		} else if ( i > max - height )
		{
			point.y = max - i;
		}
		else
		{
			point.x = width;
			point.y = max - height - i;
		}
		
		return point;
	}

}