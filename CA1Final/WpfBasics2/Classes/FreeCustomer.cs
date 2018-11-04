using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace BookSharp.Classes
{
    class FreeCustomer : Customer
    {
        private string expirydate;
        dbBooking db = new dbBooking();
        int Subsidy = 0;
        public FreeCustomer() { }
        public FreeCustomer(string username) : base(username) { }

        public FreeCustomer(string firstname, string lastname, string email, string phone, string dob, string country, string townorcity, string nationality, string address, string postalcd, string username, string password, string cardtype, string cardno, string expdate, string chname, string ccv, string membership, string expirydate) : base(firstname, lastname, email, phone, dob, country, townorcity, nationality, address, postalcd, username, password, cardtype, cardno, expdate, chname, ccv, membership)
        {
            this.expirydate = expirydate;
        }


        public string ExpiryDate
        {
            get { return this.expirydate; }
            set { this.expirydate = value; }
        }
        ObservableCollection<FreeCustomer> custFreeCollection;



        public ObservableCollection<FreeCustomer> populateFreeCustomerDetails()
        {
            custFreeCollection = new ObservableCollection<FreeCustomer>();

            DataTable table = db.getDataTable("select * from tblCustomer WHERE Membership = 'Free'");

            int size = table.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = table.Rows[i];
                if (row["Membership"].ToString() == "Free")
                {

                    FirstName = row["FirstName"].ToString();
                    LastName = row["LastName"].ToString();
                    Email = row["Email"].ToString();
                    Phone = row["Phone"].ToString();
                    DOB = row["DOB"].ToString();
                    Country = row["Country"].ToString();
                    TownOrCity = row["TownOrCity"].ToString();
                    Nationality = row["Nationality"].ToString();
                    CustAddress = row["CustAddress"].ToString();
                    PostalCd = row["PostalCd"].ToString();
                    Username = row["Username"].ToString();
                    CustPassword = row["CustPassword"].ToString();
                    CardType = row["CardType"].ToString();
                    CardNo = row["CardNo"].ToString();
                    CardExpirationDate = row["CardExpirationDate"].ToString();
                    CardHolderName = row["CardHolderName"].ToString();
                    CCV = row["ccv"].ToString();
                    Membership = row["Membership"].ToString();
                    try
                    {
                        ExpiryDate = row["ExpiryDate"].ToString();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }

                    FreeCustomer fCust = new FreeCustomer(FirstName, LastName, Email, Phone, DOB, Country, TownOrCity, Nationality, CustAddress, PostalCd, Username, CustPassword, CardType, CardNo, CardExpirationDate, CardHolderName, CCV, Membership, ExpiryDate); //create object
                    custFreeCollection.Add(fCust);

                }

            }

            return custFreeCollection;
        }

        public void addNewCustomer()
        {

            int subsidy = 1;
            List<Object> addArray = new List<object>();

            addArray.Add(FirstName);
            addArray.Add(LastName);
            addArray.Add(Email);
            addArray.Add(int.Parse(Phone));
            addArray.Add(DOB);
            addArray.Add(Country);
            addArray.Add(TownOrCity);
            addArray.Add(Nationality);
            addArray.Add(CustAddress);
            addArray.Add(PostalCd);
            addArray.Add(Username);
            addArray.Add(CustPassword);
            addArray.Add(CardType);
            addArray.Add(CardNo);
            addArray.Add(CardExpirationDate);
            addArray.Add(CardHolderName);
            addArray.Add(CCV);
            addArray.Add(Membership);
            addArray.Add(ExpiryDate.ToString());
            addArray.Add(subsidy);
            db.addRow(addArray, "tblCustomer");

        }

        public override Object getCustomerRow(string username)
        {
            FreeCustomer currentUserInfoLine = new FreeCustomer();

            ObservableCollection<FreeCustomer> customerLines = populateFreeCustomerDetails();
            foreach (FreeCustomer line in customerLines)
            {
                if (line.Username == username)
                {
                    currentUserInfoLine = line;
                }
            }
            return currentUserInfoLine;
        }

        public void updateFreeCustDB(string firstname, string lastname, string email, string phone, string dob, string country, string townorcity, string nationality, string address, string postalcd, string username, string password, string cardtype, string cardno, string expdate, string chname, string ccv, string membership, string expirydate)
        {

            List<Object> updateArray = new List<object>();
            updateArray.Add(ExpiryDate);
            updateArray.Add(FirstName);
            updateArray.Add(LastName);
            updateArray.Add(Email);
            updateArray.Add(Phone);
            updateArray.Add(Convert.ToDateTime(DOB));
            updateArray.Add(Country);
            updateArray.Add(TownOrCity);
            updateArray.Add(Nationality);
            updateArray.Add(CustAddress);
            updateArray.Add(PostalCd);
            updateArray.Add(Username);
            updateArray.Add(CustPassword);
            updateArray.Add(CardType);
            updateArray.Add(CardNo);
            updateArray.Add(CardExpirationDate);
            updateArray.Add(CardHolderName);
            updateArray.Add(CCV);
            updateArray.Add(Membership);
            updateArray.Add(DBNull.Value);

            FreeCustomer f = new FreeCustomer();
            db.updateRow(updateArray, "tblCustomer", " WHERE Username = '" + Username + "'", f);

        }


        public void deleteExpiredCustomers()
        {
            ObservableCollection<FreeCustomer> collection = populateFreeCustomerDetails();
            try
            {
                if (custFreeCollection.Count != 0)
                {
                    foreach (var freecust in custFreeCollection)
                    {
                        if (freecust.Membership == "Free")
                        {
                            if (DateTime.Compare(DateTime.Now, DateTime.Parse(freecust.ExpiryDate)) >= 0)
                            {
                                List<Object> values = new List<Object>();
                                List<string> names = new List<string>();                     
                                values.Add(freecust.Username);              
                                names.Add("Username");
                                db.deleteRow("tblCustomer", values, names);  //delete from table

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

    }
}
