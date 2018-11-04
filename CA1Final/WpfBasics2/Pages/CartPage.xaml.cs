using System;
using System.Collections;
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
    /// Interaction logic for CartPage.xaml
    /// </summary>
    public partial class CartPage : Page
    {
        Flight f = new Flight();
        Room r = new Room();

        Booking ts = new Booking();
        private string username;
        private Color color;
        TourCollection tc = new TourCollection();
        dbBooking db = new dbBooking();
        double finalprice;

        public CartPage(string username, Color color)
        {
            InitializeComponent();
            this.username = username;
            this.color = color;
        }


        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            
            refreshCartItems();

        }

 
        // BINDS UI TO OBSERVABLE COLLECTION OF CART OBJECTS - TO DISPLAY CART 
        private void refreshCartItems()
        {
            Customer customer = new Customer();
            customer = (Customer)customer.getCustomerRow(username);
            FreeCustomer fcust = new FreeCustomer(username);
            PremiumCustomer pcust = new PremiumCustomer(username);
            Cart ct = new Cart(username);
            ListBoxCartItems.ItemsSource = ct.getCartItems();

            if (ct.getCartItems().Count == 0) //shows/hides 'none selected' text block ui
            {
                txtBlockNone.Visibility = Visibility.Visible;
            }
            else
            {
                txtBlockNone.Visibility = Visibility.Collapsed;
            }

           

            if (customer.Membership == "Free")
            {
                fcust.populateCustomerDetails();
                txtBlockSubsidy.Text = "None";
                finalprice = ct.calculateTotal();
            }
            else if (customer.Membership == "Premium")
            {
                pcust.populateCustomerDetails();
                txtBlockSubsidy.Text = "10%";
                finalprice = ct.calculateTotal();
            }

            finalprice = ct.calculateTotal();
            txtBlockTotalCost.DataContext = new Booking { TotalCost = finalprice };
        }


        //ADDS new BOOKING to booking table in DATABASE & opens RECEIPT window
        private void Checkout_Click(object sender, RoutedEventArgs e)
        {
            if (txtBlockNone.Visibility != Visibility.Visible)
            {
                MessageBoxResult mb = MessageBox.Show("Do you wish to checkout?", "Checkout Confirmation", MessageBoxButton.YesNo, MessageBoxImage.Exclamation);
                if (mb == MessageBoxResult.Yes)
                {
                    ts.TotalCost = finalprice;
                    
                    var newWindow = new ReceiptWindow(color, ts.generateReceipt(username)); 
                    newWindow.Top = Window.GetWindow(this).Top;
                    newWindow.Show();
                }
            }
            else
            {
                MessageBox.Show("You have not selected any cart items", "Note");
            }

        }

        //OPENS CART SELECTION WINDOW TO EDIT CART ITEM
        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Cart cartItem = (Cart)(sender as Button).DataContext;

                var newWindow = new CartSelectionWindow(color);
                newWindow.Top = Window.GetWindow(this).Top;
                newWindow.Left = Window.GetWindow(this).Left;
                newWindow.Main.Content = new Pages.CartItemSelectionPage(cartItem.TourID, username, color);
                newWindow.Show();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        //DELETES SELECTED CART OBJECT FROM DATABASE --> FOR SPECIFIED CUSTOMER
        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Cart cartItem = (Cart)(sender as Button).DataContext;


                List<Object> values = new List<Object>();
                List<string> names = new List<string>();
                values.Add(cartItem.TourID);
                values.Add(username);
                names.Add("TourID");
                names.Add("Username");

                db.deleteRow("tblCart", values, names);  //delete from table

            }
            catch (Exception ex)
            {
                MessageBox.Show("deleteBtn: " + ex.Message);
            }

            refreshCartItems(); //refreshes ui
        }
    }
}

