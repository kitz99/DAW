using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class SearchHelper
{
    public int Id { get; set; }
    public string titlu { get; set; }
    public string continut { get; set; }
    public string image { get; set; }
    public int cat_id { get; set; }
    public string publishDate { get; set; }
    public string autor { get; set; }
    public string category { get; set; }

    private static bool canAdd(List<SearchHelper> L, SearchHelper r)
    {
        foreach(SearchHelper elem in L)
        {
            if (elem.titlu == r.titlu)
                return false;
        }
        return true;
    }
    public static List<SearchHelper> searchResuls(string query)
    {
        using (SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
        {
            con.Open();
            query = query.ToLower();
            SqlCommand cmd = new SqlCommand(@"SELECT [Id], [titlu], [continut], [image], [cat_id], [publishDate], [autor] FROM Stiri 
                                                 WHERE titlu LIKE '%" + query + "%' OR continut LIKE '%" + query + "%' ORDER BY [publishDate] DESC", con);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                List<SearchHelper> results = new List<SearchHelper>();
                while (reader.Read())
                {
                    SearchHelper curent = new SearchHelper
                    {
                        Id = reader.GetInt32(0),
                        titlu = reader.GetString(1),
                        continut = reader.GetString(2),
                        image = reader.GetString(3),
                        cat_id = reader.GetInt32(4),
                        publishDate = reader.GetDateTime(5).ToString(),
                        autor = reader.GetString(6)
                    };
                    if (canAdd(results, curent))
                    {
                        curent.category = Categorii.cat_by_id(curent.cat_id);
                        if (curent.continut.Length > 50)
                        {
                            curent.continut = curent.continut.Substring(0, 50) + "...";
                        }
                        results.Add(curent);
                    }
                }
                return results ;
            }
        }
    }
}