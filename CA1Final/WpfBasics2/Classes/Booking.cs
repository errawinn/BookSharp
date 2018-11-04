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
    class Booking
    {

        private string bookingID;
        private DateTime bookingDateTime = DateTime.Now;
        private string bookingDate;
        private double totalCost;
        private string bookTourID;
        private string bookTourDesc;
        private int bookTourQty;
        private int bookPplQty;
        dbBooking db = new dbBooking();
        public string BookingID
        {
            get { return bookingID; }
            set { this.bookingID = value; }
        }
        public DateTime BookingDateTime
        {
            get { return bookingDateTime; }
            set { this.bookingDateTime = value; }
        }
        public string BookingDate
        {
            get { return bookingDate; }
            set { this.bookingDate = value; }
        }

        public string BookTourID
        {
            get { return bookTourID; }
            set { this.bookTourID = value; }
        }
        public string BookTourDesc
        {
            get { return bookTourDesc; }
            set { this.bookTourDesc = value; }
        }
        public int BookTourQty
        {
            get { return bookTourQty; }
            set { this.bookTourQty = value; }
        }
        public int BookPplQty
        {
            get { return bookPplQty; }
            set { this.bookPplQty = value; }
        }

        public double TotalCost
        {
            get { return totalCost; }
            set { this.totalCost = value; }
        }
        public Booking()
        {

        }
        public Booking(string bookingID, string bookingDate, string bookingTourID, string bookingTourDesc)
        {
            this.bookingID = bookingID;
            this.bookingDate = bookingDate;
            this.bookTourID = bookingTourID;
            this.bookTourDesc = bookingTourDesc;
        }

        public Booking(string bookTourID, string bookTourDesc, int bookingTourQty, int bookingPplQty)
        {
            this.bookTourID = bookTourID;
            this.bookTourDesc = bookTourDesc;
            this.bookTourQty = bookingTourQty;
            this.bookPplQty = bookingPplQty;
        }


        //FOR CART PAGE

        //Adds cart information from cart to booking table in database
        public string generateReceipt(string username)
        {
            string BookingDate = bookingDateTime.ToShortDateString();
            string BookingTime = bookingDateTime.ToShortTimeString();
            Cart ct = new Cart(username);
            List<Object> cartArray = new List<object>();
            ObservableCollection<Cart> cart = ct.getCartItems();

            DataTable bookingTable = db.getDataTable("select * from tblBooking");
            List<string> bookIDs = new List<string>();

            int size = bookingTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = bookingTable.Rows[i];
                string bookID = row["BookingID"].ToString();
                bookIDs.Add(bookID);
            }
            int distinctRows = (from x in bookIDs
                                select x).Distinct().Count();
            if (distinctRows != 0)
            {
                bookingID = string.Format("B" + "{0:D8}", (distinctRows + 1));
            }
            else
            {
                bookingID = "B00000001";
            }

            foreach (Cart cartItem in cart)
            {
                cartArray.Add(BookingID);
                cartArray.Add(BookingDate);
                cartArray.Add(BookingTime);
                cartArray.Add(cartItem.Username);
                cartArray.Add(cartItem.TourID);
                cartArray.Add(cartItem.TourName);
                cartArray.Add(cartItem.TourDesc);
                cartArray.Add(cartItem.PeopleQty);
                cartArray.Add(cartItem.FlightSelection);
                cartArray.Add(cartItem.RoomSelection);
                cartArray.Add(cartItem.AddOnSelection);
                cartArray.Add(cartItem.TicketQty);
                cartArray.Add(cartItem.SingleRmQty);
                cartArray.Add(cartItem.DoubleRmQty);
                cartArray.Add(cartItem.CalculatedFlightPrice);
                cartArray.Add(cartItem.CalculatedRoomPrice);
                cartArray.Add(cartItem.Subtotal);
                cartArray.Add(cartItem.SelectedTourStartDate);
                cartArray.Add(cartItem.SelectedTourEndDate);

                db.addRow(cartArray, "tblBooking");
                cartArray.Clear();
            }

            ct.deleteAllCartItems();
            return BookingID;
        }



        //FOR SUMMARY REPORT:

        //get ObservableCollection of bookings for popup window count
        public ObservableCollection<string> getWeeklyBookingCounts()
        {
            ObservableCollection<string> bookings = new ObservableCollection<string>();
            DateTime date = DateTime.Today;

            int offset = date.DayOfWeek - DayOfWeek.Monday;
            offset = (offset < 0) ? 6 : offset;
            DateTime start = date.AddDays(-offset);
            DateTime end = start.AddDays(6);
            string command = "select * from tblBooking order by BookingID asc";
            DataTable bookingTable = db.getDataTable(command);

            int size = bookingTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = bookingTable.Rows[i];
                string bookID = row["BookingID"].ToString();
                string bookDate = row["BookingDate"].ToString();
                if (DateTime.Compare(start, DateTime.Parse(bookDate)) <= 0 && DateTime.Compare(end, DateTime.Parse(bookDate)) >= 0)
                {
                    bookings.Add(bookID);
                }
            }
            return bookings;
        }

        //get ObservableCollection of bookings made this week
        public ObservableCollection<Booking> getWeeklyBooking()
        {
            ObservableCollection<Booking> bookings = new ObservableCollection<Booking>();
            DateTime date = DateTime.Today;

            int offset = date.DayOfWeek - DayOfWeek.Monday;
            offset = (offset < 0) ? 6 : offset;
            DateTime start = date.AddDays(-offset);
            DateTime end = start.AddDays(6);
            string command = "select * from tblBooking order by BookingID asc";
            DataTable bookingTable = db.getDataTable(command);

            int size = bookingTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = bookingTable.Rows[i];
                string bookID = row["BookingID"].ToString();
                string bookDate = row["BookingDate"].ToString();
                string bookTourID = row["TourID"].ToString();
                string bookTourDesc = row["TourDesc"].ToString();
                if (DateTime.Compare(start, DateTime.Parse(bookDate)) <= 0 && DateTime.Compare(end, DateTime.Parse(bookDate)) >= 0)
                {
                    Booking b = new Booking(bookID, bookDate, bookTourID, bookTourDesc);
                    bookings.Add(b);
                }
            }
            return bookings;
        }

        //get ObservableCollection of bookings made this month
        public ObservableCollection<Booking> getMonthlyBooking()
        {
            ObservableCollection<Booking> bookings = new ObservableCollection<Booking>();


            DateTime now = DateTime.Now;
            DateTime start = new DateTime(now.Year, now.Month, 1);
            DateTime end = start.AddMonths(1).AddDays(-1);
            string command = "select * from tblBooking order by BookingID asc";
            DataTable bookingTable = db.getDataTable(command);

            int size = bookingTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = bookingTable.Rows[i];
                string bookID = row["BookingID"].ToString();
                string bookDate = row["BookingDate"].ToString();
                string bookTourID = row["TourID"].ToString();
                string bookTourDesc = row["TourDesc"].ToString();
                if (DateTime.Compare(start, DateTime.Parse(bookDate)) <= 0 && DateTime.Compare(end, DateTime.Parse(bookDate)) >= 0)
                {
                    Booking b = new Booking(bookID, bookDate, bookTourID, bookTourDesc);
                    bookings.Add(b);
                }
            }
            return bookings;
        }


        //get ObservableCollection of top 5 bookings of all time
        public ObservableCollection<Booking> getTop5Booking()
        {
            ObservableCollection<Booking> bookings = new ObservableCollection<Booking>();
            string command = "select TOP 5 TourID, TourDesc, count(TourID) 'Count', sum(PeopleQty) 'People Qty' from tblBooking group by TourID, TourDesc order by count(TourID) desc, sum(PeopleQty) desc";
            DataTable bookingTable = db.getDataTable(command);

            int size = bookingTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = bookingTable.Rows[i];
                string bookTourID = row["TourID"].ToString();
                string bookTourDesc = row["TourDesc"].ToString();
                int bookTourQty = Convert.ToInt32(row["Count"].ToString());
                int bookPplQty = Convert.ToInt32(row["People Qty"].ToString());
                Booking b = new Booking(bookTourID, bookTourDesc, bookTourQty, bookPplQty);
                bookings.Add(b);
            }
            return bookings;

        }

        //get ObservableCollection of bookings per tour this month
        public ObservableCollection<Booking> getNoOfBookingPerMonth()
        {
            DateTime now = DateTime.Now;
            string start = (new DateTime(now.Year, now.Month, 1)).ToShortDateString();
            string end = (new DateTime(now.Year, now.Month, 1).AddMonths(1).AddDays(-1)).ToShortDateString();

            ObservableCollection<Booking> bookings = new ObservableCollection<Booking>();
            string command = "select TourID, TourDesc, count(TourID) 'Count', sum(PeopleQty) 'People Qty' from tblBooking  where convert(date, BookingDate, 103) between convert(date, '" + start + "', 103) and convert(date, '" + end + "', 103) group by TourID, TourDesc order by count(TourID) desc, sum(PeopleQty) desc";
            DataTable bookingTable = db.getDataTable(command);

            int size = bookingTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = bookingTable.Rows[i];
                string bookTourID = row["TourID"].ToString();
                string bookTourDesc = row["TourDesc"].ToString();
                int bookTourQty = Convert.ToInt32(row["Count"].ToString());
                int bookPplQty = Convert.ToInt32(row["People Qty"].ToString());
                Booking b = new Booking(bookTourID, bookTourDesc, bookTourQty, bookPplQty);
                bookings.Add(b);
            }
            return bookings;

        }

        //get ObservableCollection of bookings per tour made this week
        public ObservableCollection<Booking> getNoOfBookingPerWeek()
        {
            DateTime date = DateTime.Today;

            int offset = date.DayOfWeek - DayOfWeek.Monday;
            offset = (offset < 0) ? 6 : offset;
            string start = date.AddDays(-offset).ToShortDateString();
            string end = date.AddDays(-offset).AddDays(6).ToShortDateString();

            ObservableCollection<Booking> bookings = new ObservableCollection<Booking>();
            string command = "select TourID, TourDesc, count(TourID) 'Count', sum(PeopleQty) 'People Qty' from tblBooking  where convert(date, BookingDate, 103) between convert(date, '" + start + "', 103) and convert(date, '" + end + "', 103) group by TourID, TourDesc order by count(TourID) desc, sum(PeopleQty) desc";
            DataTable bookingTable = db.getDataTable(command);

            int size = bookingTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = bookingTable.Rows[i];
                string bookTourID = row["TourID"].ToString();
                string bookTourDesc = row["TourDesc"].ToString();
                int bookTourQty = Convert.ToInt32(row["Count"].ToString());
                int bookPplQty = Convert.ToInt32(row["People Qty"].ToString());
                Booking b = new Booking(bookTourID, bookTourDesc, bookTourQty, bookPplQty);
                bookings.Add(b);
            }
            return bookings;

        }

    }

}
