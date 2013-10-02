//Zachary Olivier
//Duckworth C++
//March 10, 2010
//Use DarkGDK to display a roman numeral equivalent of the user's input number

#include "DarkGDK.h"

int Input;

void DarkGDK()

{

	//Window title
	dbSetWindowTitle("Roman Numerals");

	//Ask user for number
	dbPrint("Please enter a whole value between numbers 1 through 5");
	Input = atoi( dbInput() );

	//Load bitmaps
	dbLoadBitmap("one.bmp", 1);
	dbLoadBitmap("two.bmp", 2);
	dbLoadBitmap("three.bmp", 3);
	dbLoadBitmap("four.bmp", 4);
	dbLoadBitmap("five.bmp", 5);
	dbLoadBitmap("wrong.bmp", 6);
	
	if(Input == 1)
	
	{
	dbCopyBitmap(1, 0);
	}
	else
	{
		if(Input == 2)

		{
			dbCopyBitmap(2, 0);
		}
		else
		{
			if(Input == 3)

			{
				dbCopyBitmap(3, 0);
			}
			else
			{
				if(Input == 4)

				{
					dbCopyBitmap(4, 0);
				}
				else
				{
					if(Input == 5)

					{
						dbCopyBitmap(5, 0);
					}
					else
					{
						if(Input != 1, 2, 3, 4, 5)

						{
							dbCopyBitmap(6, 0);
						}
					}
				}
			}
		}
	}
					
	//Wait for user to press a key                                                                                                                                                                                                                         
	dbWaitKey();

}