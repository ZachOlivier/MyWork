//Zachary Olivier
//Duckworth C++
//March 10, 2010
//Use Dark GDK to create a brick wall loop pattern

#include "DarkGDK.h"

//Constants
const int WallWidth = 640;
const int WallHeight = 480;
const int BrickWidth = 40;
const int BrickHeight = 20;
const int BrickOffset = (BrickWidth/2);
const int BrickMortar = 1;
const int TotalColumns = (WallWidth/BrickWidth);
const int TotalRows = (WallHeight/BrickHeight);

void DrawBrick(int, int);

void DarkGDK()

{

	//Window title
	dbSetWindowTitle("Brick Wall Pattern");

	//Brick's variables
	int X;
	int Y;

	//Draw wall
	for(int row = 0; row <= TotalRows; row++)

	{
		for(int column = 0; column <= TotalColumns; column++)

		{
			//Find X coordinate
			X = column * (BrickWidth + BrickMortar);

			//Find Y coordinate
			Y = row * (BrickHeight + BrickMortar);

			//Current row is even?
			if(row % 2)

			{
				//Offset bricks in this row to left by half width
				X -= BrickOffset;
			}

			//Draw brick in current column and row
			DrawBrick(X, Y);

		}

	}

	//Wait for user to press a key                                                                                                                                                                                                                         
	dbWaitKey();

}

void DrawBrick(int leftX, int leftY)

{

	//Brick constants
	const int Width = 40;
	const int Height = 20;

	//Color constants
	const DWORD Red = dbRGB(255, 0, 0);
	const DWORD Black = dbRGB(0, 0, 0);

	//Set color
	dbInk(Red, Black);

	//Draw brick
	dbBox(leftX, leftY, leftX + Width, leftY + Height);

}