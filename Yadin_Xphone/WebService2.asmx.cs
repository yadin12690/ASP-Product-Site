using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DAL;

namespace Yadin_Xphone
{
    /// <summary>
    /// Summary description for WebService2
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class WebService2 : System.Web.Services.WebService
    {
        string temp = null;
        private string result = null;

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string CheckLoginCodeBehind1(string userNamePar, string passPar)
        {
            //string PW_input = PasswordInput.ToString();
            //bool isValid = PW_input.All(char.IsDigit);
            //// temp = GetUsers2(userNamePar, passPar);
            UsersLogic temp2 = new UsersLogic();
            temp = temp2.GetUsers(userNamePar, passPar);
            result = temp == "null" ? "User Not Found" : "User OK!";
            return result;
        }
    }
}
