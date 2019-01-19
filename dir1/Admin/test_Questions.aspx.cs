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
        string checkuser = "select * from test_question where ts_que  = '" + txtque.Text + "' ";
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
                string ans1="";
                if (op1.Checked == true)
                {
                    ans1 = "1";
                }
                else if (op2.Checked == true)
                {
                    ans1 = "2";
                }
                else if (op2.Checked == true)
                {
                    ans1 = "3";
                }
                else if (op2.Checked == true)
                {
                    ans1 = "4";
                }
                string insertQuery = "insert into test_question (ts_que,op1,op2,op3,op4,answer,sid) values (@ts_que,@op1,@op2,@op3,@op4,@answer,@sid)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@ts_que", txtque.Text);
                cmd.Parameters.AddWithValue("@op1", txta.Text);
                cmd.Parameters.AddWithValue("@op2", txtb.Text);
                cmd.Parameters.AddWithValue("@op3", txtc.Text);
                cmd.Parameters.AddWithValue("@op4", txtd.Text);
                cmd.Parameters.AddWithValue("@answer", ans1);
                cmd.Parameters.AddWithValue("@sid", ddl.SelectedValue);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Successfully Added');</script>");
                Response.Redirect("test_Questions.aspx");
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}