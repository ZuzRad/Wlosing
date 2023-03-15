using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using włosing;
using włosing.Commands;
using włosing.Model;
using włosing.ViewModel;
using włosing.ViewModel.Commands;
using włosing.DAL.Entities;
using włosing.ViewModels;

namespace włosing.ViewModel
{
    internal class QuizViewModel : BaseViewModel
    {

        public ICommand UpdateViewCommand { get; set; } //komenda zmieniająca viewmodel

        #region prywatne pola
        private BaseViewModel selectedViewModel;
        private double sumSoftSet;
        private bool resultVisibility = false;
        private bool quizVisibility = true;
        private string percentproteiny;
        private string percentemolienty;
        private string percenthumektanty;
        private double emolienty;
        private double humentanty;
        private double proteiny;
        private Model.QuizAnalize analize; //obiekt typu quizanalize do wywołania softsetu
        private ObservableCollection<double> softSet;
        private Model.Read load; //obiekt typu read do wczytania z pliku
        private Model.Quiz quiz; //obiekt typu quiz przechowujący kolekcje pytań
        private Model.Question question; //obiekt typu question przechowujący aktualny obiekt z pytaniem
        private string actualQuestion; //string z aktualnym pytaniem
        private string prompt; //string z aktualną podpowiedzią
        private Model.Answer answer; //obiekt typu answer z odpoiedzią
        private double userAnswer; //obiekt przechowujący aktualną odpowiedź
        private ObservableCollection<Question> collection; //kolekcja pytań
        private string name; //nzwa quizu
        private int indexOfQuestion = 0; //index pytania
        private ObservableCollection<double> answers;//tablica odpoiwedzi

        private RelayCommand infoCommand;
        private RelayCommand nextCommand; //komenda dalej
        #endregion

        #region publiczne pola
        #region konstruktor
        public QuizViewModel()
        {
            UpdateViewCommand = new UpdateQuizViewCommand(this);
            load = new Model.Read();
            quiz = load.read(); //wczytanie danych z pliku
            collection = quiz.Collection; //wyłuskanie wartości z obiektu Quiz
            name = quiz.Name;
            question = collection[indexOfQuestion];
            actualQuestion = question.Quest;
            prompt = question.Prompt;
            answer = question.Answer;
            userAnswer = answer.Ans;

            answers = new ObservableCollection<double>();
            analize = new Model.QuizAnalize();
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
                //ukrycie quizu i wyniku
                quizVisibility = false;
                OnPropertyChanged(nameof(QuizVisibility));
                resultVisibility = false;
                OnPropertyChanged(nameof(ResultVisibility));
                //zmiana wartości sekectedViewModel
                selectedViewModel = value;
                OnPropertyChanged(nameof(SelectedViewModel));

            }
        }
        public string Percentproteiny
        {
            get { return percentproteiny; }
        }

        public string Percentemolienty
        {
            get { return percentemolienty; }
        }

        public string Percenthumektanty
        {
            get { return percenthumektanty; }
        }
        public double Proteiny
        {
            get { return proteiny; }
        }

        public double Emolienty
        {
            get { return emolienty; }
        }

        public double Humentanty
        {
            get { return humentanty; }
        }

        public bool QuizVisibility
        {
            get { return quizVisibility; }
        }


        public bool ResultVisibility
        {
            get { return resultVisibility; }
        }

        public string ActualQuestion
        {
            get
            {
                return actualQuestion;
            }

        }

        public string Prompt
        {
            get
            {
                return prompt;
            }

        }


        public double UserAnswer
        {
            get
            {
                return userAnswer;
            }
            set
            {
                userAnswer = value;
                OnPropertyChanged(nameof(UserAnswer));

            }
        }

        public RelayCommand InfoCommand
        {
            get
            {
                if (infoCommand == null)
                    infoCommand = new RelayCommand(a =>
                    {
                        MessageBox.Show("Równowaga PEH (proteiny, emolienty, humektanty) jest to metoda pielęgnacji włosów, która zakłada dostarczanie im wszystkich wymaganych przez nie składników w odpowiednich dla nich proporcjach.Tymi składnikami są proteiny, emolienty i humektanty. Na widniejącym pasku możesz zobaczyć swoje proporcje tych składników.", "Czym jest PEH.", MessageBoxButton.OK);
                    }, a => true);
                return infoCommand;
            }
        }


        public RelayCommand NextCommand
        {
            get
            {
                if (nextCommand == null)
                    nextCommand = new RelayCommand(a =>
                    {
                        
                        answers.Add(userAnswer); //dodanie odpowiedzi użytkownika
                       
                        if (indexOfQuestion != collection.Count - 1)
                        {
                            indexOfQuestion++; //kolejne pytanie
                            question = collection[indexOfQuestion];
                            actualQuestion = question.Quest;
                            prompt = question.Prompt;
                            answer = question.Answer;
                            userAnswer = answer.Ans;
                            OnPropertyChanged(nameof(UserAnswer));
                            OnPropertyChanged(nameof(Prompt));
                            OnPropertyChanged(nameof(ActualQuestion));
                        }
                        else
                        { //wywołanie soft set'u na koniec quizu

                            softSet = analize.SoftSet(answers, analize.AddProblems());
                            //pokazanie kontrolek wyniku i schowanie quizu
                            quizVisibility = false;
                            OnPropertyChanged(nameof(QuizVisibility));
                            resultVisibility = true;
                            OnPropertyChanged(nameof(ResultVisibility));
                            //przypisanie wartości z softsetu
                            proteiny = softSet[0];
                            humentanty = softSet[1];
                            emolienty = softSet[2];
                            double helpproteiny = proteiny; //pomocnicze zmienne
                            double helphumentanty = humentanty;
                            double helpemolienty = emolienty;
                            sumSoftSet = emolienty + humentanty + proteiny; //suma wyników


                            proteiny = 610 * ((proteiny * 100) / sumSoftSet) / 100; //procentowa wartość paska - 530 to szerokość paska
                            humentanty = 610 * ((humentanty * 100) / sumSoftSet) / 100;
                            emolienty = 610 * ((emolienty * 100) / sumSoftSet) / 100;


                            percentemolienty = ((helpemolienty * 100) / sumSoftSet).ToString(); //procent do pojedyńczych pasków
                            if (((helpemolienty * 100) / sumSoftSet) > 15)
                                percentemolienty = "Emolienty " + percentemolienty[0].ToString() + percentemolienty[1].ToString();
                            else
                                percentemolienty = "E: " + percentemolienty[0].ToString();

                            percentproteiny = ((helpproteiny * 100) / sumSoftSet).ToString();
                            if (((helpproteiny * 100) / sumSoftSet) > 15)
                                percentproteiny = "Proteiny: " + percentproteiny[0].ToString() + percentproteiny[1].ToString();
                            else
                                percentproteiny = "P: " + percentproteiny[0].ToString();


                            percenthumektanty = ((helphumentanty * 100) / sumSoftSet).ToString();
                            if (((helphumentanty * 100) / sumSoftSet) > 15)
                                percenthumektanty = "Humektanty: " + percenthumektanty[0].ToString() + percenthumektanty[1].ToString();
                            else
                                percenthumektanty = "H: " + percenthumektanty[0].ToString();

                            OnPropertyChanged(nameof(Percentemolienty));
                            OnPropertyChanged(nameof(Percentproteiny));
                            OnPropertyChanged(nameof(Percenthumektanty));
                            OnPropertyChanged(nameof(Proteiny)); //zmiana wartości
                            OnPropertyChanged(nameof(Humentanty));
                            OnPropertyChanged(nameof(Emolienty));
                        }

                    }, a => true);
                return nextCommand;
            }
        }
        
        #endregion

        #region Filtrowanie wynikow i wyswietlanie wynikow
  

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
            get => Values.priceValuesQuiz();
        }

        private string _orderType = Values.priceValuesQuiz()[0];
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

        private string _selectedType = Searcher.TypyCombo[0];
        public string SelectedType
        {
            get => _selectedType;
            set
            {
                _selectedType = value;
                OnPropertyChanged(nameof(SelectedType));
            }
        }
        private string _selectedCountry = Searcher.KrajeCombo[0];
        public string SelectedCountry
        {
            get => _selectedCountry;
            set
            {
                _selectedCountry = value;
                OnPropertyChanged(nameof(SelectedCountry));
            }
        }

        private string _nameOfProduct = "";
        public string NameOfProduct
        {
            get => _nameOfProduct;
            set
            {
                _nameOfProduct = value;
                OnPropertyChanged(nameof(NameOfProduct));
            }
        }

        private string _veganValue = Values.veganValues()[0];
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
                        string TypeOfMask;
                        if (proteiny > humentanty & proteiny > emolienty)
                            TypeOfMask = "Maska proteinowa";
                        else if (humentanty > proteiny & humentanty > emolienty)
                            TypeOfMask = "Maska humektantowa";
                        else
                            TypeOfMask = "Maska emolientowa";
                        bool IfPeeling = false;
                        bool IfWcierka = false;
                        if (answers[answers.Count - 1] > 0.5)
                            IfWcierka = true;
                        if (answers[answers.Count - 2] > 0.5)
                            IfPeeling = true;

                        SelectedProductsSource = Searcher.showHairCareProducts(TypeOfMask,SelectedShop, SelectedType, VeganValue, SelectedCountry, NameOfProduct, OrderType, IfWcierka, IfPeeling);
                        OnPropertyChanged(nameof(SelectedProductsSource));

                    }, a => true);
                return _searchCommand;
            }
        }



      
        #endregion
        private List<string> _selectedProductSource;
        public List<string> SelectedProductsSource
        {
            get => _selectedProductSource;
            set
            {
                _selectedProductSource = value;
                OnPropertyChanged(nameof(SelectedProductsSource));
            }
        }



    }
}