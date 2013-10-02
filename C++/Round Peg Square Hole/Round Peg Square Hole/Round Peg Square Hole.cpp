//Zachary Olivier
//Duckworth C++
//March 17, 2010
//Use DarkGDK to create a game asking the user to guess the coordinates of a squares center point

#include "DarkGDK.h"

//Constant variables
const int S_WIDTH = 640;
const int S_HEIGHT = 480;

//Set square variables
const int HEIGHT = 50;
const int WIDTH  = 50;

//Functions
void start();
void drawSquare(int, int);
void drawCircle(int, int);
void play();
void end();

void DarkGDK()

{

	start();
	play();
	end();

}

void start()

{

	//Set window title
	dbSetWindowTitle("Peg/Square Game");

	//Set randomizer
	int seed = dbTimer();
	dbRandomize(seed);

}

void drawSquare(int centerX, int centerY)

{

	//Square variables
	int x1 = centerX - WIDTH  / 2;
	int y1 = centerY - HEIGHT / 2;
	int x2 = centerX + WIDTH  / 2;
	int y2 = centerY + HEIGHT / 2;

	//Draw square
	dbLine(x1, y1, x2, y1);
	dbLine(x2, y1, x2, y2);
	dbLine(x2, y2, x1, y2);
	dbLine(x1, y2, x1, y1);

}

void drawCircle(int centerX, int centerY)

{

	//Constant variable for circle
	const int RADIUS = WIDTH / 2;

	//Draw circle
	dbCircle(centerX, centerY, RADIUS);

}

void play()

{

	//Set variables
	int randomX = 0;
	int randomY = 0;
	int circleX = 0;
	int circleY = 0;

	//Continue game until win
	do
	{
		//Clear screen
		dbCLS();

		// Generate a random center point
		randomX = WIDTH  / 2 + dbRND(S_WIDTH - WIDTH);
		randomY = HEIGHT / 2 + dbRND(S_HEIGHT - HEIGHT);

		//Draw square
		drawSquare(randomX, randomY);

		//Explain game to user
		dbPrint("Guess the X and Y values of the square's center point.");

		//Ask user for X coordinate
		dbPrint("Enter your guess for the X value.");
		circleX = atoi(dbInput());

		//Ask user for Y coordinate
		dbPrint("Enter your guess for the Y value:");
		circleY = atoi(dbInput());

		//Draw circle
		drawCircle(circleX, circleY);

		//Wait for the user to press a key
		dbWaitKey();

	} while (circleX != randomX && circleY != randomY);

}

void end()

{

	//Clear screen
	dbCLS();

	//Set text size
	dbSetTextSize(24);

	//Congrats
	dbCenterText(S_WIDTH / 2, S_HEIGHT / 2, "CONGRATULATIONS!");

	//Wait three seconds, then close
	dbWait(3000);

}