//Zachary Olivier
//January 26, 2010
//Use dbLine to sketch a house

#include "DarkGDK.h"

void DarkGDK()

{

	//Lines to sketch house
	dbLine(200, 250, 200, 450);
		dbLine(200, 450, 450, 450);
		dbLine(450, 450, 450, 250);
		dbLine(450, 250, 200, 250);
		//Roof
		dbLine(200, 250, 325, 100);
		dbLine(325, 100, 450, 250);

		//Lines to sketch door
		dbLine(240, 450, 240, 365);
		dbLine(240, 365, 300, 365);
		dbLine(300, 365, 300, 450);
		dbLine(300, 450, 240, 450);
		//Circle for door knob
		dbCircle(290, 408, 3);

		//Lines to sketch window 1
		dbLine(250, 275, 250, 325);
		dbLine(250, 325, 290, 325);
		dbLine(290, 325, 290, 275);
		dbLine(290, 275, 250, 275);

		//Lines to sketch window 2
		dbLine(370, 275, 370, 325);
		dbLine(370, 325, 410, 325);
		dbLine(410, 325, 410, 275);
		dbLine(410, 275, 370, 275);

		//Lines to sketch window 3
		dbLine(350, 425, 420, 425);
		dbLine(420, 425, 420, 380);
		dbLine(420, 380, 350, 380);
		dbLine(350, 380, 350, 425);
		//Middle line
		dbLine(385, 425, 385, 380);

//Wait for user to press key
dbWaitKey();

}