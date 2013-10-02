using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PlacingOrder
{
    class PlacingOrder
    {
        static void Main()
        {
            string inputStock;
            string inputQuantity;
            int stockNumber;
            int quantityNumber;

            try
            {
                Console.WriteLine();
                Console.Write("  Please enter a stock number :  ");

                inputStock = Console.ReadLine();

                Console.WriteLine();
                Console.Write("  Please enter a number of items :  ");

                inputQuantity = Console.ReadLine();

                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine();

                stockNumber = Convert.ToInt32(inputStock);

                quantityNumber = Convert.ToInt32(inputQuantity);
            }

            catch (Exception e)
            {
                stockNumber = 0;
                quantityNumber = 0;

                Console.WriteLine("  The number you entered is not an integer.");
                Console.WriteLine();
            }
            Console.WriteLine("  The stock number is {0}, and the quantity is {1}", stockNumber, quantityNumber);

            Console.ReadLine();
        }
    }
}
