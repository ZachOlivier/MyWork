using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UsingSum
{
    class UsingSum
    {
        public static void Main()
        {
            Sum(1);

            Console.ReadLine();
        }

        public static void Sum(int quantity)
        {
            int sum;
            int[] numbers = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            string[] inputNumbers = {"x", "x", "x", "x", "x", "x", "x", "x", "x", "x"};

            Console.WriteLine();
            Console.Write("  Please enter a number : ");

            inputNumbers[0] = Console.ReadLine();
            numbers[0] = Convert.ToInt32(inputNumbers[0]);

            sum = numbers[0];

            Console.WriteLine();
            Console.WriteLine("  This number is {0}", sum);
            Console.WriteLine();

            while (quantity < 10)
            {
                Console.Write("  Please enter another number : ");

                inputNumbers[quantity] = Console.ReadLine();

                ++quantity;

                if (quantity == 3)
                {
                    numbers[0] = Convert.ToInt32(inputNumbers[0]);
                    numbers[1] = Convert.ToInt32(inputNumbers[1]);
                    numbers[2] = Convert.ToInt32(inputNumbers[2]);

                    sum = numbers[0] + numbers[1] + numbers[2];

                    Console.WriteLine();
                    Console.WriteLine("  The sum of these 3 numbers is {0}", sum);
                    Console.WriteLine();
                }

                if (quantity == 5)
                {
                    numbers[0] = Convert.ToInt32(inputNumbers[0]);
                    numbers[1] = Convert.ToInt32(inputNumbers[1]);
                    numbers[2] = Convert.ToInt32(inputNumbers[2]);
                    numbers[3] = Convert.ToInt32(inputNumbers[3]);
                    numbers[4] = Convert.ToInt32(inputNumbers[4]);

                    sum = numbers[0] + numbers[1] + numbers[2] + numbers[3] + numbers[4];

                    Console.WriteLine();
                    Console.WriteLine("  The sum of these 5 numbers is {0}", sum);
                    Console.WriteLine();
                }

                if (quantity == 10)
                {
                    numbers[0] = Convert.ToInt32(inputNumbers[0]);
                    numbers[1] = Convert.ToInt32(inputNumbers[1]);
                    numbers[2] = Convert.ToInt32(inputNumbers[2]);
                    numbers[3] = Convert.ToInt32(inputNumbers[3]);
                    numbers[4] = Convert.ToInt32(inputNumbers[4]);
                    numbers[5] = Convert.ToInt32(inputNumbers[5]);
                    numbers[6] = Convert.ToInt32(inputNumbers[6]);
                    numbers[7] = Convert.ToInt32(inputNumbers[7]);
                    numbers[8] = Convert.ToInt32(inputNumbers[8]);
                    numbers[9] = Convert.ToInt32(inputNumbers[9]);

                    sum = numbers[0] + numbers[1] + numbers[2] + numbers[3] + numbers[4] + numbers[5] + numbers[6] + numbers[7] + numbers[8] + numbers[9];

                    Console.WriteLine();
                    Console.WriteLine("  The sum of these 10 numbers is {0}", sum);
                    Console.WriteLine();
                }
            }
        }
    }
}
