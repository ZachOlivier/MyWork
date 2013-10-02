//Zachary Olivier
//Duckworth C++
//February 28, 2010
//Using DarkGDK, land a spaceship on a planet after user presses 5 keys

#include "DarkGDK.h"

void spaceship(int);

void DarkGDK()

{

	//Set window title
	dbSetWindowTitle("Spaceship Landing");

	//Key color
	dbSetImageColorKey(0, 255, 0);

	//Load images
	dbLoadImage("Space.bmp", 1);
	dbLoadImage("lunar surface.bmp", 2);
	dbLoadImage("spaceship.bmp", 3);

	spaceship(60);

	//Wait for user to press a key
	dbWaitKey();

	spaceship(120);

	//Wait for user to press a key
	dbWaitKey();

	spaceship(180);

	//Wait for user to press a key
	dbWaitKey();

	spaceship(240);

	//Wait for user to press a key
	dbWaitKey();

	spaceship(300);

	//Wait for user to press a key
	dbWaitKey();

}

void spaceship(int Y)

{

	//Show images
	dbPasteImage(1, 0, 0);
	dbPasteImage(2, 0, 0);
	dbPasteImage(3, 320, Y, 1);

}
