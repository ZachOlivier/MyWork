using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Admission
{
    class Admission
    {
        static void Main(string[] args)
        {
            //Set the variables
            string gpaString;
            string TestScoreString;
            decimal GPA;
            decimal TestScore;

            //Prompt the user to give a GPA and Test Score
            System.Console.WriteLine();
            System.Console.WriteLine();
            System.Console.Write("  Please Enter Your GPA (Grade Point Average) :  ");
            gpaString = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.WriteLine();
            System.Console.Write("  Please Enter Your Admission Test Score :  ");
            TestScoreString = System.Console.ReadLine();
            System.Console.WriteLine();
            System.Console.WriteLine();

            //Set the requirements for Accept or Reject
            GPA = Convert.ToDecimal(gpaString);
            TestScore = Convert.ToDecimal(TestScoreString);

            if ((GPA >= 3 && TestScore >= 60) || (GPA < 3 && TestScore >= 80))
                System.Console.WriteLine("Accept!");
            else
                System.Console.WriteLine("Reject");

            //Write this is order to keep the window open
            System.Console.ReadLine();
        }
    }
}
