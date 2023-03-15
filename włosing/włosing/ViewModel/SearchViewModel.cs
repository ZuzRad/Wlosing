using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using włosing;
using włosing.DAL.Entities;
using włosing.Model;
using włosing.ViewModel;
using włosing.ViewModel.Commands;
using włosing.ViewModels;

namespace włosing.ViewModel
{
    internal class SearchViewModel : BaseViewModel
    {
        #region prywatne pola

        private BaseViewModel selectedViewModel;
        private bool visibility = true;

        #endregion

        #region publiczne pola
        #region konstruktor
        public SearchViewModel()
        {
            UpdateViewCommand = new UpdateSearchViewCommand(this);
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
                visibility = false;
                OnPropertyChanged(nameof(Visibility));
                selectedViewModel = value;
                OnPropertyChanged(nameof(SelectedViewModel));

            }
        }

        public ICommand UpdateViewCommand { get; set; }


        public bool Visibility
        {
            get { return visibility; }
        }
        #endregion
        #region SearchManagerVM
        static SearchManager Searcher = new SearchManager();
        public ObservableCollection<string> ShopsSource
        {
            get => Searcher.SklepyCombo;
        }

        
        public ObservableCollection<string> TypesSource
        {
            get => Searcher.TypyCombo;
            
        }



        public ObservableCollection<string> CountriesSource
        {
            get => Searcher.KrajeCombo;
        }
        public List<string> VeganSource
        {
            get => Values.veganValues();
        }

        public List<string> PriceOrderSource
        {
            get => Values.priceValues();
        }
                
        private string _orderType = Values.priceValues()[0];
        public string OrderType
        {
            get => _orderType;
            set
            {
                _orderType = value;
                OnPropertyChanged(nameof(OrderType));
            }
        }
        private string _selectedShop = Searcher.SklepyCombo[0];
        public string SelectedShop
        {
            get => _selectedShop;
            set
            {
                _selectedShop = value;
                OnPropertyChanged(nameof(SelectedShop));
            }
        }

        private string _selectedType= Searcher.TypyCombo[0];
        public string SelectedType
        {
            get => _selectedType;
            set
            {
                _selectedType = value;
                OnPropertyChanged(nameof(SelectedType));
            }
        }
        private string _selectedCountry= Searcher.KrajeCombo[0];
        public string SelectedCountry
        {
            get => _selectedCountry;
            set
            {
                _selectedCountry = value;
                OnPropertyChanged(nameof(SelectedCountry));
            }
        }

        private string _nameOfProduct= "";
        public string NameOfProduct
        {
            get => _nameOfProduct;
            set
            {
                _nameOfProduct = value;
                OnPropertyChanged(nameof(NameOfProduct));
            }
        }

        private string _veganValue= Values.veganValues()[0];
        public string VeganValue
        {
                get => _veganValue;
            set
            {
                _veganValue = value;
                OnPropertyChanged(nameof(VeganValue));
            }
        }


        private RelayCommand _searchCommand = null;
        public RelayCommand SearchCommand
        {
            get
            {
                if (_searchCommand == null)
                    _searchCommand = new RelayCommand(a =>
                    {
                        ClickListItemIsEnabled = true;
                        SelectedProductsSource = Searcher.showListOfProducts(Searcher.selectProducts(SelectedShop, SelectedType,VeganValue,SelectedCountry,NameOfProduct,OrderType));
                        NameOfProduct = "";

                        I = 1;
                        OnPropertyChanged(nameof(NameOfProduct));
                        OnPropertyChanged(nameof(SelectedProductsSource));
                        OnPropertyChanged(nameof(ClickListItemIsEnabled));

                    }, a => true);
                return _searchCommand;
            }
        }

        private RelayCommand _showLabelCommand = null;
        public RelayCommand ShowLabelCommand
        {
            get
            {
                
                if (_showLabelCommand == null)
                    _showLabelCommand = new RelayCommand(a =>
                    {
                        if (I <= 1 || !ClickListItemIsEnabled) { 
                            I = 2; 
                            if (ClickListItemIsEnabled)
                            {

                                SelectedProductsSource = Searcher.showLabelOfProduct(SelectedProduct);
                               
                                ClickListItemIsEnabled = false;

                            }
                            else if (!ClickListItemIsEnabled)
                            {
                                if (SelectedProduct == " <- Powrót")
                                {

                                    SelectedProductsSource = Searcher.showListOfProducts(Searcher.selectProducts(SelectedShop, SelectedType, VeganValue, SelectedCountry, NameOfProduct, OrderType));

                                    ClickListItemIsEnabled = true;
                                    NameOfProduct = "";
                                    I = 1;
                                    OnPropertyChanged(nameof(NameOfProduct));

                                }
                            }
                        }
                        OnPropertyChanged(nameof(SelectedProductsSource));
                        OnPropertyChanged(nameof(ClickListItemIsEnabled));
                    }, a => true);
                return _showLabelCommand;
            }
        }
        private int I=1;
        private bool _clickListItemIsEnabled = true;
        public bool ClickListItemIsEnabled
        {
            get => _clickListItemIsEnabled;
            set
            {
                _clickListItemIsEnabled = value;
                OnPropertyChanged(nameof(ClickListItemIsEnabled));
            }
        }


        private string _selectedProduct;
        public string SelectedProduct { 
            get { return _selectedProduct; } 
            set 
            { 
                _selectedProduct = value; 
                OnPropertyChanged(nameof(SelectedProduct));
            } }
  

        private List<string> _selectedProductSource = Searcher.showListOfProducts(Searcher.Produkty);
        public List<string> SelectedProductsSource
        {
            get => _selectedProductSource;
            set
            {
                _selectedProductSource = value;
                OnPropertyChanged(nameof(SelectedProductsSource));
            }
        }
   
        #endregion


    }
}
