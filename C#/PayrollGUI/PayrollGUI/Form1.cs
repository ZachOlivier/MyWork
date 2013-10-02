using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PayrollGUI
{
    public partial class PayrollGUI : Form
    {
        public PayrollGUI()
        {
            InitializeComponent();
        }

        private void CalcAll_Click(object sender, EventArgs e)
        {
            decimal FedTax = .15M;
            decimal StTax = .05M;
            decimal HourlyRate = Convert.ToDecimal(textBox3.Text);
            decimal HoursWorked = Convert.ToDecimal(textBox4.Text);
            decimal GrossPay = HourlyRate * HoursWorked;
            textBox5.Text = GrossPay.ToString("G5");
            decimal FederalTax = GrossPay * FedTax;
            textBox6.Text = FederalTax.ToString("G5");
            decimal StateTax = GrossPay * StTax;
            textBox7.Text = StateTax.ToString("G5");
            decimal NetPay = GrossPay - (FederalTax + StateTax);
            textBox8.Text = NetPay.ToString("G5");
        }
    }
}
