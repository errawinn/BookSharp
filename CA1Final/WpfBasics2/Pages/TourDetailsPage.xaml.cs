using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for TourDetailsPage.xaml
    /// </summary>
    public partial class TourDetailsPage : Page
    {

        private string tourID;
        private string username;
        private Color color;
        Cart ct;

        public TourDetailsPage(string tourID, string username, Color color)
        {
            InitializeComponent();
            this.username = username;
            this.tourID = tourID;
            this.color = color;
        }


        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            TourCollection tc = new TourCollection();
            ObservableCollection<Tour> allTours = tc.getTours();
            Tour tour = tc.getTour(tourID);
            
            ct = new Cart(username);


            //Show specific tour details
            TextTourID.Text = tour.TourID;
            TextTourTitle.Text = tour.TourDesc;
            TextTourPrice.Text = "PRICE : $" + tour.TourPrice;
            TextTourDuration.Text = "TOUR AVAILABILITY : " + tour.TourStartDate + " - " + tour.TourEndDate;
            ImageTourSource.Source = new BitmapImage(new Uri(tour.TourImageSource));
            ItineraryDetails.Text = tour.TourItinerary;
            TextTourSummary.Text = tour.TourSummary;

            displayReviews();
        }



        private void displayReviews() //DISPLAY REVIEWS for tour
        {
            Review rv = new Review(tourID);
            ArrayList reviewsList = rv.getReviewsList();
            if (reviewsList.Count != 0)
            {
                reviewsList.Reverse();
                NoReviewsGrid.Visibility = Visibility.Collapsed;

                foreach (Review review in reviewsList)
                {
                    //Icon
                    Image icon = new Image();
                    BitmapImage bitmap = new BitmapImage();
                    bitmap.BeginInit();
                    bitmap.UriSource = new Uri(@"pack://application:,,,/Resources/Images/greenicon.png", UriKind.Absolute);
                    bitmap.EndInit();
                    icon.Source = bitmap;
                    icon.Height = 26;
                    icon.Width = 26;
                    icon.HorizontalAlignment = HorizontalAlignment.Left;
                    icon.Margin = new Thickness(0, 10, 0, 10);

                    //Customer name
                    TextBlock customerName = new TextBlock();
                    customerName.Text = ((Review)review).ReviewName;
                    customerName.FontWeight = FontWeights.Bold;
                    customerName.FontSize = 15;
                    customerName.HorizontalAlignment = HorizontalAlignment.Left;

                    customerName.Margin = new Thickness(40, 12, 0, 10);

                    //Date of review
                    TextBlock date = new TextBlock();
                    date.Text = Convert.ToString(((Review)review).ReviewDateTime.ToShortDateString());
                    date.Margin = new Thickness(0, 10, 100, 10);
                    date.FontSize = 11;
                    date.HorizontalAlignment = HorizontalAlignment.Right;
                    date.Foreground = Brushes.DarkGray;

                    //Time of review
                    TextBlock time = new TextBlock();
                    time.Text = Convert.ToString(((Review)review).ReviewDateTime.ToShortTimeString());
                    time.Margin = new Thickness(5, 10, 45, 10);
                    time.FontSize = 11;
                    time.HorizontalAlignment = HorizontalAlignment.Right;
                    time.Foreground = Brushes.DarkGray;

                    //Container for review
                    Grid customerNameContainer = new Grid();
                    customerNameContainer.Margin = new Thickness(0, 15, 0, 10);
                    customerNameContainer.Children.Add(icon);
                    customerNameContainer.Children.Add(customerName);
                    customerNameContainer.Children.Add(date);
                    customerNameContainer.Children.Add(time);

                    //Review message
                    TextBlock reviewMessage = new TextBlock();
                    reviewMessage.Margin = new Thickness(40, 10, 20, 20);
                    reviewMessage.TextWrapping = TextWrapping.Wrap;
                    reviewMessage.Text = ((Review)review).ReviewMessage;
                    reviewMessage.FontSize = 11;

                    //Divider Line
                    Line divider = new Line();
                    divider.X1 = 10;
                    divider.X2 = 590;
                    SolidColorBrush Gray = new SolidColorBrush();
                    Gray.Color = Colors.DarkGray;
                    divider.Stroke = Gray;
                    divider.Margin = new Thickness(0, 20, 0, 20);

                    //Adding reviews to stackpanel
                    ReviewStackPanel.Children.Add(customerNameContainer);
                    ReviewStackPanel.Children.Add(reviewMessage);
                    ReviewStackPanel.Children.Add(divider);
                }
            }
        }

        //ADDS BOOKMARK of tour
        private void BookmarksButton_Click(object sender, RoutedEventArgs e)
        {
            Bookmarks bm = new Bookmarks(username);
            bm.addBookmark(tourID);
        }

        //OPENS CART SELECTION WINDOW
        private void AddCartButton_Click(object sender, RoutedEventArgs e)
        {
            ObservableCollection<Cart> cartItems = ct.getCartItems();
            bool alreadyInCart = false;
            CartItemSelectionPage cisp = new CartItemSelectionPage(tourID, username, color);

       
            foreach (Cart cart in cartItems)
            {
                if (cart.TourID.Equals(tourID))
                {
                    MessageBox.Show("This is already in your cart!", "Note");
                    alreadyInCart = true;
                }
            }

            if (!alreadyInCart)
            {
                if (cisp.getTourAvailability() == false) //if every date in tour date range has 15 slots fully booked
                {
                    MessageBox.Show("Sorry, this tour is fully booked.", "Note");
                }
                else
                {
                    foreach (Window window in App.Current.Windows)
                    {
                        if (!window.IsActive)
                        {
                            window.Hide();
                        }
                    }

                    CartSelectionWindow csw = new CartSelectionWindow(color);
                    csw.Top = Window.GetWindow(this).Top;
                    csw.Left = Window.GetWindow(this).Left;
                    csw.Main.Content = cisp;
                    csw.Show();
                }
              
            }

        }

    }
}
