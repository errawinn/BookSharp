   M S B A M L   `   `   `  ����D  @BookSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:BookSharp.PagesBookSharp.Pages  5      (    "BookSharp.Pages.CreateAccountPage1   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:BookSharp.Pages     5      -   5        $	��570��5      $	��794��5	   	     N� Title$  CreateAccountPage1��5
       � 	Resources 5         RoundButtonStyleNoHover �� BasedOn �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius �� Triggers	 P� Property
 P� Value  
LightHover  	DarkHover��%�  &	        7 �&	 W    7 �&	 m    7 ��� 5   
   8   " ��6n   .�5      ��  � ��$ 0q�60   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $��0q�6!   #��z��5      $	 180��5      ._�5      �� $��Center=�6/   $��Center=�6L   5      5      5       5      P� 5      	 �@J�IsMouseOver
 . 5      5!      �� 5"   
   8   " ��6a   .�5#      ��  � �� �	#FF3030306+   �� 5$       � �� �	#FFDEDEDE6+   �� 5%       � ��$ 0q�60   �� 5&       � �� 5'      �� 5(      " ��6&   .R�5)      �� #��z��6!   $��0q�6K   ._�5*      �� $��Center=�6/   $��Center=�6L   5+      5,      5.       5/      P� 50      	 �@J�IsMouseOver
 . . �51      ��  � �� �	#FFECEAE263   �� 52       � �� �	#FF30303063   �� 53       � ��$ 0q�68   54      56      �� 58   
   8   " ��6`   .�59      ��  � �� �	#FF94C7716+   �� 5:       � �� �	#FF3030306+   �� 5;       � ��$ 0q�60   �� 5<       � �� 5=      �� 5>      " ��6&   .R�5?      �� #��z��6!   $��0q�6K   ._�5@      �� $��Center=�6/   $��Center=�6L   5A      5B      5D       5E      P� 5F      	 �@J�IsMouseOver
 . . �5G      ��  � �� �	#FF30303063   �� 5H       � �� �	#FFDEDEDE63   �� 5I       � ��$
 Bold"�63   5J      5L      5M      .��5N      �  � RowDefinitions 5O   
   �� 5P      �� 5Q      $��5* �6   .+�5U   
   � $��0��6    5V      �� 5W       � ColumnDefinitions 5Y      �� 5Z      $��* �6#   �� 5[      $��7* �6#   .+�5^      �� ���	#FF94C771.+�5_      �� $��0��6   $:��4pack://application:,,,/Resources/Images/adduser2.png��6&   $��Center=�6d   $��40��6   $
��0 30q�6�    J� Opacity$	 0.9Q�6�   5`      � 5b      $��0��6   $��1��6    ���	#FF303030.+�5c      �� $��CREATE NEW ACCOUNT��6   $��16(�66   $��Italic$�6D   $��Center=�6W   $��40q�6r   ���	#FFDEDEDE6~   5d      5e      � 5h   
   $��1��6   
������� 5i      �� 5j      $
��1.1* �6    �� 5k      $��5* �6    .+�5o      � $��0��6   ���	#FFECEAE2 � ShowGridLines .   5p      �� 5q      $
��1.5* �6'   �� 5r      $
��1.2* �6'   �� 5s      $��* �6'   �� 5t      $
��1.2* �6'   �� 5u      $��* �6'   �� 5v      $
��1.8* �6'   .+�5y      �� $��0��6   #��[  6)   ���	#FF94C771$��45��6q   $��45��6}   $��Center=�6�   $��Right=�6�   .��5z      �� $��1��6    $��Century Gothic)�6)   $��17(�6E   $
��Bold"�6S   $��Center=�6e   $��Center=�6�   ���	#FF3030306�   5{      �� 5|      $��1��6   $��Information��6,   $��Center=�6?   $��20q�6Z   $��Century Gothic)�6f   $��14(�6�   $
��Bold"�6�   ���	#FF3030306�   �� 5~      $��2��6   #��[  6)   ���	#FFBBBAB5$��45��6q   $��45��6}   $��Center=�6�   $��Right=�6�   $��
44,17,0,17q�6�   .��5      �� $��2��6    $��Century Gothic)�6)   $��17(�6E   $
��Bold"�6S   $��Center=�6e   $��Center=�6�   ���	#FF3030306�   5�      �� 5�      $��3��6   $��Payment��6,   $��Center=�6;   $��20q�6V   $��Century Gothic)�6b   $��14(�6~   $
��Bold"�6�   ���	#FF3030306�   �� 5�      $��4��6   #��[  6)   ���	#FFBBBAB5$��45��6q   $��45��6}   $��Center=�6�   $��Right=�6�   .��5�      �� $��3��6    $��Century Gothic)�6)   $��17(�6E   $
��Bold"�6S   $��Center=�6e   $��Center=�6�   ���	#FF3030306�   5�      �� 5�      $��5��6   $��Confirm��6,   $��Center=�6;   $��20q�6V   $��Century Gothic)�6b   $��14(�6~   $
��Bold"�6�   ���	#FF3030306�   5�      �� 5�      $��1��6    �� Padding$ 
22 0 22 22q�6"   ���	#FFECEAE2._�5�      �� $ 15q�6   
�������$ 20��6:   ._�5�      � 
������� 5�      �� 5�      $��* �6,   �� 5�      $��* �6,   �� 5�      $��* �6,   �� 5�      $��* �6,   �� 5�      $��* �6,   �� 5�      $��* �6,   �� 5�      $��* �6,   �� 5�      $��* �6,    5�      �� 5�      $��* �6/   �� 5�      $��2* �6/   �� 5�      $��* �6/   �� 5�      $
��2.3* �6/   .+�5�      �� $��0��6$   $��0��61   $��First Name:��6A   $	��Top=�6T   $��Right=�6l   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��1��6$   $��0��61   $��
Last Name:��6A   $	��Top=�6S   $��Right=�6k   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��2��6$   $��0��61   $��Email:��6A   $	��Top=�6O   $��Right=�6g   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��3��6$   $��0��61   $��Phone:��6A   $	��Top=�6O   $��Right=�6g   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��4��6$   $��0��61   $��Date Of Birth:��6A   $	��Top=�6W   $��Right=�6o   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��5��6$   $��0��61   $��Country:��6A   $	��Top=�6Q   $��Right=�6i   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��6��6$   $��0��61   $��
Town/City:��6A   $	��Top=�6S   $��Right=�6k   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��7��6$   $��0��61   $��Nationality:��6A   $	��Top=�6U   $��Right=�6m   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��0��6$   $��2��61   $��Address:��6A   $	��Top=�6Q   $��Right=�6i   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��1��6$   $��2��61   $��Postal Code:��6A   $	��Top=�6U   $��Right=�6m   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��3��6$   $��2��61   $��	Username:��6A   $	��Top=�6R   $��Right=�6j   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��4��6$   $��2��61   $��	Password:��6A   $	��Top=�6R   $��Right=�6j   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      $��5��6$   $��2��61   $��Confirm Password:��6A   $	��Top=�6Z   $��Right=�6r   $��0 5 0 10q�6�   $��13(�6�   $��Medium"�6�   �� 5�      -   5         ��Name$ txtBoxFName��5�   "   $��1��67   $��11(�6G   $��20��6U   $	��150��6a   $��	10,0,0,17q�6m   $��Bottom=�6�   $
��Left=�6�   6�   �� 5�      -   5         ��Name$ txtBlockFNameError��5�   $   $y�Hidden=�6@   $��0��6T   $��1��6a   $0��*Please enter a name (without a '*' symbol)��6q   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5�      -   5        $ txtBoxLName��5�   "   $��1��67   $��1��6D   $��11(�6T   $��20��6b   $	��150��6n   $��10 5 0 0q�6z   $	��Top=�6�   $
��Left=�6�   6�   �� 5�      -   5        $ txtBlockLNameError��5�   $   $y�Hidden=�6@   $��1��6T   $��1��6a   $0��*Please enter a name (without a '*' symbol)��6q   $
��Left=�6�   $��	10,25,0,3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5�      -   5        $ txtBoxEmail��5�   "   $��e.g. xxxxxx@gmail.com��67   
�������$��2��6j   $��1��6w   $��11(�6�   $��20��6�   $	��150��6�   $��10 5 0 0q�6�   $	��Top=�6�   $
��Left=�6�   6  �� 5�      -   5        $ txtBlockEmailError1��5�   $   $y�Hidden=�6A   $��2��6U   $��1��6b   $(��"Please enter a valid email address��6r   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5�      -   5        $ txtBlockEmailError2��5�   $   $y�Hidden=�6A   $��2��6U   $��1��6b   $��Email address is taken��6r   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5�      -	   5        $ txtBlockEmailMsg��5�   $   $��2��6>   $��1��6K   $y�Hidden=�6[   $��Email is available��6o   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FF21B6136�   �� 5�      -
   5        $ txtBoxPhone��5�   "   $��3��67   $��1��6D   $��e.g. 91234567��6T   
�������$��11(�6   $��20��6�   $	��150��6�   $��10 5 0 0q�6�   $	��Top=�6�   $
��Left=�6�   6  �� 5�      -   5        $ txtBlockPhoneError��5�   $   $��3��6@   $��1��6M   $y�Hidden=�6]   $5��/Please enter a number (without symbols/letters)��6q   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036   �� 5�      -   5        $ txtBoxDOBDay��5�   "   $��dd��68   
�������$��4��6Y   $��1��6f   $��11(�6v   $��20��6�   $��40��6�   $��10 5 0 0q�6�   $	��Top=�6�   $
��Left=�6�   6  �� 5�      -   5        $ txtBoxDOBMonth��5�   "   $��mm��6:   
�������$��4��6Z   $��1��6g   $��11(�6w   $��20��6�   $��40��6�   $��65 5 0 0q�6�   $	��Top=�6�   $
��Left=�6�   6  �� 5�      -   5        $ txtBoxDOBYear��5�   "   $
��yyyy��69   
�������$��4��6\   $��1��6i   $��11(�6y   $��20��6�   $��40��6�   $��	120 5 0 0q�6�   $	��Top=�6�   $
��Left=�6�   6  �� 5�      -   5        $ txtBlockDOBError��5�   $   $��4��6>   $��1��6K   $y�Hidden=�6[   $��Please enter a valid date��6o   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5�      -   5         ��Name$ comboBoxCountry��5�   #   $��5��6<   $��1��6I   $��11(�6Z   $��20��6h   $	��150��6t   $��10 5 0 0q�6�   $	��Top=�6�   $
��Left=�6�   6�   �� 5�      -   5        $ txtBlockCountryError��5�   $   $��5��6B   $��1��6O   $y�Hidden=�6_   $ ��Please choose your country��6s   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5�      -   5        $ 
txtBoxCity��5�   "   $��6��66   $��1��6C   $��11(�6S   $��20��6a   $	��150��6m   $��10 5 0 0q�6y   $	��Top=�6�   $
��Left=�6�   6�   �� 5�      -   5        $ txtBlockCityError��5�   $   $y�Hidden=�6?   $��6��6S   $��1��6`   $4��.Please enter a valid town (no numbers/symbols)��6p   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5�      -   5        $ comboBoxNationality��5�   #   $��7��6@   $��1��6M   $��11(�6^   $��20��6l   $	��150��6x   $��10 5 0 0q�6�   $	��Top=�6�   $
��Left=�6�   6�   �� 5�      -   5        $ txtBlockNationalityError��5�   $   $y�Hidden=�6F   $��7��6Z   $��1��6g   $$��Please choose your nationality��6w   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5�      -   5        $ txtBoxAddress��5�   "   $��0��69   $��3��6F   $��11(�6V   $��20��6d   $	��150��6p   $��10 5 0 0q�6~   $	��Top=�6�   $
��Left=�6�   6�   �� 5�      -   5        $ txtBlockAddressError��5�   $   $��0��6B   $��3��6O   $y�Hidden=�6_   $B��<Please enter a valid address (letters and digits and no '*')��6t   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6  ���	#FFEC03036  �� 5     -   5        $ txtBoxPostalCd��5  "   $��1��6:   $��3��6G   $��11(�6W   $��20��6e   $	��150��6q   $��10 5 0 0q�6   $	��Top=�6�   $
��Left=�6�   6�   �� 5     -   5        $ txtBlockPostalCdError1��5  $   $��1��6D   $��3��6Q   $y�Hidden=�6a   $A��;Please enter a valid postal code with at least 4 characters��6u   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6  ���	#FFEC03036  �� 5     -   5        $ txtBlockPostalCdError2��5  $   $��1��6D   $��3��6Q   $y�Hidden=�6a   $C��=Please enter a valid postal code (without '*' char or spaces)��6v   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6  ���	#FFEC03036  �� 5     -   5        $ txtBoxUserName��5  "   $��3��6:   $��4��6G   $��11(�6W   $��20��6e   $	��150��6q   $��10 5 0 0q�6   $	��Top=�6�   $
��Left=�6�   6�   �� 5
     -   5        $ txtBlockUsernameError1��5
  $   $y�Hidden=�6D   $��3��6X   $��4��6e   $��Username is taken��6u   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5     -   5        $ txtBlockUsernameError2��5  $   $��3��6D   $��4��6Q   $y�Hidden=�6a   $.��(Username must be between 4-15 characters��6u   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5     -   5        $ txtBlockUsernameError3��5  $   $��3��6D   $��4��6Q   $y�Hidden=�6a   $9��3Username must contain a letter and no '*' or spaces��6u   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036  �� 5     -   5        $ txtBlockUsernameMsg��5  $   $��3��6A   $��4��6N   $y�Hidden=�6^   $��Username is available��6r   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FF21B6136�   G� 5     -    5         G�Name$ txtBoxPW��5  &   $��4��68   $��4��6E   $��20��6U   $	��150��6a   $��10 5 0 0q�6m   $	��Top=�6   $
��Left=�6�   6�   �� 5     -!   5        $ txtBlockPWError1��5  $   $��4��6>   $��4��6K   $y�Hidden=�6[   $:��4Please enter a password between 8 and 24 characters ��6o   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036  �� 5     -"   5        $ txtBlockPWError2��5  $   $��4��6>   $��4��6K   $y�Hidden=�6[   $:��4Please enter a password with both letters and digits��6o   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036  �� 5     -#   5        $ txtBlockPWError3��5  $   $��4��6>   $��4��6K   $y�Hidden=�6[   $=��7Please enter a password with no '*' character or spaces��6p   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036  G� 5     -$   5        $ txtBoxConfirmPW��5  &   $��5��6?   $��4��6L   $��20��6\   $	��150��6h   $��10 5 0 0q�6v   $	��Top=�6�   $
��Left=�6�   6�   �� 5     -%   5        $ txtBlockConfirmPWError��5  $   $��5��6D   $��4��6Q   $y�Hidden=�6a   $��Passwords do not match��6v   $��Bottom=�6�   $
��Left=�6�   $��10 5 0 3q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5     -&   5        $ txtBlockGeneralError��5  $   $��6��6B   $��4��6O   $��Please fill all boxes��6`   $y�Hidden=�6}   $��Bottom=�6�   $
��Left=�6�   $��	10 5 0 15q�6�   $	��9.5(�6�   ���	#FFEC03036�   �� 5      -'   5        #��[ 5   !   $��7��6F   $��4��6S   $��35��6c   $	��110��6o   $��Cancel��6{   $��12(�6�   $��Century Gothic)�6�   $��Center=�6�   $
��Left=�6�   $��0q�6�    � Cursor$
 Hand��6�   6  �� 5"     -(   5        #��[ 5"  !   $��7��6D   $��4��6R   $��35��6b   $	��110��6n   $��	NEXT PAGE��6z   $
��12.5(�6�   $��Century Gothic)�6�   $��Center=�6�   $��Right=�6�   $��0 0 10 0q�6�   $
 Hand��6  6  5$     5%     5&     5'     5*     5+     