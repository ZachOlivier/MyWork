//Zachary Olivier
//Use DarkGDK to sketch a Vehicle
//January 26, 2010

#include "DarkGDK.h"

void DarkGDK()

{

	//Lines to sketch vehicle
	dbLine(120, 400, 180, 400);
	dbLine(240, 400, 340, 400);
	dbLine(400, 400, 500, 400);
	dbLine(120, 400, 120, 200);
	dbLine(500, 400, 500, 300);
	dbLine(500, 300, 450, 200);
	dbLine(450, 200, 120, 200);

	//Circle to sketch wheels
	dbCircle(210, 410, 30);
	dbCircle(370, 410, 30);

	//Ice cream cone on top
	dbLine(290, 200, 305, 150);
	dbLine(290, 200, 275, 150);

	//Circle for ice cream
	dbCircle(290, 145, 16);

	//Text
	dbSetTextSize(50);
	dbText(200, 270, "Ice Cream");

	//Wait for user to press key
	dbWaitKey();

}