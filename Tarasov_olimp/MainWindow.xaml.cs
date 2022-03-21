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
using System.Windows.Navigation;
using System.Windows.Shapes;
using _db = Tarasov_olimp.RepairDBEntities;

namespace Tarasov_olimp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BnReg_Click(object sender, RoutedEventArgs e)
        {
            _db.GetContext().Users.Add(new Users() { lovgin = tbLogin.Text, password = tbPassword.Text, date_reg = DateTime.Now, date_last_autor = DateTime.Now });
            _db.GetContext().SaveChanges();
        }
    }
}
