using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int cat_id = Convert.ToInt32(Request.QueryString["cat_id"]);
        var lista = Stire.getAllNews(cat_id);
        mainZone.Visible = false;
        faraStiri.Visible = false;
        if (lista.Count != 0)
        {
            mainZone.Visible = true;
            listaCuStiri.DataSource = lista;
            listaCuStiri.DataBind();
        }
        else
        {
            faraStiri.Visible = true;
        }
    }
    protected void sortASC_Click(object sender, EventArgs e)
    {
        int cat_id = Convert.ToInt32(Request.QueryString["cat_id"]);
        listaCuStiri.DataSource = Stire.AllNewsOrdered(cat_id, "publishDate", "ASC");
        listaCuStiri.DataBind();
    }
    protected void sortDESC_Click(object sender, EventArgs e)
    {
        int cat_id = Convert.ToInt32(Request.QueryString["cat_id"]);
        listaCuStiri.DataSource = Stire.AllNewsOrdered(cat_id, "publishDate", "DESC");
        listaCuStiri.DataBind();
    }
    protected void ASCnume_Click(object sender, EventArgs e)
    {
        int cat_id = Convert.ToInt32(Request.QueryString["cat_id"]);
        listaCuStiri.DataSource = Stire.AllNewsOrdered(cat_id, "titlu", "ASC");
        listaCuStiri.DataBind();
    }
    protected void DESCnume_Click(object sender, EventArgs e)
    {
        int cat_id = Convert.ToInt32(Request.QueryString["cat_id"]);
        listaCuStiri.DataSource = Stire.AllNewsOrdered(cat_id, "titlu", "DESC");
        listaCuStiri.DataBind();
    }
}