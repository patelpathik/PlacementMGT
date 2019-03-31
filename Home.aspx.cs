using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!Page.IsPostBack)
            {

                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
                conn.Open();
                string query = "select * from slider";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                for (int i = 1; i <= 5; i++)
                {
                    //img.ImageUrl = Server.MapPath("~/profile/" + );
                    String imgurl = dt.Rows[0][i].ToString();
                    String imgurl2 = "../../" + imgurl;
                    if (i == 1)
                    {
                        Image1.AlternateText = imgurl2;
                        Image1.ImageUrl = imgurl2;
                    }
                    else if (i == 2)
                    {
                        Image2.AlternateText = imgurl2;
                        Image2.ImageUrl = imgurl2;
                    }
                    else if (i == 3)
                    {
                        Image3.AlternateText = imgurl2;
                        Image3.ImageUrl = imgurl2;
                    }
                    else if (i == 4)
                    {
                        Image4.AlternateText = imgurl2;
                        Image4.ImageUrl = imgurl2;
                    }
                    else
                    {
                        Image5.AlternateText = imgurl2;
                        Image5.ImageUrl = imgurl2;
                    }
                }
                Label1.Text = dt.Rows[0][6].ToString();
                Label2.Text = dt.Rows[0][7].ToString();
                Label3.Text = dt.Rows[0][8].ToString();
                Label4.Text = dt.Rows[0][9].ToString();
                Label5.Text = dt.Rows[0][10].ToString();



            }
        }
        catch (Exception ex)
        {
            Response.Write("Exception:" + ex);
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2008-'09%20Placement%20Details.pdf");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2009-'10 Placement Details.pdf");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2010-'11 Placement Details.pdf");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2011-'12 Placement Details.pdf");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2012-'13 Placement Details.pdf");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2_placement_record_final_2013-14.pdf");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2_placementrecords 2014-15_2.pdf");
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/Placement_2015-16.pdf");
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/Placement_2016-17.pdf");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/Placement_2017-18.pdf");
    }

    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/format for training.pdf");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2_campus placement eligibility.PDF");
    }

    protected void LinkButton13_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2_STUDENT_UNDERTAKING_CAMPUS_PLACEMENT_2018_19.pdf");
    }
}