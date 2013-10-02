//Zachary Olivier
//February 17, 2010
//Use DarkGDK to create a multi-colored bar chart

#include "DarkGDK.h"

void DarkGDK()

{

	//Bar settings
	int pointsPerPixel;
	pointsPerPixel = 25;

	//Horizontal base line
	dbLine(0, 400, 639, 400);

	//Colors
	DWORD green = dbRGB(0, 255, 0);
	DWORD blue = dbRGB(0, 0, 255);
	DWORD red = dbRGB(255, 0, 0);
	DWORD black = dbRGB(0, 0, 0);

	//Window title
	dbSetWindowTitle("Your Sales Ammounts");

	//Introduction
	dbPrint();
	dbPrint("Please enter your sales ammounts to view a bar chart of the data.");
	dbPrint();

	//Declare variables
	int Janamt, Febamt, Maramt;
	int upperLeftY, UpperLeftY, upperleftY;

	//January's bar color
	dbInk(green, black);

	//January's data
	dbPrint("Enter sales ammount for January");
	Janamt = atoi( dbInput() );
	upperLeftY = 400 - Janamt;

	//January's bar
	dbBox(50, upperLeftY, 200, 400);

	//January's caption
	dbCenterText(125, 420, "January");

	//February's bar color
	dbInk(blue, black);

	//February's data
	dbPrint("Enter sales ammount for February");
	Febamt = atoi( dbInput() );
	UpperLeftY = 400 - Febamt;

	//February's bar
	dbBox(250, UpperLeftY, 400, 400);

	//February's caption
	dbCenterText(325, 420, "February");

	//March's bar color
	dbInk(red, black);

	//March's data
	dbPrint("Enter sales ammount for March");
	Maramt = atoi( dbInput() );
	upperleftY = 400 - Maramt;

	//March's bar
	dbBox(450, upperleftY, 600, 400);

	//March's caption
	dbCenterText(525, 420, "March");

	//Wait for user to press a key
	dbWaitKey();



}