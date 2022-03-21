using System;
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

namespace Tarasov_olimp.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddWindow.xaml
    /// </summary>
    public partial class AddWindow : Window
    {
        private WindowMain _windowMain;
        public AddWindow(WindowMain windowMain)
        {
            InitializeComponent();
            _windowMain = windowMain;
        }

        private void BnBack_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BnSave_Click(object sender, RoutedEventArgs e)
        {
            RepairDBEntities.GetContext().Worker.Add(new Worker() { Date_begin = DpStart.SelectedDate.Value, Date_end = DpEnd.SelectedDate.Value, Dolgnost = TbD.Text, Fname = TbF.Text, Lname = TbO.Text, Sname = TbN.Text });
            RepairDBEntities.GetContext().SaveChanges();

            _windowMain.dgWorker.ItemsSource = RepairDBEntities.GetContext().Worker.ToList();

            this.Hide();
            _windowMain.ShowDialog();
            
        }
    }
}
