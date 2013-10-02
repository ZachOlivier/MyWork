using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Reverse4
{
    class Reverse4
    {
        public static void Main()
        {
            int firstInt = 1;
            int secondInt = 21;
            int thirdInt = 31;
            int fourthInt = 41;

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The numbers are {0}, {1}, {2}, {3}", firstInt, secondInt, thirdInt, fourthInt);

            Reverse(ref firstInt, ref secondInt, ref thirdInt, ref fourthInt);

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The numbers are now {0}, {1}, {2}, {3}", firstInt, secondInt, thirdInt, fourthInt);

            Console.ReadLine();
        }

        public static void Reverse(ref int firstNumber, ref int secondNumber, ref int thirdNumber, ref int fourthNumber)
        {
            int[] reversedNumbers = {firstNumber, secondNumber, thirdNumber, fourthNumber};

            Array.Reverse(reversedNumbers);

            firstNumber = reversedNumbers[0];
            secondNumber = reversedNumbers[1];
            thirdNumber = reversedNumbers[2];
            fourthNumber = reversedNumbers[3];
        }
    }
}
