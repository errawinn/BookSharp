using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookSharp.Classes
{
    public class Tour
    {
        private string tourID;
        private string tourName;
        private string tourDesc;
        private double tourPrice;
        private string tourStartDate;
        private string tourEndDate;
        private int tourDuration;
        private string tourImageSource;
        private string tourCountry;
        private string tourRegion;
        private string tourSummary;
        private string tourItinerary;

        public Tour() //default constructor
        {

        }

        public Tour(string tourID, string tourName, string tourDesc, double tourPrice, string tourStartDate, string tourEndDate, int tourDuration, string tourImageSource, string tourCountry, string tourRegion, string tourSummary, string tourItinerary)
        {
            this.tourID = tourID;
            this.tourName = tourName;
            this.tourDesc = tourDesc;
            this.tourPrice = tourPrice;
            this.tourStartDate = tourStartDate;
            this.tourEndDate = tourEndDate;
            this.tourDuration = tourDuration;
            this.tourImageSource = tourImageSource;
            this.tourCountry = tourCountry;
            this.tourRegion = tourRegion;
            this.tourSummary = tourSummary;
            this.tourItinerary = tourItinerary;
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
        public double TourPrice
        {
            get { return tourPrice; }
            set { this.tourPrice = value; }
        }
        public string TourStartDate
        {
            get { return tourStartDate; }
            set { this.tourStartDate = value; }
        }
        public string TourEndDate
        {
            get { return tourEndDate; }
            set { this.tourEndDate = value; }
        }
        public int TourDuration
        {
            get { return tourDuration; }
            set { this.tourDuration = value; }
        }
        public string TourImageSource
        {
            get { return tourImageSource; }
            set { this.tourImageSource = value; }
        }

        public string TourCountry
        {
            get { return tourCountry; }
            set { this.tourCountry = value; }
        }

        public string TourRegion
        {
            get { return tourRegion; }
            set { this.tourRegion = value; }
        }

        public string TourSummary
        {
            get { return tourSummary; }
            set { this.tourSummary = value; }
        }

        public string TourItinerary
        {
            get { return tourItinerary; }
            set { this.tourItinerary = value; }
        }
    }
}
