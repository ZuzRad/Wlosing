using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.DAL.Entities;

namespace włosing.DAL.Repositories
{
    internal class RepositoryRozwiazuje
    {
        #region Zapytania
        private const string ALL_SOLUTIONS = "SELECT id_typ,id_problem FROM rozwiazuje";
        #endregion

        public static List<Rozwiazuje> GetAllSolutions()
        {
            List<Rozwiazuje> solution = new List<Rozwiazuje>();
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(ALL_SOLUTIONS, connection);
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                    solution.Add(new Rozwiazuje(reader));
                connection.Close();

            }
            return solution;
        }
    }
}
