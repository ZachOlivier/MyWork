//Zachary Olivier
//February 17, 2010
//Use DarkGDK to create Norway's Flag

#include "DarkGDK.h"

void DarkGDK()

{

	//Window title
	dbSetWindowTitle("Norway Flag");

	//Set colors
	DWORD red = dbRGB(255, 0, 0);
	DWORD white = dbRGB(255, 255, 255);
	DWORD blue = dbRGB(0, 0, 255);
	DWORD black = dbRGB(0, 0, 0);

	//Color 1
	dbInk(red, black);

	//Box
	dbBox(0, 0, 640, 480);

	//Color 2
	dbInk(white, black);

	//Boxes
	dbBox(0, 195, 640, 275);
	dbBox(195, 0, 265, 480);

	//Color 3
	dbInk(blue, black);

	//Boxes
	dbBox(0, 220, 640, 250);
	dbBox(215, 0, 245, 480);


	//Wait for user to press a key
	dbWaitKey();

}