using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedInUser"] != null)
        {
            Response.Redirect("Default.aspx");
        }
        if(IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            String checkUser = "select count(*) from Users where username='" + username.Text + "'";
            SqlCommand com = new SqlCommand(checkUser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (temp == 1)
            {
                Response.Write("User already exists");
            }
            conn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            String insertQuery = "insert into Users (username, email, password, role, avatar) values (@username, @email, @passwd, @role, @avatar)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
            string user = username.Text;
            string rol = listatari.SelectedItem.ToString();

            Random ion = new Random();

            string numePoza = ion.Next().ToString() + ion.Next().ToString() + ion.Next().ToString() + ".jpg";
            if (avatar.FileName != "")
            {
                avatar.SaveAs(Server.MapPath("~/avatars/") + numePoza);
            }
            else
            {
                numePoza = "noimage.jpg";
            }

            com.Parameters.AddWithValue("@username", user);
            com.Parameters.AddWithValue("@email", email.Text);
            com.Parameters.AddWithValue("@passwd", passwd.Text);
            com.Parameters.AddWithValue("@role", rol);
            com.Parameters.AddWithValue("@avatar", numePoza);

            com.ExecuteNonQuery();
            Session["loggedInUser"] = user;
            Session["userRole"] = rol;
            Session["avatar"] = numePoza;

            Response.Redirect("Default.aspx");
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Eroare: " + ex.ToString());
        }
        
    }
}