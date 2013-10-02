using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Restaurant
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            double wings = 2.99;
            double salad = 1.99;
            double cheeseSticks = 2.49;
            double rolls = 1.49;
            double steak = 6.49;
            double pizza = 4.99;
            double noodles = 3.49;
            double burger = 4.49;
            double cake = 2.49;
            double brownies = 1.99;
            double iceCream = 1.49;
            double cupCakes = .99;
            double cost;

            wings = comboBox1.Items.IndexOf(0);
            salad = comboBox1.Items.IndexOf(1);
            cheeseSticks = comboBox1.Items.IndexOf(2);
            rolls = comboBox1.Items.IndexOf(3);

            steak = comboBox2.Items.IndexOf(0);
            pizza = comboBox2.Items.IndexOf(1);
            noodles = comboBox2.Items.IndexOf(2);
            burger = comboBox2.Items.IndexOf(3);

            cake = comboBox3.Items.IndexOf(0);
            brownies = comboBox3.Items.IndexOf(1);
            iceCream = comboBox3.Items.IndexOf(2);
            cupCakes = comboBox3.Items.IndexOf(3);

            cost = comboBox1.SelectedIndex + comboBox2.SelectedIndex + comboBox3.SelectedIndex;

            textBox1.Text = "Your Total Will Be : " + cost.ToString("C");
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
