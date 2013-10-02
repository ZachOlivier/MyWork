//Zachary Olivier
//Duckworth C++
//March 17, 2010
//Use DarkGDK to create 2 balls that bounce

#include "DarkGDK.h"

void DarkGDK()

{

	//Set window's title
	dbSetWindowTitle("Bouncing Balls");

	//Variables
	const int RADIUS = 60;
	const int DISTANCE = 10;
	const int Center_X = dbScreenWidth() / 4;
	const int Bottom_Y = dbScreenHeight() - RADIUS;
	const int Top_Y = RADIUS;
	const int UP = 1;
	const int DOWN = 2;
	int y = Bottom_Y;
	int direction = UP;

	//Variables 2
	const int CENTER_X = dbScreenWidth() / 2;
	const int BOTTOM_Y = dbScreenHeight() - RADIUS;
	const int TOP_Y = RADIUS;
	const int Down = 1;
	const int Up = 2;
	int Y = TOP_Y;
	int Direction = Down;

	//Set refresh screen
	dbSyncOn();
	dbSyncRate(60);

	//Animation
	while ( LoopGDK() )
	{
		//Clear screen
		dbCLS();

		//Draw balls
		dbCircle(Center_X, y, RADIUS);
		dbCircle(CENTER_X, Y, RADIUS);

		//Switch
		switch (direction)
		{

		case UP:

		if (y > Top_Y)
			{
			//Move ball up
			y -= DISTANCE;
			}
		else
			{
			y = Top_Y;
			direction = DOWN;
			}

		break;

		case DOWN:

		if (y < Bottom_Y)
			{
			//Move ball down
			y += DISTANCE;
			}
		else
			{
			y = Bottom_Y;
			direction = UP;
			}

		break;
		}
	

	

		//Switch
		switch (Direction)
		{

		case Down:

		if (Y < BOTTOM_Y)
			{
			//Move ball down
			Y += DISTANCE;
			}
		else
			{
			Y = BOTTOM_Y;
			Direction = Up;
			}

		break;

		case Up:

		if (Y > TOP_Y)
			{
			//Move ball down
			Y -= DISTANCE;
			}
		else
			{
			Y = TOP_Y;
			Direction = Down;
			}

		break;
		}

		//Refresh screen
		dbSync();

	}
	
	//Wait for user to press a key
	dbWaitKey();

}