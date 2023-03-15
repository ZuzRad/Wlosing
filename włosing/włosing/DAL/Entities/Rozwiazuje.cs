using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.DAL.Entities
{
    internal class Rozwiazuje
    {
        public int id_typ, id_problem;

        public Rozwiazuje(MySqlDataReader reader)
        {
     
            id_typ = sbyte.Parse(reader["id_typ"].ToString());
            id_problem = sbyte.Parse(reader["id_problem"].ToString());
        }
    }
}
