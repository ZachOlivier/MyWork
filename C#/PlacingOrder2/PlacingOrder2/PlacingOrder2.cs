using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PlacingOrder2
{
    public class PlacingOrder2
    {
        public static int DataEntry()
        {
            string inputStock;
            string inputQuantity;
            int stockNum;
            int quantityNum;

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

                stockNum = Convert.ToInt32(inputStock);

                quantityNum = Convert.ToInt32(inputQuantity);

                return stockNum;
            }

            catch (Exception e)
            {
                stockNum = 0;
                quantityNum = 0;

                Console.WriteLine("  The number you entered is not an integer.");
                Console.WriteLine();
            }

            return quantityNum;
        }

        static void Main()
        {
            int stockNumber = DataEntry();
            int quantityNumber = DataEntry();

            Console.WriteLine("  The stock number is {0}, and the quantity is {1}", stockNumber, quantityNumber);

            Console.ReadLine();
        }
    }
}
