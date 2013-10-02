//Zachary Olivier
//Duckworth C++
//February 28, 2010
//Use DarkGDK to put your picture on different backgrounds

#include "DarkGDK.h"

void DarkGDK()

{

	//Set window title
	dbSetWindowTitle("The Lazy Tourist!");

	//Set color key
	dbSetImageColorKey(0, 255, 0);

	//Load images
	//1-4 are backgrounds
	dbLoadImage("Beach.bmp", 1);
	dbLoadImage("Snow.bmp", 2);
	dbLoadImage("Station.bmp", 3);
	dbLoadImage("Place.bmp", 4);
	dbLoadImage("Me2.bmp", 5);

	//Display background "1"
	dbPasteImage(1, 0, 0);

	//Display "Tourist"
	dbPasteImage(5, 0, 0, 1);

	//Wait for user to press a key
	dbWaitKey();

	//Display background "2"
	dbPasteImage(2, 0, 0);

	//Display "Tourist"
	dbPasteImage(5, 0, 0, 1);

	//Wait for user to press a key
	dbWaitKey();

	//Display background "3"
	dbPasteImage(3, 0, 0);

	//Display "Tourist"
	dbPasteImage(5, 0, 0, 1);

	//Wait for user to press a key
	dbWaitKey();

	//Display background "4"
	dbPasteImage(4, 0, 0);

	//Display "Tourist"
	dbPasteImage(5, 0, 0, 1);

	//Wait for user to press a key
	dbWaitKey();

}