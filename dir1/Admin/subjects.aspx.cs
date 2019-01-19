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

public partial class dir1_Admin_Default : System.Web.UI.Page
{


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select count(*) from subjects where sub_code = '" + txtcode.Text + "' OR sub_name = '" + txtsubject.Text + "' ";
        SqlCommand cmd1 = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(cmd1.ExecuteScalar());
        if (temp == 1)
        {
            Response.Write("<script>alert('Data already exist')</script>");
            con.Close();
        }
        else
        {
            try
            {
                string insertQuery = "insert into subjects (br_id,sem,sub_code,sub_name) values (@br_id,@sem,@sub_code,@sub_name)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@br_id", ddlbname.Text);
                cmd.Parameters.AddWithValue("@sem", ddlsem.Text);
                cmd.Parameters.AddWithValue("@sub_code", txtcode.Text);
                cmd.Parameters.AddWithValue("@sub_name", txtsubject.Text);
               
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("subjects.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}