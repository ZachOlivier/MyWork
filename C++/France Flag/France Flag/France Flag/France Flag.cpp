//Zachary Olivier
//February 17, 2010
//Use DarkGDK to create France's Flag

#include "DarkGDK.h"

void DarkGDK()

{

	//Window title
	dbSetWindowTitle("French Flag");

	//Set colors
	DWORD red = dbRGB(255, 0, 0);
	DWORD white = dbRGB(255, 255, 255);
	DWORD blue = dbRGB(0, 0, 255);
	DWORD black = dbRGB(0, 0, 0);

	//Color left
	dbInk(blue, black);

	//Box
	dbBox(0, 0, 212, 480);

	//Color middle
	dbInk(white, black);

	//Box
	dbBox(212, 0, 424, 480);

	//Color right
	dbInk(red, black);

	//Box
	dbBox(424, 0, 640, 480);

	//Wait for user to press a key
	dbWaitKey();


}