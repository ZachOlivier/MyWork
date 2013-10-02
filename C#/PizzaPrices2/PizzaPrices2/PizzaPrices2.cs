using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PizzaPrices2
{
    class PizzaPrices2
    {
        static void Main(string[] args)
        {
            // I just noticed your comments on my homework assignment's today as I was looking through my upcoming assignments,
            // I will start to use the lowerUpper casing and else if starting with this assignment here. Thanks for pointing it out.

            //Set the variables needed
            double[] price = { 6.99, 8.99, 12.50, 15.00 };
            double[] savings = { .10, .15, .20 };
            string inputSize;
            string inputAmount;
            char size;
            double amount;
            double discount;
            double subTotal;
            double total;

            //Ask the user to input the size and amount of pizzas
            Console.WriteLine();
            Console.Write("  What size pizza would you like? S, M, L, or X?  ");
            inputSize = Console.ReadLine();
            Console.WriteLine();
            Console.Write("  How many of these pizzas would you like?  ");
            inputAmount = Console.ReadLine();
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();


            //Determine the price of the pizza depending on the size desired
            size = Convert.ToChar(inputSize);
            amount = Convert.ToDouble(inputAmount);

            //For small pizzas
                if ((size == 's' || size == 'S') && amount == 1)
                {
                    Console.WriteLine("  Your S pizza will cost $6.99");
                }
                else if ((size == 's' || size == 'S') && amount == 2)
                {
                    subTotal = price[0] * amount;
                    discount = subTotal * savings[0];
                    total = subTotal - discount;
                    Console.WriteLine("  Your S pizzas are normally $6.99 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 10%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }
                else if ((size == 's' || size == 'S') && (amount == 3 || amount == 4))
                {
                    subTotal = price[0] * amount;
                    discount = subTotal * savings[1];
                    total = subTotal - discount;
                    Console.WriteLine("  Your S pizzas are normally $6.99 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 15%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }
                else if ((size == 's' || size == 'S') && amount >= 5)
                {
                    subTotal = price[0] * amount;
                    discount = subTotal * savings[2];
                    total = subTotal - discount;
                    Console.WriteLine("  Your S pizzas are normally $6.99 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 20%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }

            //For medium pizzas
                else if ((size == 'm' || size == 'M') && amount == 1)
                {
                    Console.WriteLine("  Your M pizza will cost $8.99");
                }
                else if ((size == 'm' || size == 'M') && amount == 2)
                {
                    subTotal = price[1] * amount;
                    discount = subTotal * savings[0];
                    total = subTotal - discount;
                    Console.WriteLine("  Your M pizzas are normally $8.99 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 10%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }
                else if ((size == 'm' || size == 'M') && (amount == 3 || amount == 4))
                {
                    subTotal = price[1] * amount;
                    discount = subTotal * savings[1];
                    total = subTotal - discount;
                    Console.WriteLine("  Your M pizzas are normally $8.99 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 15%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }
                else if ((size == 'm' || size == 'M') && amount >= 5)
                {
                    subTotal = price[1] * amount;
                    discount = subTotal * savings[2];
                    total = subTotal - discount;
                    Console.WriteLine("  Your M pizzas are normally $8.99 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 20%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }

            //For large pizzas
                else if ((size == 'l' || size == 'L') && amount == 1)
                {
                    Console.WriteLine("  Your L pizza will cost $12.50");
                }
                else if ((size == 'l' || size == 'L') && amount == 2)
                {
                    subTotal = price[2] * amount;
                    discount = subTotal * savings[0];
                    total = subTotal - discount;
                    Console.WriteLine("  Your L pizzas are normally $12.50 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 10%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }
                else if ((size == 'l' || size == 'L') && (amount == 3 || amount == 4))
                {
                    subTotal = price[2] * amount;
                    discount = subTotal * savings[1];
                    total = subTotal - discount;
                    Console.WriteLine("  Your L pizzas are normally $12.50 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 15%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }
                else if ((size == 'l' || size == 'L') && amount >= 5)
                {
                    subTotal = price[2] * amount;
                    discount = subTotal * savings[2];
                    total = subTotal - discount;
                    Console.WriteLine("  Your L pizzas are normally $12.50 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 20%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }

            //For extra large pizzas
                if ((size == 'x' || size == 'X') && amount == 1)
                {
                    Console.WriteLine("  Your X pizza will cost $15.00");
                }
                else if ((size == 'x' || size == 'X') && amount == 2)
                {
                    subTotal = price[3] * amount;
                    discount = subTotal * savings[0];
                    total = subTotal - discount;
                    Console.WriteLine("  Your X pizzas are normally $15.00 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 10%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }
                else if ((size == 'x' || size == 'X') && (amount == 3 || amount == 4))
                {
                    subTotal = price[3] * amount;
                    discount = subTotal * savings[1];
                    total = subTotal - discount;
                    Console.WriteLine("  Your X pizzas are normally $15.00 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 15%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }
                else if ((size == 'x' || size == 'X') && amount >= 5)
                {
                    subTotal = price[3] * amount;
                    discount = subTotal * savings[2];
                    total = subTotal - discount;
                    Console.WriteLine("  Your X pizzas are normally $15.00 each");
                    Console.WriteLine();
                    Console.WriteLine("  The total would normally be {0:C2}", subTotal);
                    Console.WriteLine();
                    Console.WriteLine("  Since you ordered {0} pizzas, your discount is 20%", amount);
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Your final total comes to {0:C2}", total);
                }

            //Just incase the user's input is invalid
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("  Please check your order and make sure it is correct.");

            //I put this in at the end to keep the program open
            Console.ReadLine();
        }
    }
}
