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

public partial class dir1_TPO_Co_ordinator_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(fileupload1.FileName);
            fileupload1.SaveAs(Server.MapPath("../../plc_comp_file/" + filename));
            string insertQuery = "";
            insertQuery = "insert into comp_data (plc_date,plc_time,comp_name,location,package,branch,file_name,file_path) values ('" + txtcdat.Text + "',  '" + txttime.Text + "', '" + txtloc.Text + "', '" + txtpack.Text + "', '" + filename + "', 'plc_comp_file/" + filename + "')";
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