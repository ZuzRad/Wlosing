   M S B A M L   `   `   `  ����C  ?włosing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:włosingwłosing  5   	   7 clr-namespace:włosing.ViewModelwłosing.ViewModel  5   	   M+clr-namespace:włosing.ViewModel.Converterswłosing.ViewModel.Converters  5   	   /clr-namespace:włosing.Viewswłosing.Views  5	   	       włosing.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:włosing     5   	   /vm clr-namespace:włosing.ViewModel     5   	   :cn+clr-namespace:włosing.ViewModel.Converters     5   	   .viewsclr-namespace:włosing.Views     5	   	     � 
ResizeMode$  NoResize=�5   	    � Title$ 
MainWindow��5   	   $	��490��6   $	��820��6)    � DataContext 5      &   włosing.ViewModel.MainViewModel  5   
    � 	Resources 5      @  :włosing.ViewModel.Converters.BooleanToVisibilityConverter    BooleanToVisibilityConverter��%   &	          5   
   6*   5      .��5      � ��5   
   �� 5       �� 
StartPoint$	 0,0&�6#    �� EndPoint$	 1,1&�64   .��5      �  � Color$ #d08d96��6    � Offset$
 0.25Q�6/   � 5      $ #F9E5D6��6   $	 1.0Q�6/   5      .+�5   
   �� ��6   �� *SelectedViewModel+�� 5    
   $	��800��5!      $	��100��5"      
������� �� Left$ 10��5$      
	 �� Top$	 0��5%      $��	0,0,0,350q�5&      �� 5(   
   -   5        
 ��Name$
 wlosing��5(      ���#7f4c4d$��	 Cambria )�6<   $
��Wrap=�6S   $��Włosing��6g   $��60(�6v    �� TextAlignment$ Center=�6�   $��105,13,461,363q�6�   5)      �� 5+   
   -   5         ��Name$
 quiz��5+      $��0q�6   
�������$��	 Cambria )�6G   $
��Quiz��6^   $
��Left=�6m   $��30(�6�   $	��144��6�   $��209,160,0,236q�6�   $
��Quiz��6�   ��6�   �� *UpdateViewCommand+y�6�   ��  �� Path$ ButtonVisibility� �� 	Converter# [  ��5,      �� 5-       �� Color$ #ba696c��6"    5/       �� 
TargetType �� Property �� Value��%_   '��       �� 50      " ��6   .�51      ��  �@��CornerRadius$ 27��65   52      53      54      �� 56   
   -   5        $ search��56      $��0q�6!   
�������$��	 Cambria )�6�   $��Wyszukaj��6�   $
��Left=�6�   $��30(�6�   $	��144��6  $��445,160,0,236q�6  $��Search��6L  y�65   �� $ ButtonVisibility�# [  ��6&  �� *UpdateViewCommand+��57      �� 58      $ #ba696c��6"    5:      ��%_   '��       �� 5;      " ��6   .�5<      ��  �@��CornerRadius$ 27��65   5=      5>      5?      �� 5B   
   $��1q�5C      
�������$��194,261,194,61q�5D      y�61   �� $ ButtonVisibility�# [  ._�5E      �� 
������� J� Opacity$	 0.3Q�5F      $��0,0,-2,0q�6   5H      �� 5J   
   -   5        $	
 tip��5J      
�������$�� Monserrat )�65   $
��Wrap=�6N   $����Witaj w aplikacji Włosing, która pomoże ci rozwiązać Twoje włosowe problemy. Za pomocą Quiz'u aplikacja dobierze Ci spersonalizowaną pielęgnację, a wyszukiwarka pomoże znaleźć odpowiednie produkty.��5K      $��17(�5L      $ Center=�6"   $��211,271,211,71q�69   y�6Q   �� $ ButtonVisibility�# [  5M      5P      5]      