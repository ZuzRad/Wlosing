using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace włosing.DAL.Entities
{
    class Produkt
    {
        public int id_produkt, id_producent, id_typ,weganski;
        public string nazwa;
        public decimal cena;

        public Produkt(MySqlDataReader reader)
        {
            id_produkt = sbyte.Parse(reader["id_produkt"].ToString());
            nazwa = reader["nazwa"].ToString();
            cena = decimal.Parse(reader["cena"].ToString());
            weganski = sbyte.Parse(reader["weganski"].ToString());
            id_producent = sbyte.Parse(reader["id_producent"].ToString());
            id_typ = sbyte.Parse(reader["id_typ"].ToString());
        }

        public override string ToString()
        {
            return String.Format("{0,-70} {1} zł",nazwa,cena);
        }
    }
}
