using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace TeamSelector
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void listBox1_MouseMove(object sender, MouseEventArgs e)
        {
            label1.Text = "Team Red $27.50 - Team Blue $23.00 - Team Green $19.99 - Team Orange $18.50";
        }

        private void listBox1_MouseLeave(object sender, EventArgs e)
        {
            label1.Text = "";
        }

        private void listBox1_MouseClick(object sender, MouseEventArgs e)
        {
            if (listBox1.SelectedIndex == 0)
            {
                this.BackColor = System.Drawing.Color.Red;
                label2.Text = "Your total will be $27.50";
            }

            else if (listBox1.SelectedIndex == 1)
            {
                this.BackColor = System.Drawing.Color.Blue;
                label2.Text = "Your total will be $23.00";
            }

            else if (listBox1.SelectedIndex == 2)
            {
                this.BackColor = System.Drawing.Color.Green;
                label2.Text = "Your total will be $19.99";
            }

            else if (listBox1.SelectedIndex == 3)
            {
                this.BackColor = System.Drawing.Color.Orange;
                label2.Text = "Your total will be $18.50";
            }
        }
    }
}
