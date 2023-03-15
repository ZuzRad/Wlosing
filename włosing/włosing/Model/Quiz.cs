using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.Model
{
    internal class Quiz
    {
        public ObservableCollection<Question> Collection { get; set; }
        public string Name { get; set; }

        public Quiz(ObservableCollection<Question> Collection, string Name)
        {
            this.Collection = Collection;
            this.Name = Name;
        }

    }
}
