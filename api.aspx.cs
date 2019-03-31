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

public partial class api : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!Page.IsPostBack)
            {

                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
                conn.Open();
                string query = "select * from temp_slider";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                for (int i = 1; i <= 3; i++)
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
                    else
                    {
                        Image3.AlternateText = imgurl2;
                        Image3.ImageUrl = imgurl2;
                    }
                }
             
            }
        }
        catch (Exception ex)
        {
            Response.Write("Exception:" + ex);
        }

    }

  
}