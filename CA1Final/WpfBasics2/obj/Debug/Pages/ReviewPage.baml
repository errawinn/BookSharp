   M S B A M L   `   `   `  ����D  @BookSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:BookSharp.PagesBookSharp.Pages  5           BookSharp.Pages.ReviewPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:BookSharp.Pages     5      $	��467��5      $	��794��5	        N� Title$  
ReviewPage��5
      .��5      � $	��467��6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $
��5.5* �6   .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $9��3pack://application:,,,/Resources/Images/review2.png��6   $��Center=�6Y   $��19��6t   $��19��6�   $��35 0 0 0q�6�    J� Opacity$
 0.65Q�6�   �� 5      $��LEAVE A REVIEW��6   $��15(�6/    �� Padding$
 0 20q�6=   $
��20 7q�6L   ���	#FF0C0C0C$5��/pack://application:,,,/Resources/Fonts/#Corbert)�6q   5      �� 5   
   $��1��6    �� Padding$ 
22 0 22 22q�6   
������ ._�5      �� $ 15q�6   
������� �� CornerRadius$ 10��65   ._�5      � $��1��6   
������� 5      �� 5      $	��30* �6(   �� 5      $	��20* �6(   �� 5      $	��80* �6(   �� 5!      $	��30* �6(   .+�5(      � $��0��6   .+�5*      �� $��0��6$   $��0��61   $��Name:��6A   $��Bottom=�6N   $
��Left=�6i   $��65,0,0,8q�6�   $��12(�6�   ���	#FF4646466�   �� 5-      -   5         ��Name$ 
txtBoxName��5-   "   $��0��67   $��0��6D   $��23��6T   $��12(�6`   $	��190��6o   $��2q�6{   $��
180 0 40 6q�6�   $��Bottom=�6�   $
��Left=�6�   ���	#FF4646466�   5/      � 51      $��1��6   .+�52      �� $��0��6$   $��1��61   $��Purchased Tour:��6A   $��Bottom=�6X   $
��Left=�6s   $��65,0,0,8q�6�   $��12(�6�   ���	#FF4646466�   �� 53      -   5         ��Name$ comboBoxTourID��53   #   $��0��6;   $��1��6H   $��23��6Y   $��12(�6e   $	��190��6t   $��4q�6�   $��
180 0 40 6q�6�   $��Bottom=�6�   $
��Left=�6�   ���	#FF4646466�   �� 54      -   5        	 ��Name$	 ErrorTextBlock1��54   l   $��0��6$   $��1��61   $)��#You haven't purchased any tours yet��6A   $��Bottom=�6�   $
��Left=�6�   $��	395,0,0,8q�6�   $��12(�6�   ���	#FFEA29296�   55      � 5;      $��2��6   $��60 15 60 45q�6(   .+�5<      �� -   5        
 ��Name$
 ChildScroll��5<   '   $
��Auto=�6<   .��5>      �� -   5        $ txtBoxMessage��5>   &   $��4q�6=   $��12(�6I   
�������$q��kEnter your review of the tour you have purchased and it will be posted in the respective tour details page!��6m    �� TextWrapping$
 Wrap=�6�   $��2q�6�   6*  5@      5C      �� 5G      -   5        $	 ErrorTextBlock2��5G       $��4��6;   $��Please fill all boxes��6I   $	��Top=�6f   $
��Left=�6~   $��65,0,0,0q�6�   $��12(�6�   ���	#FFC50D0D6�   �� 5J      -   5         ��Name$ 
PostButton��5J   @   $��4��6   $��POST REVIEW��6*   $��45��6T   $	��140��6`   $	��Top=�6l   $��Right=�6�   $��0 0 55 0q�6�    � Cursor$
 Hand��6�   ���	#FF292929$��15(�6�   $
��Bold"�6�   $��Century Gothic)�6  5K      5M      5N      5O      5Q      