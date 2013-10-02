using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Video
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            double cost;

            cost = 2.50 * listBox1.SelectedItems.Count;

            textBox1.Text = "Your Total Will Be : " + cost.ToString("C");
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
