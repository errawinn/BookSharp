   M S B A M L   `   `   `  ����D  @BookSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:BookSharp.PagesBookSharp.Pages  5      !    BookSharp.Pages.WelcomePage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:BookSharp.Pages     5      $	��570��5      $	��794��5	   	     N� Title$  WelcomePage��5
       � 	Resources 5       �� BasedOn �� 
TargetType �� Property �� Value �� 
TargetType �� Triggers P� Property	 P� Value��%�  '��       7 ��� 5   
   8   " ��6N   .�5      ��  � ��
 �����6+   �� 5       � �� �	#FF3030306+   �� 5       � ��$ 0q�60   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $��0q�6K   ._�5      �� $��Center=�6/   $��Center=�6L   5      5      5       5      P� 5       �@J�IsMouseOver	 . . �5      ��  � �� �	#FF94C77163   �� 5       � ��
 �   �63   5      5       5!      .��5"      � 
�������
 � ColumnDefinitions
 5#   
   �� 5$      �� 5%      $��2* �6   �� 5&      .+�5)   
   �� $��1��6   $��
WELCOME TO��6$    �� TextAlignment$ Center=�66   $
��Wrap=�6M   $5��/pack://application:,,,/Resources/Fonts/#Corbert)�6b   $��Center=�6�   $��Center=�6�   $��20(�6�   $��Medium"�6�   ���	#FF303030$��	0 0 0 150q�6  �� 5+   
   $��1��6   $��	BOOKSHARP��6$   $ Center=�65   $
��Wrap=�6L   $5��/pack://application:,,,/Resources/Fonts/#Corbert)�6a   $��Center=�6�   $��Center=�6�   $��47(�6�   $��Medium"�6�   ���	#FF303030$��0 0 0 70q�6  �� 5,   
   $��1��6   $7��1pack://application:,,,/Resources/Images/City6.png��6    $��Bottom=�6[   $��Center=�6v   $	��200��6�   $	��400��6�   $��	0 0 10 90q�6�    J� Opacity$	 0.7Q�6�   �� 5/   
   -   5         ��Name$ CreateButton��5/      $��0��6>   $	��120��6O   $	��180��6\    � Cursor$
 Hand��6i   $��Right=�6w   $��
0 30 30 60q�6�   
������ .��50      �� -   5         ��Name$ Border1��50       �� CornerRadius$ 5��6&    �� Padding$ 2q�67   ���	#FFE0FFCB._�51      � $	��120��6   $	��180��6$   .+�53      �� -   5         ��Name$ create1��53      $:��4pack://application:,,,/Resources/Images/adduser1.png��6-   $��Center=�6k   $
��Left=�6�   $��20��6�   $��20��6�   $��	35 0 20 0q�6�   $	 0.7Q�6�   �� 54      $��Create Account��6!   $��Center=�67   $��Center=�6R   $��Medium"�6p   
���   �$3��-pack://application:,,,/Resources/Fonts/#Dense)�6�   $��20(�6�   $��30 0 0 0q�6�   $	 0.7Q�6�   �� 55      -   5        $ create2��55      $=��7pack://application:,,,/Resources/Images/rightarrow3.png��6-   $��Center=�6n   $
��Left=�6�   $��30��6�   $��30��6�   $��
60 60 20 0q�6�   $	 0.7Q�6�   $y�Hidden=�6�   z�56      �� 57       �� Angle$	 180Q�6.   59      5:      5;      5<      �� 5>   
   -   5        $ LoginButton��5>      $��2��6<   $	��120��6M   $	��180��6Z   $
 Hand��6g   $
��Left=�6u   $��
30 30 0 60q�6�   
������ .��5?      �� -   5        $ Border2��5?      $ 5��6&   $ 2q�67   ���	#FFE0FFCB._�5@      � $	��120��6   $	��180��6$   .+�5B      �� -   5        $ login1��5B      $7��1pack://application:,,,/Resources/Images/user1.png��6,   $��Center=�6g   $��Right=�6�   $��20��6�   $��20��6�   $��	20 0 35 0q�6�   $	 0.7Q�6�   $y�Visible=�6�   �� 5D      -   5        $ login2��5D      $=��7pack://application:,,,/Resources/Images/rightarrow3.png��6,   $��Center=�6m   $��Right=�6�   $��30��6�   $��30��6�   $��	20 0 30 0q�6�   $	 0.7Q�6�   $y�Hidden=�6�   �� 5G      $��Login to Account��6!   $��Center=�69   $��Center=�6T   $��Medium"�6r   
���   �$3��-pack://application:,,,/Resources/Fonts/#Dense)�6�   $��20(�6�   $��0 0 30 0q�6�   $	 0.7Q�6�   5I      5J      5K      5M      5O      