   M S B A M L   `   `   `  ����D  @BookSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:BookSharp.PagesBookSharp.Pages  5      "    BookSharp.Pages.FeedbackPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:BookSharp.Pages     5      $	��467��5      $	��800��5	        N� Title$  FeedbackPage��5
      .��5      � $	��467��6    � RowDefinitions 5   
   �� 5      $��* �6   .+�5   
   �� $��1��6    �� Padding$ 22q�6   
������ ._�5      �� $ 15q�6   
������� �� CornerRadius$ 10��65   ._�5      � $��1��6   
������� 5      �� 5      $	��35* �6(   �� 5      $	��30* �6(   �� 5      $
��130* �6(   �� 5      $	��53* �6(   .+�5#      � $��0��6    � ColumnDefinitions 5$      �� 5%      �� 5&      .+�5(      �� $��0��6$   $��0��61   $��Name:��6A   $��Bottom=�6N   $
��Left=�6i   $��65,0,0,0q�6�   $��12(�6�   ���	#FF4646466�   �� 5)      $��0��6$   $��1��61   $��Email:��6A   $��Bottom=�6O   $
��Left=�6j   $��55,0,0,0q�6�   $��12(�6�   ���	#FF4646466�   �� 5+      -   5         ��Name$ txtBlockName��5+   $   $��0��6;   $��0��6H   $��12(�6X   $	��250��6g   $��0 0 0 0q�6u   $��Bottom=�6�   $��Right=�6�   ���	#FF4646466�   �� 5,      -   5        $ txtBlockEmail��5,   $   $��0��6;   $��1��6H   $��12(�6X   $	��195��6g   $��0 0 55 0q�6u   $��Bottom=�6�   $��Right=�6�   ���	#FF4646466�   5-      �� 50      -   5         ��Name$ txtBoxTitle��50      $��1��63   $��12(�6@   $��Title��6N   
�������$��4q�6q   $��30��6}   $��	60 0 60 0q�6�   $��Bottom=�6�   $��Stretch=�6�   $��2q�6�   6	  � 55      $��2��6   $��60 10 60 30q�6(   .+�56      �� -   5         ��Name$ ChildScroll��56   '   $
��Auto=�6<   .��58      �� -   5        $ txtBoxMessage��58   &   $��4q�6=   $��12(�6I   
�������$A��;Enter your query here and we will reply to you via email...��6m    �� TextWrapping$
 Wrap=�6�   $��2q�6�   6�   5:      5=      �� 5A      -   5        $ ErrorTextBlock��5A       $��4��6:   $��Please fill all boxes��6H   $	��Top=�6e   $
��Left=�6}   $��65,0,0,0q�6�   $��12(�6�   ���	#FFC50D0D$y�Hidden=�6�   �� 5C      -   5        	 ��Name$	 CancelButton��5C   ^      	GreyStyle#��[  6   $��4��6@   $��CANCEL��6M   $��15(�6t   $
��Bold"�6�   $��Century Gothic)�6�   $��2��6�   $��45��6�   $	��140��6�   $	��Top=�6�   $��Right=�6�   $��	0 0 210 0q�6  
 � Cursor$

 Hand��6!  6/  �� 5E      -   5        $	 
SendButton��5E   9   $��4��6   $
��SEND��6*   $��45��6M   $	��140��6Y   $	��Top=�6e   $��Right=�6}   $��0 0 55 0q�6�   $

 Hand��6�   ���	#FF292929$��15(�6�   $
��Bold"�6�   $��Century Gothic)�6
  5F      5H      5I      5J      5L      