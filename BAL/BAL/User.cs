using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
    public class Users
    {
        public string UserName { get; set; }
        public string Password { get; set; }

        public Users(string un)
        {
            UserName = un;
        }
    }
}