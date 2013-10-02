using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DemoScouts
{
    class GirlScout
    {
        public string name {get; set;}
        public int number {get; set;}
        public double dues {get; set;}

        public static void Motto()
        {
            Console.WriteLine("  to obey the Girl Scout law");
        }

        public GirlScout()
        {
            name = "Rachel";
            number = 2117;
            dues = 20.37;
        }

        public GirlScout(string Name, int Number, double Dues)
        {
            name = Name;
            number = Number;
            dues = Dues;
        }
    }

    public class DemoScouts
    {
        public static void Main()
        {
            GirlScout scout1 = new GirlScout();
            GirlScout scout2 = new GirlScout("Courtney", 2132, 47.86);

            Console.WriteLine();
            Console.WriteLine("  {1} - {0} : {2}", scout1.name, scout1.number, scout1.dues.ToString("C2"));
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  {1} - {0} : {2}", scout2.name, scout2.number, scout2.dues.ToString("C2"));
            Console.WriteLine();
            Console.WriteLine();
            GirlScout.Motto();

            Console.ReadLine();
        }
    }
}
