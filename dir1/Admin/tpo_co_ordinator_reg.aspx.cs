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
       /* btnupdate.Visible = false;
        if (Request.QueryString["co_id"] != null)
        {
            if (Request.QueryString["dflag"] != null && Request.QueryString["co_id"] != null)
            {
                if (Request.QueryString["dflag"].ToString() == "1")
                {
                    //Response.Write("<script>if(confirm('Are you sure you want to DELETE record ?')){} else{window.top.location='company_reg.php';}</script>");
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
                    con.Open();
                    string del = Request.QueryString["co_id"].ToString();
                    string delete = "Delete from coordinator WHERE co_id=" + del;
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script type='text/javascript'>window.top.location='tpo_co_ordinator_reg.aspx';</script>");
                    con.Close();
                }
            }
            else {
                btnsubmit.Visible = false;
                btnupdate.Visible = true;
                txtpass.Visible = false;
                txtcpass.Visible = false;
                
                string com_id = Request.QueryString["com_id"].ToString();
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
                con.Open();
                string query = "select * from company WHERE com_id='" + com_id + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtname.Text = dt.Rows[0][1].ToString();
                txtcont.Text = dt.Rows[0][3].ToString();
                txtadd.Text = dt.Rows[0][8].ToString();
                txtpin.Text = dt.Rows[0][9].ToString();
                txtcity.Text = dt.Rows[0][4].ToString();
                txtstate.Text = dt.Rows[0][5].ToString();
                txtemail.Text = dt.Rows[0][2].ToString();
            }
        }
        if (Request.QueryString["com_id1"] != null)
        {

        }*/
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
        con.Open();
        string checkuser = "select count(*) from coordinator where co_email = '" + txtmail.Text + "' OR co_cno = '" + txtcont.Text + "' OR id_no = '" + txtidno.Text+ "' ";
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
                msg.Subject = "Your password for BVM Placement Portal.";
                msg.Body = "Welcome to BVM Placement Management System. This is your password for BVM Placement TPO Co-ordinator is : " + ans + ". P.S.: Dont share with anyone!";
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

                string insertQuery = "insert into coordinator (co_name,co_email,co_cno,br_id,co_pwd,id_no) values (@co_name,@co_email,@co_cno,@br_id,@co_pwd,@id_no)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@co_name", txtname.Text);
                cmd.Parameters.AddWithValue("@co_email", txtmail.Text);
                cmd.Parameters.AddWithValue("@co_cno", txtcont.Text);
                cmd.Parameters.AddWithValue("@br_id", ddlbname.Text);
                cmd.Parameters.AddWithValue("@co_pwd", ans );
                cmd.Parameters.AddWithValue("@id_no", txtidno.Text);

                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Data Successfully Added')</script>");
                Response.Redirect("tpo_co_ordinator_reg.aspx");
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error:" + ex.ToString());
            }
        }
    }
}
