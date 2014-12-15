using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class Stire
{
    public string titluStire { get; set; }
    public string content { get; set; }
    public string publishDate { get; set; }
    public string category { get; set; }
    public string imagine { get; set; }
    public string autor { get; set; }
    public int id { get; set; }

    public static List<Stire> getStiri(int catID)
    {
        using (SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"select titlu, continut, publishDate, cat_name, image, tabel.Id, autor from 
                                              (SELECT titlu, continut, publishDate, cat_id, image, Stiri.Id, autor, ROW_NUMBER() OVER(ORDER BY publishDate DESC) as numar from Stiri where cat_id = " + catID + @") as tabel, 
                                                Categories 
                                               where tabel.numar BETWEEN 0 AND 3 AND tabel.cat_id = Categories.Id", con);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                List<Stire> titluri = new List<Stire>();
                while (reader.Read())
                {
                    Stire stire = new Stire
                    {
                        titluStire = reader.GetString(0),
                        content = reader.GetString(1),
                        publishDate = reader.GetDateTime(2).ToString(),
                        category = reader.GetString(3),
                        id = reader.GetInt32(5),
                        autor = reader.GetString(6)
                    };
                    if (stire.content.Length > 100)
                    {
                        stire.content = stire.content.Substring(0, 100) + "...";
                    }
                    if (reader.IsDBNull(4))
                        stire.imagine = "noimage.jpg";
                    else
                        stire.imagine = reader.GetString(4);
                    titluri.Add(stire);
                }
                return titluri;
            }
        }
    }


    public static List<Stire> getAllNews(int catID)
    {
        using (SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT [id], [titlu], [continut], [image], [publishDate], [autor] from [Stiri] where cat_id = " + catID, con);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                List<Stire> titluri = new List<Stire>();
                while (reader.Read())
                {
                    Stire stire = new Stire
                    {
                        id = reader.GetInt32(0),
                        titluStire = reader.GetString(1),
                        publishDate = reader.GetDateTime(4).ToString(),
                        autor = reader.GetString(5),
                        imagine = reader.GetString(3)
                    };
                    if (reader.GetString(2).Length > 50)
                        stire.content = reader.GetString(2).Substring(0, 50) + "...";
                    else
                        stire.content = reader.GetString(2);
                    titluri.Add(stire);
                }
                return titluri;
            }
        }
    }

    public static List<Stire> AllNewsOrdered(int catID, string criteriu, string sort)
    {
        using (SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT [id], [titlu], [continut], [image], [publishDate], [autor] from [Stiri] where cat_id = " + catID + "ORDER BY " + criteriu +  " " + sort, con);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                List<Stire> titluri = new List<Stire>();
                while (reader.Read())
                {
                    Stire stire = new Stire
                    {
                        id = reader.GetInt32(0),
                        titluStire = reader.GetString(1),
                        publishDate = reader.GetDateTime(4).ToString(),
                        autor = reader.GetString(5),
                        imagine = reader.GetString(3)
                    };
                    if (reader.GetString(2).Length > 50)
                        stire.content = reader.GetString(2).Substring(0, 50) + "...";
                    else
                        stire.content = reader.GetString(2);
                    titluri.Add(stire);
                }
                return titluri;
            }
        }
    }

    public static List<Stire> getOne(int ID)
    {
        using (SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT [titlu], [continut], [image], [publishDate], [autor] from [Stiri] where id = " + ID, con);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                List<Stire> titluri = new List<Stire>();
                while (reader.Read())
                {
                    Stire stire = new Stire
                    {
                        titluStire = reader.GetString(0),
                        publishDate = reader.GetDateTime(3).ToString(),
                        autor = reader.GetString(4),
                        imagine = reader.GetString(2),
                        content = reader.GetString(1)
                    };
                    titluri.Add(stire);
                }
                return titluri;
            }
        }
    }
}