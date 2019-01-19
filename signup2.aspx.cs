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

public partial class signup2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select * from signup where sig_email = '" + txtemail.Text + "' AND sig_mobile = '" + txtmob.Text + "' AND sig_id_no = '"+ txtid.Text +"' ";

        //SqlCommand cmd1 = new SqlCommand(checkuser, con);
        //int temp = Convert.ToInt32(cmd1.ExecuteScalar());
        SqlDataAdapter sda1 = new SqlDataAdapter(checkuser, con);
        DataTable dt1 = new DataTable();
        sda1.Fill(dt1);
        int temp=dt1.Rows.Count;
        if (temp > 0)
        {
            Response.Write("<script>alert('Data already exist');</script>");
            con.Close();
        }
        else
        {
            try
            {
                string insertQuery = "insert into signup (sig_name,sig_id_no,sig_email,sig_mobile,br_id,sig_sem) values (@sig_name,@sig_id_no,@sig_email,@sig_mobile,@br_id,@sig_sem)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@sig_name", txtname.Text);
                cmd.Parameters.AddWithValue("@sig_id_no", txtid.Text);
                cmd.Parameters.AddWithValue("@sig_email", txtemail.Text);
                cmd.Parameters.AddWithValue("@sig_mobile", txtmob.Text);
                cmd.Parameters.AddWithValue("@br_id", ddlbranch.Text);
                cmd.Parameters.AddWithValue("@sig_sem", ddlsem.SelectedValue);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Successfully Added');</script>");
                con.Close();
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }

    }



    protected void Button_Click(object sender, EventArgs e)
    {

    }
}
