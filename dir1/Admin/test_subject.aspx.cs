using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class dir1_Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select * from test_subject where ts_name = '" + txtsub.Text + "' ";
        Response.Write(checkuser);
        //SqlCommand cmd1 = new SqlCommand(checkuser, con);
        SqlDataAdapter da = new SqlDataAdapter(checkuser, con);
        DataTable dt1 = new DataTable();
        da.Fill(dt1);
        int temp = dt1.Rows.Count;
        if (temp > 0)
        {
            Response.Write("<script>alert('Data already exist');</script>");
            con.Close();
        }
        else
        {
            try
            {
                string insertQuery = "insert into test_subject (ts_name) values (@ts_name)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@ts_name", txtsub.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Successfully Added');</script>");
                Response.Redirect("test_subject.aspx");
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}