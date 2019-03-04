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
    public partial class TicketBooking : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ARS_Connstring"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            Admintab();
            if (!(IsPostBack))
            {
                //Clear();
                FlightIdBind();
            }
        }
        
        //Admintab();
        public void Admintab()
        {
            if(Session["id"] == null || Session["id"].ToString() == "")
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

        public void FlightIdBind()
        {
            con.Open();
            SqlCommand titlecmd = new SqlCommand("select FLIGHT_ID from FLIGHTDET", con);
            SqlDataAdapter da = new SqlDataAdapter(titlecmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlFlightId.DataSource = ds;
                ddlFlightId.DataTextField = "FLIGHT_ID";
                ddlFlightId.DataValueField = "FLIGHT_ID";
                ddlFlightId.DataBind();
                ddlFlightId.Items.Insert(0, "--Select--");
            }
            con.Close();
        }
        protected void ddlFlightId_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_ADDANDVIEWFLIGHT", con);
            cmd.CommandType = CommandType.StoredProcedure; ;
            cmd.Parameters.Add(new SqlParameter("@Mode", "Bind"));
            cmd.Parameters.Add(new SqlParameter("@FlightName", ddlFlightId.SelectedValue.ToString()));
            //cmd.Parameters.AddWithValue("", "");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtFlightName.Text = ds.Tables[0].Rows[0]["FLIGHT_NAME"].ToString();
                    txtFrom.Text = ds.Tables[0].Rows[0]["From_place"].ToString();
                    txtTo.Text = ds.Tables[0].Rows[0]["TO_PLACE"].ToString();
                    txtArrival.Text = ds.Tables[0].Rows[0]["ARRIVAL_TIME"].ToString();
                    txtDepature.Text = ds.Tables[0].Rows[0]["DEPATURE_TIME"].ToString();
                    txtFlightName.Text = ds.Tables[0].Rows[0]["FLIGHT_NAME"].ToString();
                    txtAvailableSeats.Text = ds.Tables[0].Rows[0]["SEATS"].ToString();
                    txtTicketPrice.Text = ds.Tables[0].Rows[0]["TICKET_PRICE"].ToString();
                    int seatCount = Convert.ToInt32(txtAvailableSeats.Text);
                    ddlNoofSeats.Items.Clear();
                    for(int i=1;i<=seatCount;i++)
                    {
                        ddlNoofSeats.Items.Add(i.ToString());
                    }
                }
            con.Close();
        }

        protected void ddlNoofSeats_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {

            try
            {
                string userid = Session["id"].ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_BookSeats", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@USERID", userid));
                cmd.Parameters.Add(new SqlParameter("@FlightName", ddlFlightId.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@Name", txtName.Text));
                cmd.Parameters.Add(new SqlParameter("@NoOfSeats", ddlNoofSeats.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@Total_Price", txtTotTicketPrice.Text));
                cmd.Parameters.Add(new SqlParameter("@Mode", "Add"));
                

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                if (ds.Tables[0].Rows[0]["Message"].ToString() == "SUCCESS")
                {
                    Clear();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ds.Tables[0].Rows[0]["Booking_Id"].ToString() + " Booked Successfully')", true);
                }
                else
                {
                    Clear();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ds.Tables[0].Rows[0]["Message"].ToString() + "')", true);
                }
               // clear();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message.ToString() + "')", true);
            }
           
        }

        protected void ddlNoofSeats_SelectedIndexChanged1(object sender, EventArgs e)
        {
             int ticket_price = Convert.ToInt32(txtTicketPrice.Text);
            int NofSeats = Convert.ToInt32(ddlNoofSeats.SelectedValue.ToString());
            int TotalPrice = ticket_price * NofSeats;
            txtTotTicketPrice.Text = TotalPrice.ToString();
        }


        public void Clear()
        {
            ddlFlightId.SelectedIndex = 0;
            txtFlightName.Text = "";
            txtFrom.Text = "";
            txtTo.Text = "";
            txtArrival.Text = "";
            txtDepature.Text = "";
            txtAvailableSeats.Text = "";
            txtTicketPrice.Text = "";
            txtName.Text = "";
            ddlNoofSeats.Items.Clear();
            txtTotTicketPrice.Text = "";
        }
    }
}
    
