using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.IO;
using System.Collections;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace BookSharp.Classes
{
    public class TourCollection
    {

        dbBooking db = new dbBooking();

        //GETS an ObservableCollection of TOUR OBJECTS for DISPLAY purposes in TOUR CATALOGUE
        public ObservableCollection<Tour> getTours()
        {
            ObservableCollection<Tour> tourCollection = new ObservableCollection<Tour>();

            DataTable table = db.getDataTable("select * from tblTour");

            int size = table.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = table.Rows[i];
                string tourID = row["TourID"].ToString();
                string tourName = row["TourName"].ToString();
                string tourDesc = row["TourDesc"].ToString();
                double tourPrice = double.Parse(row["TourPrice"].ToString(), NumberStyles.Currency);
                string tourStartDate = (DateTime.Parse(row["TourStartDate"].ToString())).ToShortDateString();
                string tourEndDate =(DateTime.Parse(row["TourEndDate"].ToString())).ToShortDateString();
                int tourDuration = int.Parse(row["TourDuration"].ToString());
                string tourImageSource = row["TourImageSource"].ToString();
                string tourCountry = row["TourCountry"].ToString();
                string tourRegion = row["TourRegion"].ToString();
                string tourSummary = row["TourSummary"].ToString();
                string tourItinerary = row["TourItinerary"].ToString();

                Tour tour = new Tour(tourID, tourName, tourDesc, tourPrice, tourStartDate, tourEndDate, tourDuration, tourImageSource, tourCountry, tourRegion,tourSummary, tourItinerary); //create object
                tourCollection.Add(tour);
            }

            return tourCollection;

        }


        //GETS a TOUR OBJECT based on it's tourID
        public Tour getTour(string tourID)
        {
            ObservableCollection<Tour> tours = getTours();
       
            Tour tourToReturn = null;
            foreach (Tour tour in tours)
            {
                if (tour.TourID == tourID)
                {
                    tourToReturn = tour;
                }
          
            }
            return tourToReturn;
        }


    }

}
