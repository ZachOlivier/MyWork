using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BookDemo2
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

        public override bool Equals(object book2)
        {
            bool equal;

            if (this.GetType() != book2.GetType())
                equal = false;
            else
            {
                Book temp = (Book)book2;

                if (ISBN == temp.ISBN)
                {
                    equal = true;
                }
                else
                    equal = false;
            }
            return equal;
        }
    }

    public class BookDemo
    {
        public static void Main()
        {
            Book book1 = new Book();
            Book book2 = new Book();
            Book book3 = new Book();

            book1.ISBN = 746382918; book1.Title = "This is Life"; book1.Author = "One, Any"; book1.Price = 32;
            book2.ISBN = 746382918;
            book3.ISBN = 948367123; book3.Title = "Algrebra"; book3.Author = "Guy, That"; book3.Price = 55;

            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book1.ISBN, book1.Title, book1.Author, book1.Price.ToString("C"));
            Console.WriteLine();
            Console.WriteLine("  {0} - This book has the same ISBN as Book 1", book2.ISBN.Equals(book1.ISBN));
            Console.WriteLine();
            Console.WriteLine("  {0} - '{1}' by : {2} will cost {3}", book3.ISBN, book3.Title, book3.Author, book3.Price.ToString("C"));

            Console.ReadLine();
        }
    }
}