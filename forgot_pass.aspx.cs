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
public partial class forgot_pass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
         SqlConnection conn = new SqlConnection();
         conn.ConnectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF; Integrated Security = True; Connect Timeout = 300";
         conn.Open();
         string query1 = "select * from signup where sig_email = '" + txtemail.Text + "'";
         SqlDataAdapter da1 = new SqlDataAdapter(query1, conn);
         DataTable dt1 = new DataTable();
         da1.Fill(dt1);
         int i = dt1.Rows.Count;
        if (i > 0)
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("jaladhipatel46@gmail.com");
            msg.To.Add(txtemail.Text);

            string q3 = "select pass from signup where sig_email = '" + txtemail.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(q3, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string password = dt.Rows[0][0].ToString();

            msg.Subject = "Your password for BVM Placement Portal.";
            msg.Body = "This is your password for BVM Placement portal is : " + password + " P.S.: Dont share with anyone!";
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
            Response.Write("<script>alert('Password of BVM Portal has been sent to your registerd Email Id')</script>");

        }

        string query2 = "select * from tpo where tpo_email = '" + txtemail.Text + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(query2, conn);
        DataTable dt2 = new DataTable();
        da2.Fill(dt2);
        int j = dt2.Rows.Count;
        if (j > 0)
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("jaladhipatel46@gmail.com");
            msg.To.Add(txtemail.Text);

            string q3 = "select tpo_pwd from tpo where tpo_email = '" + txtemail.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(q3, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string password = dt.Rows[0][0].ToString();

            msg.Subject = "Your password for BVM Placement Portal.";
            msg.Body = "This is your password for BVM Placement portal is : " + password + " P.S.: Dont share with anyone!";
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
            Response.Write("<script>alert('Password of BVM Portal has been sent to your registerd Email Id')</script>");
        }



        string query3 = "select * from coordinator where co_email = '" + txtemail.Text + "'";
        SqlDataAdapter da3 = new SqlDataAdapter(query3, conn);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        int k = dt3.Rows.Count;
        if (k > 0)
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("jaladhipatel46@gmail.com");
            msg.To.Add(txtemail.Text);

            string q3 = "select co_pwd from coordinator where co_email = '" + txtemail.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(q3, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string password = dt.Rows[0][0].ToString();

            msg.Subject = "Your password for BVM Placement Portal.";
            msg.Body = "This is your password for BVM Placement portal is : " + password + " P.S.: Dont share with anyone!";
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
            Response.Write("<script>alert('Password of BVM Portal has been sent to your registerd Email Id')</script>");
        }

        string query4 = "select * from Admin where a_email = '" + txtemail.Text + "'";
        SqlDataAdapter da4 = new SqlDataAdapter(query4, conn);
        DataTable dt4 = new DataTable();
        da4.Fill(dt4);
        int l = dt4.Rows.Count;
        if (l > 0)
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("jaladhipatel46@gmail.com");
            msg.To.Add(txtemail.Text);

            string q3 = "select a_pwd from Admin where a_email = '" + txtemail.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(q3, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string password = dt.Rows[0][0].ToString();

            msg.Subject = "Your password for BVM Placement Portal.";
            msg.Body = "This is your password for BVM Placement portal is : " + password + " P.S.: Dont share with anyone!";
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
            Response.Write("<script>alert('Password of BVM Portal has been sent to your registerd Email Id')</script>");
        }
     }
}