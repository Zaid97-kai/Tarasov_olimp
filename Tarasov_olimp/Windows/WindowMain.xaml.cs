﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using _db = Tarasov_olimp.RepairDBEntities;

namespace Tarasov_olimp.Windows
{
    /// <summary>
    /// Логика взаимодействия для WindowMain.xaml
    /// </summary>
    public partial class WindowMain : Window
    {
        private string _name;
        private List<Worker> _temp = _db.GetContext().Worker.ToList();
        public WindowMain()
        {
            InitializeComponent();
            dgWorker.ItemsSource = _db.GetContext().Worker.ToList();
            CbAtr.ItemsSource = new List<string>() { "ФИО", "Должность" };
            TbValueAtr.IsReadOnly = true;
        }

        private void TbValueAtr_TextChanged(object sender, TextChangedEventArgs e)
        {
            List<Worker> first = new List<Worker>();
            if (_name == "ФИО")
            {
                first = _temp.OrderBy(worker => worker.FullName).Where(worker => worker.FullName.ToLower().Contains(TbValueAtr.Text.ToLower())).ToList();
            }
            else if (_name == "Должность")
            {
                first = _temp.OrderBy(worker => worker.Dolgnost).Where(worker => worker.Dolgnost.ToLower().Contains(TbValueAtr.Text.ToLower())).ToList();
            }
            dgWorker.ItemsSource = first;
        } 

        private void CbAtr_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _name = CbAtr.SelectedItem.ToString();
            if (_name != null)
            {
                TbValueAtr.IsReadOnly = false;
            }
        }

        private void BnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddWindow addWindow = new AddWindow(this);
            
            this.Hide();
            addWindow.ShowDialog();
        }

        private void BnRemove_Click(object sender, RoutedEventArgs e)
        {
            if (dgWorker.SelectedItems.Count == 1)
            {
                _db.GetContext().Worker.Remove(dgWorker.SelectedItem as Worker);
                _db.GetContext().SaveChanges();
            }
            else if(dgWorker.SelectedItems.Count > 1)
            {
                _db.GetContext().Worker.RemoveRange(dgWorker.SelectedItems.Cast<Worker>());
                _db.GetContext().SaveChanges();
            }

            dgWorker.ItemsSource = _db.GetContext().Worker.ToList();
        }
    }
}
