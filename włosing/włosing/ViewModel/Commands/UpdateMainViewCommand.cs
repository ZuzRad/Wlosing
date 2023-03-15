using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using włosing.ViewModel;

namespace włosing.Commands
{
    internal class UpdateMainViewCommand :ICommand
    {
        private MainViewModel viewModel;

        public UpdateMainViewCommand(MainViewModel viewModel)
        {
            this.viewModel = viewModel;
        }

        public event EventHandler CanExecuteChanged;

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public void Execute(object parameter)
        {
            if (parameter.ToString() == "Quiz")
            {
               
                viewModel.SelectedViewModel = new QuizViewModel();
            }
            else if (parameter.ToString() == "Search")
            {
                viewModel.SelectedViewModel = new SearchViewModel();
            }
        }
    }
}
