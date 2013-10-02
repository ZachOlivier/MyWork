using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BookDemo
{
    class Book
    {
        private int isbn;
        private string title;
        private string author;
        protected double price;

        public int ISBN
        {
            get
            {
                return isbn;
            }
            set
            {
                isbn = value;
            }
        }

        public string Title
        {
            get
            {
                return this.title;
            }
            set
            {
                this.title = value;
            }
        }

        public string Author
        {
            get
            {
                return this.author;
            }
            set
            {
                this.author = value;
            }
        }

        public virtual double Price
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
    }

    class TextBook : Book
    {
        private int grade;

        public int Grade
        {
            get
            {
                return grade;
            }
            set
            {
                grade = value;
            }
        }

        override public double Price
        {
            set
            {
                double Minimum = 20.00;
                double Maximum = 80.00;

                if (value < Minimum)
                    price = Minimum;
                else
                    if (value > Maximum)
                        price = Maximum;
                    else
                        price = value;
            }
        }
    }

    class CoffeeTableBook : Book
    {
        override public double Price
        {
            set
            {
                double Minimum = 35.00;
                double Maximum = 100.00;

                if (value < Minimum)
                    price = Minimum;
                else
                    if (value > Maximum)
                        price = Maximum;
                    else
                        price = value;
            }
        }
    }

    public class BookDemo
    {
        public static void Main()
        {
            Book book1 = new Book();
            Book book2 = new Book();
            TextBook book3 = new TextBook();
            TextBook book4 = new TextBook();
            TextBook book5 = new TextBook();
            CoffeeTableBook book6 = new CoffeeTableBook();
            CoffeeTableBook book7 = new CoffeeTableBook();
            CoffeeTableBook book8 = new CoffeeTableBook();

            book1.ISBN = 746382918; book1.Title = "This is Life"; book1.Author = "One, Any"; book1.Price = 32;
            book2.ISBN = 847362918; book2.Title = "Up and Down"; book2.Author = "One, Any"; book2.Price = 113;
            book3.ISBN = 948367123; book3.Title = "Algrebra"; book3.Author = "Guy, That"; book3.Price = 15;
            book4.ISBN = 832749210; book4.Title = "Geometry"; book4.Author = "Guy, That"; book4.Price = 90;
            book5.ISBN = 109238750; book5.Title = "English"; book5.Author = "Girl, That"; book5.Price = 45;
            book6.ISBN = 923850178; book6.Title = "Sports"; book6.Author = "Guy, Some"; book6.Price = 30;
            book7.ISBN = 622934749; book7.Title = "Romance"; book7.Author = "Girl, Some"; book7.Price = 105;
            book8.ISBN = 847392301; book8.Title = "Politics"; book8.Author = "Guy, A"; book8.Price = 65;

            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book1.ISBN, book1.Title, book1.Author, book1.Price.ToString("C"));
            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book2.ISBN, book2.Title, book2.Author, book2.Price.ToString("C"));
            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book3.ISBN, book3.Title, book3.Author, book3.Price.ToString("C"));
            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book4.ISBN, book4.Title, book4.Author, book4.Price.ToString("C"));
            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book5.ISBN, book5.Title, book5.Author, book5.Price.ToString("C"));
            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book6.ISBN, book6.Title, book6.Author, book6.Price.ToString("C"));
            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book7.ISBN, book7.Title, book7.Author, book7.Price.ToString("C"));
            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book8.ISBN, book8.Title, book8.Author, book8.Price.ToString("C"));

            Console.ReadLine();
        }
    }
}