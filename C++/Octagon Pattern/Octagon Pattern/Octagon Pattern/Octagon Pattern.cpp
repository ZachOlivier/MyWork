//Zachary Olivier
//Duckworth C++
//February 21, 2010
//Create a Octagon Pattern using DarkGDK

#include "DarkGDK.h"

// Global constants
const int FULL = 40;			
const int HALF = FULL / 2;		
const int QUARTER = FULL / 4;	

// Function prototypes
void drawOctagon(int, int);

void DarkGDK()
{
	//Declare variables
	int centerX;
	int centerY;

	//Set the window's title
	dbSetWindowTitle("Octagon Pattern");

	//Ask user for X coordinate
	dbPrint("Please enter the X coordinate of the Octagon");
	centerX = atoi( dbInput() );

	//Ask user for Y coordinate
	dbPrint("Please enter the Y coordinate of the Octagon");
	centerY = atoi( dbInput() );

	//Draw an Octagon using the user's coordinates
	drawOctagon(centerX, centerY);

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

	//Draw octagon line segments clockwise from the top
	dbLine(left + QUARTER, top, right - QUARTER, top);		
	dbLine(right - QUARTER, top, right, y - QUARTER);		
	dbLine(right, y - QUARTER, right, y + QUARTER);			
	dbLine(right, y + QUARTER, right - QUARTER, bottom);	
	dbLine(right - QUARTER, bottom, left + QUARTER, bottom);
	dbLine(left + QUARTER, bottom, left, y + QUARTER);		
	dbLine(left, y + QUARTER, left, y - QUARTER);			
	dbLine(left, y - QUARTER,left + QUARTER, top);			
}