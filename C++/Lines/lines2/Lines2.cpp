#include "DarkGDK.h"

void DarkGDK()

{

	// Draw some lines
	dbLine(0, 239, 639, 239);
		dbLine(319, 0, 319, 479);
		dbLine(0, 0, 639, 479);
		dbLine(639, 0, 0, 479);

		// Wait for the user to press a key
		dbWaitKey();

}