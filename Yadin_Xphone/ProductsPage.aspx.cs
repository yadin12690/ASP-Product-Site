using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using DAL;

namespace Yadin_Xphone
{
    public partial class ProductsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["showProduct"] != null)
            {
                ProductsLogic pl=new ProductsLogic();
                List<Product> list = pl.GetProductses();

                GridView1.DataSource = list;
                GridView1.DataBind();
            }
        }

        protected void AddBTN_Click(object sender, EventArgs e)
        {
            ProductsLogic pl =new ProductsLogic();
           // Debugger.Launch();
            pl.AddProduct(nameInput.Text,float.Parse(PriceInput.Text),VendorInput.Text);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Product Inserted Successfully')", true);
        }
    }
}