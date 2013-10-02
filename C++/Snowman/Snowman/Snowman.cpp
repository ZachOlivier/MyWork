//Zachary Olivier
//Duckworth C++
//March 3, 2010
//Use DarkGDK and required functions to draw a snowman

#include "DarkGDK.h"

void drawBase();
void drawMidSection();
void drawArms();
void drawHead();
void drawHat();

void DarkGDK()

{

	drawBase();
	drawMidSection();
	drawArms();
	drawHead();
	drawHat();

	//Window title
	dbSetWindowTitle("Snowman!");

	//Wait for user to press a key
	dbWaitKey();

}

void drawBase()

{

	//Set colors
	DWORD black = dbRGB(0, 0, 0);
	DWORD white = dbRGB(255, 255, 255);

	dbInk(white, white);

	dbCircle(319, 239, 45);

}

void drawMidSection()

{

	//Set colors
	DWORD black = dbRGB(0, 0, 0);
	DWORD white = dbRGB(255, 255, 255);

	dbInk(white, white);

	dbCircle(319, 169, 25);

}

void drawArms()

{

	//Set colors
	DWORD black = dbRGB(0, 0, 0);
	DWORD white = dbRGB(255, 255, 255);
	DWORD blue = dbRGB(0, 0, 255);

	dbInk(white, black);

	//Right arm
	dbLine(344, 169, 360, 155);
	dbLine(360, 155, 365, 145);
	dbLine(360, 155, 370, 159);

	//Left arm
	dbLine(294, 169, 280, 164);
	dbLine(280, 164, 274, 142);
	dbLine(274, 142, 273, 134);
	dbLine(274, 142, 265, 140);

}

void drawHead()

{

	//Set colors
	DWORD black = dbRGB(0, 0, 0);
	DWORD white = dbRGB(255, 255, 255);

	dbInk(white, white);

	dbCircle(319, 125, 19);

	dbInk(white, black);

	//Eyes
	dbCircle(314, 120, 3);
	dbCircle(324, 120, 3);

	//Mouth
	dbLine(308, 130, 329, 130);

}

void drawHat()

{

	//Set colors
	DWORD black = dbRGB(0, 0, 0);
	DWORD white = dbRGB(255, 255, 255);

	dbInk(white, white);

	dbBox(285, 100, 353, 108);

	dbBox(299, 71, 339, 99);

}