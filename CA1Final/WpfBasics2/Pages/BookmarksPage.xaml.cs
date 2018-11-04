using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using BookSharp.Classes;

namespace BookSharp.Pages
{
    /// <summary>
    /// Interaction logic for BookmarksPage.xaml
    /// </summary>
    public partial class BookmarksPage : Page
    {

        Bookmarks bm;
        private string username;
        private Color color;

        dbBooking db = new dbBooking();

        public BookmarksPage(string username, Color color)
        {
            InitializeComponent();
            this.username = username;
            this.color = color;
            bm = new Bookmarks(username);
           
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            displayBookmarks();
        }

        //DISPLAYS BOOKMARKS by binding to LISTBOX ITEMSOURCE
        private void displayBookmarks()
        {
            ListBoxBookmarks.ItemsSource = bm.getBookmarks();

            if (bm.getBookmarks().Count == 0) //shows/hides 'none selected' text block ui
            {
                txtBlockNone.Visibility = Visibility.Visible;
            }
            else
            {
                txtBlockNone.Visibility = Visibility.Collapsed;
            }

        }

        //DELETE BOOKMARK  -->  when clicking specific listbox item's button
        private void deleteBtnClick(object sender, RoutedEventArgs e)
        {
            try
            {
                Tour tour = (Tour)(sender as Button).DataContext;

                List<Object> values = new List<Object>();
                List<string> names = new List<string>();
                values.Add(tour.TourID);
                values.Add(username);
                names.Add("TourID");
                names.Add("Username");
           
                db.deleteRow("tblBookmarks", values, names); //delete from table using WHERE clause

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            displayBookmarks(); //refreshes ui
        }

        //OPENS TOUR DETAILS PAGE based on  --> specific listbox item clicked
        private void viewBtnClick(object sender, RoutedEventArgs e)
        {
            Tour tour = (Tour)(sender as Button).DataContext; //gets tour of the listbox item using the button in the listbox

            var newWindow = new TourDetailsWindow(color);
            newWindow.Top = Window.GetWindow(this).Top;
            newWindow.Left = Window.GetWindow(this).Left;
            Window.GetWindow(this).Hide();
            newWindow.Show(); //Show the new window
            newWindow.Main.Content = new Pages.TourDetailsPage(tour.TourID, username, color);

        }


    }
}
