//Zachary Olivier
//February 17, 2010
//Use DarkGDK to create a multi-colored bar chart

#include "DarkGDK.h"

void DarkGDK()

{

	//Sales ammount
	int januarySales = 5000;
	int februarySales = 2500;
	int marchSales = 7000;

	//Bar settings
	int pointsPerPixel = 25;
	int barWidth = 150;
	int barHeight;

	//Horizontal base line
	dbLine(0, 400, 639, 400);

	//Colors
	DWORD green = dbRGB(0, 255, 0);
	DWORD blue = dbRGB(0, 0, 255);
	DWORD red = dbRGB(255, 0, 0);
	DWORD black = dbRGB(0, 0, 0);

	//Window title
	dbSetWindowTitle("Sales Ammounts");

	//January's bar color
	dbInk(green, black);

	//January's bar
	dbBox(50, 200, 200, 400);

	//January's caption
	dbCenterText(125, 420, "January");
	dbCenterText(125, 180, "5000");

	//February's bar color
	dbInk(blue, black);

	//February's bar
	dbBox(250, 300, 400, 400);

	//February's caption
	dbCenterText(325, 420, "February");
	dbCenterText(325, 280, "2500");

	//March's bar color
	dbInk(red, black);

	//March's bar
	dbBox(450, 120, 600, 400);

	//March's caption
	dbCenterText(525, 420, "March");
	dbCenterText(525, 100, "7000");

	//Wait for user to press a key
	dbWaitKey();



}