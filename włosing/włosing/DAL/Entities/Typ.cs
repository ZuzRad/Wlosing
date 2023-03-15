using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.DAL.Entities
{
    internal class Typ
    {
        public int id_typ;
        public string typ;

        public Typ(MySqlDataReader reader)
        {
            id_typ = sbyte.Parse(reader["id_typ"].ToString());
            typ = reader["typ"].ToString();
        }

        public override string ToString()
        {
            return typ;
        }
    }
}
