using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.DAL.Entities;

namespace włosing.DAL.Repositories
{
    internal class RepositoryTypy
    {
        #region Zapytania
        private const string ALL_TYPES = "SELECT * FROM typy";
        #endregion

        public static List<Typ> GetAllTypes()
        {
            List<Typ> types = new List<Typ>();
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(ALL_TYPES, connection);
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                    types.Add(new Typ(reader));
                connection.Close();

            }
            return types;
        }
    }
}
