using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
   public class DBService
    {
        protected SqlCommand Comm;
        protected SqlDataReader Reader;
        protected SqlConnection Con = new SqlConnection(@"Data Source=DESKTOP-FDMDQ0A\SQLEXPRESS;Initial Catalog=XphoneDB;Integrated Security=True");
    }
}
