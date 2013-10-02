using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SmallAndLarge
{
    class SmallAndLarge
    {
        public static void Main()
        {
            string[] inputNumber = { "c", "y", "z", "a", "b" };

            Console.WriteLine();
            Console.Write("  Please enter a number : ");
            inputNumber[0] = Console.ReadLine();

            Console.WriteLine();

            Console.Write("  Please enter another number : ");
            inputNumber[1] = Console.ReadLine();

            Console.WriteLine();

            Console.Write("  Please enter another number : ");
            inputNumber[2] = Console.ReadLine();

            Console.WriteLine();

            Console.Write("  Please enter another number : ");
            inputNumber[3] = Console.ReadLine();

            Console.WriteLine();

            Console.Write("  Please enter another number : ");
            inputNumber[4] = Console.ReadLine();

            LowAndHigh(inputNumber[0], inputNumber[1], inputNumber[2], inputNumber[3], inputNumber[4]);

            Console.ReadLine();
        }

        public static void LowAndHigh(string numOne, string numTwo, string numThree, string numFour, string numFive)
        {
            int small, large;

            int one = Convert.ToInt32(numOne);
            int two = Convert.ToInt32(numTwo);
            int three = Convert.ToInt32(numThree);
            int four = Convert.ToInt32(numFour);
            int five = Convert.ToInt32(numFive);

            int[] numbers = { one, two, three, four, five };

            Array.Sort(numbers);

            small = numbers[0];
            large = numbers[4];

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  Your smallest number was {0}", small);
            Console.WriteLine("  Your largest number was {0}", large);
        }
    }
}
