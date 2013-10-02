using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolsDemo
{
    class School : IComparable
    {
        public string name { get; set; }
        public int students { get; set; }

        int IComparable.CompareTo(Object o)
        {
            int returnVal;
            School temp = (School)o;

            if (this.students > temp.students)
                returnVal = 1;
            else
                if (this.students < temp.students)
                    returnVal = -1;
                else
                    returnVal = 0;
            return returnVal;
        }
    }

    public class DemoSchools
    {
        public static void Main()
        {
            School[] schoolArray = new School[5];
            int x;
            string[] studentsInput = { "a", "a", "a", "a", "a" };

            for (x = 0; x < schoolArray.Length; ++x)
            {
                schoolArray[x] = new School();

                Console.WriteLine();
                Console.Write("  Please enter a school name :  ");
                schoolArray[x].name = Console.ReadLine();
                Console.Write("  Please enter a number of students that enroll to this school :  ");
                studentsInput[x] = Console.ReadLine();
                schoolArray[x].students = Convert.ToInt32(studentsInput[x]);
            }

            Console.WriteLine();

            Array.Sort(schoolArray);

            for (x = 0; x < schoolArray.Length; ++x)
            {
                Console.WriteLine();
                Console.WriteLine("  {0} currently has {1} students enrolled", schoolArray[x].name, schoolArray[x].students);
            }

            Console.ReadLine();
        }
    }
}
