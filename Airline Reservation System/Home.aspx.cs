using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Airline_Reservation_System
{
    public partial class Home : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admintab();
           

        }

         //Admintab();
        public void Admintab()
        {
            if (Session["id"] == null || Session["id"].ToString() == "")
            {
                Response.Redirect("Login.aspx");
            }
            string type = Session["type"].ToString();

         
            if (type == "0")
            {
                admintabs.Visible = true;
            }
            else
            {
                admintabs.Visible = false;
            }
        }



    }
}