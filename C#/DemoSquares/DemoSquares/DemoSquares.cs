using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DemoSquares
{
    class Square
    {
        public int length;
        public int area;

        public Square()
        {
            Length = 1;
        }

        public int Length
        {
            get
            {
                return length;
            }
            set
            {
                length = value;
                CalcArea();
            }
        }

        public int Area
        {
            get
            {
                return area;
            }
        }

        private void CalcArea()
        {
            area = length * length;
        }
    }

    public class DemoSquares
    {
        public static void Main()
        {
            Square[] squareArray = new Square[5];
            int x;
            for (x = 0; x < squareArray.Length; ++x)
                squareArray[x] = new Square();
            squareArray[1].Length = 2;
            squareArray[2].Length = 3;
            squareArray[3].Length = 4;
            squareArray[4].Length = 5;

            Console.WriteLine();
            Console.WriteLine("  The 1st square's length is {0}, which means the area is {1}", squareArray[0].length, squareArray[0].area);
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The 2nd square's length is {0}, which means the area is {1}", squareArray[1].length, squareArray[1].area);
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The 3rd square's length is {0}, which means the area is {1}", squareArray[2].length, squareArray[2].area);
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The 4th square's length is {0}, which means the area is {1}", squareArray[3].length, squareArray[3].area);
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The 5th square's length is {0}, which means the area is {1}", squareArray[4].length, squareArray[4].area);

            Console.ReadLine();
        }
    }
}
