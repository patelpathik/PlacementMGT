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
        string checkuser = "select * from test where sch_date = '" + txtdate.Text + "' AND sch_time = '" + txttime.Text + "' ";
        SqlCommand cmd1 = new SqlCommand(checkuser, con);
        SqlDataAdapter sda1 = new SqlDataAdapter(checkuser, con);
        DataTable dt1 = new DataTable();
        sda1.Fill(dt1);
        int temp = dt1.Rows.Count;
        if (temp > 0)
        {
            Response.Write("<script>alert('Test is already schedule at same time');</script>");
            con.Close();
        }
        else
        {
            try
            {
                string insertQuery = "insert into test (name,description,sch_date,sch_time,hour) values (@name,@description,@sch_date,@sch_time,@hour)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@description", txtdec.Text);
                cmd.Parameters.AddWithValue("@sch_date", txtdate.Text);
                cmd.Parameters.AddWithValue("@sch_time", txttime.Text);
                cmd.Parameters.AddWithValue("@hour", txthour.Text);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Test Successfully Scheduled');</script>");
                Response.Redirect("create_test.aspx");
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    
}
}