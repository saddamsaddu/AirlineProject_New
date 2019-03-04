using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace Airline_Reservation_System
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ARS_Connstring"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            //clear();
            if(!(IsPostBack))
            {
                //clear();
                TilteBind();
            }
        }
      
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //if(ddlTitle.SelectedIndex == 0)
                //{
                //    lblerrormsg.Visible = true;
                    
                //}
                //else
                //{
                //    lblerrormsg.Visible = false;
                //}
                string Gender;
                if (rbmale.Checked == true)
                    Gender = "M";
                else
                    Gender = "F";


                con.Open();
                SqlCommand cmd = new SqlCommand("SP_LOGINREGISTER", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Title", ddlTitle.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@Name", txtfname.Text + ' ' + txtlname.Text));
                cmd.Parameters.Add(new SqlParameter("@Gender", Gender));
                cmd.Parameters.Add(new SqlParameter("@Address", txtaddress.Text));
                cmd.Parameters.Add(new SqlParameter("@Email", txtemail.Text));
                cmd.Parameters.Add(new SqlParameter("@Mobno", txtmobno.Text));
                cmd.Parameters.Add(new SqlParameter("@Passno", txtPassportNo.Text));
                cmd.Parameters.Add(new SqlParameter("@Aadharno", txtAadharNo.Text));
                cmd.Parameters.Add(new SqlParameter("@Panno", txtPanNo.Text));
                cmd.Parameters.Add(new SqlParameter("@UserName", txtusername.Text));
                cmd.Parameters.Add(new SqlParameter("@Password", txtpassword.Text));
                cmd.Parameters.Add(new SqlParameter("@Mode", "Register"));

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                if (ds.Tables[0].Rows[0]["Message"].ToString() == "SUCCESS")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + txtusername.Text + " Created Successfully')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ds.Tables[0].Rows[0]["Message"].ToString() + "')", true);
                }
                clear();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message.ToString() + "')", true);
            }
        }

        public void TilteBind()
        {
            con.Open();
            SqlCommand titlecmd = new SqlCommand("select LISTNAME from AR_GENERAL where LISTGROUP = '001' ", con);
          

            SqlDataAdapter da = new SqlDataAdapter(titlecmd);
            DataSet ds = new DataSet();

            da.Fill(ds);

          

            ddlTitle.DataSource = ds;

            ddlTitle.DataValueField = "LISTNAME";

            ddlTitle.DataTextField = "LISTNAME";

            ddlTitle.DataBind();

            ddlTitle.Items.Insert(0, "--Select--");

            con.Close();
        }

        protected void ddlTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlTitle.SelectedValue == "Mr.")
            {
                rbfmale.Checked = false;
                rbmale.Checked = true;
                
            }
            else 
            {
                rbmale.Checked = false;
                rbfmale.Checked = true;
            }
        }

        public void clear()
        {
            ddlTitle.SelectedIndex = 0;
txtfname.Text  = "";
  txtlname.Text = "";
txtaddress.Text = "";
 txtemail.Text = "";
 txtmobno.Text = "";
 txtPassportNo.Text = "";
txtAadharNo.Text = "";
 txtPanNo.Text = "";
 txtusername.Text = "";
 txtpassword.Text = "";
 txtconfirmpassword.Text = "";

        }

    }
}