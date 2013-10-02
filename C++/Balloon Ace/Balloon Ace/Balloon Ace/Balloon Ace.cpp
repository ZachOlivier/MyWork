// Zachary Olivier
// Duckworth C++
// April 14, 2010
// Create a game in which the user flies through balloons as an airplane

#include "DarkGDK.h"

// Constants for the image numbers
const int TITLE_SCREEN_IMAGE		= 1;
const int PLANE_IMAGE				= 2;
const int YELLOW_BALLOON_IMAGE		= 3;
const int GREEN_BALLOON_IMAGE		= 4;
const int ACE_AWARD_IMAGE			= 5;

// Constants for the sprite numbers
const int PLANE_SPRITE				= 1;
const int BALLOON_SPRITE			= 2;

// Constant for the music
const int MAIN_MUSIC				= 1;

// Constants for the sounds
const int HIT_GREEN_BALLOON_SOUND	= 1;
const int HIT_YELLOW_BALLOON_SOUND	= 2;

// Time delay constants
const int TWO_SECONDS				= 2000;
const int TENTH_SECOND				= 100;

// Other constants
const int REFRESH_RATE				= 60;
const int TOTAL_BALLOONS			= 20;
const int PLANE_MOVE				= 4;
const int BALLOON_MOVE				= 5;

// Function prototypes
void loadResources();
void intro();
void createSprites();
void updateBalloons(int);
void movePlane();
void checkCollisions(int &, int &);
void moveBalloons(int &, int &);
void deleteSprites();
void summaryScreen(int, int);

// ********************************************************
// The DarkGDK function                                   *
// ********************************************************
void DarkGDK()
{
	// Local variables
	int balloons = TOTAL_BALLOONS;
	int popped   = 0;
	int avoided  = 0;

	// Load the resources.
	loadResources();

	// Play the introduction.
	intro();

	// Create the sprites.
	createSprites();

	// Execute the game loop.
	while ( LoopGDK() && balloons > 0)
	{
		// Loop the main music.
		dbLoopMusic(MAIN_MUSIC);

		// Move the plane up and down with user input.
		movePlane();

		// Check for collisions, updating popped green balloons.
		checkCollisions(popped, balloons);

		// Move the balloons, updating avoided yellow balloons.
		moveBalloons(avoided, balloons);

		// Update the balloons
		updateBalloons(balloons);

		// Refresh the screen.
		dbSync();
	}

	// Stop the main music.
	dbStopMusic(MAIN_MUSIC);

	// Display the summary screen.
	summaryScreen(popped, avoided);
}

// ********************************************************
// The loadResources function loads all the images and    *
// audio files.                                           *
// ********************************************************
void loadResources()
{
	// Set the image color key to green.
	dbSetImageColorKey(0, 255, 0);

	// Load the images.
	dbLoadImage("BalloonAce.bmp", TITLE_SCREEN_IMAGE);
	dbLoadImage("Plane.bmp", PLANE_IMAGE);
	dbLoadImage("YellowBalloon.bmp", YELLOW_BALLOON_IMAGE);
	dbLoadImage("GreenBalloon.bmp", GREEN_BALLOON_IMAGE);
	dbLoadImage("Award.bmp", ACE_AWARD_IMAGE);

	// Load the music
	dbLoadMusic("PressureStardust.mp3", MAIN_MUSIC);

	// Load the sounds
	dbLoadSound("pop.wav", HIT_GREEN_BALLOON_SOUND);
	dbLoadSound("clap.wav", HIT_YELLOW_BALLOON_SOUND);
}

// ********************************************************
// The intro function displays the title screen, and a    *
// short introduction sequence.                           *
// ********************************************************
void intro()
{
	// Set the window's title.
	dbSetWindowTitle("Balloon Ace by Zachary Olivier");

	// Paste the title screen
	dbPasteImage(TITLE_SCREEN_IMAGE, 0, 0);

	// Set custom text font and size.
	dbSetTextFont("Impact");
	dbSetTextSize(48);
	
	// Display the message and wait for the user to
	// press a key.
	dbCenterText(320, 400, "Press any key to start.");
	dbWaitKey();

	// Clear the screen.
	dbCLS();

	// Display the plane message for two seconds.
	dbCenterText(320, 240, "Fly the Plane with the Arrow Keys");
	dbPasteImage(PLANE_IMAGE, 240, 100);
	dbWait(TWO_SECONDS);

	// Clear the screen.
	dbCLS();

	// Display the green balloon message for two seconds.
	dbCenterText(320, 240, "Pop the Green Balloons");
	dbPasteImage(GREEN_BALLOON_IMAGE, 270, 100);
	dbWait(TWO_SECONDS);

	// Clear the screen.
	dbCLS();

	// Display the yellow balloon message for two seconds.
	dbCenterText(320, 240, "Avoid the Yellow Balloons");
	dbPasteImage(YELLOW_BALLOON_IMAGE, 270, 100);
	dbWait(TWO_SECONDS);

	// Clear the screen.
	dbCLS();

	// display the get ready message for two seconds.
	dbCenterText(320, 240, "GET READY!");
	dbWait(TWO_SECONDS);

	// Clear the screen.
	dbCLS();
}
// ********************************************************
// The createSprites function creates the sprites and     *
// sets up the game loop.                                 *
// ********************************************************
void createSprites()
{
	// Seed the random number generator with a value
	// from the system clock.
	dbRandomize( dbTimer() );

	// Initialize the plane's XY coordinates.
	int planeX = 20;
	int planeY = 190;

	// Create the plane sprite.
	dbSprite(PLANE_SPRITE, planeX, planeY, PLANE_IMAGE);

	// Variables for the balloons.
	int sprite;						// The sprite number
	int image;						// The image number
	int x = dbScreenWidth() - 128;	// The X coordinate
	int y;							// The Y coordinate

	// Create the balloon sprites.
	for (int count = 0; count < TOTAL_BALLOONS; count++)
	{
		// Assign the balloon a sprite number.
		sprite = BALLOON_SPRITE + count;

		// Generate a random number between 1 and 0.
		image = dbRND(1);
		
		// Assign the sprite an image based 
		// on the random number value.
		switch (image)
		{

		// A zero means the balloon will be green.
		case 0:

			// Set the balloon image to green.
			image = GREEN_BALLOON_IMAGE;
			break;

		// A one means the ballon will be yellow.
		case 1:

			// Set the balloon image to yellow.
			image = YELLOW_BALLOON_IMAGE;
			break;
		}

		// Generate a random Y coordinate.
		y = dbRND(dbScreenHeight() - 128);

		// Create the balloon sprite.
		dbSprite(sprite, x, y, image);

		// Hide the balloon sprite.
		dbHideSprite(BALLOON_SPRITE + count);
	}

	// Turn on manual refresh.
	dbSyncOn();

	// Set the maximum refresh rate.
	dbSyncRate(REFRESH_RATE);
}

// ********************************************************
// The updateBalloons functions displays a new balloon.   *
// Parameter summary:                                     *
// number: The balloon sprite number                      *
// ********************************************************
void updateBalloons(int number)
{
	// Store the balloon sprite number.
	int balloon = BALLOON_SPRITE + number - 1;

	// Check and make sure the balloon exists.
	if ( dbSpriteExist(balloon) )
	{
		// Show the balloons.
		dbShowSprite(balloon);
	}
}

// ********************************************************
// The movePlane function detects user input and moves    *
// the plane accordingly.                                 *
// ********************************************************
void movePlane()
{
	// Get the plane's XY coordinates.
	int planeX = dbSpriteX(PLANE_SPRITE);
	int planeY = dbSpriteY(PLANE_SPRITE);

	// The top edge of the screen.
	int topEdge = 0;

	// The bottom edge of the screen.
	int bottomEdge = dbScreenHeight() - 
		            dbSpriteHeight(PLANE_SPRITE);

	// Check if the up key is pressed.
	if ( dbUpKey() )
	{
		// Stop the plane at the top edge of the screen.
		if (planeY <= topEdge)
		{
			planeY = topEdge;
		}

		// Move the plane up.
		else
		{
			planeY -= PLANE_MOVE;
		}
	}

	// Check if the down key is pressed.
	if ( dbDownKey() )
	{
		// Stop the plane at the bottom edge of the screen.
		if (planeY >= bottomEdge)
		{
			planeY = bottomEdge;
		}

		// Move the plane down.
		else
		{
			planeY += PLANE_MOVE;
		}
	}

	// Update the plane's position.
	dbSprite(PLANE_SPRITE, planeX, planeY, PLANE_IMAGE);
}

// ********************************************************
// The checkCollisions function moves visible balloons    *
// from right to left across the screen.                  *
// Parameter Summary:                                     *
//  avoided: The avoided yellow balloons (by reference)   *
// balloons: The number of balloons left (by reference)   *
// ********************************************************
void checkCollisions(int &popped, int &balloons)
{
	// Variables for sprite number and image.
	int sprite;	// The balloon sprite number.
	int image;	// The balloon sprite image.

	// Check for collisions with visible balloons.
	for (int count = 0; count < balloons; count++)
	{
		// Get the sprite number and balloon image.
		sprite = BALLOON_SPRITE + count;
		image = dbSpriteImage(sprite);

		// Check if the balloon is visible.
		if ( dbSpriteVisible(sprite) )
		{
			// Check if the plane has collided with the balloon.
			if ( dbSpriteCollision(PLANE_SPRITE, sprite) )
			{
				// Check the balloon's image.
				switch (image)
				{

				// The balloon was green.
				case GREEN_BALLOON_IMAGE:

					// Play the sound.
					dbPlaySound(HIT_GREEN_BALLOON_SOUND);

					// Wait for a tenth of a second.
					dbWait(TENTH_SECOND);

					// Increment the number of popped balloons.
					popped++;

					// Hide the sprite.
					dbHideSprite(sprite);

					// Decrement the number of balloons left in play.
					balloons--;
					break;

				// The balloon was yellow.
				case YELLOW_BALLOON_IMAGE:

					// Play the sound.
					dbPlaySound(HIT_YELLOW_BALLOON_SOUND);

					// Wait for a tenth of a second.
					dbWait(TENTH_SECOND);

					// Hide the sprite.
					dbHideSprite(sprite);

					// Decrement the number of balloons left in play.
					balloons--;
					break;

				}	// end switch

			}	// end if visible

		} // end if collision

	}	// end for
}

// ********************************************************
// The moveBalloons function moves visible balloons from  *
// right to left across the screen.                       *
// Parameter Summary:                                     *
//  avoided: The avoided yellow balloons (by reference)   *
// balloons: The number of balloons left (by reference)   *
// ********************************************************
void moveBalloons(int &avoided, int &balloons)
{
	// To hold balloon information
	int sprite;		// The sprite number
	int image;		// The image number
	int x;			// The X coordinate
	int y;			// The Y coordinate

	// The left edge of the screen.
	int leftEdge = 0;

	// Move the visible balloons
	for (int count = 0; count < balloons; count++)
	{
		// Store information about the balloon.
		sprite = BALLOON_SPRITE + count;
		x      = dbSpriteX(sprite);
		y      = dbSpriteY(sprite);
		image  = dbSpriteImage(sprite);

		// Check if the balloon is visible.
		if ( dbSpriteVisible(sprite) )
		{
			// Hide the balloon at the left edge of the screen.
			if ( x <= leftEdge ) 
			{
				// Check if the balloon is a yellow one.
				if (image == YELLOW_BALLOON_IMAGE)
				{
					// Increment the number of avoided yellow balloons.
					avoided++;
				}

				// Hide the balloon.
				dbHideSprite(sprite);

				// Decrement the number of balloons.
				balloons--;
			}
			
			// Move the balloon.
			else
			{
				// Move the balloon left.
				x -= BALLOON_MOVE;
			}

			// Update the balloon's position.
			dbSprite(sprite, x, y, image);

		}	// end if visible

	}	// end for
}
// ********************************************************
// The deleteSprites function removes all sprites.        *
// ********************************************************
void deleteSprites()
{
	// Delete the plane sprite.
	dbDeleteSprite(PLANE_SPRITE);

	// Delete the balloon sprites.
	for (int id = 0; id < TOTAL_BALLOONS; id++)
	{
		dbDeleteSprite(BALLOON_SPRITE + id);
	}
}
// ********************************************************
// The summaryScreen function displays a summary of the   *
// player's performance, including points earned.         *
// Each green balloon popped is worth 100 points.         *
// Each yellow balloon avoided is worth 100 points.       *
// Parameter summary:                                     *
//  popped: The green balloons popped                     *
// avoided: The yellow balloons avoided                   *
// ********************************************************
void summaryScreen(int popped, int avoided)
{
	// Delete the sprites.
	deleteSprites();

	// Turn off manual refresh
	dbSyncOff();

	// Clear the screen.
	dbCLS();

	// Display the text.
	dbCenterText(dbScreenWidth() / 2, 100, "GAME OVER!");

	// Wait for two seconds.
	dbWait(TWO_SECONDS);

	// Award points for popped and avoided balloons.
	for (int count = 0; count <= popped + avoided; count++)
	{
		// Clear the screen.
		dbCLS();
		
		// Display the text.
		dbCenterText(dbScreenWidth() / 2, 50, "GAME RESULTS");

		// Display the images.
		dbPasteImage(GREEN_BALLOON_IMAGE, 10, 100);
		dbPasteImage(YELLOW_BALLOON_IMAGE, 10, 250);

		// Display the number of green balloons popped.
		dbText(300, 150, "Popped");
		dbText(200, 150, dbStr(popped));

		// Display the number of yellow balloons avoided.
		dbText(300, 300, "Avoided");
		dbText(200, 300, dbStr(avoided));

		// Play the hit sound.
		dbPlaySound(HIT_GREEN_BALLOON_SOUND);

		// Tally the score.
		dbCenterText(dbScreenWidth() / 2, 400, dbStr(count * 100));
 
		// Wait for a tenth of a second.
  		dbWait(TENTH_SECOND);
	}

	// Display the Gold Ace Medal for a perfect score!
	if (popped + avoided == TOTAL_BALLOONS)
	{
		dbPasteImage(ACE_AWARD_IMAGE,dbScreenWidth() - 
			         dbGetImageWidth(ACE_AWARD_IMAGE), 0);
	}

	// Wait for the user to press a key, then exit.
	dbWaitKey();
}