//Zachary Olivier
//February 17, 2010
//Use DarkGDK to create a user-colored box

#include "DarkGDK.h"

void DarkGDK()

{

	//Window title
	dbSetWindowTitle("Color The Box!");

	//Introduction
	dbPrint();
	dbPrint("Please enter a color to view the box.");
	dbPrint();

	//Variables
	int Red, Green, Blue;
	DWORD black = dbRGB(0, 0, 0);

	//Statement/set color
	Red = atoi( dbInput() );
	Green = atoi( dbInput() );
	Blue = atoi( dbInput() );
	DWORD usercolor = dbRGB(Red, Green, Blue);

	//Declare color
	dbInk(usercolor, black);

	//Draw the box
	dbBox(150, 100, 450, 500);

	//Wait for user to press a key
	dbWaitKey();

}