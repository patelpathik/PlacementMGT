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
        string checkuser = "select count(*) from tpo where tpo_email = '" + txtemail.Text + "' OR tpo_cno = '" + txtmob.Text + "' ";
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
                msg.To.Add(txtemail.Text);
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

                string insertQuery = "insert into tpo (tpo_name,tpo_email,tpo_cno,tpo_profile,tpo_pwd,tpo_quali) values (@tpo_name,@tpo_email,@tpo_cno,@tpo_profile,@tpo_pwd,@tpo_quali)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@tpo_name", txtname.Text);
                cmd.Parameters.AddWithValue("@tpo_email", txtemail.Text);
                cmd.Parameters.AddWithValue("@tpo_cno", txtmob.Text);
                cmd.Parameters.AddWithValue("@tpo_profile", txtprofile.Text);
                cmd.Parameters.AddWithValue("@tpo_pwd", ans);
                cmd.Parameters.AddWithValue("@tpo_quali", txtqul.Text);
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Data Succesfully Added')</script>");
                Response.Redirect("tpo_registration.aspx");
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}