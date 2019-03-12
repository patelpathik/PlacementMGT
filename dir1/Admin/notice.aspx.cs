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


public partial class dir1_TPO_Co_ordinator_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtdate.Text = DateTime.Now.ToShortDateString();
        txttime.Text = DateTime.Now.ToShortTimeString();
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(fileupload1.FileName);
            fileupload1.SaveAs(Server.MapPath("../../Upload file/" + filename));
            string insertQuery="";
            insertQuery = "insert into notice (title,date,time,description,filename,filepath) values ('" + txttitle.Text+"',  '"+txtdate.Text+"', '"+txttime.Text+"', '"+txtdes.Text+"', '"+filename+"', 'Upload file/"+filename+"')";
            SqlCommand cmd = new SqlCommand(insertQuery, con);
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }

}