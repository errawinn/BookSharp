using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
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
    /// Interaction logic for CartItemSelectionPage.xaml
    /// </summary>
    public partial class CartItemSelectionPage : Page
    {
        string tourID, tourName, tourDesc;
        double tourPrice;
        int noOfPeople;
        int noOfTickets;
        int noOfSingleRm;
        int noOfDoubleRm;
        string flightSelection;
        string roomSelection;
        double totalFlightPrice;
        double totalRoomPrice;
        string addOnSelection;
        double subtotal;
        DateTime selectedStartDate;
        DateTime selectedEndDate;
        int tourDuration;

        AddOnCart aoct = new AddOnCart();
        dbBooking db = new dbBooking();
        TourCollection tc = new TourCollection();
        bool input;
        private string username;
        private Color color;
        int noOfSlotsLeft;
        DateTime startDate = default(DateTime),
                   endDate = default(DateTime);


        public CartItemSelectionPage(string tourID, string username, Color color)
        {
            InitializeComponent();
            this.username = username;
            this.color = color;
            this.tourID = tourID;
            
            noOfPeople = 0;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {

            ErrorTicket.Visibility = Visibility.Hidden;
            ErrorRoom.Visibility = Visibility.Hidden;
            ErrorDate.Visibility = Visibility.Hidden;
            ErrorPerson.Text = "Select a date first";

            populateDatePicker();
        }

        // 1. SHOWS DATES in specified TOUR DATE-RANGE only 
        // 2. Makes FULLY-BOOKED DATES UNAVAILABLE (15 max)  - in datePicker
        private void populateDatePicker() 
        {
            ObservableCollection<Tour> allTours = tc.getTours();

            foreach (Tour tour in allTours)
            {
                if (tour.TourID == tourID)
                {
                    TourID.Text = tour.TourID;
                    TourName.Text = tour.TourName;
                    TourDesc.Text = tour.TourDesc;

                    tourName = tour.TourName;
                    tourDesc = tour.TourDesc;
                    
                    tourPrice = tour.TourPrice;
                    tourDuration = tour.TourDuration;

                    datePicker.DisplayDate = Convert.ToDateTime(tour.TourStartDate);

                    if (DateTime.Compare(Convert.ToDateTime(tour.TourStartDate), DateTime.Now) < 0)
                    {
                        startDate = DateTime.Now;
                    }
                    else
                    {
                        startDate = (DateTime)Convert.ToDateTime(tour.TourStartDate);
                    }

                    datePicker.DisplayDateStart = startDate;
                    endDate = (DateTime)Convert.ToDateTime(tour.TourEndDate);
                    datePicker.DisplayDateEnd = endDate;
                }
            }

            for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
            {
                int noOfSlotsLeft = getNoOfSlotsLeft(date.ToShortDateString());
                if (noOfSlotsLeft < 1)
                {
                    datePicker.BlackoutDates.Add(new CalendarDateRange(date));
                }
            }
        }


        // GETS NO. OF SLOTS LEFT (of the MAXIMUM 15 slots) for the specific tourID on the selected tour date
        private int getNoOfSlotsLeft(string date) 
        {        
            int NoOfSlotsLeft = 15;
            DataTable bookingsForTour = db.getDataTable("SELECT * FROM tblBooking");
            for (int i = 0; i < bookingsForTour.Rows.Count; i++)
            {
                DataRow row = bookingsForTour.Rows[i];
                if (row["TourID"].ToString() == tourID)
                {

                    if (row["SelectedTourStartDate"].ToString() == date)
                    {
                        NoOfSlotsLeft = NoOfSlotsLeft - int.Parse(row["PeopleQty"].ToString());
                    }
                }
            }

            return NoOfSlotsLeft;
        }

        //for tour details page when user clicks add to cart 
        // - 1. CHECK if ALL TOUR DATES are FULLY BOOKED
        public bool getTourAvailability() 
        {
            bool tourIsAvailable = false;

            for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
            {
                noOfSlotsLeft = getNoOfSlotsLeft(date.ToShortDateString());
                if (noOfSlotsLeft > 0)
                {
                    tourIsAvailable = true;
                }
            }

            return tourIsAvailable;
        }


        //1. ADD NO. OF SLOTS to COMBOBOX based on tour availability 
        private void populateNoOfPersonComboBox(DateTime selectedDate) 
        {

            ObservableCollection<string> noOfPeopleList = new ObservableCollection<string>();
            int NoOfSlotsLeft = getNoOfSlotsLeft(selectedDate.ToShortDateString());
            int num = 1;
            while (NoOfSlotsLeft >= num)
            {
                cbNoOfPerson.Items.Add(num.ToString());
                num++;
            }


        }

        // SELECTION_CHANGED and TEXT_CHANGED EVENT HANDLERS
        private void datePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e) //sets selected date to variable
        {
            selectedStartDate = (DateTime)Convert.ToDateTime(Convert.ToDateTime(datePicker.SelectedDate).ToShortDateString());
            ErrorPerson.Text = "Please choose no. of people.";
            ErrorPerson.Visibility = Visibility.Hidden;
            ErrorDate.Visibility = Visibility.Hidden;
            cbNoOfPerson.IsHitTestVisible = true;
       
            cbNoOfPerson.Items.Clear();
            noOfPeople = 0;
            populateNoOfPersonComboBox(selectedStartDate);
        }

        private void NoOfPerson_SelectionChanged(object sender, SelectionChangedEventArgs e) //sets selected no. of people to variable
        {
            CBaddFlight.Visibility = CBAddRoom.Visibility = Visibility.Visible;
            CBaddFlight.IsChecked = CBAddRoom.IsChecked = false;
            ErrorPerson.Visibility = Visibility.Hidden;
            this.NoOfFlightTickets.Items.Clear();

            if (cbNoOfPerson.SelectedValue != null)
            {
                noOfPeople = int.Parse(cbNoOfPerson.SelectedValue.ToString());
            }

        }

        private void CBaddFlight_Checked(object sender, RoutedEventArgs e)
        {
            NoOfFlightTickets.IsHitTestVisible = true;
            NoOfFlightTickets.Cursor = Cursors.Hand;
            Img1.Opacity = 0.9;
            for (int i = 1; i <= noOfPeople; i++)
            {
                NoOfFlightTickets.Items.Add(i);
            }
        }

        private void CBaddFlight_Unchecked(object sender, RoutedEventArgs e)
        {
            NoOfFlightTickets.IsHitTestVisible = false;
            NoOfFlightTickets.Cursor = Cursors.Arrow;
            Img1.Opacity = 0.5;
            ErrorTicket.Visibility = Visibility.Hidden;
            NoOfFlightTickets.Items.Clear();
        }

        private void CBAddRoom_Unchecked(object sender, RoutedEventArgs e)
        {
            NoOfSingle.Text = "";
            NoOfDouble.Text = "";
            NoOfDouble.Focusable = NoOfSingle.Focusable = false;
            Img2.Opacity = Img3.Opacity = Img4.Opacity = 0.5;
            NoOfDouble.Cursor = NoOfSingle.Cursor = Cursors.Arrow;
            ErrorRoom.Visibility = Visibility.Hidden;
        }

        private void CBAddRoom_Checked(object sender, RoutedEventArgs e)
        {
            NoOfDouble.Focusable = NoOfSingle.Focusable = true;
            NoOfDouble.Cursor = NoOfSingle.Cursor = Cursors.IBeam;
            Img2.Opacity = Img3.Opacity = Img4.Opacity = 0.9;
        }

        private void NoOfFlightTickets_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (CBaddFlight.IsChecked == true)
            {
                if (NoOfFlightTickets.SelectedIndex < 0)
                {
                    ErrorTicket.Visibility = Visibility.Visible;
                }
                else
                {
                    ErrorTicket.Visibility = Visibility.Hidden;
                    noOfTickets = (int)NoOfFlightTickets.SelectedItem;
                }
            }
            else
            {
                ErrorTicket.Visibility = Visibility.Hidden;
            }

        }

        private void NoOfSingle_TextChanged(object sender, TextChangedEventArgs e)
        {
            input = int.TryParse(NoOfSingle.Text, out noOfSingleRm);

            if (!input || noOfSingleRm <= 0)
            {
                ErrorRoom.Visibility = Visibility.Visible;
            }
            else
            {
                ErrorRoom.Visibility = Visibility.Hidden;
                noOfSingleRm = int.Parse(NoOfSingle.Text);
            }
        }

        private void NoOfDouble_TextChanged(object sender, TextChangedEventArgs e)
        {
            input = int.TryParse(NoOfDouble.Text, out noOfDoubleRm);

            if (!input || noOfDoubleRm <= 0)
            {
                ErrorRoom.Visibility = Visibility.Visible;
            }
            else
            {
                ErrorRoom.Visibility = Visibility.Hidden;
                noOfDoubleRm = int.Parse(NoOfDouble.Text);
            }
        }


        //INVOKES ALL VALIDATION METHODS
        private void Confirm_Click(object sender, RoutedEventArgs e)
        {
            Cart ct = new Cart(username);
            AddOnCart aoct = new AddOnCart();
            checkDate();
            checkFlight();
            checkPerson();
            checkRoom();

            if (rbYes.IsChecked == true)
            {
                addOnSelection = "Yes";
                subtotal = aoct.calculateSubTotal(tourPrice, noOfPeople, totalRoomPrice, totalFlightPrice); //calculate subtotal
            }
            else if (rbNo.IsChecked == true)
            {
                addOnSelection = "No";
                subtotal = ct.calculateSubTotal(tourPrice, noOfPeople, totalRoomPrice, totalFlightPrice); //calculate subtotal
            }

            
            // if no errors are visible
            if (ErrorPerson.Visibility != Visibility.Visible && ErrorDate.Visibility != Visibility.Visible && ErrorRoom.Visibility != Visibility.Visible && ErrorTicket.Visibility != Visibility.Visible && ErrorDate.Visibility != Visibility.Visible)
            {
                try
                {
                    Cart newCart = new Cart(username, tourID, tourName, tourDesc, noOfPeople, flightSelection, roomSelection, addOnSelection, noOfTickets, noOfSingleRm, noOfDoubleRm, totalFlightPrice, totalRoomPrice, subtotal, selectedStartDate.ToShortDateString(), selectedEndDate.ToShortDateString());

                    newCart.addOrUpdateCartItem(tourID);


                    MessageBox.Show("Cart item has been updated!", "Note");
                    foreach (Window window in App.Current.Windows)
                    {
                        if (!window.IsActive)
                        {
                            window.Close();
                        }
                    }

                    MainWindow mw = new MainWindow(username, color);
                    mw.Top = Window.GetWindow(this).Top;
                    mw.Left = Window.GetWindow(this).Left;

                    Window.GetWindow(this).Close();
                    CartPage cp = new CartPage(username, color);
                    mw.Main.Content = cp;
                    mw.Show();

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Checkout "+ ex.Message);
                }
               
            }
        }

        //CHECKING METHODS:

        private void checkPerson()
        {
            if (noOfPeople == 0)
            {
                ErrorPerson.Visibility = Visibility.Visible;
            }
            else
            {
                ErrorPerson.Visibility = Visibility.Hidden;
            }
        }

        private void checkDate() //check whether date is selected and whether date clashes with cart items
        {
            if (datePicker.SelectedDate == null)
            {
                ErrorDate.Text = "Please select a date";
                ErrorDate.Visibility = Visibility.Visible;
            }
            else
            {
                selectedEndDate = selectedStartDate.AddDays(tourDuration - 1);

                bool isClashing = false;
                Cart newCart = new Cart(username);
                ObservableCollection<Cart> cartItems = newCart.getCartItems();

                if (cartItems.Count != 0)
                {
                    foreach (Cart cartItem in cartItems)
                    {
                        if (tourID != cartItem.TourID) //if cart item is not the selected cart item
                        {
                            startDate = Convert.ToDateTime(cartItem.SelectedTourStartDate);
                            endDate = Convert.ToDateTime(cartItem.SelectedTourEndDate);
                            for (int i = 0; i < tourDuration; i++) //for each day of the tour
                            {
                                if (selectedStartDate.AddDays(i) >= startDate && selectedStartDate.AddDays(i) <= endDate) //if the dates of selected tour falls within the startdate and enddate of other tours
                                {
                                    ErrorDate.Text = "Date clashes with tour dates in cart";
                                    ErrorDate.Visibility = Visibility.Visible;
                                    isClashing = true;
                                }
                            }

                            if (!isClashing)
                            {
                                ErrorDate.Visibility = Visibility.Hidden;
                            }
                        }
                    }
                }
                else //if no other cart items
                {
                    ErrorDate.Visibility = Visibility.Hidden;
                }

            }
        }

        private void checkFlight()
        {
            if (CBaddFlight.IsChecked == true)
            {
                flightSelection = "Yes";

                if (NoOfFlightTickets.SelectedIndex < 0)
                {
                    ErrorTicket.Visibility = Visibility.Visible; // ask user to pick a flight
                }
                else
                {
                    ErrorTicket.Visibility = Visibility.Hidden;
                }
            }
            else // no flights
            {
                flightSelection = "No";
                noOfTickets = 0;
                ErrorTicket.Visibility = Visibility.Hidden;
            }

            Flight f = new Flight(noOfTickets, flightSelection);
            totalFlightPrice = f.totalFlightPrice(f.FlightPrice, noOfTickets); //calculate flight price 
        }

        private void checkRoom()
        {
            if (CBAddRoom.IsChecked == true)
            {
                roomSelection = "Yes";
                if (NoOfDouble.Text == "" && NoOfSingle.Text == "")
                {
                    ErrorRoom.Text = "Please enter number of rooms or uncheck the box";
                    ErrorRoom.Visibility = Visibility.Visible;
                }
                else if ((noOfDoubleRm * 2) + noOfSingleRm > noOfPeople)
                {
                    ErrorRoom.Text = "Error: Rooms selected are more than no. of people";
                    ErrorRoom.Visibility = Visibility.Visible;
                }
            }
            else
            {
                roomSelection = "No";
                noOfSingleRm = 0;
                noOfDoubleRm = 0;
                ErrorRoom.Visibility = Visibility.Hidden;
            }

            Room r = new Room(noOfSingleRm, noOfDoubleRm, roomSelection);
            totalRoomPrice = r.calculateTotalRmPrice(r.SingleRmPrice, noOfSingleRm, r.DoubleRmPrice, noOfDoubleRm);
        }


        private void Close_Click(object sender, RoutedEventArgs e)
        {
            Window.GetWindow(this).Close();
        }



    }
}
