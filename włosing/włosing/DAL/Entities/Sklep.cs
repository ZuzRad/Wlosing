using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.DAL.Entities
{
    internal class Sklep
    {

        public int id_sklep;
        public string nazwa;

        public Sklep(MySqlDataReader reader)
        {
            id_sklep = sbyte.Parse(reader["id_sklep"].ToString());
            nazwa = reader["nazwa"].ToString();
        }

        public override string ToString()
        {
            return nazwa;
        }
    }
}
