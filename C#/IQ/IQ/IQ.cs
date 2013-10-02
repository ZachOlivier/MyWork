using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IQ
{
    class IQ
    {
        static void Main(string[] args)
        {
            //Set the variables
            string iqString;
            int IQ;

            //Prompt the user for their IQ Score
            System.Console.WriteLine();
            System.Console.WriteLine();
            System.Console.Write("  Please Enter Your IQ Score :  ");
            iqString = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.WriteLine();

            //Decide whether the score entered is above, below, or just average
            IQ = Convert.ToInt32(iqString);

            if (IQ > 200 || IQ <= 0)
                System.Console.WriteLine("  Error, Please Try Again With A Different IQ Score");

            if (IQ == 100)
                System.Console.WriteLine("  Your IQ Score Is Average.");

            if (IQ > 100 && IQ <= 200)
                System.Console.WriteLine("  Your IQ Score Is Above Average!");

            if (IQ < 100 && IQ > 0)
                System.Console.WriteLine("  Your IQ Score Is Below Average.");

            //I use this in order to keep the window open
            System.Console.ReadLine();
        }
    }
}
