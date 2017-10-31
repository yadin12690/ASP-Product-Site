using BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
   public class ProductsLogic : DBService
    {
        public List<Product> GetProductses()
        {
            List<Product> productsList = new List<Product>();
            try
            {
                bool flag = false;
                using (Comm = new SqlCommand("GetProducts", Con))
                {
                    Comm.CommandType = CommandType.StoredProcedure;
                    Comm.Connection.Open();
                    Reader = Comm.ExecuteReader();
                    while (Reader.Read())
                    {
                        flag = true;
                        productsList.Add(new Product
                        {
                            ProductID = int.Parse(Reader["ProductID"].ToString()),
                            ProductName = Reader["ProductName"].ToString(),
                            Price = Double.Parse(Reader["Price"].ToString()),
                            Vendor = Reader["Vendor"].ToString()
                        });
                    }
                    if (!flag)
                    {
                        return null;
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                Comm.Connection.Close();
            }
            return productsList;
        }

        public void AddProduct(string Name,float Price,string Vendor)
        {
            try
            {
                using (Comm = new SqlCommand("insertProduct", Con))
                {
                    Comm.CommandType = CommandType.StoredProcedure;
                    //Comm.Parameters.AddWithValue("@UserNameTemp", un);
                    //Comm.Parameters.AddWithValue("@PassTemp", pw);


                    //Comm.Parameters.Add("@UserNameTemp",SqlDbType.NVarChar,50).Value=un;
                    //Comm.Parameters.Add("@PassTemp", SqlDbType.NVarChar,50).Value = pw;

                    Comm.Parameters.Add(new SqlParameter("@ProductName", Name));
                    Comm.Parameters.Add(new SqlParameter("@Price", Price));
                    Comm.Parameters.Add(new SqlParameter("@Vendor", Vendor));

                    Comm.Connection.Open();
                    Comm.ExecuteNonQuery();
                }

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                Comm.Connection.Close();
            }
        }
    }
}
