﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using APOAUTIS.Formas.Entrevista_Padres;

namespace APOAUTIS
{
    public partial class VistaEntrevistaPadres : Form
    {
        public VistaEntrevistaPadres()
        {
            InitializeComponent();
        }

        

        private void textBox29_TextChanged(object sender, EventArgs e)
        {

        }

        private void button9_Click(object sender, EventArgs e)
        {
            //tabEntPadres.SelectedTab = tabPage2;
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
          
        }

        private void button3_Click(object sender, EventArgs e)
        {
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            
        }

        private void button5_Click(object sender, EventArgs e)
        {
           
        }

        private void button6_Click(object sender, EventArgs e)
        {
            
        }

        private void button7_Click(object sender, EventArgs e)
        {
           
        }

        private void button10_Click(object sender, EventArgs e)
        {
           
        }

        private void button11_Click(object sender, EventArgs e)
        {
            FrmBusquedaEntPadres frmBusEntPad = new FrmBusquedaEntPadres();
            frmBusEntPad.ShowDialog();
        }

        private void button26_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
