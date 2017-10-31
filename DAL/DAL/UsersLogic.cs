using BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace DAL
{
    public class UsersLogic : DBService
    {
        public string GetUsers(string un, string pw)
        {
            Users u1 = null;
            bool flag = true;
            foreach (char c in pw)
            {
                if (c < '0' || c > '9')
                    flag = false;
            }

            if (flag)
            {
                try
                {
                    using (Comm = new SqlCommand("getUsers", Con))
                    {
                        Comm.CommandType = CommandType.StoredProcedure;
                        //Comm.Parameters.AddWithValue("@UserNameTemp", un);
                        //Comm.Parameters.AddWithValue("@PassTemp", pw);


                        //Comm.Parameters.Add("@UserNameTemp",SqlDbType.NVarChar,50).Value=un;
                        //Comm.Parameters.Add("@PassTemp", SqlDbType.NVarChar,50).Value = pw;

                        Comm.Parameters.Add(new SqlParameter("@UserNameTemp", un));
                        Comm.Parameters.Add(new SqlParameter("@PassTemp", pw));

                        Comm.Connection.Open();
                        Reader = Comm.ExecuteReader();

                        if (Reader.Read())
                        {
                            u1 = new Users(Reader["UserName"].ToString());
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
            }
            JavaScriptSerializer json = new JavaScriptSerializer();
            return json.Serialize(u1);
        }
    }


    //public string GetUsers2(string un, string pw)
    //{
    //    Users u1 = null;
    //    try
    //    {
    //        Comm.CommandText = "SELECT * FROM UsersTB WHERE UserName = @name AND Password = @pass";
    //        Comm.Connection.Open();
    //        Comm.Parameters.Add(new SqlParameter("@name", un));
    //        Comm.Parameters.Add(new SqlParameter("@pass", pw));
    //        //bool flag = false;

    //        Reader = Comm.ExecuteReader();
    //        if (Reader.Read())
    //        {
    //            u1 = new Users(Reader["UserName"].ToString(), Reader["Password"].ToString());
    //        }
    //    }
    //    catch (SqlException e)
    //    {
    //        Console.WriteLine(e);
    //    }
    //    finally
    //    {
    //        Comm.Connection.Close();
    //    }
    //    JavaScriptSerializer json = new JavaScriptSerializer();
    //    return json.Serialize(u1);
    //}
}
