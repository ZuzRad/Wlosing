using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.Model
{
    internal class Question
    {
        public string Quest { get; set; }
        public string Prompt { get; set; }
        public Answer Answer { get; set; }
        public Question(string Quest, Answer Answer, string Prompt)
        {
            this.Quest = Quest;
            this.Answer = Answer;
            this.Prompt = Prompt;
        }
 
    }
}
