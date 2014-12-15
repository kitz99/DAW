using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using DataSetTableAdapters;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gresit.Visible = false;
        if (Session["loggedInUser"] != null)
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void loginButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        String checkUser = "select count(*) from Users where username='" + username.Text + "'";
        SqlCommand com = new SqlCommand(checkUser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1)
        {
            conn.Open();
            string checkPassQuery = "select password from Users where username='" + username.Text + "'";
            SqlCommand comm = new SqlCommand(checkPassQuery, conn);
            string pass = comm.ExecuteScalar().ToString();
            string loginPasswd = passsword.Text;

            if (pass == loginPasswd)
            {
                Session["loggedInUser"] = username.Text;
                UsersTableAdapter U = new UsersTableAdapter();
                string role = U.getRoleByUsername(username.Text);
                string avatar = U.getImage(username.Text);
                Session["userRole"] = role;
                Session["avatar"] = avatar;
                Response.Write("Passwd is correct");
                Response.Redirect("Default.aspx");
            }
            else
            {
                gresit.Visible = true;
            }

        }
        else
        {
            gresit.Visible = true;
        }
        conn.Close();
    }
}