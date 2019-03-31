using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.IO;
using System.Text;

public partial class dir1_Admin_Default2 : System.Web.UI.Page
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

            }
        }
        catch (Exception ex)
        {
            Response.Write("Exception:" + ex);
        }
    }


    protected void btnupd1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(fl1.FileName);
            fl1.SaveAs(Server.MapPath("../../img" + filename));
            string insertimg = "update slider SET image1 = 'img/" + filename + "', title1= '"+txt1.Text+"'  ";
            SqlCommand cmd = new SqlCommand(insertimg, con);

            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Image Successfully Uploaded');</script>");
            Response.Redirect("slider.aspx");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }

  
    protected void btnupd2_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(fl2.FileName);
            fl2.SaveAs(Server.MapPath("../../img" + filename));
            string insertimg = "update slider SET image2 = 'img/" + filename + "', title2= '" + txt2.Text + "'  ";
            SqlCommand cmd = new SqlCommand(insertimg, con);

            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Image Successfully Uploaded');</script>");
            Response.Redirect("slider.aspx");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }
    protected void btnupd3_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(fl3.FileName);
            fl3.SaveAs(Server.MapPath("../../img" + filename));
            string insertimg = "update slider SET image3 = 'img/" + filename + "', title3= '" + txt3.Text + "'  ";
            SqlCommand cmd = new SqlCommand(insertimg, con);

            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Image Successfully Uploaded');</script>");
            Response.Redirect("slider.aspx");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }

    protected void btnupd4_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(fl4.FileName);
            fl4.SaveAs(Server.MapPath("../../img" + filename));
            string insertimg = "update slider SET image4 = 'img/" + filename + "', title4= '" + txt4.Text + "'  ";
            SqlCommand cmd = new SqlCommand(insertimg, con);

            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Image Successfully Uploaded');</script>");
            Response.Redirect("slider.aspx");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }

    protected void btnupd5_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(fl5.FileName);
            fl5.SaveAs(Server.MapPath("../../img" + filename));
            string insertimg = "update slider SET image5 = 'img/" + filename + "', title5= '" + txt5.Text + "'  ";
            SqlCommand cmd = new SqlCommand(insertimg, con);

            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Image Successfully Uploaded');</script>");
            Response.Redirect("slider.aspx");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }
}