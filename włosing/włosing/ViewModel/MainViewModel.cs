using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using włosing;
using włosing.Model;
using włosing.Commands;

namespace włosing.ViewModel
{
    internal class MainViewModel : BaseViewModel
    {

        #region prywatne pola

        private BaseViewModel selectedViewModel; //wybrany viewmodel
        private bool buttonVisibility = true; //widoczność kontrolek

        #endregion

        #region publiczne pola
        #region Konstruktor
        public MainViewModel()
        {
            UpdateViewCommand = new UpdateMainViewCommand(this); //aktualizacja widoku

        }
        #endregion
        public BaseViewModel SelectedViewModel
        {
            get
            {

                return selectedViewModel;
            }
            set
            {

                buttonVisibility = false; //ukrycie kontrolek
                OnPropertyChanged(nameof(ButtonVisibility));
                selectedViewModel = value;
                OnPropertyChanged(nameof(SelectedViewModel));

            }
        }

        public ICommand UpdateViewCommand { get; set; }

        public bool ButtonVisibility
        {
            get { return buttonVisibility; }
        }
        #endregion
    }
}
