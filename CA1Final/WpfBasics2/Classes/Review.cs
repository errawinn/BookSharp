using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace BookSharp.Classes
{

    class Review
    {
        private string tourID;
        private string reviewName;
        private string reviewMessage;
        private DateTime reviewDateTime;
        dbBooking db = new dbBooking();

        public Review() { }
        public Review(string tourID) { this.tourID = tourID; }
        public Review(string tourID, string reviewName, string reviewMessage, DateTime reviewDateTime)
        {
            this.tourID = tourID;
            this.reviewName = reviewName;
            this.reviewMessage = reviewMessage;
            this.reviewDateTime = reviewDateTime;
        }

        public string TourID
        {
            get { return this.tourID; }
            set { this.tourID = value; }
        }
        public string ReviewName
        {
            get { return this.reviewName; }
            set { this.reviewName = value; }
        }
        public string ReviewMessage
        {
            get { return this.reviewMessage; }
            set { this.reviewMessage = value; }
        }
        public DateTime ReviewDateTime
        {
            get { return this.reviewDateTime; }
            set { this.reviewDateTime = value; }
        }


        //STORES USER REVIEW in DATABASE
        public void storeReview()
        {
            List<Object> addArray = new List<object>();
            addArray.Add(tourID);
            addArray.Add(reviewName);
            addArray.Add(reviewMessage);
            addArray.Add(Convert.ToString(reviewDateTime));
            db.addRow(addArray, "tblReviews");


        }


        //GETS an ARRAYLIST of REVIEW OBJECTS for DISPLAY in tour details page
        public ArrayList getReviewsList()
        {
            ArrayList tourReviewsList = new ArrayList();

            DataTable reviewTable = db.getDataTable("Select * from tblReviews");

            int size = reviewTable.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = reviewTable.Rows[i];
                if (TourID == row["TourID"].ToString())
                {
                    string tourID = row["TourID"].ToString();
                    string reviewName = row["ReviewName"].ToString();
                    string reviewMessage = row["ReviewMessage"].ToString();
                    DateTime reviewDateTime = DateTime.Parse(row["ReviewDateTime"].ToString());

                    Review review = new Review(tourID, reviewName, reviewMessage, reviewDateTime);
                    tourReviewsList.Add(review);
                }
            }
            return tourReviewsList;
        }
    }
}
