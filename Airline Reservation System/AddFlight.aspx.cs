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
    public partial class AddFlight : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ARS_Connstring"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            Admintab();
            if (!(IsPostBack))
            {
                clear();
                FlightBind();
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try{
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_ADDANDVIEWFLIGHT", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@FlightName", ddlFlight.SelectedValue.ToString()));
            cmd.Parameters.Add(new SqlParameter("@FromPlace", txtFrom.Text));
            cmd.Parameters.Add(new SqlParameter("@ToPlace", txtTo.Text));
            cmd.Parameters.Add(new SqlParameter("@ArrivalTime", txtArrival.Text));
            cmd.Parameters.Add(new SqlParameter("@DepatureTime", txtDepature.Text));
            cmd.Parameters.Add(new SqlParameter("@Seats", txtSeats.Text));
            cmd.Parameters.Add(new SqlParameter("@TicketPrice", txtTicketPrice.Text));
            cmd.Parameters.Add(new SqlParameter("@Mode", "Add"));

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            if(ds.Tables[0].Rows[0]["Message"].ToString() == "SUCCESS" )
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ds.Tables[0].Rows[0]["flightid"].ToString() + " Added Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ds.Tables[0].Rows[0]["Message"].ToString() + "')", true);
            }
            clear();
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message.ToString() + "')", true);
            }
        }

        public void FlightBind()
        {
            con.Open();
            SqlCommand titlecmd = new SqlCommand("select LISTNAME from AR_GENERAL where LISTGROUP = '005' ", con);


            SqlDataAdapter da = new SqlDataAdapter(titlecmd);
            DataSet ds = new DataSet();

            da.Fill(ds);



            ddlFlight.DataSource = ds;

            ddlFlight.DataValueField = "LISTNAME";

            ddlFlight.DataTextField = "LISTNAME";

            ddlFlight.DataBind();

            ddlFlight.Items.Insert(0, "--Select--");

            con.Close();
        }

        public void clear()
        {
            ddlFlight.SelectedIndex = 0;
             txtFrom.Text = "";
             txtTo.Text = "";
             txtArrival.Text ="";
            txtDepature.Text= "";
            txtTicketPrice.Text = "";
        }
    }
}