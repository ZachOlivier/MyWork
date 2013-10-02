using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace TestsInteractiveGUI
{
    public partial class TestsInteractiveGUI : Form
    {
        public TestsInteractiveGUI()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            decimal score1 = Convert.ToDecimal(textBox1.Text);
            decimal score2 = Convert.ToDecimal(textBox2.Text);
            decimal score3 = Convert.ToDecimal(textBox3.Text);
            decimal score4 = Convert.ToDecimal(textBox4.Text);
            decimal score5 = Convert.ToDecimal(textBox5.Text);
            decimal AvgScore = (score1 + score2 + score3 + score4 + score5) / 5;
            textBox6.Text = AvgScore.ToString("G4");
        }
    }
}