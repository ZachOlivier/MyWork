//Zachary Olivier
//February 17, 2010
//Use DarkGDK to create England's Flag

#include "DarkGDK.h"

void DarkGDK()

{

	//Window title
	dbSetWindowTitle("England Flag");

	//Set colors
	DWORD red = dbRGB(255, 0, 0);
	DWORD white = dbRGB(255, 255, 255);
	DWORD black = dbRGB(0, 0, 0);

	//White background
	dbInk(white, black);

	//Box
	dbBox(0, 0, 640, 480);

	//Red for flag
	dbInk(red, black);

	//Boxes
	dbBox(280, 0, 360, 480);
	dbBox(0, 210, 640, 270);

	//Wait for user to press a key
	dbWaitKey();

}