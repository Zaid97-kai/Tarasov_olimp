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
using _db = Tarasov_olimp.RepairDBEntities;

namespace Tarasov_olimp.Windows
{
    /// <summary>
    /// Логика взаимодействия для AuthWindow.xaml
    /// </summary>
    public partial class AuthWindow : Window
    {
        public static MainWindow window;
        public AuthWindow()
        {
            InitializeComponent();
        }

        private void BtnAutor_Click(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < _db.GetContext().Users.Count(); i++)
            {
                if (_db.GetContext().Users.ToList()[i].lovgin == tbLogin.Text && _db.GetContext().Users.ToList()[i].password == tbPassword.Text)
                {

                    new WindowMain().Show();
                    this.Hide();
                    _db.GetContext().Users.ToList()[i].date_last_autor = DateTime.Now;
                    _db.GetContext().SaveChanges();
                }
                else
                {
                    MessageBox.Show("Не существует пользователя! Зарегестрируйтесь!");
                }
            }
        }
    }
}
