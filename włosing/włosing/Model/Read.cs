using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.Model.Interfaces;

namespace włosing.Model
{
    internal class Read :IRead
    {
        public Quiz read()
        {
            String name = "";
            String question = "";
            String prompt = "";
            string answer = "";

            ObservableCollection<Question> q = new ObservableCollection<Question>();
            string filePath = @"quiz.txt";
            List<string> lines= File.ReadAllLines(filePath).ToList();
            name = lines[0];

            for (int i = 1; i < lines.Count; i+=3)
            {
                question = lines[i];
                prompt= lines[i+1];
                answer = lines[i + 2];

                Answer a = new Answer(double.Parse(answer));
                Question quest = new Question(question, a, prompt);
                q.Add(quest);
            }

            Quiz quiz = new Quiz(q, name);
            return quiz;
        }
    }
}
