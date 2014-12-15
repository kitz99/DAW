using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string querry = Request.QueryString["query"].ToString();
        List<SearchHelper> results = SearchHelper.searchResuls(querry);
        box1.DataSource = results;
        box1.DataBind();
    }
}