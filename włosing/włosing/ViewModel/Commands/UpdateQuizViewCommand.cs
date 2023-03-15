using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace włosing.ViewModel.Commands
{
    internal class UpdateQuizViewCommand : ICommand
    {
        private QuizViewModel viewModel;

        public UpdateQuizViewCommand(QuizViewModel viewModel)
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
