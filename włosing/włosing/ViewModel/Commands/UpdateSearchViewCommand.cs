using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace włosing.ViewModel.Commands
{
    internal class UpdateSearchViewCommand :ICommand
    {
        private SearchViewModel viewModel;

        public UpdateSearchViewCommand(SearchViewModel viewModel)
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

          viewModel.SelectedViewModel = new QuizViewModel();
            
        }
    }
}
