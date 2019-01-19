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

public partial class dir1_Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select count(*) from coordinator where co_email = '" + txtmail.Text + "' OR co_cno = '" + txtcont.Text + "' OR id_no = '" + txtidno.Text + "' ";
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
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("jaladhipatel46@gmail.com");
                msg.To.Add(txtmail.Text);
                int ans;
                int min = 100000;
                int max = 999999;
                Random rdm = new Random();
                ans = rdm.Next(min, max);
                //string q3 = "insert into company (com_pwd) values ('"+ans+"') ";
                //SqlCommand up = new SqlCommand(q3, con);
                //up.ExecuteNonQuery();
                msg.Subject = "Your password for BVM Placement Portal.";
                msg.Body = "Welcome to BVM Placement Management System. This is your password for BVM Placement portal is : " + ans + ". P.S.: Dont share with anyone!";
                SmtpClient smt = new SmtpClient();
                smt.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "jaladhipatel46@gmail.com"; //Your Email ID  
                ntwd.Password = "jaladhi@27733688"; // Your Password  
                smt.UseDefaultCredentials = true;
                smt.Credentials = ntwd;
                smt.Port = 587;
                smt.EnableSsl = true;
                smt.Send(msg);
                Response.Write("<script>alert('Data Successfully Added')</script>");



                string insertQuery = "insert into coordinator (co_name,co_email,co_cno,co_pwd,br_id,id_no) values (@co_name,@co_email,@co_cno,@co_pwd,@br_id,@id_no)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@co_name", txtname.Text);
                cmd.Parameters.AddWithValue("@co_email", txtmail.Text);
                cmd.Parameters.AddWithValue("@co_cno", txtcont.Text);
                cmd.Parameters.AddWithValue("@co_pwd", ans);
                cmd.Parameters.AddWithValue("@br_id", ddlbname.Text);
                cmd.Parameters.AddWithValue("@id_no", txtidno.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Successfully Added')</script>");
                con.Close();
                Response.Redirect("tpo_co_ordinator_reg.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}
