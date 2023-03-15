using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.DAL.Entities;

namespace włosing.DAL.Repositories
{
    internal class RepositorySklepy
    {
        #region Zapytania
        private const string ALL_SHOPS = "SELECT * FROM sklepy";
        #endregion

        public static List<Sklep> GetAllShops()
        {
            List<Sklep> shops = new List<Sklep>();
            using (var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(ALL_SHOPS, connection);
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                    shops.Add(new Sklep(reader));
                connection.Close();

            }
            return shops;
        }
    }

}
