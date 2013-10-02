using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PizzaPrices
{
    class PizzaPrices
    {
        static void Main(string[] args)
        {
            //Set the variables needed
            double[] Price = {6.99, 8.99, 12.50, 15.00};
            string inputSize;
            char Size;

            //Ask the user to input a size
            Console.WriteLine();
            Console.WriteLine("  What size pizza would you like? S, M, L, or X?");
            inputSize = Console.ReadLine();
            Console.WriteLine();

            //Determine the price of the pizza depending on the size desired
            Size = Convert.ToChar(inputSize);

            if (Size == 'S' || Size == 's')
                Console.WriteLine("  The price of your pizza will be {0}", Price[0]);
            else if (Size == 'M' || Size == 'm')
                Console.WriteLine("  The price of your pizza will be {0}", Price[1]);
            else if (Size == 'L' || Size == 'l')
                Console.WriteLine("  The price of your pizza will be {0}", Price[2]);
            else if (Size == 'X' || Size == 'x')
                Console.WriteLine("  The price of your pizze will be {0}", Price[3]);
            else
                Console.WriteLine("  Incorrect letter.");

            //I put this in at the end to keep the program open
            Console.ReadLine();
        }
    }
}
