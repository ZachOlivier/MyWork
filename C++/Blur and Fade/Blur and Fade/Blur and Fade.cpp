//Zachary Olivier
//James Duckworth
//February 28, 2010
//Use DarkGDK to display a bitmap image, then blue and fade it

#include "DarkGDK.h"

const int WAIT = 500;

void DarkGDK()

{

	//Set window title
	dbSetWindowTitle("Good-Bye Chef");

	//Load image
	dbLoadBitmap("chef2.jpg", 1);

	//Display image
	dbCopyBitmap(1, 0);
 
	//Wait for user to press a key
	dbWaitKey();

	//Blur image every 1 second
	dbBlurBitmap(0, 3);
	dbWait(WAIT);

	dbBlurBitmap(0, 6);
	dbWait(WAIT);

	dbBlurBitmap(0, 9);

	//Fade image every 1 second
	dbFadeBitmap(0, 75);
	dbWait(WAIT);

	dbFadeBitmap(0, 50);
	dbWait(WAIT);

	dbFadeBitmap(0, 25);
	dbWait(WAIT);

	dbFadeBitmap(0, 0);

	//Wait for user to press a key
	dbWaitKey();

}