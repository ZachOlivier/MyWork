Zach Olivier

COSC 497 - Building A Game Engine

Whack A Dot Game Analysis
	
I found that when you finally figure out the correct code and placement of that code, you are rewarded with a huge feeling of relief. Being able to test the project and have it work the way you intend for it to is one of the best feelings in the world. Especially when you have been sitting in front of the computer staring at it for 2.5 hours and haven't even made one bit of progress. I actually stumbled upon the correct placement of the textfield code. Afterwards, I took a moment to figure out why that worked, and I think I understand now. For a second I was having trouble with the textfield after I had it working, it would change the cursor and make it so that it couldn't click the dots. I changed simple textfield properties to make sure the size wasn't any bigger than the text (Thanks to the code already in the Whack A Dot Game!).

The least satisfying part is how frustrating it can get plugging in code and pressing Test Project only to get the same results over and over. The textfield was the hardest part for me. I knew how I had to code the penalty for missing a click, except I made it a MOUSE_DOWN event instead of a CLICK at first. As soon as I changed it the program started working correctly. I had to figure out where to place it in order for the player to not change the score before the game starts. The changing color of the backgrounds for the different clicks gave me no trouble. I simply copied and paste the code already in the game to get the desired effect.

Creating the box to pop up at times instead of the dot took a bit of figuring out. I knew I had to copy and paste most of the code in order for it to work. I made a switch in order to decide whether the shape is a dot or a box.