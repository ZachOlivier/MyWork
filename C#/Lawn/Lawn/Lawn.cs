using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Lawn
{
    class Lawn
    {
        static void Main(string[] args)
        {
            //Set the variables
            string LengthString;
            string WidthString;
            decimal Length;
            decimal Width;
            decimal Area;
            decimal Season;
            decimal Week = 0;

            //Prompt the user to enter a length and width
            System.Console.WriteLine();
            System.Console.WriteLine();
            System.Console.Write("  Please Enter A Length :  ");
            LengthString = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.WriteLine();
            System.Console.Write("  Please Enter A Width :  ");
            WidthString = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.WriteLine();
            System.Console.WriteLine();
            System.Console.WriteLine();

            //Do the calculations to decide the cost
            Length = Convert.ToDecimal(LengthString);
            Width = Convert.ToDecimal(WidthString);

            Area = Length * Width;

            if (Area < 300)
                Week = 25;
                Season = Week * 20;
                
            if (Area >= 300 && Area < 600)
                Week = 35;
                Season = Week * 20;

            if (Area >= 600)
                Week = 55;
                Season = Week * 20;

            //Print on the screen the results/costs
                System.Console.WriteLine("  Your Weekly Cost Is {0}", Week);
                System.Console.WriteLine();
                System.Console.WriteLine();
                System.Console.WriteLine("  Your Season Cost Will Be {0}", Season);

            //I put this in so the window doesn't close
                System.Console.ReadLine();
        }
    }
}
