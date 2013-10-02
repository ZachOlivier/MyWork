//Zachary Olivier
//Duckworth C++
//February 21, 2010
//Create a Octagon Pattern using DarkGDK

#include "DarkGDK.h"

//Declare variables
const int FULL = 40;			
const int HALF = FULL / 2;		
const int QUARTER = FULL / 4;	

void drawOctagon(int, int);

void DarkGDK()

{
	//Set variables
	int centerX = dbScreenWidth() / 2;	
	int centerY = dbScreenHeight() / 2;	
	int leftX = centerX - HALF;			
	int topY = centerY - HALF;			
	int rightX = centerX + HALF;		
	int lowerY = centerY + HALF;		
	
	//Set the window's title
	dbSetWindowTitle("Octagon Pattern");

	//Set colors
	DWORD black = dbRGB(0, 0, 0);
	DWORD red = dbRGB(255, 0, 0);

	//Draw the Octagons using the variables
	dbInk(red, black);
	drawOctagon(leftX, topY);		
	drawOctagon(leftX, lowerY);		
	drawOctagon(rightX, topY);		
	drawOctagon(rightX, lowerY);	

	//Wait for the user to press a key
	dbWaitKey();
}

//The drawOctagon function draws an octagon centered at
//the location specified by the x and y parameters

void drawOctagon(int x, int y)
{
	//Set variables
	int left = x - HALF;	
	int top = y - HALF;		
	int right = x + HALF;	
	int bottom = y + HALF;	

	//Draw Octagon line segments clockwise from the top
	dbLine(left + QUARTER, top, right - QUARTER, top);		
	dbLine(right - QUARTER, top, right, y - QUARTER);			
	dbLine(right, y - QUARTER, right, y + QUARTER);				
	dbLine(right, y + QUARTER, right - QUARTER, bottom);		
	dbLine(right - QUARTER, bottom, left + QUARTER, bottom);	
	dbLine(left + QUARTER, bottom, left, y + QUARTER);			
	dbLine(left, y + QUARTER, left, y - QUARTER);				
	dbLine(left, y - QUARTER,left + QUARTER, top);				
}
