using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace GuessANumber
{
    public partial class Form1 : Form
    {
        static Random ranNumberGenerator = new Random();
        public int randomNumber = ranNumberGenerator.Next(1, 5);

        public Form1()
        {
            InitializeComponent();
        }

        public void label1_MouseHover(object sender, EventArgs e)
        {
            if (randomNumber == 1)
            {
                label1.Text = "It is NOT Button 4";
            }

            if (randomNumber == 2)
            {
                label1.Text = "It is NOT Button 1";
            }

            if (randomNumber == 3)
            {
                label1.Text = "It is NOT Button 5";
            }

            if (randomNumber == 4)
            {
                label1.Text = "It is NOT Button 3";
            }

            if (randomNumber == 5)
            {
                label1.Text = "It is NOT Button 2";
            }

            label1.Enabled = false;
        }

        public void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            radioButton1.Enabled = false;
            radioButton2.Enabled = false;
            radioButton3.Enabled = false;
            radioButton4.Enabled = false;
            radioButton5.Enabled = false;

            if (randomNumber == 1)
            {
                label2.Text = "Congratulations, You Won!";
            }

            else
            {
                label2.Text = "Sorry, Try Again.";
            }
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            radioButton1.Enabled = false;
            radioButton2.Enabled = false;
            radioButton3.Enabled = false;
            radioButton4.Enabled = false;
            radioButton5.Enabled = false;

            if (randomNumber == 2)
            {
                label2.Text = "Congratulations, You Won!";
            }

            else
            {
                label2.Text = "Sorry, Try Again.";
            }
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            radioButton1.Enabled = false;
            radioButton2.Enabled = false;
            radioButton3.Enabled = false;
            radioButton4.Enabled = false;
            radioButton5.Enabled = false;

            if (randomNumber == 3)
            {
                label2.Text = "Congratulations, You Won!";
            }

            else
            {
                label2.Text = "Sorry, Try Again.";
            }
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            radioButton1.Enabled = false;
            radioButton2.Enabled = false;
            radioButton3.Enabled = false;
            radioButton4.Enabled = false;
            radioButton5.Enabled = false;

            if (randomNumber == 4)
            {
                label2.Text = "Congratulations, You Won!";
            }

            else
            {
                label2.Text = "Sorry, Try Again.";
            }
        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {
            radioButton1.Enabled = false;
            radioButton2.Enabled = false;
            radioButton3.Enabled = false;
            radioButton4.Enabled = false;
            radioButton5.Enabled = false;

            if (randomNumber == 5)
            {
                label2.Text = "Congratulations, You Won!";
            }

            else
            {
                label2.Text = "Sorry, Try Again.";
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
