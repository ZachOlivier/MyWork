using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Exponent
{
    class Exponent
    {
        public static void Main()
        {
            int value;
            string inputValue;

            Console.WriteLine();
            Console.WriteLine();
            Console.Write("  Please enter a whole number : ");
            inputValue = Console.ReadLine();
            value = Convert.ToInt32(inputValue);

            int squared;
            int cubed;

            squared = DisplaySquared(value);

            cubed = DisplayCubed(squared, value);

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  This number squared is {0}", squared.ToString("N0"));
            Console.WriteLine();
            Console.WriteLine("  This number cubed is {0}", cubed.ToString("N0"));

            Console.ReadLine();
        }

        public static int DisplaySquared(int value)
        {
            int squared = value * value;
            return squared;
        }

        public static int DisplayCubed(int squared, int value)
        {
            int cubed = squared * value;
            return cubed;
        }
    }
}
