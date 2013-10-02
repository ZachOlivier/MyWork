//Zachary Olivier
//Duckworth C++
//March 10, 2010
//Use DarkGDK to change an images color

#include "DarkGDK.h"

void DarkGDK()

{

	//Window title
	dbSetWindowTitle("Color Manipulator");

	//Variables
	const int WIDTH = 640;
	const int HEIGHT = 480;
	const int DEPTH = 32;
	const int BLACK = 0;
	int green = 0;
	int blue = 0;

	//Colors
	DWORD pixelColor = 0;

	//Set display
	dbSetDisplayMode(WIDTH, HEIGHT, DEPTH);

	//Load and display image
	dbLoadBitmap("Color.png");

	//Wait for user to press a key
	dbWaitKey();

	for (int y = 0; y < HEIGHT; y++)
	{
		for (int x = 0; x < WIDTH; x++)
		{
			pixelColor = dbPoint(x, y);

			green = dbRGBG(pixelColor);
			blue = dbRGBB(pixelColor);
			
			if(green < 100 && blue < 100)
			{
				pixelColor = dbRGB(BLACK, BLACK, BLACK);

				dbDot(x, y, pixelColor);
			}
		}
	}

	//Wait for user to press a key
	dbWaitKey();

}