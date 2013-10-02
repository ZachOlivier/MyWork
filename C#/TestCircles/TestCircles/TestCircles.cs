using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TestCircles
{
    class Circle
    {
        private double radius;
        private double area;
        private double diameter;

        public Circle()
        {
            Radius = 1;
        }

        public double Radius
        {
            get
            {
                return radius;
            }
            set
            {
                radius = value;
                CalcArea();
                CalcDiameter();
            }
        }

        public double Area
        {
            get
            {
                return area;
            }
        }

        public double Diameter
        {
            get
            {
                return diameter;
            }
        }

        private void CalcArea()
        {
            area = Math.PI * (radius * radius);
        }

        private void CalcDiameter()
        {
            diameter = radius * 2;
        }
    }

    public class TestCircles
    {
        public static void Main()
        {
            Circle smallCircle = new Circle();
            Circle largeCircle = new Circle();
            Circle normalCircle = new Circle();
            smallCircle.Radius = .25;
            largeCircle.Radius = 3.75;

            Console.WriteLine();
            Console.WriteLine("  The first circle has a radius of {0}, which means the area is {1}", smallCircle.Radius, smallCircle.Area.ToString("N2"));
            Console.WriteLine();
            Console.WriteLine("     and the diameter is {0}", smallCircle.Diameter);
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The second circle has a radius of {0}, which means the area is {1}", largeCircle.Radius, largeCircle.Area.ToString("N2"));
            Console.WriteLine();
            Console.WriteLine("     and the diameter is {0}", largeCircle.Diameter);
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("  The third circle has a radius of {0}, which means the area is {1}", normalCircle.Radius, normalCircle.Area.ToString("N2"));
            Console.WriteLine();
            Console.WriteLine("     and the diameter is {0}", normalCircle.Diameter);

            Console.ReadLine();
        }
    }
}