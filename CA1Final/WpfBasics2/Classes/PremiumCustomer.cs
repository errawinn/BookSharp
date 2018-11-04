using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookSharp.Classes
{
        class PremiumCustomer : Customer
        {
            private double subsidy;
            dbBooking db = new dbBooking();

            public PremiumCustomer() { }
            public PremiumCustomer(string username) : base(username) { }
            public PremiumCustomer(string firstname, string lastname, string email, string phone, string dob, string country, string townorcity, string nationality, string address, string postalcd, string username, string password, string cardtype, string cardno, string expdate, string chname, string ccv, string membership, double subsidy) : base(firstname, lastname, email, phone, dob, country, townorcity, nationality, address, postalcd, username, password, cardtype, cardno, expdate, chname, ccv, membership)
            {
                this.subsidy = subsidy;
            }



            public override double calculateFinalPrice(double totalprice, double subsidy)
            {
                return totalprice * Subsidy;
            }

            ObservableCollection<PremiumCustomer> custPremiumCollection;

            public ObservableCollection<PremiumCustomer> populatePremiumCustomerDetails()
            {
                custPremiumCollection = new ObservableCollection<PremiumCustomer>();

                DataTable table = db.getDataTable("select * from tblCustomer where Membership = 'Premium' ");

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
                    Subsidy = Convert.ToDouble(row["Subsidy"]);

                    PremiumCustomer pCust = new PremiumCustomer(FirstName, LastName, Email, Phone, DOB, Country, TownOrCity, Nationality, CustAddress, PostalCd, Username, CustPassword, CardType, CardNo, CardExpirationDate, CardHolderName, CCV, Membership, Subsidy); //create object
                    custPremiumCollection.Add(pCust);
                }

                return custPremiumCollection;
            }

            public void addNewCustomer()
            {
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
                addArray.Add(DBNull.Value);
                addArray.Add(Subsidy);
                db.addRow(addArray, "tblCustomer");

            }

            public override Object getCustomerRow(string username)
            {
                PremiumCustomer currentUserInfoLine = new PremiumCustomer();

                ObservableCollection<PremiumCustomer> customerLines = populatePremiumCustomerDetails();
                foreach (PremiumCustomer line in customerLines)
                {
                    if (line.Username == username)
                    {
                        currentUserInfoLine = line;
                    }
                }
                return currentUserInfoLine;
            }

            public void updatePremiumCustDB(string firstname, string lastname, string email, string phone, string dob, string country, string townorcity, string nationality, string address, string postalcd, string username, string password, string cardtype, string cardno, string expdate, string chname, string ccv, string membership, double subsidy)
            {

                List<Object> updateArray = new List<object>();
                updateArray.Add(Subsidy);
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

                PremiumCustomer p = new PremiumCustomer();
                db.updateRow(updateArray, "tblCustomer", " WHERE Username = '" + Username + "'", p);

            }

            public double Subsidy
            {
                get { return this.subsidy; }
                set { this.subsidy = value; }
            }
        }
    }

