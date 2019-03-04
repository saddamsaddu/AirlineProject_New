using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Configuration;
using System.Data.SqlClient;

namespace Airline_Reservation_System
{

    public partial class Login : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ARS_Connstring"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnSignup_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_LOGINREGISTER", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@UserName", txtuserid.Text));
                cmd.Parameters.Add(new SqlParameter("@Password", txtpassword.Text));
                cmd.Parameters.Add(new SqlParameter("@Mode", "Login"));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
               // SqlDataReader rd = cmd.ExecuteReader();
               

                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "SUCCESS")
                    {
                        string LoginId = ds.Tables[0].Rows[0]["USERNAME"].ToString();
                        string UserType = ds.Tables[0].Rows[0]["USERTYPE"].ToString();
                        string Tile = ds.Tables[0].Rows[0]["TITLE"].ToString();
                        string Name = ds.Tables[0].Rows[0]["NAME"].ToString();
                        string Gender = ds.Tables[0].Rows[0]["GENDER"].ToString();
                        string Mail = ds.Tables[0].Rows[0]["EMAILID"].ToString();

                       

                        Session["id"] = LoginId;
                        Session["type"] = UserType;
                        Session["title"] = Title;
                        Session["gen"] = Gender;
                        Session["mail"] = Mail;
                       

                      
                      
                       Response.Redirect("Home.aspx",false);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username or Password is Incorrect')", true);
                    }
                    //Console.WriteLine("Read Successfully");
                }
                //else
                //{

                //}
                con.Close();
            }

            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+ex.Message+"')", true);
            }
            finally
            {
                con.Close();
            }
           
        }
    }
}