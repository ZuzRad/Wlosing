   M S B A M L   `   `   `  ����C  ?włosing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:włosing.Viewswłosing.Views  5      7 clr-namespace:włosing.ViewModelwłosing.ViewModel  5      M+clr-namespace:włosing.ViewModel.Converterswłosing.ViewModel.Converters  6@       włosing.Views.Search   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      (localclr-namespace:włosing.Views  5      h dMicrosoft.Expression.Interactions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Ciex9http://schemas.microsoft.com/expression/2010/interactions  68   0	viewmodel clr-namespace:włosing.ViewModel  5      4cn+clr-namespace:włosing.ViewModel.Converters  6@     � 	Resources  5      @  :włosing.ViewModel.Converters.BooleanToVisibilityConverter    BooleanToVisibilityConverter��%   &	          5   
   6*   5      .��5      � ��5   
   �� 5       �� 
StartPoint$	 0,0&�6#    �� EndPoint$	 1,1&�64   .��5      �  � Color$ #d08d96��6    � Offset$
 0.25Q�6/   � 5      $ #F9E5D6��6   $	 1.0Q�6/   5      .+�5   
   �� ��6   �� *SelectedViewModel+�� 5   
   $	��800��5      $	��100��5      
������� �� Left$ 10��5      
 �� Top$ 0��5      $��	0,0,0,350q�5       �� 5"   
   -   5         ��Name$ wlosing��5"      ���#7f4c4d$��	 Cambria )�6<   $
��Wrap=�6S   $��Włosing��6g   $��60(�6v    �� TextAlignment$ Center=�6�   $��105,13,461,363q�6�   y�6�   �� 	 �� Path$	 
Visibility�
 �� 	Converter#
 [  5#      �� 5%   
   -   5         ��Name$
 quiz��5%      $��0q�6   
�������$��	 Cambria )�6�   $
��Quiz��6�   $
��Left=�6�   $��25(�6�   $��84��6�   $��430,376,0,36q�6  y�63   �� $	 
Visibility�#
 [  ��6  �� *UpdateViewCommand+��5&      �� 5'       �� Color$ #ba696c��6"     5)       �� 
TargetType �� Property �� Value��%_   '��       �� 5*      " ��6   .�5+      ��  �@��CornerRadius$ 20��65   5,      5-      5.      �� 51   
   -   5        $ accept��51      $��0q�6!   
�������$��	 Cambria )�6I   $��
Zatwierdź��6`   $
��Left=�6t   $��12(�6�   $��74��6�   $��84,365,0,55q�6�   y�6�   �� $	 
Visibility�#
 [  ��52      �� 53      $ #ba696c��6"     55      ��%_   '��       �� 56      " ��6   .�57      ��  �@��CornerRadius$ 18��65   58      59      .  (System.Windows.Interactivity.Interaction   Triggers 5:      /  )System.Windows.Interactivity.EventTrigger  5;         	EventName$ Click��6!   .  (System.Windows.Interactivity.TriggerBase   Actions. 5<      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6,   �� *SearchCommand+5=      5?      �� 5B   
   $��1q�5C      
�������$��220,174,56,88q�5D      y�6/   �� $	 
Visibility�#
 [  ._�5E      �� 
������� J� Opacity$	 0.3Q�5F      5G      �� 5I   
   -   5        $��listbox_prod��5I      
������ 
�������$��1q�5J   ?   ���#5e3a3a$ 1Q�6h   $��220,174,56,88q�6t   y�5I   '   �� $	 
Visibility�#
 [  ��5J   �   �� *SelectedProductsSource+ �� SelectedItem 6�   �� $	 SelectedProduct� 5P        5Q      $ SelectionChanged��6!   . 5R         6,   �� $	 ShowLabelCommand�5S      5U      �� 5X   
   -   5         ��Name$ comboBox_cena��5X      $��596,128,95,298q�6,    �� 
IsReadOnly$
 true��5Y       �� Text$
 Cena��6&   ���#5e3a3ay�5X   D   �� $	 
Visibility�#
 [   5Y   G   �� $	 	OrderType���6o   �� $	 PriceOrderSource�5[      �� 5]   
   -   5        $ comboBox_weg��5]      $��37,189,595,237q�6*   $
 true��5^      ���#5e3a3ay�5]   B   �� $	 
Visibility�#
 [  ��5^   ;   �� $	 VeganSource� 6d   �� $	 
VeganValue�5`      �� 5b   
   -   5        $ comboBox_kraj��5b      $��37,234,595,192q�6+   $
 true��5c      ���#5e3a3ay�5b   C   �� $	 
Visibility�#
 [   5c   ;   �� $	 SelectedCountry���6i   �� $	 CountriesSource�5e      �� 5g   
   -   5        $ comboBox_typ��5g      $��37,278,595,148q�6*   $
 true��5h      ���#5e3a3ay�5g   B   �� $	 
Visibility�#
 [   5h   ;   �� $	 SelectedType���6f   �� $	 TypesSource�5i      �� 5k   
   -	   5        $ comboBox_sklep��5k      $��37,323,595,103q�6+   $
 true��5l      ���#5e3a3ay�5k   C   �� $	 
Visibility�#
 [   5l   ;   �� $	 SelectedShop���6f   �� $	 ShopsSource�5n      �� 5p   
   -
   5         ��Name$ textBox_search��5p      $��Center=�6*   
�������$��1q�5q   N   
����������#5e3a3a$��235,128,235,298q�6�   $
{�True��6�   y�5p   _   �� $	 
Visibility�#
 [  ��5q      �� $	 NameOfProduct�.��6�     5r      ��%_   '��       �� 5s      " ��6   .�5t      ��  �@��CornerRadius$ 12��65   5u      5v      .��6!   5w      5�      5�      