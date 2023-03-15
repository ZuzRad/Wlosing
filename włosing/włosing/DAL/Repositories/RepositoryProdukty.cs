using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using włosing.DAL.Entities;

namespace włosing.DAL.Repositories
{
    internal class RepositoryProdukty
    {
        #region Zapytania
        private const string ALL_PRODUCTS = "SELECT * FROM produkty";
        #endregion

        public static List<Produkt> GetAllProducts()
        {
            List<Produkt> products = new List<Produkt>();
            using(var connection = DBConnection.Instance.Connection)
            {
                MySqlCommand command = new MySqlCommand(ALL_PRODUCTS, connection);
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                    products.Add(new Produkt(reader));
                connection.Close();

            }
            return products;
        }

    }
}
