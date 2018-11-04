using BookSharp.Classes;
using BookSharp.Pages;
using System;
using System.Collections.Generic;
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

namespace BookSharp
{
    /// <summary>
    /// Interaction logic for SummaryReportWindow.xaml
    /// </summary>
    public partial class SummaryReportWindow : Window
    {
        public string username { get; set; }
        public Color color { get; set; }
   
        dbBooking db = new dbBooking();
        Booking book = new Booking();

        public SummaryReportWindow(string username)
        {
            InitializeComponent();
            bookingTop5Names.Visibility = Visibility.Hidden;
            bookingTop5Names.Visibility = Visibility.Collapsed ;
            this.username = username;
            this.color = (Color)(ColorConverter.ConvertFromString("#FFECEAE2"));
            Border.Background = new SolidColorBrush(color);
            try
            {
                LBBooking.ItemsSource = book.getWeeklyBooking();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            try
            {
                LBBookTour.ItemsSource = book.getTop5Booking();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public SummaryReportWindow(string username, Color color)
        {
            InitializeComponent();
            bookingTop5Names.Visibility = Visibility.Hidden;
            bookingTop5Names.Visibility = Visibility.Collapsed;
            this.username = username;
            this.color = color;
            Border.Background = new SolidColorBrush(color);
            try
            {
                LBBooking.ItemsSource = book.getWeeklyBooking();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            try
            {
                LBBookTour.ItemsSource = book.getTop5Booking();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
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

        //SELECTION CHANGED --> CHANGES LISTBOX ITEMSOURCE to display DIFFERENT SUMMARY REPORTS
        private void sortReport_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (sortReport.SelectedIndex >= 0 && sortReport.SelectedIndex <= 1)
            {
                bookingNames.Visibility = Visibility.Visible;
                bookingTop5Names.Visibility = Visibility.Collapsed;
                LBBooking.Visibility = Visibility.Visible;
                LBBookTour.Visibility = Visibility.Collapsed;
                      
                switch (sortReport.SelectedIndex)
                {
                    case 0:
                        LBBooking.ItemsSource = book.getWeeklyBooking();
                        break;
                    case 1:
                        LBBooking.ItemsSource = book.getMonthlyBooking();
                        break;
                }         
            }
            else if (sortReport.SelectedIndex >= 2 && sortReport.SelectedIndex <= 4)
            {
                bookingTop5Names.Visibility = Visibility.Visible;
                bookingNames.Visibility = Visibility.Collapsed;
                LBBookTour.Visibility = Visibility.Visible;
                LBBooking.Visibility = Visibility.Collapsed;

                switch (sortReport.SelectedIndex)
                {
                    case 2:
                        LBBookTour.ItemsSource = book.getNoOfBookingPerWeek();
                        break;
                    case 3:
                        LBBookTour.ItemsSource = book.getNoOfBookingPerMonth();
                        break;
                    case 4:
                        LBBookTour.ItemsSource = book.getTop5Booking();
                        break;
                }

            }
        }
    }

}
