using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.DAL.Entities
{
    internal class JestDostepne
    {

        public int  id_produkt, id_sklep;

        public JestDostepne(MySqlDataReader reader)
        {
            id_produkt = sbyte.Parse(reader["id_produkt"].ToString());
            id_sklep = sbyte.Parse(reader["id_sklep"].ToString());
        }
       
    }
}
