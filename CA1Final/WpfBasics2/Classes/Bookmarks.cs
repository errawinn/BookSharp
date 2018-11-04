using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using BookSharp.Pages;

namespace BookSharp.Classes
{
    public class Bookmarks
    {

        PremiumCustomer pc = new PremiumCustomer();
        FreeCustomer fc = new FreeCustomer();
        dbBooking db = new dbBooking();
        TourCollection tc = new TourCollection();

        private string username;
        public string Username
        {
            get { return username; }
            set { this.username = value; }
        }

        public Bookmarks(string username)
        {
            this.username = username;
        }

        //gets user's booksmarks from previous session for display
        public ObservableCollection<Tour> getBookmarks()
        {
            ObservableCollection<Tour> tours = tc.getTours();
            ObservableCollection<Tour> bookmarkTours = new ObservableCollection<Tour>();
            List<string> bookmarks = new List<string>();
            DataTable table = db.getDataTable("select * from tblBookmarks");

            int size = table.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = table.Rows[i];
                if (row["Username"].ToString() == username)
                {
                    bookmarks.Add(row["TourID"].ToString());
                }
            }

            bookmarks.Distinct();

            foreach (string tourID in bookmarks)
            {
                foreach (Tour tour in tours)
                {
                    if (tour.TourID == tourID)
                    {
                        bookmarkTours.Add(new Tour(tour.TourID, tour.TourName, tour.TourDesc, tour.TourPrice, tour.TourStartDate, tour.TourEndDate, tour.TourDuration, tour.TourImageSource
                            , tour.TourCountry, tour.TourRegion, tour.TourSummary, tour.TourItinerary));
                    }
                }
            }

            return bookmarkTours;

        }



        //for tour details page button - check if already in bookmarks and adds to database if not
        public void addBookmark(string tourID) 
        {
            bool isInBookmarks = false;

            ObservableCollection<Tour> bookmarkTours = getBookmarks();


            foreach (Tour tour in bookmarkTours)
            {
                if (tour.TourID == tourID)
                {
                    MessageBox.Show("You have already added this to your bookmarks!", "Note");
                    isInBookmarks = true;
                }
            }


            if (!(isInBookmarks))
            {
                List<Object> bookmark = new List<object>();
                bookmark.Add(username);
                bookmark.Add(tourID);
                db.addRow(bookmark, "tblBookmarks");
                MessageBox.Show("Added to bookmarks!", "Note");
            }
        }
    }
}
