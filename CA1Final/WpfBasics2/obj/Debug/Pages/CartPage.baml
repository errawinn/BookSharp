   M S B A M L   `   `   `  ����D  @BookSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:BookSharp.PagesBookSharp.Pages  5          BookSharp.Pages.CartPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:BookSharp.Pages     5      -   5          N� Title$  CartPage��5	       N� 	KeepAlive .  � 	Resources 5         DeleteHover �� BasedOn �� 
TargetType �� Property �� Value �� 
TargetType �� Triggers	 P� Property
 P� Value  NoScroll��%�  &	        7 �&	 �    �� 5   
   8   " ��6b   .�5      ��  � ��$ 0q�60   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $��0q�6K   ._�5      �� $��Center=�6/   $��Center=�6L   5      5      5       5      P� 5      	 �@J�IsMouseOver
 . . �5      ��  � ��
 �����63   �� 5       � ��$ 0q�68   5      5      �� 5   
   .R�5       �� 6   5!      5#      .��5%      �� .+�5&   
   �� -   5         ��Name$ 	Container��5&      
������ $��Stretch=�6B   $	��479��6`   .+�5(      ��  �� Orientation$ 
Horizontal=�6   .+�5)      �� $7��1pack://application:,,,/Resources/Images/cart1.png��6   $��Center=�6S   $��19��6n   $��19��6z   $��29 3 0 0q�6�    J� Opacity$
 0.65Q�6�   �� 5*      $
��CART��6   $��15(�6*    �� Padding$
 0 20q�68   $��	20 8 20 7q�6G   ���	#FF0C0C0C$5��/pack://application:,,,/Resources/Fonts/#Corbert)�6q   5+      �� 5,      $	��270��6   $	��760��6(   $
��Auto=�64   .��5-      �� $��0 0 0 50q�6   $	��750��6/   $
��auto��6;   .+�5.      ��   NoHover#��[ 6   
�������$	��760��6R   $��40��6^   .��50      �� $ 
Horizontal=�6%   .+�51      �� $��TourID��6(   $��25 0 0 0q�66   �� 52      $��	Tour Info��6(   $��45 0 0 0q�69   �� 53      $	��Qty��6(   $��	100 0 0 0q�63   �� 54      $��Flight��6(   $��40 0 0 0q�66   �� 55      $��Rooms��6(   $��30 0 0 0q�65   �� 56      $��Addons��6(   $��20 0 0 0q�66   �� 57      $��SubTotal��6(   $��	40 0 27 0q�68   �� 58      $	��Del��6(   $��35 0 0 0q�63   �� 59      $
��Edit��6(   $��
40 0 150 0q�64   5:      5;      �� 5=      -   5         ��Name$ txtBlockNone��5=       $��None Selected��66   $��16(�6K   
�������$ 330 30q�6o   
�������$	��760��6�   $��80��6�   �� 5@      -   5        $��ListBoxCartItems��5@      $
��auto��5A      ��.  $��Hidden=�5B   <   $��Hidden=�5C      #��[ 5D      ��5@   6   Z� ��6M   Z� ��6d   ��  5F       �� Color��%  (��       5G   .   * SystemColors.HighlightBrushKey+)(�� %     5H   .   *$"SystemColors.HighlightTextBrushKey+)(�� D     5I   .   *SystemColors.ControlBrushKey+)�� 5G      $ Transparent��6`   �� 5H      $ Black��6d   �� 5I      $ Transparent��6^   5J      ��5L      �� 5M      .R�5P   "   ��  ��Name$ Button��6)   #��[ 6:   
�������$	��760��6p   $��80��6|   .��5Q   &   �� $ 
Horizontal=�61   $	��760��6J   .+�5R   *   �� $ 	TourIDTxt��64   $��60��6_   $
��Bold"�6j   $��11(�6|   $��Center=�6�   $��Center=�6�   $	 0 5q�6�   $��25 0 0 0q�6�   ��6G   �� *TourID+6�   �� 5S   *   $��Center=�65   $��10 0 0 0q�6P   .+�5T   .   �� $ TourNameTxt��68   $	��115��6g   $
��Bold"�6s   $��11(�6�   $
��Left=�6�   $��Center=�6�   $ 0 0 0 5q�6�   ��6M   �� *
TourName+6�   �� 5U   .   $ 
Horizontal=�69   $	��130��6S   $
��Left=�6_   .+�5V   2   �� $ TourDescTxt��6<   $	��115��6k   $��11(�6w   $
��Left=�6�   $ 0 5 0 0q�6�   ��6Q   �� *
TourDesc+6�   �� 5W   2   $	��...��6<   $��10��6G   $��11(�6R   $
��Left=�6`   $ 0 5 0 0q�6{   5X   /   �� 5Y   .   $ TourDate��68   $	��115��6q   $��11(�6}   $
��Left=�6�   ��6J   �� *SelectedTourStartDate+6�   5Z   +   �� 5[   *   $	 Qty��64   $��60��6\    �� TextAlignment$ Center=�6g   $��10 0 0 0q�6~   ��6A   �� *	PeopleQty+6~   �� 5\   *   .+�5]   .   �� $ Flight��68   $��60��6i   $ Center=�6t   ��6H   �� *FlightSelection+6t   �� 5^   .   $ FlightPrice��68   $��60��6�   $ Center=�6�   ��6M   �� *CalculatedFlightPrice+ �� StringFormat$ {0:c}��6�   5_   +   �� 5`   *   .+�5a   .   �� $ Rooms��68   $��60��6f   $ Center=�6q   ��6G   �� *RoomSelection+6q   �� 5b   .   $ 	RoomPrice��68   $��60��6�   $ Center=�6�   ��6K   �� *CalculatedRoomPrice+$ {0:c}��6�   5c   +   �� 5d   *   $ Addons��64   $��60��6d   $ Center=�6o   ��6D   �� *AddOnSelection+6o   �� 5f   *   $ Subtotal��64   $��60��6z   $ Center=�6�   $��	25 0 10 0q�6�   ��6F   �� *
Subtotal+$ {0:c}��6�   �� 5i   *   $ DeleteButton��61   -   5          DeleteRedStyle#��[ 5i   b    � Cursor$
 Hand��6�   $��Center=�6�   $��35 0 0 0q�6�   $��40��6�   $��40��6�   .��5j   .   �� $8��2pack://application:,,,/Resources/Images/Trash1.png��64   $��Center=�6p   $��20��6�   $��20��6�   $��0 0 0 0q�6�   $	 0.8Q�6�   5k   +   �� 5l   *   $ 
EditButton��61   -   5        $
 Hand��5l   ^   $��Center=�6m   $��20 0 0 0q�6�   $��40��6�   $��40��6�   .��5m   .   �� $D��>pack://application:,,,/Resources/Images/pencil-edit-button.png��64   $��Center=�6|   $��20��6�   $��20��6�   $��0 0 0 0q�6�   $	 0.8Q�6�   5n   +   5o   '   5p   #   5r      5t      5w      5x      �� 5y      $ 
Horizontal=�6   $��Right=�62   .+�5z      �� $��
SUBSIDY : ��6   $��20(�6.   $
��Bold"�6<   $��	0 20 10 0q�6N   �� 5{      -   5        $ txtBlockSubsidy��5{      $��Bottom=�66   $��20(�6Q   $��	 0 0 50 0q�6_   �� 5}      $��GRAND TOTAL : ��6   $��20(�62   $
��Bold"�6@   $��	0 20 10 0q�6R   �� 5      -   5        $ txtBlockTotalCost��5      $��Bottom=�6j   $��20(�6�   $��	 0 0 50 0q�6�   ��67   �� *	TotalCost+$ {0:c}��6�   5�      �� 5�      -	   5        $ Checkout��5�      $��CHECKOUT  >>��6>   $��5q�6U   $	��150��6a   $��40��6m   $��Right=�6y   $
��Bold"�6�   $��	0 10 50 0q�6�   5�      5�      5�      