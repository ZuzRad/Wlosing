using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.Model
{
    internal class Values
    {
        static public List<string> veganValues()
        {
            List<string> values = new List<string>();
            values.Add("Wszystkie");
            values.Add("Wegański");
            values.Add("Niewegański");

            return values;
        }

        static public List<string> priceValues()
        {
            List<string> values = new List<string>();
            values.Add("Cena rosnąco");
            values.Add("Cena malejąco");

            return values;
        }

        static public List<string> priceValuesQuiz()
        {
            List<string> values = new List<string>();
            values.Add("Najtańsze");
            values.Add("Nieważne");
            values.Add("Najdroższe");

            return values;
        }
    }
}