//Zachary Olivier
//Duckworth C++
//February 21, 2010
//Create a Rectangular Pattern using DarkGDK

#include "DarkGDK.h"

void drawPattern(int, int);

void DarkGDK()
{

	//Set variables
	int width;
	int height;

	// Set the window's title
	dbSetWindowTitle("Rectangular Pattern");

	//Ask user for width
	dbPrint("Please enter the width of the pattern.");
	width = atoi(dbInput());

	//Ask user for height
	dbPrint("Please enter the height of the pattern.");
	height = atoi(dbInput());

	//Draw the rectangular pattern using the width and height values
	drawPattern(width, height);

	//Wait for the user to press a key
	dbWaitKey();
}

// ********************************************************
// The drawPattern function draws a rectangular pattern   *
// using the width and height values input by the user.   *
// ********************************************************
void drawPattern(int width, int height)
{
	// Local variables for the drawPattern function.
	int centerX = dbScreenWidth() / 2;				// The center X value.
	int centerY = dbScreenHeight() / 2;				// The center Y value.

	int outsideWidth = width / 2;					// The outside width from center X.
	int outsideHeight = height / 2;					// The outside height from center Y.

	int middleWidth = width  / 3;					// The middle width from center X.
	int middleHeight = height / 3;					// The middle height from center Y.

	int insideWidth = width / 6;					// The inside width from center X.
	int insideHeight = height / 6;					// The inside height from center Y.

	int outsideLeft = centerX - outsideWidth;		// Left X value for the outermost lines.
	int outsideTop = centerY - outsideHeight;		// Top Y value for the outermost lines.
	int outsideRight = centerX + outsideWidth;		// Right X value for the outermost lines.
	int outsideBottom = centerY + outsideHeight;	// Bottom Y value for the outermost lines.

	int middleLeft = centerX - middleWidth;			// Left X value for the middle lines.
	int middleTop = centerY - middleHeight;			// Top Y value for the middle lines.
	int middleRight = centerX + middleWidth;		// Right X value for the middle lines.
	int middleBottom = centerY + middleHeight;		// Bottom Y value for the middle lines.

	int insideLeft = centerX - insideWidth;			// Left X value for the inside rectangle.
	int insideTop = centerY - insideHeight;			// Top Y value for the inside rectangle.
	int insideRight = centerX + insideWidth;		// Right X value for the inside rectangle.
	int insideBottom = centerY + insideHeight;		// Bottom Y value for the inside rectangle.

	// Draw the outermost lines.

	// Draw a vertical line through the center.
	dbLine(centerX, outsideBottom, centerX, outsideTop);
	// Draw a horizontal line through the center.
	dbLine(outsideLeft, centerY, outsideRight, centerY);
	// Draw the outside left vertical line.
	dbLine(outsideLeft, outsideTop, outsideLeft, outsideBottom);
	// Draw the outside top horizontal line.
	dbLine(outsideLeft, outsideTop, outsideRight, outsideTop);
	// Draw the outside right vertical line.
	dbLine(outsideRight, outsideTop, outsideRight, outsideBottom);
	// Draw the outside bottom horizontal line.
	dbLine(outsideLeft, outsideBottom, outsideRight, outsideBottom);
	// Draw the outside left diagonal line.
	dbLine(outsideLeft, outsideTop, outsideRight, outsideBottom);
	// Draw the outside right diagonal line.
	dbLine(outsideRight, outsideTop, outsideLeft, outsideBottom);

	// Draw the middle lines.                            

	// Draw the middle-left vertical line.
	dbLine(middleLeft, middleTop, middleLeft, middleBottom);
	// Draw the middle-top horizontal line.
	dbLine(middleLeft, middleTop, middleRight, middleTop);
	// Draw the middle-right vertical line.
	dbLine(middleRight, middleTop, middleRight, middleBottom);
	// Draw the middle-bottom horizontal line.
	dbLine(middleLeft, middleBottom, middleRight, middleBottom);

	// Draw the inside rectangle.                         

	// Draw the inside rectangle in the center of the screen.
	dbBox(insideLeft, insideTop, insideRight, insideBottom);
}