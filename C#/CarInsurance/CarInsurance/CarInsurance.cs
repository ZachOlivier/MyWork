using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarInsurance
{
    class CarInsurance
    {
        public static double CalcPremiums(int age, string state)
        {
            int driverAge = age;
            double premiumBase = 1;
            double total;

            if (state == "IL" || state == "il" || state == "Il" || state == "iL")
                premiumBase = 100;

            if (state == "WI" || state == "wi" || state == "Wi" || state == "wI")
                premiumBase = 50;

            total = premiumBase + (3 * (100 - driverAge));

            if (driverAge < 16 || driverAge > 81)
                Console.WriteLine("  You did not enter a valid age.");

            return total;
        }

        static void Main()
        {
            string inputAge1 = "xx";
            string driverState1 = "xx";

            int driverAge1 = 1;

            double Total = 0;

            try
            {
                Console.WriteLine();
                Console.Write("  Please enter your age :  ");

                inputAge1 = Console.ReadLine();

                driverAge1 = Convert.ToInt32(inputAge1);

                Console.WriteLine();
                Console.Write("  Please enter the 2 letter code for your state of residence :  ");

                driverState1 = Console.ReadLine();

                Total = CalcPremiums(driverAge1, driverState1);
            }

            catch (FormatException e)

            {
                Console.WriteLine("  You did not enter a correct age.");
            }

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  Your premium will cost {0}, since you are a {1} year old from {2}.", Total, driverAge1, driverState1);

            Console.ReadLine();
        }
    }
}
