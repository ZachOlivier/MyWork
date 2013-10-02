using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TurningDemo
{
    public interface ITurnable
    {
        string Turn();
    }

    class Page : ITurnable
    {
        public string Turn()
        {
            return "You turn the page in the book.";
        }
    }

    class Corner : ITurnable
    {
        public string Turn()
        {
            return "You turn the corner at North Main and 3rd Avenue.";
        }
    }

    class Pancake : ITurnable
    {
        public string Turn()
        {
            return "You turn the pancake over.";
        }
    }

    class Leaf : ITurnable
    {
        public string Turn()
        {
            return "You turn the leaf onto the ugly side.";
        }
    }

    class DemoTurn
    {
        public static void Main()
        {
            Page one = new Page();
            Corner two = new Corner();
            Pancake three = new Pancake();
            Leaf four = new Leaf();

            Console.WriteLine();
            Console.WriteLine("  {0}", one.Turn());
            Console.WriteLine();
            Console.WriteLine("  {0}", two.Turn());
            Console.WriteLine();
            Console.WriteLine("  {0}", three.Turn());
            Console.WriteLine();
            Console.WriteLine("  {0}", four.Turn());

            Console.ReadLine();
        }
    }
}
