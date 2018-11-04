using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace BookSharp.Classes
{
    class Customer
    {
        private string firstName;
        private string lastName;
        private string email;
        private string phone;
        private string dob;
        private string country;
        private string townOrCity;
        private string nationality;
        private string address;
        private string postalCd;
        private string username;
        private string password;
        private string cardType;
        private string cardNo;
        private string cardExpirationDate;
        private string cardHolderName;
        private string ccv;
        private string membership;



        public Customer() { }
        public Customer(string username) { this.username = username; }
        public Customer(string firstname, string lastname, string email, string phone, string dob, string country, string townorcity, string nationality, string address, string postalcd, string username, string password, string cardtype, string cardno, string expdate, string chname, string ccv, string membership)
        {
            this.firstName = firstname;
            this.lastName = lastname;
            this.email = email;
            this.phone = phone;
            this.dob = dob;
            this.country = country;
            this.townOrCity = townorcity;
            this.nationality = nationality;
            this.address = address;
            this.postalCd = postalcd;
            this.username = username;
            this.password = password;
            this.cardType = cardtype;
            this.cardNo = cardno;
            this.cardExpirationDate = expdate;
            this.cardHolderName = chname;
            this.ccv = ccv;
            this.membership = membership;
        }



        public string getCustomerDetail(string username, int zerobasedElementNo)  //to get Membership
        {
            Customer currentUserInfoLine = (Customer)getCustomerRow(username);

            string[] elements = { currentUserInfoLine.FirstName, currentUserInfoLine.LastName, currentUserInfoLine.Email, currentUserInfoLine.Phone, currentUserInfoLine.DOB, currentUserInfoLine.Country, currentUserInfoLine.TownOrCity, currentUserInfoLine.Nationality, currentUserInfoLine.CustAddress, currentUserInfoLine.PostalCd, currentUserInfoLine.Username, currentUserInfoLine.CustPassword, currentUserInfoLine.CardType, currentUserInfoLine.CardNo, currentUserInfoLine.CardExpirationDate, currentUserInfoLine.CardHolderName, currentUserInfoLine.CCV, currentUserInfoLine.Membership };

            return elements[zerobasedElementNo];
        }

        public virtual double calculateFinalPrice(double totalprice, double subsidy) //to be overridden by Premium Customer
        {
            return totalprice;
        }

        ObservableCollection<Customer> custCollection;
        dbBooking db = new dbBooking();


        //get an observableCollection of Customer objects to retrieve data for user
        public ObservableCollection<Customer> populateCustomerDetails()
        {

            custCollection = new ObservableCollection<Customer>();

            DataTable table = db.getDataTable("select * from tblCustomer");

            int size = table.Rows.Count;
            for (int i = 0; i < size; i++)
            {
                DataRow row = table.Rows[i];
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

                Customer cust = new Customer(FirstName, LastName, Email, Phone, DOB, Country, TownOrCity, Nationality, CustAddress, PostalCd, Username, CustPassword, CardType, CardNo, CardExpirationDate, CardHolderName, CCV, Membership); //create object
                custCollection.Add(cust);
            }

            return custCollection;

        }


        //get Customer object based on username
        public virtual Object getCustomerRow(string username)
        {
            Customer currentUserInfoLine = new Customer();

            ObservableCollection<Customer> customerLines = populateCustomerDetails();
            foreach (Customer line in customerLines)
            {
                if (line.Username == username)
                {
                    currentUserInfoLine = line;
                }
            }
            return currentUserInfoLine;
        }




        public string FirstName
        {
            get { return this.firstName; }
            set { this.firstName = value; }
        }

        public string LastName
        {
            get { return this.lastName; }
            set { this.lastName = value; }
        }
        public string Email
        {
            get { return this.email; }
            set { this.email = value; }
        }
        public string Phone
        {
            get { return this.phone; }
            set { this.phone = value; }
        }
        public string DOB
        {
            get { return this.dob; }
            set { this.dob = value; }
        }
        public string Country
        {
            get { return this.country; }
            set { this.country = value; }
        }
        public string TownOrCity
        {
            get { return this.townOrCity; }
            set { this.townOrCity = value; }
        }
        public string Nationality
        {
            get { return this.nationality; }
            set { this.nationality = value; }
        }
        public string CustAddress
        {
            get { return this.address; }
            set { this.address = value; }
        }
        public string PostalCd
        {
            get { return this.postalCd; }
            set { this.postalCd = value; }
        }
        public string Username
        {
            get { return this.username; }
            set { this.username = value; }
        }
        public string CustPassword
        {
            get { return this.password; }
            set { this.password = value; }
        }
        public string CardType
        {
            get { return this.cardType; }
            set { this.cardType = value; }
        }
        public string CardNo
        {
            get { return this.cardNo; }
            set { this.cardNo = value; }
        }
        public string CardExpirationDate
        {
            get { return this.cardExpirationDate; }
            set { this.cardExpirationDate = value; }
        }
        public string CardHolderName
        {
            get { return this.cardHolderName; }
            set { this.cardHolderName = value; }
        }
        public string CCV
        {
            get { return this.ccv; }
            set { this.ccv = value; }
        }
        public string Membership
        {
            get { return this.membership; }
            set { this.membership = value; }
        }


    }
}
