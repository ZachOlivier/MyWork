using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Commission
{
    class Commission
    {
        public static void Main()
        {
            double dailySales;

            Console.WriteLine();
            Console.WriteLine();

            dailySales = DisplayDailySales();
            DisplayCommission(dailySales);

            Console.ReadLine();
        }

        public static double DisplayDailySales()
        {
            double dailySales;
            string inputDailySales;

            Console.Write("  Please enter a number for total daily sales by a salesperson : ");
            inputDailySales = Console.ReadLine();
            dailySales = Convert.ToDouble(inputDailySales);

            Console.WriteLine();
            Console.WriteLine();

            return dailySales;
        }

        public static void DisplayCommission(double dailySales)
        {
            int[] commissionRateLow = { 0, 1000, 3000 };
            double[] commissionRate = { .03, .04, .05 };

            double commission;

            int sub = commissionRateLow.Length - 1;

            while (sub >= 0 && dailySales < commissionRateLow[sub])
                --sub;

            commission = dailySales * commissionRate[sub];

            Console.WriteLine("  The total commission is {0}", commission.ToString("C"));



            /*  I read your comment on my other homework. I forgot I had to use that certain way to do it.
                Although this range thing seems harder in my opinion, I will attempt it in this homework.
             
            if (dailySales < 1000)
            {
                commission = dailySales * commissionRate[0];
                Console.WriteLine("  The total commission is {0}", commission.ToString("C"));
            }

            else if (dailySales >= 1000 && dailySales < 3000)
            {
                commission = dailySales * commissionRate[1];
                Console.WriteLine("  The total commission is {0}", commission.ToString("C"));
            }

            else if (dailySales >= 3000)
            {
                commission = dailySales * commissionRate[2];
                Console.WriteLine("  The total commission is {0}", commission.ToString("C"));
            }
             */
        }
    }
}
