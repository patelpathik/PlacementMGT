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
        String uid = Session["userid"].ToString();
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select * from coordinator where co_email = '" + txtemail.Text + "' AND co_pwd = '" + txtcupass.Text + "' ";
        SqlCommand cmd1 = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(cmd1.ExecuteScalar());
        if (temp == 0)
        {
            Response.Write("<script>alert('Please insert valid Email ID or Your Current Password')</script>");
            con.Close();
        }
        else
        {
            try
            {
                string insertQuery = "UPDATE coordinator SET co_pwd = @co_pwd";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@co_pwd", txtcpass.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Password Successfully Change')</script>");
                Response.Redirect("TPO_co_change_pass.aspx");

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}