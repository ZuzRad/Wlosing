using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.DAL.Entities
{
    internal class Problem
    {
        public int id_problem;
        public string nazwa;

        public Problem(MySqlDataReader reader)
        {
            id_problem = sbyte.Parse(reader["id_problem"].ToString());
            nazwa = reader["nazwa"].ToString();
        }
        public override string ToString()
        {
            return nazwa;
        }
    }
}
