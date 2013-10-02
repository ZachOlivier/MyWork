using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EggsInteractive
{
    class EggsInteractive
    {
        static void Main(string[] args)
        {
            //String the variables in order to hold input values
            string Chicken1;
            string Chicken2;
            string Chicken3;
            string Chicken4;

            //Ask the user for each Chicken's input values
            System.Console.WriteLine();
            System.Console.Write("    Please enter a number of eggs per month for Chicken 1 :     ");
            Chicken1 = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.Write("    Please enter a number of eggs per month for Chicken 2 :     ");
            Chicken2 = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.Write("    Please enter a number of eggs per month for Chicken 3 :     ");
            Chicken3 = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.Write("    Please enter a number of eggs per month for Chicken 4 :     ");
            Chicken4 = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.WriteLine();

            //Return each set value to the user
            System.Console.WriteLine("    Chicken 1 = {0}", Chicken1);
            System.Console.WriteLine();
            System.Console.WriteLine("    Chicken 2 = {0}", Chicken2);
            System.Console.WriteLine();
            System.Console.WriteLine("    Chicken 3 = {0}", Chicken3);
            System.Console.WriteLine();
            System.Console.WriteLine("    Chicken 4 = {0}", Chicken4);
            System.Console.WriteLine();
            System.Console.WriteLine();

            //Do the math
            int TotalEggs = Convert.ToInt32(Chicken1) + Convert.ToInt32(Chicken2) + Convert.ToInt32(Chicken3) + Convert.ToInt32(Chicken4);
            int ResultDozen = TotalEggs / 12;
            Single ResultEggs = TotalEggs % 12;

            //Return the total number of dozen and eggs back to user
            System.Console.Write("    {0} Dozen and {1} Eggs", ResultDozen, ResultEggs);

            //I use this so my window doesn't automatically close
            System.Console.ReadLine();
        }
    }
}
