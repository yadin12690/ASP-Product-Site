using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DAL;
using BAL;

namespace Yadin_Xphone
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : /*System.Web.Services.WebService ,*/ UsersLogic

    {
        private string temp;
        private string result = null;

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string CheckLoginCodeBehind(string userNamePar, string passPar)
        {
            temp = GetUsers2(userNamePar, passPar);
            if (temp != null)
            {
                result = "UserOK";
                return result;
            }
            return result;
        }

        [WebMethod]
        public void ProductsDataToGridView()
        {
          List<Product> proList= GetProductses();
            proList = GetProductses();
        }
    }
}
