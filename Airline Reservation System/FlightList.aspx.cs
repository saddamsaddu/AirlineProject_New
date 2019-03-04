using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Airline_Reservation_System
{
    public partial class FlightList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ARS_Connstring"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            Admintab();
            if (!IsPostBack)
            {
                FlightListBind();
            }
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

        public void FlightListBind()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_ADDANDVIEWFLIGHT", con);
            cmd.CommandType = CommandType.StoredProcedure; ;
            cmd.Parameters.Add(new SqlParameter("@Mode", "View"));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                gridFlightList.DataSource = ds;
                gridFlightList.DataBind();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Records Found')", true);
            }
            con.Close();
        }
    }
}