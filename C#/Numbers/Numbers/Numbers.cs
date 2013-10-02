using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Numbers
{
    class Numbers
    {
        public static void Main()
        {
            int number1;
            int number2;
            string inputNumber1;
            string inputNumber2;

            Console.WriteLine();
            Console.Write("  Please enter a number : ");
            inputNumber1 = Console.ReadLine();
            Console.WriteLine();
            Console.Write("  Please enter another number : ");
            inputNumber2 = Console.ReadLine();
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();

            number1 = Convert.ToInt32(inputNumber1);
            number2 = Convert.ToInt32(inputNumber2);

            DisplaySum(number1, number2);
            DisplayDifference(number1, number2);
            DisplayProduct(number1, number2);

            Console.ReadLine();
        }

        public static void DisplaySum(int number1, int number2)
        {
            int sum;
            sum = number1 + number2;
            Console.WriteLine("  The Sum = {0}", sum.ToString());
            Console.WriteLine();
        }

        public static void DisplayDifference(int number1, int number2)
        {
            int difference;
            difference = number1 - number2;
            Console.WriteLine("  The Difference = {0}", difference.ToString());
            Console.WriteLine();
        }

        public static void DisplayProduct(int number1, int number2)
        {
            int product;
            product = number1 * number2;
            Console.WriteLine("  The Product = {0}", product.ToString());
        }
    }
}
