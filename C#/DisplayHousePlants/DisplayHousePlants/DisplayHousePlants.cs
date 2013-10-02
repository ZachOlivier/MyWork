using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DisplayHousePlants
{
    class HousePlant
    {
        private string name;
        private double price;
        private string fed;

        public string Name
        {
            get
            {
                return this.name;
            }
            set
            {
                this.name = value;
            }
        }

        public double Price
        {
            get
            {
                return price;
            }
            set
            {
                price = value;
            }
        }

        public string Fed
        {
            get
            {
                return this.fed;
            }
            set
            {
                this.fed = value;
            }
        }

        public class DisplayHousePlants
        {
            public static void Main()
            {
                HousePlant plantOne = new HousePlant();
                HousePlant plantTwo = new HousePlant();
                HousePlant plantThree = new HousePlant();
                plantOne.Name = "Rose";
                plantOne.Price = 3.99;
                plantOne.Fed = "fed";
                plantTwo.Name = "Daisy";
                plantTwo.Price = 2.99;
                plantTwo.Fed = "unfed";
                plantThree.Name = "Unknown";
                plantThree.Price = 7.49;
                plantThree.Fed = "fed?";

                Console.WriteLine();
                Console.WriteLine("  The first plant is a {0} {1} that costs {2}", plantOne.Fed, plantOne.Name, plantOne.Price.ToString("C2"));
                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine("  The second plant is an {0} {1} that costs {2}", plantTwo.Fed, plantTwo.Name, plantTwo.Price.ToString("C2"));
                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine("  The third plant is a {0} {1} that costs {2}", plantThree.Fed, plantThree.Name, plantThree.Price.ToString("C2"));

                Console.ReadLine();
            }
        }
    }
}
