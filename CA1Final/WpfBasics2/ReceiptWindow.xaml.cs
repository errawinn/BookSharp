using System;
using System.Collections.Generic;
using System.Data;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using BookSharp.Classes;
using BookSharp.Pages;

namespace BookSharp
{
    /// <summary>
    /// Interaction logic for ReceiptWindow.xaml
    /// </summary>
    public partial class ReceiptWindow : Window
    {
        dbBooking db = new dbBooking();
        private Color color;
        private string bookingID;
        private string username;
        public ReceiptWindow(Color color, string bookingID)
        {
            InitializeComponent();
            this.color = color;
            this.bookingID = bookingID;
            Grid.Background = new SolidColorBrush(color);
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            double totalCost = 0;
            DataTable bookingTable = db.getDataTable("select * from tblBooking where BookingID = '"+ bookingID +"'");
         

            for (int i = 0; i < bookingTable.Rows.Count; i++)
            {
                DataRow row = bookingTable.Rows[i];
                txtBoxBookingID.Text = row["BookingID"].ToString();
                username = row["Username"].ToString();
                bookingDate.Text = Convert.ToDateTime(row["BookingDate"].ToString()).ToShortDateString();
                bookingTime.Text = Convert.ToDateTime(row["BookingTime"].ToString()).ToShortTimeString();
                

                Customer c = new Customer(username);
                Customer cust = (Customer)c.getCustomerRow(username);
               
                
                custName.Text = cust.getCustomerDetail(username, 0) + " " + cust.getCustomerDetail(username, 1);
                email.Text = cust.getCustomerDetail(username, 2);
                contact.Text = cust.getCustomerDetail(username, 3);

                totalCost += double.Parse(row["Subtotal"].ToString());

                TourCollection tc = new TourCollection();
                Tour tour = tc.getTour(row["TourID"].ToString());
                
                TextBlock tourID = new TextBlock();
                tourID.Text = string.Format("({0}) TourID : ", (i + 1));
                tourID.FontWeight = FontWeights.Bold;

                TextBlock tourIDValue = new TextBlock();
                tourIDValue.Text = row["TourID"].ToString();

                TextBlock tourQty = new TextBlock();
                tourQty.Text = "No. Of People : ";
                tourQty.FontWeight = FontWeights.Bold;

                TextBlock qtyValue = new TextBlock();
                qtyValue.Text = row["PeopleQty"].ToString();

                TextBlock tourDate = new TextBlock();
                tourDate.Text = "Selected Tour Date : ";
                tourDate.FontWeight = FontWeights.Bold;

                TextBlock dateRange = new TextBlock();
                dateRange.Text = row["SelectedTourStartDate"].ToString() + " - " + row["SelectedTourEndDate"].ToString();

                TextBlock flight = new TextBlock();
                flight.Text = "Flight Choice : ";
                flight.FontWeight = FontWeights.Bold;

                TextBlock flightSelection = new TextBlock();
                flightSelection.Text = row["FlightSelection"].ToString();

                TextBlock fTicket = new TextBlock();
                fTicket.Text = "No. Of Tickets : ";
                fTicket.FontWeight = FontWeights.Bold;

                TextBlock ticketQty = new TextBlock();
                ticketQty.Text = row["TicketQty"].ToString();

                TextBlock room = new TextBlock();
                room.Text = "Room Choice : ";
                room.FontWeight = FontWeights.Bold;

                TextBlock roomSelection = new TextBlock();
                roomSelection.Text = row["RoomSelection"].ToString();

                TextBlock roomType = new TextBlock();
                roomType.Text = "Room Type : ";
                roomType.FontWeight = FontWeights.Bold;

                TextBlock roomValue = new TextBlock();
                roomValue.Text = string.Format("Single x {0}, Double x {1}", row["SingleRmQty"].ToString(), row["DoubleRmQty"].ToString());

                TextBlock tourPrice = new TextBlock();
                tourPrice.Text = "Total Tour Price : ";
                tourPrice.FontWeight = FontWeights.Bold;

                TextBlock tourPriceValue = new TextBlock();
                tourPriceValue.Text = (int.Parse(row["PeopleQty"].ToString()) * tour.TourPrice).ToString("c2");

                TextBlock flightPrice = new TextBlock();
                flightPrice.Text = "Flight Price : ";
                flightPrice.FontWeight = FontWeights.Bold;

                TextBlock flightPriceValue = new TextBlock();
                flightPriceValue.Text = "$" + row["CalculatedFlightPrice"].ToString();

                TextBlock roomPrice = new TextBlock();
                roomPrice.Text = "Room Price : ";
                roomPrice.FontWeight = FontWeights.Bold;

                TextBlock roomPriceValue = new TextBlock();
                roomPriceValue.Text = "$" + row["CalculatedRoomPrice"].ToString();

                TextBlock addon = new TextBlock();
                addon.Text = "Add-on : ";
                addon.FontWeight = FontWeights.Bold;

                TextBlock addonSelection = new TextBlock();
                addonSelection.Text = row["AddOnSelection"].ToString();

                TextBlock subTotal = new TextBlock();
                subTotal.Text = "Subtotal : ";
                subTotal.FontWeight = FontWeights.Bold;

                TextBlock subValue = new TextBlock();
                subValue.Text = "$" + row["Subtotal"].ToString();

                StackPanel tourPanel = new StackPanel();
                tourPanel.Margin = new Thickness(10, 10, 0, 0);
                tourPanel.Orientation = Orientation.Horizontal;
                tourPanel.Children.Add(tourID);
                tourPanel.Children.Add(tourIDValue);

                StackPanel qty = new StackPanel();
                qty.Margin = new Thickness(27, 20, 0, 0);
                qty.Orientation = Orientation.Horizontal;
                qty.Children.Add(tourQty);
                qty.Children.Add(qtyValue);

                StackPanel selectedDate = new StackPanel();
                selectedDate.Margin = new Thickness(27, 20, 0, 0);
                selectedDate.Orientation = Orientation.Horizontal;
                selectedDate.Children.Add(tourDate);
                selectedDate.Children.Add(dateRange);

                StackPanel flightChoice = new StackPanel();
                flightChoice.Margin = new Thickness(27, 0, 0, 0);
                flightChoice.Orientation = Orientation.Horizontal;
                flightChoice.Children.Add(flight);
                flightChoice.Children.Add(flightSelection);

                StackPanel flightTicket = new StackPanel();
                flightTicket.Margin = new Thickness(27, 0, 0, 0);
                flightTicket.Orientation = Orientation.Horizontal;
                flightTicket.Children.Add(fTicket);
                flightTicket.Children.Add(ticketQty);

                StackPanel roomChoice = new StackPanel();
                roomChoice.Margin = new Thickness(27, 0, 0, 0);
                roomChoice.Orientation = Orientation.Horizontal;
                roomChoice.Children.Add(room);
                roomChoice.Children.Add(roomSelection);

                StackPanel rmType = new StackPanel();
                rmType.Margin = new Thickness(27, 0, 0, 0);
                rmType.Orientation = Orientation.Horizontal;
                rmType.Children.Add(roomType);
                rmType.Children.Add(roomValue);

                StackPanel totalTour = new StackPanel();
                totalTour.Margin = new Thickness(27, 0, 0, 0);
                totalTour.Orientation = Orientation.Horizontal;
                totalTour.Children.Add(tourPrice);
                totalTour.Children.Add(tourPriceValue);

                StackPanel totalFlight = new StackPanel();
                totalFlight.Margin = new Thickness(27, 0, 0, 0);
                totalFlight.Orientation = Orientation.Horizontal;
                totalFlight.Children.Add(flightPrice);
                totalFlight.Children.Add(flightPriceValue);

                StackPanel totalRoom = new StackPanel();
                totalRoom.Margin = new Thickness(27, 0, 0, 0);
                totalRoom.Orientation = Orientation.Horizontal;
                totalRoom.Children.Add(roomPrice);
                totalRoom.Children.Add(roomPriceValue);

                StackPanel subTotal1 = new StackPanel();
                subTotal1.Margin = new Thickness(27, 0, 0, 0);
                subTotal1.Orientation = Orientation.Horizontal;
                subTotal1.Children.Add(subTotal);
                subTotal1.Children.Add(subValue);

                StackPanel addons = new StackPanel();
                addons.Margin = new Thickness(27, 0, 0, 0);
                addons.Orientation = Orientation.Horizontal;
                addons.Children.Add(addon);
                addons.Children.Add(addonSelection);

                Line divider = new Line();
                divider.X1 = 10;
                divider.X2 = 460;
                SolidColorBrush Gray = new SolidColorBrush();
                Gray.Color = Colors.DarkGray;
                divider.Stroke = Gray;
                divider.Margin = new Thickness(0, 20, 0, 0);

                mainContent.Children.Add(tourPanel);
                mainContent.Children.Add(qty);
                mainContent.Children.Add(selectedDate);
                mainContent.Children.Add(flightChoice);
                mainContent.Children.Add(flightTicket);
                mainContent.Children.Add(roomChoice);
                mainContent.Children.Add(rmType);
                mainContent.Children.Add(addons);
                mainContent.Children.Add(totalTour);
                mainContent.Children.Add(totalFlight);
                mainContent.Children.Add(totalRoom);
                mainContent.Children.Add(subTotal1);
                mainContent.Children.Add(divider);
            }

            TotalCost.Text = totalCost.ToString("c2");

        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Cart ct = new Cart(username);
            
            foreach (Window window in App.Current.Windows)
            {
                if (!window.IsActive)
                {
                    window.Close();
                }
                else if (window.IsActive)
                {
                    MainWindow mw = new MainWindow(username, color);
                    mw.Top = Window.GetWindow(this).Top;
                    mw.Main.Content = new CartPage(username, color);
                    mw.Show();
                    window.Close();
                }
            }

        }

        private void Close_Click(object sender, RoutedEventArgs e)
        {
            Cart ct = new Cart();
            ct.deleteAllCartItems();
            foreach (Window window in App.Current.Windows)
            {
                if (!window.IsActive)
                {
                    window.Close();
                }
                else if (window.IsActive)
                {
                    MainWindow mw = new MainWindow(username, color);
                    mw.Top = Window.GetWindow(this).Top;
                    mw.Main.Content = new CartPage(username, color);
                    mw.Show();
                    window.Close();
                }
            }
        }

        private void TitleBar_MouseLeftButtonDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void MinimiseImage_MouseEnter(object sender, System.Windows.Input.MouseEventArgs e)
        {
            MinimiseImage.Opacity = 0.5;
        }

        private void MinimiseImage_MouseLeave(object sender, System.Windows.Input.MouseEventArgs e)
        {
            MinimiseImage.Opacity = 0.6;
        }

        private void CloseImage_MouseEnter(object sender, System.Windows.Input.MouseEventArgs e)
        {
            CloseImage.Opacity = 0.9;
        }

        private void CloseImage_MouseLeave(object sender, System.Windows.Input.MouseEventArgs e)
        {
            CloseImage.Opacity = 1;
        }
    }
}