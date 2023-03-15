using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace włosing.Model
{

    internal class QuizAnalize
    {

        public List<List<double>> AddProblems()
        {
            List<List<double>> problems = new List<List<double>>();
        //proteiny
            problems.Add(new List<double>());
            problems[0].Add(1); //(1, 'Puszenie'),
            problems[0].Add(0); //(3, 'Matowosc'),
            problems[0].Add(0.5); //(4, 'Koltunienie'),
            problems[0].Add(1); //(5, 'Straczkowanie'),
            problems[0].Add(0); //(6, 'Suchosc'),
            problems[0].Add(0.5); //(7, 'Szorstkosc'),
            problems[0].Add(1); //(8, 'Nadmierne obciazenie'),
            problems[0].Add(0.5); //(9, 'lamanie sie wlosow'),
            problems[0].Add(0.5); //(10, 'Elektryzowanie'),
            problems[0].Add(1); //(11, 'Szybkie przetluszczanie'),

            //humektanty
            problems.Add(new List<double>());
            problems[1].Add(0); //(1, 'Puszenie'),
            problems[1].Add(0); //(3, 'Matowosc'),
            problems[1].Add(0); //(4, 'Koltunienie'),
            problems[1].Add(1); //(5, 'Straczkowanie'),
            problems[1].Add(1); //(6, 'Suchosc'),
            problems[1].Add(0.5); //(7, 'Szorstkosc'),
            problems[1].Add(1); //(8, 'Nadmierne obciazenie'),
            problems[1].Add(0); //(9, 'lamanie sie wlosow'),
            problems[1].Add(0.5); //(10, 'Elektryzowanie'),
            problems[1].Add(1); //(11, 'Szybkie przetluszczanie'),

            //emolienty
            problems.Add(new List<double>());
            problems[2].Add(1); //(1, 'Puszenie'),
            problems[2].Add(1); //(3, 'Matowosc'),
            problems[2].Add(1); //(4, 'Koltunienie'),
            problems[2].Add(0); //(5, 'Straczkowanie'),
            problems[2].Add(1); //(6, 'Suchosc'),
            problems[2].Add(1); //(7, 'Szorstkosc'),
            problems[2].Add(0); //(8, 'Nadmierne obciazenie'),
            problems[2].Add(1); //(9, 'lamanie sie wlosow'),
            problems[2].Add(1); //(10, 'Elektryzowanie'),
            problems[2].Add(0); //(11, 'Szybkie przetluszczanie'),

            return problems;
        }

        public ObservableCollection<double> SoftSet(ObservableCollection<double> ans, List<List<double>> prob)
        {
            ObservableCollection<double> sums=new ObservableCollection<double>();
            sums.Add(0);
            sums.Add(0);
            sums.Add(0);

            for (int i = 0; i < 3; i++)
            {
                
                for (int j = 0; j < ans.Count-1; j++) 
                {
                    
                    sums[i] += ans[j] * prob[i][j];
                   
                }
            }
           
            return sums;
        }

    }
}
