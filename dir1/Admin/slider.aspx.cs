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

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            String uid = Session["userid"].ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(FileUpload.FileName);
            FileUpload.SaveAs(Server.MapPath("../../img/" + filename));
            string filepath = "img/" + filename;
            string insertimg = "insert into slider (label,imagepath,imagename) values ('"+txtname.Text+"','"+filepath+"','"+ filename +"')";
            SqlCommand cmd = new SqlCommand(insertimg, con);
           /* cmd.Parameters.AddWithValue("@label", txtname.Text);
            cmd.Parameters.AddWithValue("@imagepath", 'img/' + filename);
            cmd.Parameters.AddWithValue("@imagename", txtbsnam.Text); */

            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Image Successfully Selected');</script>");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }
}