using comentariiTableAdapters;
using DataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        List<Stire> st = new List<Stire>();
        st = Stire.getOne(id);
        if (st == null)
        {
            Response.Redirect("404.aspx");
        }
        listaCuStire.DataSource = st;
        listaCuStire.DataBind();

        if (Session["loggedInUser"] == null)
        {
            commBox.Visible = false;
        }
    }
    protected void submitComment_Click(object sender, EventArgs e)
    {
        ComentariiTableAdapter C = new ComentariiTableAdapter();

        String commentCon = commentContent.Text;
        String username = Session["loggedInUser"].ToString();
        int id = Convert.ToInt32(Request.QueryString["id"]);

        C.InsertComment(id, username, commentCon, Session["avatar"].ToString());

        commentContent.Text = "";
        listaComentarii.DataBind();
    }
}