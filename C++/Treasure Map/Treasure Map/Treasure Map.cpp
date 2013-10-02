//Zachary Olivier
//Duckworth C++
//February 28, 2010
//Use DarkGDK to display a treasure map and the coordinates

#include "DarkGDK.h"

void DarkGDK()

{

	//Set variables
	int X;
	int Y;

	//Window title
	dbSetWindowTitle("Treasure Map");

	//Set key color
	dbSetImageColorKey(0, 255, 0);

	//Load image
	dbLoadImage("treasure map.bmp", 1);

	//Display image
	dbPasteImage(1, 0, 0);

	//Enter X coordinate
	dbPrint("Please enter the X coordinate for treasure!");
	X = atoi( dbInput() );

	//Enter Y coordinate
	dbPrint("Please enter the Y coordinate for treasure!");
	Y = atoi( dbInput() );

	DWORD red = dbRGB(255, 0, 0);
	DWORD black = dbRGB(0, 0, 0);

	dbInk(red, black);

	//Draw the X
	dbLine(X-10, Y-10, X+10, Y+10);
	dbLine(X-10, Y+10, X+10, Y-10);


	//Wait for user to press a key
	dbWaitKey();

}