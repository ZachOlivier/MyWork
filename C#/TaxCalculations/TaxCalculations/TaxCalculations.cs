using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TaxCalculations
{
    class TaxCalculations
    {
        public static void Main()
        {
            double tax;

            DoubleTax(23.75, .07, out tax);
            Console.WriteLine();
            Console.WriteLine("  The Double Tax total is {0}", tax.ToString("C"));

            DoubleTax(23.75, 7, out tax);
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The Int Tax total is {0}", tax.ToString("C"));

            Console.ReadLine();
        }

        public static void DoubleTax(double price, double tax, out double doubleTax)
        {
            doubleTax = price * tax;
        }

        public static void DoubleTax(double price, int tax, out double intTax)
        {
            double Tax = tax * .01;

            intTax = price * Tax;
        }
    }
}
