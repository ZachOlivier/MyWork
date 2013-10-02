using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WhippetBus
{
    class WhippetBus
    {
        static void Main(string[] args)
        {
            //Declare the variables needed
            int[] Price = { 25, 40, 55, 70 };
            string inputDistance;

            //Ask the user to input the distance traveled
            Console.WriteLine();
            Console.WriteLine("  Please enter a distance traveled.");
            inputDistance = Console.ReadLine();
            Console.WriteLine();

            //Calculate what the price will be determined by the distance
            int Distance = Convert.ToInt32(inputDistance);

            if (Distance < 100)
                Console.WriteLine("  Your price will be {0}", Price[0]);
            else if (Distance >= 100 && Distance < 300)
                Console.WriteLine("  Your price will be {0}", Price[1]);
            else if (Distance >= 300 && Distance < 500)
                Console.WriteLine("  Your price will be {0}", Price[2]);
            else if (Distance >= 500)
                Console.WriteLine("  Your price will be {0}", Price[3]);

            //I put this in at the end to keep the window open
            Console.ReadLine();
        }
    }
}
