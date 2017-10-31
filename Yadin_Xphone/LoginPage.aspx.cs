using System;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web.Script.Services;
using System.Web.Services;
using BAL;
using DAL;
using Microsoft.Win32;

namespace Yadin_Xphone
{
    public partial class LoginPage : System.Web.UI.Page
    {
        //static string temp = null;
        //private static string result = null;


        protected void Page_Load(object sender, EventArgs e, string userNamePar, string passPar)
        {

        }

        //[System.Web.Services.WebMethod]
        //public static string CheckLoginCodeBehind1(string userNamePar, string passPar)
        //{
        //    //string PW_input = PasswordInput.ToString();
        //    //bool isValid = PW_input.All(char.IsDigit);
        //    //// temp = GetUsers2(userNamePar, passPar);
        //    UsersLogic temp2 = new UsersLogic();
        //    temp = temp2.GetUsers(userNamePar, passPar);
        //    if (temp != null)
        //    {
        //        result = "UserOK";
        //        return result;
        //    }
        //    return result;
        //}
    }
}