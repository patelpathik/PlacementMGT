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
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select * from tpo where tpo_email = '" + txtemail.Text + "' AND tpo_pwd = '"+txtcupass.Text+"' WHERE tpo_id= " +uid;
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
                string insertQuery = "UPDATE tpo SET tpo_pwd = @tpo_pwd";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@tpo_pwd", txtcpass.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Password Successfully Change')</script>");

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}