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

public partial class dir1_dashboard : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("../../Login.aspx");
        }
        /*String uid = Session["userid"].ToString();
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
        conn.Open();
        string query = "select * from coordinator WHERE co_id='" + uid + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        //img.ImageUrl = Server.MapPath("~/profile/" + );
        String imgurl = dt.Rows[0][6].ToString();
        String imgurl2 = "../../profile/" + imgurl;
        Image1.AlternateText = imgurl2;
        Image1.ImageUrl = imgurl2;*/
    }
}
