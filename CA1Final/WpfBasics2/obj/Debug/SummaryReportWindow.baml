   M S B A M L   `   `   `  ����D  @BookSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:BookSharp	BookSharp  5   	   #    BookSharp.SummaryReportWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:BookSharp     5   	   $	��600��5   
   $	��800��6     � 
ResizeMode$  CanMinimize=�5	   	    � WindowStartupLocation$ CenterOwner=�6"    � Title$" Book # | Tour Booking System��6F   
������  � AllowsTransparency .  � WindowStyle$
 None=�6�    � Icon$7 1pack://application:,,,/Resources/Images/icon8.png��6�    � 	Resources 5
         LogoutUnderline �� 
TargetType �� Triggers	 P� Property
 P� Value �� Property �� Value  LogoutHover �� BasedOn �� 
TargetType �� ElementName��%�  &	        &	 �     7 �'� T    �� 5   
   " ��6(    5      P� 5      	 �@J�IsMouseOver
 . . �5      ��  � ��$ 	Underline{�68   5      5      �� 5   
   8   " ��6b   .�5      ��  �@�Cursor$
 Hand��6'   �� 5       � ��$ 0q�60   �� 5       � ��
 ���� 6+   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $��0q�6!   #��z��5      ._�5      �� $��Center=�6/   $��Center=�6L   5      5      5       5!      P� 5"      	 �@J�IsMouseOver
 . . �5$      ��  � �� �	#FF88BD6363   5&      5(      �� 5*   
   " �6    5+      P� 5,      	 � ��
 . . �5-      ��  �@�PlacementTarget 68   �� $
 btnH���� 5.       � ��$	 Top=�62   �� 5/       �@�VerticalOffset$ -5��67   �� 50       �@�HorizontalOffset$ 5��69   51      53      55      .��56      �� -   5         ��Name$ Border��56       �� Padding$ 2q�6    �� CornerRadius$ 5��6)   ���	#FFECEAE2._�58   
   �� $	��794��6   $	��595��6!   .+�59      � -   5         �Name$ TitleBar��59      $��25��6%   .+�5:      �� $7��1pack://application:,,,/Resources/Images/icon8.png��6   $��14��6S   $��14��6_   $
��Left=�6j   $	��Top=�6�   $	��3 3q�6�   �� 5;      $��11(�6   $����BookSharp | Tour Booking System                                                                                                                                          ��6*   $��20��6�   $
��Left=�6�   $	��Top=�6  $��24 3 0 0q�6   J� Opacity$
 0.85Q�6-  $��Century Gothic)�6<  $	��733��6X  �� 5<      -   5         ��Name$ CloseButton��5<      $��15��6H   $��15��6T   
������ $��Right=�6x   $	��Top=�6�   $��0 2 1 0q�6�   .��5=      �� -   5         ��Name$ Close��5=      $8��2pack://application:,,,/Resources/Images/close2.png��6+   $��15��6g   $��15��6s   $��Center=�6~   $	 0.7Q�6�   6�   5>      �� 5?      -   5        $ MinimizeButton��5?      $��15��6O   $��15��6[   
������ $��Right=�6   $	��Top=�6�   $��0 2 18 0q�6�   .��5@      �� -   5        $ Minimise��5@      $;��5pack://application:,,,/Resources/Images/minimize2.png��6.   $��15��6n   $��Center=�6y   $	 0.3Q�6�   6�   5A      5B      �� 5C      $	��800��6   $��90��6%   ���	#FF94C771.+�5D      ��  �� Orientation$ 
Horizontal=�6   .+�5E      �� $��SUMMARY REPORT��6    $
��Left=�66   $��40(�6Q   $��	28 20 0 0q�6_   $��Century Gothic)�6r   �� 5F      -   5        $��
sortReport��5F       �� 
IsReadOnly .  �� Text$ Sort By��6r    �� 
IsEditable . $��30��6�   $	��225��6�   $��Center=�6�   $��
150 20 0 0q�6�   $��7q�6�    � Cursor$
 Hand��6�   .@�5H      �� $
 Hand��6'   .��65   Bookings made this week6N   �� 5I      $
 Hand��6'   .��65   Bookings made this month6O   �� 5J      $
 Hand��6'   .��65   $"No. of bookings per tour this week6Y   �� 5K      $
 Hand��6'   .��65   %#No. of bookings per tour this month6Z   �� 5L      $
 Hand��6'   .��65   Top 5 most popular tours6P   5M      5N      5O      �� 5P      -   5         ��Name$ bookingNames��5P      $ 
Horizontal=�6/   $��70��6H   
�������.+�5Q      �� $��Center=�6    �� TextAlignment$ Center=�67   $	��135��6N   $��18(�6Z   $��Century Gothic)�6h   $��
Booking ID��6�   �� 5R      $��Center=�6   $ Center=�67   $	��165��6N   $��18(�6Z   $��Century Gothic)�6h   $��Booking Date��6�   �� 5S      $��Center=�6   $ Center=�67   $	��140��6N   $��18(�6Z   $��Century Gothic)�6h   $��Tour ID��6�   �� 5T      $��Center=�6   $ Center=�67   $	��175��6N   $��18(�6Z   $��Century Gothic)�6h   $��Tour Description��6�   5U      �� 5V      -	   5        $ bookingTop5Names��5V      $ 
Horizontal=�63   $��70��6L   
�������.+�5W      �� $��Center=�6   $ Center=�67   $	��105��6N   $��18(�6Z   $��Century Gothic)�6h   $��Tour ID��6�   �� 5X      $��Center=�6   $ Center=�67   $	��170��6N   $��18(�6Z   $��Century Gothic)�6h   $��	Tour Name��6�   $��	0,23,0,22q�6�   �� 5Y      $��Center=�6   $ Center=�67   $	��215��6N   $��18(�6Z   $��Century Gothic)�6h   $��No. of bookings��6�   $��	115 0 0 0q�6�   �� 5Z      $��Center=�6   $ Center=�67   $	��135��6N   $��18(�6Z   $��Century Gothic)�6h   $��	Total Qty��6�   5[      �� 5_      -
   5         ��Name$ 	LBBooking��5_      $	��410��5`      ��.  $��Hidden=�6I   $��Visible=�5a      ��5_   )   Z� ��6@   Z� ��6W   �� ��5b      �� 5c      " ��6   .�5d      ��  � |� .  66   5e      ��5h      �� 5i      .R�5j      �� $ 
Horizontal=�6%   $	��800��6>   $��60��6J   
�������.+�5k      ��  ��Name$ bookID��6(   $��20 0 0 0q�6S   $	��100��6e   $��Center=�6q   $
 Left=�6�   ��68   �� *	BookingID+6�   �� 5l      $ bookDate��6(   $��40 0 0 0q�6W   $	��100��6i   $��Center=�6u   $
 Left=�6�   ��6:   �� *BookingDate+6�   �� 5m      $ 
bookTourID��6(   $��80 0 0 0q�6X   $	��100��6j   $��Center=�6v   $
 Left=�6�   ��6<   �� *
BookTourID+6�   �� 5n      $ bookTourDesc��6(   $��20 0 0 0q�6\   $	��250��6n   $��Center=�6z   $
 Left=�6�   ��6>   �� *BookTourDesc+6�   5o      5p      5r      �� 5s      -   5        $ 
LBBookTour��5s      $	��410��5t      ��.  $��Hidden=�6I   $��Visible=�5u      ��5s   *   Z� ��6A   Z� ��6X   �� ��5w      �� 5x      " ��6   .�5y      ��  � |� .  66   5z      ��5|      �� 5}      .R�5~      �� $ 
Horizontal=�6%   $	��800��6>   $��60��6J   
�������.+�5      �� $ TourID��6(   $��20 0 0 0q�6T   $	��100��6f   $��Center=�6r   $
 Left=�6�   ��68   �� *
BookTourID+6�   �� 5�      $ bookTourDesc��6(   $��20 0 0 0q�6\   $	��250��6n   $��Center=�6z   $
 Left=�6�   ��6>   �� *BookTourDesc+6�   �� 5�      $ 	bookCount��6(   $��50 0 0 0q�6X   $	��100��6j   $��Center=�6v   $ Center=�6�   ��6;   �� *BookTourQty+6�   �� 5�      $ bookTourQty��6(   $��80 0 0 0q�6Y   $��90��6k   $��Center=�6v   $ Center=�6�   ��6=   �� *
BookPplQty+6�   5�      5�      5�      5�      5�      5�      