   M S B A M L   `   `   `  ����D  @BookSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:BookSharp.PagesBookSharp.Pages  5      #    BookSharp.Pages.BookmarksPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:BookSharp.Pages     5      -   5          N� Title$  BookmarksPage��5	       N� 	KeepAlive .  � 	Resources 5         NoScroll��%7   &	        �� 5   
   .R�5      �� 6   5      5      .��5      �� $	��509��6   $	��785��6    $
��Auto=�6,   .��5      �� -   5         ��Name$ 	Container��5      
������ $��Stretch=�6F   .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $;��5pack://application:,,,/Resources/Images/bookmark1.png��6   $��Center=�6[   $��19��6v   $��19��6�   $��25 3 0 0q�6�    J� Opacity$
 0.65Q�6�   �� 5      $��	BOOKMARKS��6   $��15(�6.    �� Padding$
 0 20q�6<   $��	20 8 20 7q�6K   ���	#FF0C0C0C$5��/pack://application:,,,/Resources/Fonts/#Corbert)�6u   5      �� 5      $��0 0 0 50q�6   $	��750��6+   .+�5      ��   NoHover#��[ 6   
�������$	��760��6N   $��40��6Z   .��5      �� $ 
Horizontal=�6!   .+�5      �� $��TourID��6$   $��15 0 0 0q�62   �� 5      $��	Tour Info��6$   $��45 0 0 0q�65   �� 5      $��
Start Date��6$   $��	100 0 0 0q�66   �� 5      $��End Date��6$   $��55 0 0 0q�64   �� 5      $��
Tour Price��6$   $��47 0 0 0q�66   �� 5       $��Remove��6$   $��
48 0 150 0q�62   5!      5"      �� 5%      -   5         ��Name$ txtBlockNone��5%      $��None Selected��62   $��16(�6G   
�������$ 330 30q�6k   
�������$	��760��6�   $��80��6�   �� 5(      -   5        $��ListBoxBookmarks��5(      $
��auto��5)      ��.  $��Hidden=�5*   <   $��Hidden=�5+      #��[  5,      ��5(   2   Z� ��6I   Z� ��6`   ��  5.       �� Color��%  (��       5/   *   * SystemColors.HighlightBrushKey+)(�� %     50   *   *$"SystemColors.HighlightTextBrushKey+)(�� D     51   *   *SystemColors.ControlBrushKey+)�� 5/      $ Transparent��6\   �� 50      $ Black��6`   �� 51      $ Transparent��6Z   52      ��54      �� 55      .R�58      �� 	 ��Name$	 Button1��6%   #��[ 67   
�������$	��760��6m   $��80��6y   .��59   "   �� $ 
Horizontal=�6-   $	��760��6F   .+�5:   &   �� $ 	TourIDTxt��60   $��60��6C   $
��Bold"�6N   $��11(�6`   $��Center=�6n   $��Center=�6�   $	 0 5q�6�   $��25 0 0 0q�6�   ��6�   �� *TourID+�� 5;   &   $��Center=�61   $��20 0 0 0q�6L   .+�5<   *   �� $ TourNameTxt��64   $	��130��6J   $
��Bold"�6V   $��11(�6h   $��Center=�6v   $��Center=�6�   $ 0 0 0 5q�6�   ��6�   �� *
TourName+�� 5=   *   $ 
Horizontal=�65   $	��130��6O   $
��Left=�6[   .+�5>   .   �� $ TourDescTxt��68   $	��123��6M   $��11(�6Y   $
��Left=�6g   $ 0 5 0 0q�6�   ��6�   �� *
TourDesc+�� 5?   .   $	��...��68   $��10��6C   $��11(�6N   $
��Left=�6\   $ 0 5 0 0q�6w   5@   +   5A   '   �� 5B   &   $ TourStartDateTxt��60   $��55��6J   $��Center=�6U   $��	18 0 30 0q�6r   ��6�   �� *TourStartDate+�� 5C   &   $ TourEndDateTxt��60   $��55��6H   $��Center=�6S   $��	22 0 30 0q�6p   ��6�   �� *TourEndDate+�� 5E   &   $	��100��61   $ 
Horizontal=�6=   .+�5F   *   �� $��$��64   $��22 0 0 0q�6>   $��Center=�6P   �� 5G   *   $ TourPriceTxt1��64   $
��auto��6K   $
��Left=�6s   ��6X   �� *	TourPrice+6s   5H   '   �� 5I   &   $	 DeleteButton��6-   -   5        
 � Cursor$

 Hand��5I   [   $��Center=�6j   $��14 0 0 0q�6�   $��40��6�   $��40��6�     DeleteRedStyle#��[ 6�   .��5J   *   �� $8��2pack://application:,,,/Resources/Images/Trash1.png��60   $��Center=�6l   $��20��6�   $��20��6�   $��0 0 0 0q�6�   $	 0.8Q�6�   5K   '   �� 5L   &   $	 
ViewButton��6-   -   5        $

 Hand��5L   W   $��Center=�6f   $��10 0 0 0q�6�   $��40��6�   $	��120��6�   .��5M   *   � $��40��6/   $	��120��6;   .+�5N   .   �� $��	View More��68   $��Center=�6I   $��15 0 0 3q�6d   ���	#FF2C2C2C$
��Bold"�6�   �� 5O   .   $=��7pack://application:,,,/Resources/Images/rightarrow3.png��64   $��Center=�6u   $��20��6�   $��20��6�   $��85 1 0 0q�6�   5P   +   5Q   '   5R   #   5S      5U      5W      5Y      5Z      5[      5^      