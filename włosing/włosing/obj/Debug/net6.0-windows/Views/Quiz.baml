   M S B A M L   `   `   `  ����C  ?włosing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:włosing.Viewswłosing.Views  5      7 clr-namespace:włosing.ViewModelwłosing.ViewModel  68   M+clr-namespace:włosing.ViewModel.Converterswłosing.ViewModel.Converters  5          włosing.Views.Quiz   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      .localclr-namespace:włosing.Views     5      6	viewmodel clr-namespace:włosing.ViewModel     68   :cn+clr-namespace:włosing.ViewModel.Converters     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  6D     � 	Resources  5      @  :włosing.ViewModel.Converters.BooleanToVisibilityConverter    BooleanToVisibilityConverter��%   &	          5   
   6*   5      .��5      � ��5   
   �� 5       �� 
StartPoint$	 0,0&�6#    �� EndPoint$	 1,1&�64   .��5      �  � Color$ #d08d96��6    � Offset$
 0.25Q�6/   � 5      $ #F9E5D6��6   $	 1.0Q�6/   5      .+�5   
   �� ��6   �� *SelectedViewModel+�� 5   
   $	��800��5      $	��100��5      
������� �� Left$ 10��5!      
 �� Top$ 0��5"      $��	0,0,0,350q�5#      �� 5)   
   -   5         ��Name$
 next��5)      $��0q�6�   
�������$��	 Cambria )�6�   $��Dalej��6�   $
��Left=�6�   $��23(�6  $��92��6  $��325,349,0,59q�6(  y�6   ��  �� Path$ QuizVisibility�	 �� 	Converter#	 [  ��6�   �� *NextCommand+��5*      �� 5+      
 �� Color$
 #ba696c��6"     5-       �� 
TargetType �� Property �� Value��%_   '��       �� 5.      " ��6   .�5/      ��  �@��CornerRadius$ 27��65   50      51      52      �� 55   
   $��1q�56      
�������$��65,131,124,255q�57      y�61   �� $ QuizVisibility�#	 [  ._�58      �� 
������� J� Opacity$	 0.3Q�59      $��0,0,-2,0q�6   y�6-   �� $ QuizVisibility�#	 [  5:      �� 5<   
   -   5         ��Name$	 tip��5<      ���#5e3a3a$�� Monserrat )�6\   $
��Wrap=�6u   $
��Left=�5=      $	��Top=�60   $��22(�5>       �� TextAlignment$ Center=�6"   $��180,150,0,0q�69   ��5<   7   �� $ ActualQuestion�y�5>   N   �� $ QuizVisibility�#	 [  5?      �� 5A   
   $��1q�5B      
�������$��693,140,62,264q�5C      y�61   �� $ QuizVisibility�#	 [  ._�5D      �� 
�������$	 0.3Q�5E      $��0,0,-1,0q�6    � ToolTip 5F      �� $ Prompt�5G      �� 5I   
   -   5        $ quest��5I      
�������$�� Monserrat )�66   $
��Wrap=�6O   $��?��5J      $
��Left=�6   $	��Top=�68   $��22(�5K      $ Center=�6   $��711,150,0,0q�6&    6;   �� $ Prompt�y�6[   �� $ QuizVisibility�#	 [  5L      �� 5N   
   -   5        $��RectangleHeight��5N      $��94,247,0,166q�6)   $	��554��5O       �� Orientation$ 
Horizontal=�6   $
��Left=�6(    � Minimum$ 0Q�5P   2    � Maximum$ 1Q�6>    � SmallChange$	 0.5Q�5Q       � LargeChange$ 1Q�6    �� TickPlacement$ BottomRight=�5R       �� TickFrequency$	 0.5Q�6    � Value 5P      �� $ 
UserAnswer� �� Mode$ TwoWay=�y�5R   3   �� $ QuizVisibility�#	 [  �� 5U   
   ���#5e3a3a$
��Left=�6#   $��100,254,0,194q�5V      $
��Auto��5W      ��5X      ��  �� ElementName$ RectangleWidth��$ Value��� 5Z   
   -   5        $ wcale��5Z      ���#5e3a3a$�� Monserrat )�69   $
��Wrap=�6R   $��Wcale��5[      $
��Left=�6!   $	��Top=�6<   $��19(�5\      $ Center=�6   $��
75,283,0,0q�6&   y�6:   �� $ QuizVisibility�#	 [  5]      �� 5_   
   -   5        $ cp��5_      ���#5e3a3a$�� Monserrat )�66   $
��Wrap=�6O   $��Ciężko powiedzieć��5`      $
��Left=�6-   $	��Top=�6H   $��19(�5a      $ Center=�6   $��294,283,0,0q�6&   y�6;   �� $ QuizVisibility�#	 [  5b      �� 5d   
   -   5        $ bardzo��5d      ���#5e3a3a$�� Monserrat )�6:   $
��Wrap=�6S   $��Bardzo��5e      $
��Left=�6"   $	��Top=�6=   $��19(�5f      $ Center=�6   $��618,283,0,0q�6&   y�6;   �� $ QuizVisibility�#	 [  5g      �� 5k   
   -   5        $ search��5k      $��0q�6�   
�������$��	 Cambria )�6�   $��Wyszukiwarka��6�   $
��Left=�6�   $��16(�6�   $	��102��6  $��450,391,0,21q�6  $��Search��6O  y�6!   �� $ ResultVisibility�#	 [  ��6)  �� *UpdateViewCommand+��5l      �� 5m      $
 #ba696c��6"     5o      ��%_   '��       �� 5p      " ��6   .�5q      ��  �@��CornerRadius$ 22��65   5r      5s      5t      �� 5v   
   -	   5        $ Wyk_pon��5v      $
��Quiz��6I   $��0q�6�   
�������$��	 Cambria )�6�   $��Wykonaj ponownie��6  $
��Left=�6"  $��16(�6=  $	��150��6K  $��38��6W  $��200,391,0,21q�6d  ��6#   �� *UpdateViewCommand+y�6a   �� $ ResultVisibility�#	 [  ��5w      �� 5x      $
 #ba696c��6"     5z      ��%_   '��       �� 5{      " ��6   .�5|      ��  �@��CornerRadius$ 22��65   5}      5~      5      �� 5�   
   -
   5        $ tt��5�      ���#5e3a3a$��	 Cambria )�66   $
��Wrap=�6M   $X��ROto twój wynik. Kliknij przycisk podpowiedzi, aby dowiedzieć się czym jest PEH.��5�      $
��Left=�6k   $	��Top=�6�   $��16(�5�      $ Center=�6   $��
99,104,0,0q�6&   y�5�   a   �� $ ResultVisibility�#	 [  5�   <   �� 5�   
   -   5        $ ss��5�      ���#5e3a3a$��	 Cambria )�66   $
��Wrap=�6M   $(��"Wybierz parametry swojego zestawu:��5�      $
��Left=�6>   $	��Top=�6Y   $��16(�5�      $ Center=�6   $��
99,156,0,0q�6&   y�5�   a   �� $ ResultVisibility�#	 [  5�   <   �� 5�   
   -   5        $ accept��5�      $��0q�6�   
�������$��	 Cambria )�6�   $��
Zatwierdź��6�   $
��Left=�6�   $��15(�6�   $��75��6  $��647,178,0,242q�6  y�6!   �� $ ResultVisibility�#	 [  ��5�      �� 5�      $
 #ba696c��6"     5�      ��%_   '��       �� 5�      " ��6   .�5�      ��  �@��CornerRadius$ 18��65   5�      5�      .  (System.Windows.Interactivity.Interaction   Triggers 5�      /  )System.Windows.Interactivity.EventTrigger  5�         	EventName$ Click��6!   .  (System.Windows.Interactivity.TriggerBase   Actions. 5�      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6,   �� *SearchCommand+5�      5�      �� 5�   
   $��1q�5�      
�������$��75,225,74,79q�5�      y�6.   �� $ ResultVisibility�#	 [  ._�5�      �� 
�������$	 0.3Q�5�      5�      �� 5�   
   -   5        $��listbox_prod��5�      
������ 
�������$��1q�5�   ?   ���#5e3a3a$ 1Q�6h   $��75,225,74,79q�6t   y�5�   '   �� $ ResultVisibility�#	 [  ��5�      �� $ SelectedProductsSource�5�      �� 5�   
   -   5          ��Name$  comboBox_cena��5�      $��507,181,170,245q�6+   ! �� 
IsReadOnly$
! true��5�      " �� Text$
" Cena��6&   ���#5e3a3ay�5�   D   �� $ ResultVisibility�#	 [  ��5�      �� $ PriceOrderSource�# �� SelectedItem# 6A   �� $ 	OrderType�5�      �� 5�   
   -   5        $  comboBox_weg��5�      $��367,181,310,245q�6*   $
! true��5�      ���#5e3a3ay�5�   C   �� $ ResultVisibility�#	 [  ��5�      �� $ VeganSource�# 6<   �� $ 
VeganValue�5�      �� 5�   
   -   5        $  comboBox_kraj��5�      $��226,181,451,245q�6+   $
! true��5�      ���#5e3a3ay�5�   D   �� $ ResultVisibility�#	 [  ��5�   ;   �� $ CountriesSource�# 6h   �� $ SelectedCountry�5�      �� 5�   
   -   5        $  comboBox_dost��5�      $��84,181,593,245q�6+   $
! true��5�      ���#5e3a3a$ J� RenderTransformOrigin$$ 0.512,1.417&�6;   y�5�   C   �� $ ResultVisibility�#	 [  ��5�      �� $ ShopsSource�# 6<   �� $ SelectedShop�5�      �� 5�   
   -   5        $	 que��5�      $��0q�6   
�������$��	 Cambria )�6e   $��?��6�   $
��Left=�6�   $��16(�6
  $��22��6  $��695,126,0,300q�6#  ��62   �� *InfoCommand+y�6|   �� $ ResultVisibility�#	 [  ��5�      �� 5�      $
 #ba696c��6"     5�      ��%_   '��       �� 5�      " ��6   .�5�      ��  �@��CornerRadius$ 22��65   5�      5�      5�      �� 5�   
   $��75,127,0,301q�6   $
��Left=�6,   $	��610��6G   % �� Orientation$% 
Horizontal=�6S   y�6l   �� $ ResultVisibility�#	 [  .+�5�      �� $��1q�6   
�������y�6=   �� $ ResultVisibility�#	 [  ._�5�      �� -   5        $ Proteiny��5�      $
��Wrap=�6�   ���#a1cacb$ Center=�6�   $��21��6�   y�6.   �� $ ResultVisibility�#	 [  ��6�   �� $ Proteiny���6  �� $ Percentproteiny�5�      �� 5�      $��1q�6   
�������y�6=   �� $ ResultVisibility�#	 [  ._�5�      �� -   5        $ 	Emolienty��5�      $
��Wrap=�6�   ���#78abad$ Center=�6�   $��21��6�   y�6/   �� $ ResultVisibility�#	 [  ��6�   �� $ 	Emolienty���6  �� $ Percentemolienty�5�      �� 5�      $��1q�6   
�������y�6=   �� $ ResultVisibility�#	 [  ._�5�      �� -   5        $ 
Humektanty��5�      $
��Wrap=�6�   ���#649799$ Center=�6�   $��21��6�   y�60   �� $ ResultVisibility�#	 [  ��6�   �� $ 
Humentanty���6  �� $ Percenthumektanty�5�      5�      5�      5�      