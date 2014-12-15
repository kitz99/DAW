using DataSetTableAdapters;
using stiriTableAdapters;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tabelTableAdapters;

public partial class EditorPannel : System.Web.UI.Page
{

    protected void dispari(object sender, EventArgs e)
    {
        if (numeCat.Text == "")
            alertaSucces.Visible = false;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        contentTabel.Visible = false;
        neautorizat.Visible = false;
        if (Session["loggedInUser"] != null)
        {
            if (Session["userRole"].ToString() == "admin" || Session["userRole"].ToString() == "editor")
            {
                contentTabel.Visible = true;
                alertaSucces.Visible = false;
                stireOK.Visible = false;
            }
            else
            {
                contentTabel.Visible = false;
                locStiri.Visible = false;
                neautorizat.Visible = true;
            }
        }
        else 
        {
            locStiri.Visible = false;
            neautorizat.Visible = true;
        }

    }
    protected void insertCat_Click(object sender, EventArgs e)
    {
        string categ_noua = numeCat.Text;

        // caut in baza sa vad daca mai exista o categorie cu acelasi nume
        CategoriesTableAdapter T = new CategoriesTableAdapter();
        int? exists = T.SearchCatByName(categ_noua);

        if (exists == 0)
        {
            
            T.InsertCategorie(categ_noua);
            alertaSucces.Visible = true;
            output.Text = "Inserarea a fost realizata cu succes";
            categoriiGrid.DataBind();
            listaCat.DataBind();
            DropDownList1.DataBind();
            numeCat.Text = "";
        }
        else
        {
            output.Text = "Inserarea a esuat pentru ca aceasta categorie exista deja";
            
        }
    }
    protected void adaugastire_Click(object sender, EventArgs e)
    {
        StiriTableAdapter S = new StiriTableAdapter();

        String titlu = titluStire.Text;
        int cat_id = Convert.ToInt32(listaCat.SelectedValue);
        String continut = continutStire.Text;
        String autor = Session["loggedInUser"].ToString();
        Random ion = new Random();

        string numePoza = ion.Next().ToString() + ion.Next().ToString() + ion.Next().ToString() + ".jpg";

        if (FileUpload1.FileName != "")
        {
            FileUpload1.SaveAs(Server.MapPath("~/images/") + numePoza);
        }
        else
        {
             numePoza = "noimage.jpg";
        }

        S.InsertStire(titlu, continut, numePoza, cat_id, autor);

        titluStire.Text = "";
        continutStire.Text = "";
        stireOK.Visible = true;

        GridView1.DataBind();
    }

}