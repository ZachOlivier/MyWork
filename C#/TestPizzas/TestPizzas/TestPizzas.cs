using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TestPizzas
{
    class Pizza
    {
        private string toppings;
        private int size;
        private double price;

        public string Toppings
        {
            get
            {
                return this.toppings;
            }
            set
            {
                this.toppings = value;
            }
        }

        public int Size
        {
            get
            {
                return size;
            }
            set
            {
                size = value;
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

        public class TestPizzas
        {
            public static void Main()
            {
                Pizza pizzaOne = new Pizza();
                Pizza pizzaTwo = new Pizza();
                pizzaOne.Toppings = "Pepperoni and Cheese";
                pizzaOne.Size = 12;
                pizzaOne.Price = 7.99;
                pizzaTwo.Toppings = "Extra Cheese";
                pizzaTwo.Size = 14;
                pizzaTwo.Price = 10.00;

                Console.WriteLine();
                Console.WriteLine("  Your {0}inch pizza with {1} is going to cost {2}", pizzaOne.Size, pizzaOne.Toppings, pizzaOne.Price.ToString("C2"));
                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine("  Your {0}inch pizza with {1} is going to cost {2}", pizzaTwo.Size, pizzaTwo.Toppings, pizzaTwo.Price.ToString("C2"));

                Console.ReadLine();
            }
        }
    }
}
