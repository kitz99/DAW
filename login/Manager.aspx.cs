using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedInUser"] == null)
        {
            neautorizat.Visible = true;
            totul.Visible = false;

        }
        else
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string checkUserRole = "select role from Users where username='" + Session["loggedInUser"].ToString() + "'";
            SqlCommand com = new SqlCommand(checkUserRole, conn);
            string  userRole= com.ExecuteScalar().ToString();
            if (userRole == "admin")
            {
                neautorizat.Visible = false;
            }
            else
            {
                totul.Visible = false;
                neautorizat.Visible = true;
            }
            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}