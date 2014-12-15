using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class Categorii
{
    public int cat_id { get; set; }
    public string cat_name { get; set; }

    public static List<Categorii> getCats()
    {
        using (SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Categories", con);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                List<Categorii> cats = new List<Categorii>();
                while (reader.Read())
                {
                    Categorii cat = new Categorii
                    {
                        cat_id = reader.GetInt32(0),
                        cat_name = reader.GetString(1)
                    };
                    cats.Add(cat);
                }
                return cats;
            }
        }
    }

    public static String cat_by_id(int ID)
    {
        using (SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT [cat_name] FROM Categories WHERE ID=" + ID.ToString(), con);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                String cat_name = "";
                while (reader.Read())
                {
                    cat_name = reader.GetString(0);
                }
                return cat_name;
            }
        }
    }
}