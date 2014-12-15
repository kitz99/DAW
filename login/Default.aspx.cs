using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AlertaVid.Visible = false;
        List<Categorii> cats = Categorii.getCats();

        if (cats.Count >= 5)
        {
            titlu1.Text = cats[0].cat_name;
            box1.DataSource = Stire.getStiri(cats[0].cat_id);

            titlu2.Text = cats[1].cat_name;
            box2.DataSource = Stire.getStiri(cats[1].cat_id);

            titlu3.Text = cats[2].cat_name;
            box3.DataSource = Stire.getStiri(cats[2].cat_id);

            titlu4.Text = cats[3].cat_name;
            box4.DataSource = Stire.getStiri(cats[3].cat_id);

            titlu5.Text = cats[4].cat_name;
            box5.DataSource = Stire.getStiri(cats[4].cat_id);

            box1.DataBind(); box2.DataBind(); box3.DataBind(); box4.DataBind(); box5.DataBind();

            listCat.DataSource = cats;
            listCat.DataBind();
        }

        if (cats.Count == 4)
        {
            titlu1.Text = cats[0].cat_name;
            box1.DataSource = Stire.getStiri(cats[0].cat_id);

            titlu2.Text = cats[1].cat_name;
            box2.DataSource = Stire.getStiri(cats[1].cat_id);

            titlu3.Text = cats[2].cat_name;
            box3.DataSource = Stire.getStiri(cats[2].cat_id);

            titlu4.Text = cats[3].cat_name;
            box4.DataSource = Stire.getStiri(cats[3].cat_id);

            box1.DataBind(); box2.DataBind(); box3.DataBind(); box4.DataBind();
            place5.Visible = false;

            listCat.DataSource = cats;
            listCat.DataBind();
        }

        if (cats.Count == 3)
        {
            titlu1.Text = cats[0].cat_name;
            box1.DataSource = Stire.getStiri(cats[0].cat_id);

            titlu2.Text = cats[1].cat_name;
            box2.DataSource = Stire.getStiri(cats[1].cat_id);

            titlu3.Text = cats[2].cat_name;
            box3.DataSource = Stire.getStiri(cats[2].cat_id);

            box1.DataBind(); box2.DataBind(); box3.DataBind();

            place5.Visible = false; place4.Visible = false;

            listCat.DataSource = cats;
            listCat.DataBind();
        }

        if (cats.Count == 2)
        {
            titlu1.Text = cats[0].cat_name;
            box1.DataSource = Stire.getStiri(cats[0].cat_id);

            titlu2.Text = cats[1].cat_name;
            box2.DataSource = Stire.getStiri(cats[1].cat_id);

            box1.DataBind(); box2.DataBind();
            place5.Visible = false; place4.Visible = false; place3.Visible = false;

            listCat.DataSource = cats;
            listCat.DataBind();
        }

        if (cats.Count == 1)
        {
            titlu1.Text = cats[0].cat_name;
            box1.DataSource = Stire.getStiri(cats[0].cat_id);

            box1.DataBind();
            place5.Visible = false; place4.Visible = false; place3.Visible = false; place2.Visible = false;

            listCat.DataSource = cats;
            listCat.DataBind();
        }
        if (cats.Count == 0)
        {
            AlertaVid.Visible = true;
            listaCategorii.Visible = false;
        }
    }
}