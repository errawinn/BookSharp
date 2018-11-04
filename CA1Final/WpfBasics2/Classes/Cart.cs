using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace BookSharp.Classes
{
    class Cart
    {
        private string username;
        private string tourID;
        private string tourName;
        private string tourDesc;
        private int peopleQty;
        private string flightSelection;
        private string roomSelection;
        private string addOnSelection;
        private int ticketQty, 
                    singleRmQty, 
                    doubleRmQty;

        private double calculatedFlightPrice;
        private double calculatedRoomPrice;

        private double subtotal;
        private string selectedTourStartDate;
        private string selectedTourEndDate;

       
        
        DataTable cartTable;
        dbBooking db = new dbBooking();
        Flight f = new Flight();

        public Cart() { } //default constructor

        public Cart(string username)
        {
            this.username = username;
        }

    
        public Cart(string username, string tourID, string tourName, string tourDesc, int peopleQty, string flightSelection, string roomSelection, string addOnSelection, int ticketQty, int singleRmQty, int doubleRmQty, double calculatedFlightPrice, double calculatedRoomPrice, double subtotal, string selectedTourStartDate, string selectedTourEndDate)
        {
            this.username = username;
            this.tourID = tourID;
            this.tourDesc = tourDesc;
            this.tourName = tourName;
            this.peopleQty = peopleQty;
            this.flightSelection = flightSelection;
            this.roomSelection = roomSelection;
            this.addOnSelection = addOnSelection;
            this.ticketQty = ticketQty;
            this.singleRmQty = singleRmQty;
            this.doubleRmQty = doubleRmQty;
            this.calculatedFlightPrice = calculatedFlightPrice;
            this.calculatedRoomPrice = calculatedRoomPrice;
            this.subtotal = subtotal;
            this.selectedTourStartDate = selectedTourStartDate;
            this.selectedTourEndDate = selectedTourEndDate;

        }


        //Gets an ObservableCollection of Cart Objects from database for the specified Customer --> to display in Cart page
        public ObservableCollection<Cart> getCartItems()
        {
          
            ObservableCollection<Cart> cartItems = new ObservableCollection<Cart>();
        
            cartTable = db.getDataTable("SELECT * FROM tblCart WHERE Username = '" + username + "'");

            int size = cartTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = cartTable.Rows[i];
                this.Username = row["Username"].ToString();
                this.tourID = row["TourID"].ToString();
                this.tourName = row["TourName"].ToString();
                this.tourDesc = row["TourDesc"].ToString();
                this.peopleQty = int.Parse(row["PeopleQty"].ToString());
                this.flightSelection = row["FlightSelection"].ToString();
                this.roomSelection = row["RoomSelection"].ToString();
                this.addOnSelection = row["AddOnSelection"].ToString();
                this.ticketQty = int.Parse(row["TicketQty"].ToString());
                this.singleRmQty = int.Parse(row["SingleRmQty"].ToString());
                this.doubleRmQty = int.Parse(row["DoubleRmQty"].ToString());

                this.calculatedFlightPrice = double.Parse(row["CalculatedFlightPrice"].ToString());
                this.calculatedRoomPrice = double.Parse(row["CalculatedRoomPrice"].ToString());

                this.subtotal = double.Parse(row["Subtotal"].ToString());
                this.selectedTourStartDate = row["SelectedTourStartDate"].ToString();
                this.selectedTourEndDate = row["SelectedTourEndDate"].ToString();


                Cart cartItem = new Cart(Username, TourID, TourName, TourDesc, PeopleQty, FlightSelection, RoomSelection, AddOnSelection, TicketQty, SingleRmQty, DoubleRmQty, CalculatedFlightPrice, CalculatedRoomPrice, Subtotal, SelectedTourStartDate, SelectedTourEndDate);

                cartItems.Add(cartItem);
            }

            return cartItems;

        }


        //calculates subtotal for cart item
        public virtual double calculateSubTotal(double tourPrice, int qty, double totalRmPrice, double totalFlightPrice) //overridden by addon cart
        {
            double subTotal = (tourPrice * qty) + totalFlightPrice + totalRmPrice;
            return subTotal;
        }


        //calculates total cost for entire cart
        public double calculateTotal()
        {
            double total = 0;
            Cart ct = new Cart(username);
            ObservableCollection<Cart> cartItems = ct.getCartItems();
            foreach (Cart cartItem in cartItems)
            {
                total += cartItem.Subtotal;
            }
            Customer cust = new Customer();
            Customer customer = (Customer)cust.getCustomerRow(username);
            if (customer.Membership == "Premium")
            {
                PremiumCustomer pc = new PremiumCustomer(username);
                pc = (PremiumCustomer)pc.getCustomerRow(username);
                total = pc.calculateFinalPrice(total, pc.Subsidy);
            }

            return total;
        }


        // 1. Adds cart object to cart if tourID is not in user's cart 
        // 2. Updates cart object if tourID is already in user's cart
        public void addOrUpdateCartItem(string tourID) //for cartselection pages
        {
            Boolean alreadyInCart = false;
            List<Object> cartArray = new List<object>();

            cartArray.Add(Username);
            cartArray.Add(TourID);
            cartArray.Add(TourName);
            cartArray.Add(TourDesc);
            cartArray.Add(PeopleQty);
            cartArray.Add(FlightSelection);
            cartArray.Add(RoomSelection);
            cartArray.Add(AddOnSelection);
            cartArray.Add(TicketQty);
            cartArray.Add(SingleRmQty);
            cartArray.Add(DoubleRmQty);
            cartArray.Add(CalculatedFlightPrice);
            cartArray.Add(CalculatedRoomPrice);
            cartArray.Add(Subtotal);
            cartArray.Add(SelectedTourStartDate);
            cartArray.Add(SelectedTourEndDate);

            ObservableCollection<Cart> cartItems = getCartItems();
     
               foreach(Cart cart in cartItems)
            {
                if (cart.TourID == tourID)
                {
                    alreadyInCart = true;
                    db.updateRow(cartArray, "tblCart", " WHERE Username = '" + username + "' AND TourID = '" + tourID + "'", cart);
                }
            }

            if (!alreadyInCart)
            {
                db.addRow(cartArray, "tblCart");
            }

        }


        //Deletes all of user's cart items from the database --> when they log out or close window
        public void deleteAllCartItems() 
        {
            try
            {              
                List<Object> values = new List<Object>();
                List<string> names = new List<string>();
                values.Add(username);
                names.Add("Username");

                db.deleteRow("tblCart", values, names);  //delete from table
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }




        public string Username
        {
            get { return username; }
            set { this.username = value; }
        }

        public string TourID
        {
            get { return tourID; }
            set { this.tourID = value; }
        }

        public string TourName
        {
            get { return tourName; }
            set { this.tourName = value; }
        }

        public string TourDesc
        {
            get { return tourDesc; }
            set { this.tourDesc = value; }
        }

        public int PeopleQty
        {
            get { return peopleQty; }
            set { this.peopleQty = value; }
        }

        public string FlightSelection
        {
            get { return flightSelection; }
            set { this.flightSelection = value; }
        }

        public string RoomSelection
        {
            get { return roomSelection; }
            set { this.roomSelection = value; }
        }

        public string AddOnSelection
        {
            get { return addOnSelection; }
            set { this.addOnSelection = value; }
        }

        public int TicketQty
        {
            get { return ticketQty; }
            set { this.ticketQty = value; }
        }

        public int SingleRmQty
        {
            get { return singleRmQty; }
            set { this.singleRmQty = value; }
        }

        public int DoubleRmQty
        {
            get { return doubleRmQty; }
            set { this.doubleRmQty = value; }
        }

        public double CalculatedFlightPrice
        {
            get { return calculatedFlightPrice; }
            set { this.calculatedFlightPrice = value; }
        }

        public double CalculatedRoomPrice
        {
            get { return calculatedRoomPrice; }
            set { this.calculatedRoomPrice = value; }
        }

        public double Subtotal
        {
            get { return subtotal; }
            set { this.subtotal = value; }
        }

        public string SelectedTourStartDate
        {
            get { return selectedTourStartDate; }
            set { this.selectedTourStartDate = value; }
        }

        public string SelectedTourEndDate
        {
            get { return selectedTourEndDate; }
            set { this.selectedTourEndDate = value; }
        }
    }
}
