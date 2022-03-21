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
        private bool _flag = false;
        private Worker _worker;
        /// <summary>
        /// Конструктор окна
        /// </summary>
        /// <param name="windowMain"></param>
        /// <param name="flag"></param>
        /// <param name="button"></param>
        public AddWindow(WindowMain windowMain, bool flag, object button = null)
        {
            InitializeComponent();
            _windowMain = windowMain;
            _flag = flag;
            if(flag == false)
            {
                this.DataContext = (button as Button).DataContext;
                _worker = DataContext as Worker;
                TbF.Text = _worker.Fname;
                TbN.Text = _worker.Sname;
                TbO.Text = _worker.Lname;
                TbD.Text = _worker.Dolgnost;
                DpStart.Text = _worker.Date_begin.ToString();
                DpEnd.Text = _worker.Date_end.ToString();
            }
        }
        /// <summary>
        /// Событие нажатия на кнопку Назад
        /// </summary>
        /// <param name="sender">Кнопка, вызвавшая событие</param>
        /// <param name="e"></param>
        private void BnBack_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            _windowMain.ShowDialog();
        }
        /// <summary>
        /// Событие нажатия на кнопку Сохранить
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BnSave_Click(object sender, RoutedEventArgs e)
        {
            if (_flag)
            {
                RepairDBEntities.GetContext().Worker.Add(new Worker() { Date_begin = DpStart.SelectedDate.Value, Date_end = DpEnd.SelectedDate.Value, Dolgnost = TbD.Text, Fname = TbF.Text, Lname = TbO.Text, Sname = TbN.Text });
                RepairDBEntities.GetContext().SaveChanges();

                _windowMain.dgWorker.ItemsSource = RepairDBEntities.GetContext().Worker.ToList();

                this.Hide();
                _windowMain.ShowDialog();
            }
            else
            {
                _worker.Fname = TbF.Text;
                _worker.Sname = TbN.Text;
                _worker.Lname = TbO.Text;
                _worker.Dolgnost = TbD.Text;
                _worker.Date_begin = DpStart.SelectedDate.Value;
                _worker.Date_end = DpEnd.SelectedDate.Value;
                RepairDBEntities.GetContext().SaveChanges();

                this.Hide();
                _windowMain.ShowDialog();
            }
        }
    }
}
