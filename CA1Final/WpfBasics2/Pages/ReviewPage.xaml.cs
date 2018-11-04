using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
    /// Interaction logic for ReviewPage.xaml
    /// </summary>
    public partial class ReviewPage : Page
    {

        private static string username;
        private Color color;
        private string selectedTourID = "";
        Customer cs = new Customer();
        private bool hasPurchasedTour = false;
        dbBooking db = new dbBooking();


        public ReviewPage(string username, Color color)
        {
            InitializeComponent();

            ReviewPage.username = username;
            this.color = color;

            cs = (Customer)cs.getCustomerRow(username);

            txtBoxName.Text = cs.FirstName + " " + cs.LastName;

            ErrorTextBlock1.Visibility = Visibility.Visible;
            ErrorTextBlock2.Visibility = Visibility.Hidden;
            comboBoxTourID.IsHitTestVisible = false;

            getCurrentUserPurchasedTours(username);

        }



        private void getCurrentUserPurchasedTours(string username) //returns a list of current user's PREVIOUSLY BOOKED TOURS for COMBOBOX
        {
            List<string> currentUserTourIDs = new List<string>();

            DataTable bookingTable = db.getDataTable("select * from tblBooking");
            int size = bookingTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = bookingTable.Rows[i];
                if (row["Username"].ToString() == username)
                {
                    ErrorTextBlock1.Visibility = Visibility.Hidden;
                    comboBoxTourID.IsHitTestVisible = true;
                    comboBoxTourID.Cursor = Cursors.Hand;
                    hasPurchasedTour = true;

                    if (!currentUserTourIDs.Contains(row["TourID"].ToString()))
                    {
                        currentUserTourIDs.Add(row["TourID"].ToString());
                    }

                }

            }

            if (currentUserTourIDs != null)
            {
                foreach (string tourID in currentUserTourIDs)
                {
                    comboBoxTourID.Items.Add(tourID); //add tours to combobox if user has purchased any
                }
            }

        }


        // ADDS REVIEW TO DATABASE 
        private void PostButton_Click(object sender, RoutedEventArgs e)
        {
            if (hasPurchasedTour)
            {
                if (txtBoxName.Text == "" || txtBoxMessage.Text == "" || txtBoxMessage.Text == "Enter your review of the tour you have purchased and it will be posted in the respective tour details page!" || string.IsNullOrWhiteSpace(txtBoxMessage.Text.Trim()) || string.IsNullOrWhiteSpace(txtBoxName.Text.Trim()))
                {
                    ErrorTextBlock2.Visibility = Visibility.Visible;
                }
                else if (selectedTourID == "")
                {
                    ErrorTextBlock2.Visibility = Visibility.Hidden;
                    ErrorTextBlock1.Visibility = Visibility.Visible;
                    ErrorTextBlock1.Text = "Please select a tour";
                }
                else if (txtBoxName.Text.Length > 50)
                {
                    ErrorTextBlock2.Text = "Please enter a name less than 50 characters";
                }
                else if (txtBoxMessage.Text.Length > 350)
                {
                    ErrorTextBlock2.Text = "Please leave a review less than 350 characters";
                }
                else
                {
                    ErrorTextBlock1.Visibility = Visibility.Hidden;
                    ErrorTextBlock2.Visibility = Visibility.Hidden;
                    Review rv = new Review(selectedTourID, txtBoxName.Text.Trim(), txtBoxMessage.Text.Trim(), DateTime.Now);
                    rv.storeReview();

                    this.NavigationService.Navigate(new ReviewSentPage(username, color, selectedTourID));
                }
            }
        }


        private void comboBoxTourID_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selectedTourID = comboBoxTourID.SelectedValue.ToString();   //sets the comboBox tourID to selectedTourID   
        }



        private void txtBoxName_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBoxName.Text))
            {
                txtBoxName.Text = cs.FirstName + " " + cs.LastName;
            }
        }


        //Message TextBox GotFocus   //Removes default string from email textbox when got focus
        private void txtBoxMessage_GotFocus(object sender, RoutedEventArgs e)
        {
            txtBoxMessage.Foreground = Brushes.Black;
            if (txtBoxMessage.Text == "Enter your review of the tour you have purchased and it will be posted in the respective tour details page!")
            {
                txtBoxMessage.Text = string.Empty;
            }
        }


        //Email TextBox LostFocus //Adds default string to email textbox if empty when lose focus

        private void txtBoxMessage_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBoxMessage.Text))
            {
                txtBoxMessage.Text = "Enter your review of the tour you have purchased and it will be posted in the respective tour details page!";
                txtBoxMessage.Foreground = Brushes.DarkGray;
            }
        }

    }
}