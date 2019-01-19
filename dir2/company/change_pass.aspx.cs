using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class dir2_student_Default : System.Web.UI.Page
{
   
    protected void btnpass_Click(object sender, EventArgs e)
    {
        String uid = Session["userid"].ToString();
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select count(*) from company where com_email = '" + txtemail.Text + "' AND com_pwd = '" + txtpass.Text + "' WHERE com_id=" +uid;
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
                string updateQuery = "UPDATE signup SET pass = @pass WHERE sig_id_no" + uid;
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@pass", txtcnpass.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Password Successfully Change')</script>");
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error occured')</script>");
                //Response.Write("error:" + ex.ToString());
            }
        }
    }
}
