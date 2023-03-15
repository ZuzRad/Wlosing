using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.DAL.Entities;

namespace włosing.DAL.Repositories
{
    internal class RepositoryProblemy
    {
        #region Zapytania
        private const string ALL_PROBLEMS = "SELECT * FROM problemy";
        #endregion

        public static List<Problem> GetAllProblems()
        {
            List<Problem> problems = new List<Problem>();
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(ALL_PROBLEMS, connection);
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                    problems.Add(new Problem(reader));
                connection.Close();

            }
            return problems;
        }
    }
}
