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



public partial class dir1_TPO_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string query = "select distinct(st_name) from city order by st_name asc";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
        }

        if (this.IsPostBack)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string query = "select ct_name from city WHERE st_name = '" + ddlstate.SelectedValue + "'";
            SqlDataAdapter daa = new SqlDataAdapter(query, con);
            DataTable dtb = new DataTable();
            daa.Fill(dtb);
            ddlcity.DataSource = dtb;
            ddlcity.DataBind();
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select count(*) from company where com_email = '" + txtemail.Text + "' OR com_cno = '" + txtcont.Text + "' ";
        SqlCommand cmd1 = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(cmd1.ExecuteScalar());
        if (temp == 1)
        {
            Response.Write("<script>alert('Data already exist');</script>");
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


                string insertQuery = "insert into company (com_name,com_email,com_cno,c_id,st_id,com_info,com_add,com_pwd) values (@com_name,@com_email,@com_cno,@c_id,@st_id,@com_info,@com_add,@com_pwd)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@com_name", txtname.Text);
                cmd.Parameters.AddWithValue("@com_email", txtemail.Text);
                cmd.Parameters.AddWithValue("@com_cno", txtcont.Text);
                cmd.Parameters.AddWithValue("@c_id", ddlcity.SelectedValue);
                cmd.Parameters.AddWithValue("@st_id", ddlstate.SelectedValue);
                cmd.Parameters.AddWithValue("@com_add", txtadd.Text);
                cmd.Parameters.AddWithValue("@com_info", txtdetail.Text);
                cmd.Parameters.AddWithValue("@com_pwd", ans);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Succesfully Added');</script>");
                Response.Redirect("company_reg.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}
