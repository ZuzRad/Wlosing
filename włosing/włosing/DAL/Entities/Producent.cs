using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.DAL.Entities
{
    internal class Producent
    {
        public int id_producent;
        public string nazwa;
        public string kraj;

        public Producent(MySqlDataReader reader)
        {
            id_producent = sbyte.Parse(reader["id_producent"].ToString());
            nazwa = reader["nazwa"].ToString();
            kraj = reader["kraj"].ToString();
        }

       
    }
}
