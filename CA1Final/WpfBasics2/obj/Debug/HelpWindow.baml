   M S B A M L   `   `   `  ����D  @BookSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:BookSharp	BookSharp  5   	       BookSharp.HelpWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:BookSharp     5   	     � Title$  Book # | Help Window��5   	   $	��600��6&    � Icon$7 1pack://application:,,,/Resources/Images/icon8.png��63   $	��800��6m    � 
ResizeMode$ CanMinimize=�5	   	    � WindowStartupLocation$ CenterOwner=�6"   
������  � AllowsTransparency .  � WindowStyle$
 None=�5
   <   .��5      �� -   5         ��Name$ Border��5       �� Padding$ 2q�6    �� CornerRadius$ 5��6)   
�������._�5   
   �� $	��794��6   $	��595��6!   .+�5      � -   5        	 �Name$	 TitleBar��5       $��25��6   .+�5      �� $7��1pack://application:,,,/Resources/Images/icon8.png��6   $��14��6S   $��14��6_   $
��Left=�6j   $	��Top=�6�   $	��3 3q�6�   �� 5      $��11(�6   $����BookSharp | About and FAQ                                                                                                                                                                                                     ��6*   $��17��6  $
��Left=�6  $	��Top=�67  $��24 3 0 0q�6P  
 J� Opacity$

 0.85Q�6b  �� 5      -   5         ��Name$ CloseButton��5      $��15��6H   $��15��6T   
������ $��Right=�6x   $	��Top=�6�   $��0 2 1 0q�6�   .��5      �� -   5         ��Name$ Close��5      $8��2pack://application:,,,/Resources/Images/close2.png��6+   $��15��6g   $��15��6s   $��Center=�6~   $	
 0.7Q�6�   6�   5      �� 5      -   5        $ MinimizeButton��5      $��15��6O   $��15��6[   
������ $��Right=�6   $	��Top=�6�   $��0 2 18 0q�6�   .��5      �� -   5        $ Minimise��5      $;��5pack://application:,,,/Resources/Images/minimize2.png��6.   $��15��6n   $��Center=�6y   $	
 0.3Q�6�   6�   5      5      � 5       � ShowGridLines .   � RowDefinitions 5      �� 5      �� 5      $��5* �6$   .+�5      � $��0��6   .+�5!      � $	��100��6   $
��Left=�6'   ���	#FF303030.+�5"      �� -   5           RoundButtonStyle#��[  5"   :   $��14q�6d   .��5#      �� $;��5pack://application:,,,/Resources/Images/BackArrow.png��6$   $��30��6c   $��30��6o   $��18q�6z   $	
 0.8Q�6�   5$      5%      � 5'      $��98 0 0 0q�6   ���	#FF303030 .  .+�5(      �� $
��BACK��6$   $��16(�60   $��Italic$�6>   $��Center=�6Q   $��20q�6l   ���	#FFDEDEDE6x   5)      5+       � 5-      -   5          �Name$
 Main��5-   %   $��1��6     � NavigationUIVisibility$ Hidden=�63   $��Stretch=�6S   $��Stretch=�6o   5/      50      51      52      