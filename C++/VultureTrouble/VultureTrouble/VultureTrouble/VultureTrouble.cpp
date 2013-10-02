//Zachary Olivier
//Duckworth C++
//April 14, 2010
//Alter this Vulture Game to increase the speed of each next egg


#include "DarkGDK.h"

// Constants for the image numbers
const int TITLE_SCREEN_IMAGE = 1;
const int INTRO_SCREEN_IMAGE = 2;
const int EGG_IMAGE          = 3;
const int BROKEN_EGG_IMAGE   = 4;
const int FARM_IMAGE         = 5;
const int BASKET_IMAGE       = 6;
const int HIT_BASKET_IMAGE   = 7;
const int VULTURE_IMAGE      = 8;

// Constants for the sprite numbers
const int FARM_SPRITE        = 1;
const int BASKET_SPRITE      = 2;
const int EGG_SPRITE         = 3;
const int HIT_BASKET_SPRITE  = 4;
const int BROKEN_EGG_SPRITE  = 5;
const int VULTURE_SPRITE     = 6;

// Constants for the vulture animated sprite
const int VULTURE_COLS       = 4;
const int VULTURE_ROWS       = 2;
const int START_FRAME        = 1;
const int END_FRAME          = 8;

// Constants for the sound numbers
const int POP_SOUND           = 1;
const int CLAP_SOUND          = 2;
const int TYPE_SOUND          = 3;
const int COMPLETE_SOUND      = 4;
const int PERFECT_SCORE_SOUND = 5;

// Constants for the music numbers
const int INTRO_MUSIC         = 1;
const int MAIN_MUSIC          = 2;

// Time delay constants
const int TENTH_SECOND        = 100;
const int ONE_SECOND          = 1000;
const int FOUR_SECONDS        = 4000;

// Other constants
const int MAX_EGGS       = 40;   // Total number of eggs
const int BASKET_MOVE    = 4;    // Amount to move the basket
const int VULTURE_MOVE   = 2;    // Amount to move the vulture
const float ACCELERATION = 0.5;  // Gravity acceleration
const float ACCELERATION_INCREASE = 0.1;  // Acceleration increase
const int REFRESH_RATE   = 60;   // Refresh rate

// Function Prototypes
void loadResources();
void createSprites(int &, int &, int &, int &,
                   int &, int &);
void intro();
void moveBasket(int &);
void moveVulture(int &);
void moveEgg(int, int, int &, int &, int &, float);
void checkCollisions(int, int &, int &, int &, int &, int &, float&);
void showHitBasket();
void showBrokenEgg();
void resetEgg(int, int, int &, float&);
void render(int, int, int, int, int, int);
void deleteSprites();
void summaryScreen(int, int);

//******************************************
// DarkGDK function                        *
//******************************************
void DarkGDK()
{
    // Local variables
    int eggs = MAX_EGGS;    // Number of eggs in play
    int caught = 0;         // Number of eggs caught
    int broken = 0;         // Number of eggs broken
    int basketX, basketY;   // Basket's XY coordinates
    int vultureX, vultureY; // Vulture's XY coordinates
    int eggX, eggY;         // Egg's XY coordinates
    int time = 0;           // Time, for distance formula

	// Set acceleration
	float acceleration = ACCELERATION;

    // Load the game resources.
    loadResources();

    // Display the title and intro screens.
    intro();

    // Create the sprites.
    createSprites(basketX, basketY, eggX, eggY,
                  vultureX, vultureY);

    // Execute the game loop.
    while ( LoopGDK() && eggs > 0 )
    {
        // Move the basket.
        moveBasket(basketX);

        // Move the vulture.
        moveVulture(vultureX);

        // Move the egg.
        moveEgg(vultureX, vultureY, 
                eggX, eggY, time, acceleration);

        // Check for collisions.
        checkCollisions(vultureY, eggY, caught,
                        broken, eggs, time, acceleration);

        // Render the scene.
        render(basketX, basketY, eggX, eggY,
               vultureX, vultureY);
    }

    // Display the summary screen.
    summaryScreen(caught, broken);
}

// ******************************************************
// The loadResources function loads all the images      *
// and audio files.                                     *
// ******************************************************
void loadResources()
{
    // Set the color key to green.
    dbSetImageColorKey(0, 255, 0);

    // Load the images.
    dbLoadImage("titleScreen.bmp", TITLE_SCREEN_IMAGE);
    dbLoadImage("intro.bmp", INTRO_SCREEN_IMAGE);
    dbLoadImage("farm.bmp", FARM_IMAGE);
    dbLoadImage("egg.bmp", EGG_IMAGE);
    dbLoadImage("brokenEgg.bmp", BROKEN_EGG_IMAGE);
    dbLoadImage("basket.bmp", BASKET_IMAGE);
    dbLoadImage("hitBasket.bmp", HIT_BASKET_IMAGE);

    // Load the intro music
    dbLoadMusic("vultureTrouble.mp3", INTRO_MUSIC);	
    dbLoadMusic("vultureLevel.mp3", MAIN_MUSIC);

    // Load the sound effcts.
    dbLoadSound("pop.wav", POP_SOUND);
    dbLoadSound("clap.wav", CLAP_SOUND);
    dbLoadSound("type.wav", TYPE_SOUND);
    dbLoadSound("complete.wav", COMPLETE_SOUND);
    dbLoadSound("vulturePerfect.wav", PERFECT_SCORE_SOUND);
}

// ******************************************************
// The intro function displays a title screen, followed *
// by an intro screen while playing music.              *
// ****************************************************** 
void intro()
{
    // Set the window title.
    dbSetWindowTitle("Vulture Trouble");

    // Loop the intro music.
    dbLoopMusic(INTRO_MUSIC);
    
    // Paste the title screen image and wait for
    // the user to press a key.
    dbPasteImage(TITLE_SCREEN_IMAGE, 0, 0);
    dbWaitKey();

    // Clear the screen.
    dbCLS();

    // Paste the intro image and wait for the
    // user to press a key.
    dbPasteImage(INTRO_SCREEN_IMAGE, 0, 0);
    dbWaitKey();

    // Stop the music.
    dbStopMusic(INTRO_MUSIC);

    // Disable auto refresh and set the
    // refresh rate.
    dbSyncOn();
    dbSyncRate(REFRESH_RATE);
}

// ******************************************************
// The createSprites function creates the sprites.      *
// Parameter summary:                                   *
//  basketX: The basket's X coordinate (by reference)   *
//  basketY: The basket's X coordinate (by reference)   *
//     eggX: The egg's X coordinate (by reference)      *
//     eggY: The egg's X coordinate (by reference)      *
// vultureX: The vulture's X coordinate (by reference)  *
// vultureY: The vulture's X coordinate (by reference)  *
// ******************************************************
void createSprites(int &basketX, int &basketY, int &eggX,
                   int &eggY, int &vultureX, int &vultureY)
{
    // Variable to hold calculated sprite numbers.
    int spriteNum;

    // Create the sprites, initially positioned at (0, 0).
    dbSprite(FARM_SPRITE, 0, 0, FARM_IMAGE);
    dbSprite(BASKET_SPRITE, 0, 0, BASKET_IMAGE);
    dbSprite(EGG_SPRITE, 0, 0, EGG_IMAGE);
    dbSprite(HIT_BASKET_SPRITE, 0, 0, HIT_BASKET_IMAGE);
    dbSprite(BROKEN_EGG_SPRITE, 0, 0, BROKEN_EGG_IMAGE);

    // Hide the hit basket and broken egg sprites.
    dbHideSprite(HIT_BASKET_SPRITE);
    dbHideSprite(BROKEN_EGG_SPRITE);

    // Create the animated vulture sprite.
    dbCreateAnimatedSprite(VULTURE_SPRITE, "vulture.bmp", 
                           VULTURE_COLS, VULTURE_ROWS,
                           VULTURE_IMAGE);

    // Set the starting position of the vulture to
    // the center of the top of the screen.
    vultureX = dbScreenWidth() / 2 - 
               dbSpriteWidth(VULTURE_SPRITE) / 2;
    vultureY = 0;

    // Set the starting position of the egg so it
    // is at the vulture's beak.
    eggX = vultureX + dbSpriteWidth(VULTURE_SPRITE) - 
           dbSpriteWidth(EGG_SPRITE);
    eggY = vultureY + 
           dbSpriteHeight(VULTURE_SPRITE) / 2;
 
    // Set the basket's starting X position to a
    // random location on the screen.
    dbRandomize( dbTimer() );
    basketX = dbRND( dbScreenWidth() - 
                     dbSpriteWidth(BASKET_SPRITE) );

    // Set the basket's starting Y position to the bottom
    // of the screen.
    basketY = dbScreenHeight() - 
              dbSpriteHeight(BASKET_SPRITE);

    // Clone the egg sprite to display mini eggs at the
    // top of the screen. The cloned mini eggs sprite
    // numbers will begin at 100.
    for(int count = 0; count < MAX_EGGS; count++)
    {
        // Calculate a new sprite number.
        spriteNum = 100 + count;

        // Clone the egg sprite.
        dbCloneSprite(EGG_SPRITE, spriteNum);

        // Scale the sprite to 50%.
        dbScaleSprite(spriteNum, 50);

        // Place the sprite in the status bar.
        dbSprite(spriteNum, 
                 dbSpriteWidth(EGG_SPRITE) / 2 * count , 
                 0,
                 EGG_IMAGE);
    }
}

// *****************************************************
// The moveBasket function detects keyboard input and  *
// moves the basket accordingly.                       *
// Parameter summary:                                  *
// basketX: The basket's X coordinate (by reference)   *
// ***************************************************** 
void moveBasket(int &basketX)
{
    // Check if the left key is pressed.
    if(dbLeftKey())
    {
        // Stop the basket at the left edge of the screen.
        if (basketX <= 0)
        {
            basketX = 0;
        }
        // Move the basket left.
        else
        {
            basketX -= BASKET_MOVE;
        }
    }

    // Check if the right key is pressed.
    if(dbRightKey())
    {
        // Stop the basket at the right edge of the screen.
        if (basketX + dbSpriteWidth(BASKET_SPRITE) >= dbScreenWidth())
        {
            basketX = dbScreenWidth() - dbSpriteWidth(BASKET_SPRITE);
        }
        // Move the basket right.
        else
        {
            basketX += BASKET_MOVE;
        }
    }
}

// *****************************************************
// The moveVulture function moves the vulture back and *
// forth across the top of the screen.                 *
// Parameter summary:                                  *
// vultureX: The vulture's X coordinate (by reference) *
// ***************************************************** 
void moveVulture(int &vultureX)
{
    // Play the vulture animation sequence.
    dbPlaySprite(VULTURE_SPRITE, START_FRAME, 
                 END_FRAME, TENTH_SECOND);

    // Check the vulture X position. If it is less 
    // than or equal to 0, mirror the vulture sprite.
    if (vultureX <= 0)
    {
        dbMirrorSprite(VULTURE_SPRITE);
    }

    // If the vulture is at the right edge of the
    // screen, mirror the vulture sprite.
    if (vultureX + dbSpriteWidth(VULTURE_SPRITE) >= dbScreenWidth())
    {
        dbMirrorSprite(VULTURE_SPRITE);
    }

    // If the vulture is currently mirrored, move right.
    if ( dbSpriteMirrored(VULTURE_SPRITE) )
    {
        vultureX += VULTURE_MOVE;
    }
    // If the vulture is not mirrored, move left.
    else
    {
        vultureX -= VULTURE_MOVE;
    }
}

// *****************************************************
// The moveEgg function moves the egg sprite both      *
// down the screen and across the screen.              *
// Parameter summary:                                  *
// vultureX: The vulture's X coordinate                *
// vultureY: The vulture's Y coordinate                *
//     eggX: The egg's X coordinate (by reference)     *
//     eggY: The egg's Y coordinate (by reference)     *
//     time: The falling time (by reference)           *
// ***************************************************** 
void moveEgg(int vultureX, int vultureY, 
             int &eggX, int &eggY, int &time, float accel)
{
    // Local varible to hold the falling distance
    float distance;

    // Set the egg's X position so it is below the 
    // vulture's beak. This will depend on whether
    // the vulture is mirrored.
    if( dbSpriteMirrored(VULTURE_SPRITE) )
    {
        eggX = vultureX + 
               dbSpriteWidth(VULTURE_SPRITE) - 
               dbSpriteWidth(EGG_SPRITE);
    }
    else
    {
        eggX = vultureX;
    }

    // Calculate the falling distance.
    distance = 0.5 * accel * time * time;

    // update the egg Y position.
    eggY = distance + vultureY + 
           dbSpriteHeight(VULTURE_SPRITE) / 2;

    // Increment the falling time.
    time++;
}

// *****************************************************
// The checkCollisions function checks for a collision *
// between the egg and basket or the ground.           *
// Parameter summary:                                  *
// vultureY: The vulture's Y coordinate                *
//     eggY: The egg's Y coordinate (by reference)     *
//   caught: The number of caught eggs (by reference)  *
//   broken: The number of broken eggs (by reference)  *
//     eggs: The number of eggs in play (by reference) *
//     time: The falling time (by reference)           *
// ***************************************************** 
void checkCollisions(int vultureY, int &eggY, int &caught,  
                     int &broken, int &eggs, int &time, float& accel)
{
    // The egg has hit the basket.
    if ( dbSpriteCollision(EGG_SPRITE, BASKET_SPRITE) )
    {
        // Increment number of caught eggs.
        caught++;

        // Decrement number of eggs in play.
        eggs--;

        // Show the hit basket effect.
        showHitBasket();

        // Reset the egg.
        resetEgg(eggs, vultureY, eggY, accel);

        // Reset the falling time.
        time = 0;
    }
    // The egg has missed the basket.
    else if (eggY > dbScreenHeight() )
    {
        // Increment the number of broken eggs.
        broken++;

        // Decrement the number of eggs in play.
        eggs--;

        // Show the broken egg effect.
        showBrokenEgg();

        // Reset the egg.
        resetEgg(eggs, vultureY, eggY, accel);

        // Reset the falling time.
        time = 0;
    }
}

//*************************************************
// The showHitBasket function displays the hit    *
// basket effect and plays the pop sound.         *
//*************************************************
void showHitBasket()
{
    // Temporarily enable auto refresh.
    dbSyncOff();

    // Show the hit basket sprite.
    dbShowSprite(HIT_BASKET_SPRITE);

    // Play the pop sound.
    dbPlaySound(POP_SOUND);

    // Wait for a tenth of a second.
    dbWait(TENTH_SECOND);

    // Hide the hit basket sprite.
    dbHideSprite(HIT_BASKET_SPRITE);

    // Disable auto refresh.
    dbSyncOn();
}

//*************************************************
// The showBrokenEgg function displays the broken *
// egg effect and plays the clap sound.           *
//*************************************************
void showBrokenEgg()
{
    // Temporarily enable auto refresh.
    dbSyncOff();

    // Show the broken egg sprite.
    dbShowSprite(BROKEN_EGG_SPRITE);

    // Play the clap sound.
    dbPlaySound(CLAP_SOUND);

    // Wait for a tenth of a second.
    dbWait(TENTH_SECOND);

    // Hide the broken egg sprite.
    dbHideSprite(BROKEN_EGG_SPRITE);

    // Disable auto refresh.
    dbSyncOn();
}

//*******************************************************
// The resetEgg function resets the egg after it has    *
// either been caught in the basket, or hit the ground. *
// Parameter summary:                                   *
//     eggs: The number of eggs in play                 *
// vultureY: The vulture's Y coordinate                 *
//     eggY: The egg's Y coordinate (by reference)      *
//*******************************************************
void resetEgg(int eggs, int vultureY, int &eggY, float &accel)
{
    // If a clone of this egg sprite exists in the
    // status bar, delete it.
    if ( dbSpriteExist(eggs + 100) )
    {
        dbDeleteSprite(eggs + 100);
    }

    // Wait for a tenth of a second.
    dbWait(TENTH_SECOND);

    // Reset the egg Y position.
    eggY = vultureY + 
           dbSpriteHeight(VULTURE_SPRITE) / 2;

	// Accelerate egg
	accel += ACCELERATION_INCREASE;
}

// *****************************************************
// The render function draws the screen.               *
// Parameter summary:                                  *
//  basketX: The basket's X coordinate                 *
//  basketY: The basket's Y coordinate                 *
//     eggX: The egg's X coordinate                    *
//     eggX: The egg's Y coordinate                    *
// vultureX: The vulture's X coordinate                *
// vultureY: The vulture's Y coordinate                *
// ***************************************************** 
void render(int basketX, int basketY, int eggX, int eggY,
            int vultureX, int vultureY)
{
    // Draw the sprites.
    dbSprite(BASKET_SPRITE, basketX, basketY, BASKET_IMAGE);
    dbSprite(EGG_SPRITE, eggX, eggY, EGG_IMAGE);
    dbSprite(HIT_BASKET_SPRITE, basketX, basketY, HIT_BASKET_IMAGE);
    dbSprite(BROKEN_EGG_SPRITE, eggX, 
		     dbScreenHeight() - dbSpriteHeight(BROKEN_EGG_SPRITE), 
			 BROKEN_EGG_IMAGE);
    dbSprite(VULTURE_SPRITE, vultureX, vultureY, VULTURE_IMAGE);

    // Refresh the screen.
    dbSync();
}

// *****************************************************
// The summaryScreen function displays a summary of    *
// player's performance, including points earned.      *
// Each caught egg earns 1000 points.                  *
// Parameter summary:                                  *
// caught: The number of eggs caught in the basket     *
// broken: The number of broken eggs                   *
// ***************************************************** 
void summaryScreen(int caught, int broken)
{
    // Delete the sprites and get them off the screen.
    deleteSprites();

    // Enable auto refresh and clear the screen.
    dbSyncOff();
    dbCLS();

    // Set the text size.
    dbSetTextSize(36);

    // Display the text.
    dbCenterText(dbScreenWidth() / 2, 100, "GAME OVER!");

    // Play the game complete sound.
    dbPlaySound(COMPLETE_SOUND);

    // Wait four seconds for sound to finish.
    dbWait(FOUR_SECONDS);

    // Count the eggs caught and tally the 
    // score.
    for(int caughtCount = 0; caughtCount <= caught; caughtCount++)
    {
        // Clear the screen.
        dbCLS();
        
        // Paste the images.
        dbPasteImage(EGG_IMAGE, 200, 240);
        dbPasteImage(BROKEN_EGG_IMAGE, 300, 240);

        // Display the text.
        dbCenterText(dbScreenWidth() / 2, 
                     100, "GAME RESULTS");
        dbText(240,240,"x");
        dbText(380,240,"x");
        dbText(260,240,dbStr(caughtCount));
        dbText(400,240, dbStr(broken) );

        // Play the caught egg sound.
        dbPlaySound(TYPE_SOUND);

        // Wait for a tenth of a second.
        dbWait(TENTH_SECOND);
        
        // Display the score, which is 1000 points
        // for each caught egg.
        dbCenterText(dbScreenWidth() / 2, 
                     400, dbStr(caughtCount * 1000));
    }

    // If no eggs were broken, display a special message.
    if (caught == MAX_EGGS)
    {
        // Display the perfect score message.
        dbCenterText(dbScreenWidth() / 2, 
                     200, "PERFECT SCORE!");

        // Play the sound.
        dbPlaySound(PERFECT_SCORE_SOUND);

        // Wait for one second.
        dbWait(ONE_SECOND);
    }

    // Wait for the player to press a key.
    dbWaitKey();
}

//****************************************************
// The deleteSprites function deletes the sprites.   *
//****************************************************
void deleteSprites()
{
    dbDeleteSprite(FARM_SPRITE);
    dbDeleteSprite(BASKET_SPRITE);
    dbDeleteSprite(EGG_SPRITE);
    dbDeleteSprite(HIT_BASKET_SPRITE);
    dbDeleteSprite(BROKEN_EGG_SPRITE);
    dbDeleteSprite(VULTURE_SPRITE);
}