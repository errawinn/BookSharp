using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
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
    /// Interaction logic for LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        AccountValidation av = new AccountValidation();

        Cart ct = new Cart();
 
        Customer c = new Customer();
        FreeCustomer fc = new FreeCustomer();
        PremiumCustomer pc = new PremiumCustomer();
        private Color BorderColor = (Color)(ColorConverter.ConvertFromString("#FFECEAE2"));
        public LoginPage()
        {
            InitializeComponent();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new Uri("./Pages/WelcomePage.xaml", UriKind.Relative));
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            validateOnClickOrEnter();
        }


        private void Page_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                validateOnClickOrEnter();
            }
        }

        //VALIDATES LOGIN USERNAME AND PASSWORD
        private void validateOnClickOrEnter()
        {
            string UsernameTxt = txtBoxLoginUsername.Text.ToLower();
            string PasswordTxt = txtBoxLoginPW.Password.ToString().ToLower();


            if (UsernameTxt == "username" || PasswordTxt == "")
            {
                if (txtBlockError2.Visibility == Visibility.Visible)
                {
                    txtBlockError2.Visibility = Visibility.Hidden;
                }
                txtBlockError1.Visibility = Visibility.Visible;
                txtBlockError1.Text = "Please fill all boxes";
            }

            else if (validateLoginUsername(UsernameTxt))
            {
                if (validateLoginPassword(UsernameTxt, PasswordTxt))
                {
                    txtBlockError1.Visibility = Visibility.Hidden;
                    txtBlockError2.Visibility = Visibility.Hidden;
                    Customer cust = getCustomerRow(UsernameTxt);

                    MessageBox.Show("Welcome back, " + cust.FirstName + " " + cust.LastName + "!", "Welcome"); //show msg box like "Welcome, John!"
                    Cart ct = new Cart(UsernameTxt);
                    ct.deleteAllCartItems();
                    var newWindow = new MainWindow(UsernameTxt, BorderColor); //create new window (Open all-tour page)
                    newWindow.Top = Window.GetWindow(this).Top;
                    newWindow.Left = Window.GetWindow(this).Left;
                    newWindow.Main.Content = new BrowseToursPage(cust.Username, BorderColor);
                    newWindow.Show(); //Show the new window
                    Window.GetWindow(this).Close();

                }
                else
                {

                    txtBlockError2.Visibility = Visibility.Visible;
                    txtBlockError1.Visibility = Visibility.Hidden;
                    txtBoxLoginPW.Password = string.Empty;
                    PW.Visibility = Visibility.Visible;
                    txtBoxLoginPW.BorderBrush = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FFD1CDBC")));
                }
            }
            else
            {
                txtBlockError1.Visibility = Visibility.Visible;
                txtBlockError1.Text = "Username does not exist";
                txtBlockError2.Visibility = Visibility.Hidden;
                txtBoxLoginPW.Password = string.Empty;
                PW.Visibility = Visibility.Visible;
                txtBoxLoginPW.BorderBrush = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FFD1CDBC")));
            }
        }


        private void txtBoxLoginUsername_GotFocus(object sender, RoutedEventArgs e)
        {
            txtBlockError1.Visibility = Visibility.Hidden;
            txtBlockError2.Visibility = Visibility.Hidden;
            if (txtBoxLoginUsername.Text == "Username")
            {
                txtBoxLoginUsername.Foreground = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FF2e2e2e")));
                txtBoxLoginUsername.BorderBrush = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FF2e2e2e")));
                txtBoxLoginUsername.FontStyle = FontStyles.Normal;
                txtBoxLoginUsername.Text = "";
            }
        }

        private void txtBoxLoginUsername_LostFocus(object sender, RoutedEventArgs e)
        {
            if (txtBoxLoginUsername.Text == "")
            {
                txtBoxLoginUsername.Foreground = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FFD1CDBC")));
                txtBoxLoginUsername.BorderBrush = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FFD1CDBC")));
                txtBoxLoginUsername.FontStyle = FontStyles.Italic;
                txtBoxLoginUsername.Text = "Username";
            }
        }

        private void txtBoxLoginPW_GotFocus(object sender, RoutedEventArgs e)
        {
            txtBlockError1.Visibility = Visibility.Hidden;
            txtBlockError2.Visibility = Visibility.Hidden;
            PW.Visibility = Visibility.Hidden;
            txtBoxLoginPW.BorderBrush = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FF2e2e2e")));
        }

        private void txtBoxLoginPW_LostFocus(object sender, RoutedEventArgs e)
        {
            if (txtBoxLoginPW.Password == "")
            {
                PW.Visibility = Visibility.Visible;
                txtBoxLoginPW.BorderBrush = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FFD1CDBC")));
            }
        }
        private Boolean validateLoginUsername(string LoginUsername) //Validates Login Username
        {
            ObservableCollection<Customer> allCust = c.populateCustomerDetails();
            Customer getCust = new Customer();
            Boolean exists = false;
            foreach (var cust in allCust)
            {
                if (cust.Username == LoginUsername)
                {
                    exists = true;
                }
            }

            return exists;
        }


        private Boolean validateLoginPassword(string LoginUsername, string LoginPassword) //Validates Login Password
        {
            Boolean passwordIsValid = false;
            Customer getCust = getCustomerRow(LoginUsername);
            if (getCust.CustPassword == LoginPassword)
            {
                passwordIsValid = true;
            }

            return passwordIsValid;
        }




        private Customer getCustomerRow(string LoginUsername) // get line from customerInfo text file containing the valid username inputted
        {
            ObservableCollection<Customer> allCust = c.populateCustomerDetails();
            Customer getCust = new Customer();
            foreach (var cust in allCust)
            {
                if (cust.Username == LoginUsername)
                {
                    getCust = cust;
                }
            }

            return getCust;
        }

        private void txtBoxLoginPW_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if (txtBoxLoginPW.Password != "")
            {
                txtBlockError1.Visibility = Visibility.Hidden;
                txtBlockError2.Visibility = Visibility.Hidden;
                PW.Visibility = Visibility.Hidden;
                txtBoxLoginPW.BorderBrush = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FF2e2e2e")));
            }
            else if (txtBoxLoginPW.Password == "")
            {
                PW.Visibility = Visibility.Visible;
                txtBoxLoginPW.BorderBrush = new SolidColorBrush((Color)(ColorConverter.ConvertFromString("#FFD1CDBC")));

            }
        }
    }
}

