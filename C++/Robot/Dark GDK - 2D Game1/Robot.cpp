//Zachary Olivier
//Use DarkGDK to sketch a Robot
//January 28, 2010

#include "DarkGDK.h"

void DarkGDK()

{

	//Lines for neck
	dbLine(330, 133, 330, 162);
	dbLine(310, 133, 310, 162);

	//Face
	dbLine(320, 120, 335, 115);
	dbLine(320, 120, 305, 115);
	dbEllipse(305, 90, 8, 4);
	dbEllipse(335, 90, 8, 4);
	
	//Lines for arms
	//Left
	dbLine(285, 210, 240, 215);
	dbLine(240, 215, 180, 200);
	//Fingers
	dbLine(180, 200, 185, 185);
	dbLine(180, 200, 170, 177);
	dbLine(180, 200, 157, 174);
	dbLine(180, 200, 155, 185);
	dbLine(180, 200, 158, 197);
	//Right
	dbLine(355, 210, 400, 215);
	dbLine(400, 215, 460, 200);
	//Fingers
	dbLine(460, 200, 455, 185);
	dbLine(460, 200, 470, 177);
	dbLine(460, 200, 483, 174);
	dbLine(460, 200, 485, 185);
	dbLine(460, 200, 482, 197);

	//Lines for legs
	//Right
	dbLine(330, 315, 335, 420);
	dbLine(335, 420, 350, 420);
	//Left
	dbLine(310, 315, 305, 420);
	dbLine(305, 420, 290, 420);

	//Robot body
	dbEllipse(320, 237, 38, 80);

	//Circle for head
	dbCircle(320, 100, 35);

	//Text
	dbSetTextSize(40);
	dbText(40, 30, "GREETINGS HUMAN!");

	//Wait for user to press key
	dbWaitKey();

}