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
        string checkuser = "select * from branch where br_name = '" + txtbname.Text + "' AND br_sname = '"+ txtbsname +"' ";
        SqlCommand cmd1 = new SqlCommand(checkuser, con);
        SqlDataAdapter sda1 = new SqlDataAdapter(checkuser, con);
        DataTable dt1 = new DataTable();
        sda1.Fill(dt1);
        int temp = dt1.Rows.Count;
        if (temp > 0)
        {
            Response.Write("<script>alert('Data already exist');</script>");
            con.Close();
        }
        else
        {
            try { 
                string insertQuery = "insert into branch (br_name,br_sname) values (@br_name,@br_sname)";
                SqlCommand cmd = new SqlCommand(insertQuery,con);
                cmd.Parameters.AddWithValue("@br_name", txtbname.Text);
                cmd.Parameters.AddWithValue("@br_sname", txtbsname.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Successfully Added');</script>");
                con.Close();
                Response.Redirect("branch.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}
