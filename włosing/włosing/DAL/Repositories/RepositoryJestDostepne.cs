using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.DAL.Entities;

namespace włosing.DAL.Repositories
{
    internal class RepositoryJestDostepne
    {
        #region Zapytania
        private const string ALL_AVAIBILITY = "SELECT id_produkt,id_sklep FROM jest_dostepne";
        #endregion

        public static List<JestDostepne> GetAllAvaibility()
        {
            List<JestDostepne> avaibility = new List<JestDostepne>();
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(ALL_AVAIBILITY, connection);
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                    avaibility.Add(new JestDostepne(reader));
                connection.Close();

            }
            return avaibility;
        }
    }
}
