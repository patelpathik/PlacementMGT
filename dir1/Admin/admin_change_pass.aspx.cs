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
        string checkuser = "select count(*) from admin WHERE a_email = '" + txtemail.Text + "' AND a_pwd = '"+txtcupass.Text+"' AND a_id= " + uid;
        SqlCommand cmd1 = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(cmd1.ExecuteScalar());
        if (temp == 0)
        {
            Response.Write("<script>alert('Please insert valid Email ID or your current Password')</script>");
            con.Close();
        }
        else
        {
            try
            {
                string insertQuery = "UPDATE admin SET a_pwd = @a_pwd";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@a_pwd", txtcpass.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Password Successfully Change');</script>");
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}