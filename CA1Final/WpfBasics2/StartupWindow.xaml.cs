using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
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
using BookSharp.Classes;
namespace BookSharp
{
    /// <summary>
    /// Interaction logic for StartupWindow.xaml
    /// </summary>
    public partial class StartupWindow : Window
    {

        public StartupWindow()
        {
            InitializeComponent();
            Main.Content = new Pages.WelcomePage();
            FreeCustomer fcs = new FreeCustomer();
            Booking bk = new Booking();
            fcs.deleteExpiredCustomers();
            ObservableCollection<Booking> Hi = bk.getNoOfBookingPerMonth();
        }
        
        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {

            if (MessageBox.Show("Close Application?", "Question", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {             
                App.Current.Shutdown();
            }
        }

        private void TitleBar_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void MinimizeButton_MouseEnter(object sender, MouseEventArgs e)
        {
            Minimise.Opacity = 0.4;
        }

        private void CloseButton_MouseEnter(object sender, MouseEventArgs e)
        {
            Close.Opacity = 0.8;
        }

        private void Minimise_MouseLeave(object sender, MouseEventArgs e)
        {
            Minimise.Opacity = 0.3;
        }

        private void Close_MouseLeave(object sender, MouseEventArgs e)
        {
            Close.Opacity = 0.7;
        }
    }
}
