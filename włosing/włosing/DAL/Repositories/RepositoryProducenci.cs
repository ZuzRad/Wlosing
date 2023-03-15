using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.DAL.Entities;

namespace włosing.DAL.Repositories
{
    internal class RepositoryProducenci
    {
        #region Zapytania
        private const string ALL_PROBLEMS = "SELECT * FROM producenci";
        #endregion

        public static List<Producent> GetAllProducers()
        {
            List<Producent> producers = new List<Producent>();
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(ALL_PROBLEMS, connection);
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                    producers.Add(new Producent(reader));
                connection.Close();

            }
            return producers;
        }
    }
}
