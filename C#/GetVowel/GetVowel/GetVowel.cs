using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GetVowel
{
    class GetVowel
    {
        static void Main(string[] args)
        {
            //Set the variables
            string inputString;
            char response;

            //Ask the user to enter a vowel, or an ! to end the program
            System.Console.WriteLine("  Please enter a vowel, or an ! to end the program.");
            inputString = Console.ReadLine();
            response = Convert.ToChar(inputString);
            char[] vowel = new char[] { 'a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U' };

            //The loop statement. While the input is a vowel respond OK, while it is not a vowel respond Error, if it is an ! end program
            while (response != '!')
            {
                if (vowel.Contains(response))
                    System.Console.WriteLine("  OK");
                else
                    System.Console.WriteLine("  Error");
                inputString = Console.ReadLine();
                response = Convert.ToChar(inputString);
            }
        }
    }
}
