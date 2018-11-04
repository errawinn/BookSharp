using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for BrowseToursPage.xaml
    /// </summary>
    public partial class BrowseToursPage : Page
    {
        private Color BorderColor;
        private string Username;
        private TourCollection tc = new TourCollection();


        public BrowseToursPage(string username, Color color)
        {
            InitializeComponent();
            Username = username;
            BorderColor = color;
            try
            {
                ListBoxTour.ItemsSource = tc.getTours();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        //OPENS TOUR DETAILS PAGE based on  --> specific listbox item clicked
        private void viewBtnClick(object sender, RoutedEventArgs e)
        {
            Tour tour = (Tour)(sender as Button).DataContext;

            var newWindow = new TourDetailsWindow(BorderColor);
            newWindow.Top = Window.GetWindow(this).Top;
            newWindow.Left = Window.GetWindow(this).Left;
            try
            {
                newWindow.Main.Content = new Pages.TourDetailsPage(tour.TourID, Username, BorderColor);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            newWindow.Show(); //Show the new window
            Application.Current.Windows[0].Hide();
        }






        //FILTERS TOURS and BINDS LISTBOX to ObservableCollection of FILTERED TOURS based on selection
        private void getFilteredTours(string comboBoxName, int comboBoxIndex)
        {
            string c = "", r = "", b = "";
            double lowerBudget = 0, higherBudget = 0;
            ObservableCollection<Tour> tourCollection = new ObservableCollection<Tour>();
            tourCollection = tc.getTours();

            ObservableCollection<Tour> filteredTourCollection = new ObservableCollection<Tour>(); ;


            if (comboBoxName == "SortCountry")
            {
                switch (comboBoxIndex) //Sets value of country based on selected combobox index
                {

                    case 0:
                        c = "Cambodia";
                        break;
                    case 1:
                        c = "China";
                        break;
                    case 2:
                        c = "India";
                        break;
                    case 3:
                        c = "Japan";
                        break;
                    case 4:
                        c = "South Korea";
                        break;
                    case 5:
                        c = "Taiwan";
                        break;
                    case 6:
                        c = "Thailand";
                        break;
                    case 7:
                        c = "Vietnam";
                        break;
                }

                //add tour to filtered collection if the tour's database country == selected country
                foreach (Tour t in tourCollection)
                {
                    if (t.TourCountry == c)
                    {
                        filteredTourCollection.Add(t);
                    }
                }

                SortBudget.SelectedIndex = -1;
                SortBudget.Text = "Budget";
                SortRegion.SelectedIndex = -1;
                SortRegion.Text = "Region";
                SortCountry.Text = c;

            }
            else if (comboBoxName == "SortRegion")
            {
                switch (comboBoxIndex) //Sets value of region based on selected combobox index
                {
                    case 0:
                        r = "Northeast";
                        break;
                    case 1:
                        r = "South";
                        break;
                    case 2:
                        r = "Southeast";
                        break;
                }

                //add tour to filtered collection if the tour's database region == selected region
                foreach (Tour t in tourCollection)
                {
                    if (t.TourRegion == r)
                    {
                        filteredTourCollection.Add(t);
                    }
                }

                SortBudget.SelectedIndex = -1;
                SortBudget.Text = "Budget";
                SortCountry.SelectedIndex = -1;
                SortCountry.Text = "Country";
                SortRegion.Text = r;
            }
            else if (comboBoxName == "SortBudget")
            {
                if (comboBoxIndex >= 0 && comboBoxIndex <= 2)
                {
                    //Sets values of budget based on selected combobox index
                    if (comboBoxIndex == 0)
                    {
                        b = "$2000-$2200";
                        lowerBudget = 2000;
                        higherBudget = 2200;
                    }
                    else if (comboBoxIndex == 1)
                    {
                        b = "$2300-$2500";
                        lowerBudget = 2300;
                        higherBudget = 2500;
                    }
                    else if (comboBoxIndex == 2)
                    {
                        b = "$2600-$3000";
                        lowerBudget = 2600;
                        higherBudget = 3000;
                    }

                    foreach (Tour t in tourCollection)
                    {
                        //add tour to filtered collection if the tour's tourPrice is within budget range
                        if (t.TourPrice >= lowerBudget && t.TourPrice <= higherBudget)
                        {
                            filteredTourCollection.Add(t);
                        }
                    }
                }
                else if (comboBoxIndex >= 3 && comboBoxIndex <= 4)
                {
                    foreach (Tour t in tourCollection)
                    {
                        filteredTourCollection.Add(t);
                    }

                    if (comboBoxIndex == 3)
                    {
                        b = "Low - High";
                        filteredTourCollection = new ObservableCollection<Tour>(filteredTourCollection.OrderBy(tour => tour.TourPrice));
                    }
                    else if (comboBoxIndex == 4)
                    {
                        b = "High - Low";
                        filteredTourCollection = new ObservableCollection<Tour>(filteredTourCollection.OrderByDescending(tour => tour.TourPrice));
                    }
                }
                SortRegion.SelectedIndex = -1;
                SortRegion.Text = "Region";
                SortCountry.SelectedIndex = -1;
                SortCountry.Text = "Country";
                SortBudget.Text = b;
            }

            //Display in listbox
            ListBoxTour.ItemsSource = filteredTourCollection;
        }



        //INVOKES FILTERING OF TOURS --> using getFilteredTours() method

        private void SortCountry_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            getFilteredTours("SortCountry", SortCountry.SelectedIndex);
        }


        private void SortRegion_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            getFilteredTours("SortRegion", SortRegion.SelectedIndex);
        }

        private void SortBudget_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            getFilteredTours("SortBudget", SortBudget.SelectedIndex);
        }



        //RESETS TOURS to ALL TOURS
        private void radioNone_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                SortBudget.SelectedIndex = -1;
                SortBudget.Text = "Budget";
                SortRegion.SelectedIndex = -1;
                SortRegion.Text = "Region";
                SortCountry.SelectedIndex = -1;
                SortCountry.Text = "Country";
                ListBoxTour.ItemsSource = tc.getTours();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


    }
}


