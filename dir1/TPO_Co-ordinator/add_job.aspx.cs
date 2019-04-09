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
using System.Net;
using System.Net.Mail;
using System.Text;


public partial class dir1_TPO_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
        con.Open();
        /*string checkuser = "select count(*) from placement where com_id = '" + ddlname.SelectedValue + "' ";
        SqlCommand cmd1 = new SqlCommand(checkuser, con);
        SqlDataAdapter sda1 = new SqlDataAdapter(checkuser, con);
        DataTable dt1 = new DataTable();
        sda1.Fill(dt1);
        int temp = dt1.Rows.Count;
        if (temp > 1)
        {
            Response.Write("<script>alert('Company is already added');</script>");
            Response.Redirect("add_job.aspx");
            con.Close();
        }
        else*/
        {
            try
            {
                string brc = "";
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {

                        brc = brc + CheckBoxList1.Items[i].Value + ",";
                    }

                }

                string insertQuery = "insert into placement (com_id,description,package,location,time,date,branch) values (@com_id,@description,@package,@location,@time,@date,@branch)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@com_id", ddlname.SelectedValue);
                cmd.Parameters.AddWithValue("@description", txtdes.Text);
                cmd.Parameters.AddWithValue("@package", txtpck.Text);
                cmd.Parameters.AddWithValue("@location", txtloc.Text);
                cmd.Parameters.AddWithValue("@time", txttime.Text);
                cmd.Parameters.AddWithValue("@date", txtdate.Text);
                cmd.Parameters.AddWithValue("@branch", brc);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Succesfully Added')</script>");
                Response.Redirect("add_job.aspx");

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}