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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void txtbtn_Click(object sender, EventArgs e)
    {
        //string ut = utype.SelectedValue;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF; Integrated Security = True; Connect Timeout = 300";
        conn.Open();
       /* if (ut == "S")
        {
            String id = txtuname.Text.ToUpper().ToString();
           query1 = "select * from signup where sig_id_no = '" + id + "' AND pass = '" + txtpass.Text + "' ";
        }

        else if (ut == "T")
        {
            query1 = "select * from tpo where tpo_email = '" + txtuname.Text + "' AND tpo_pwd = '" + txtpass.Text + "' ";
        }
        else if (ut == "C")
        {
            query1 = "select * from coordinator where co_email = '" + txtuname.Text + "' AND co_pwd = '" + txtpass.Text + "' ";
        }
        else if (ut == "A")
        {
            query1 = "select * from Admin where a_email = '" + txtuname.Text + "' AND a_pwd = '" + txtpass.Text + "' ";

        }
        else if (ut == "CO")
        {
            query1 = "select * from company where com_email = '" + txtuname.Text + "' AND com_pwd = '" + txtpass.Text + "' ";
        }
        else
        {
            Response.Write("<script>alert('Please select relevant user type'); </script>");
        }*/

        //txtuname.Text = query1;
        String id = txtuname.Text.ToUpper().ToString();
        string query1 = "select * from signup where sig_id_no = '" + id + "' AND pass = '" + txtpass.Text + "' ";
        SqlDataAdapter da1 = new SqlDataAdapter(query1, conn);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        int i = dt1.Rows.Count;
        if (i > 0)
        {
            string temp = dt1.Rows[0][0].ToString();
            Session["userid"] = temp;
            Session["uname"] = dt1.Rows[0][2].ToString();
            Response.Redirect("dir2/student/Home.aspx");
        }
        string query2 = "select * from tpo where tpo_email = '" + txtuname.Text + "' AND tpo_pwd = '" + txtpass.Text + "' ";
        SqlDataAdapter da2 = new SqlDataAdapter(query2, conn);
        DataTable dt2 = new DataTable();
        da2.Fill(dt2);
        int j = dt2.Rows.Count;
        if (j > 0)
        {
            string temp = dt2.Rows[0][0].ToString();
            Session["userid"] = temp;
            Session["uname"] = dt2.Rows[0][1].ToString();
            Response.Redirect("dir1/TPO/home.aspx");
        }
        string query3 = "select * from coordinator where co_email = '" + txtuname.Text + "' AND co_pwd = '" + txtpass.Text + "' ";
        SqlDataAdapter da3 = new SqlDataAdapter(query3, conn);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        int k = dt3.Rows.Count;
        if (k > 0)
        {
            string temp = dt3.Rows[0][0].ToString();
            Session["userid"] = temp;
            Session["uname"] = dt3.Rows[0][1].ToString();
            Response.Redirect("dir1/TPO_Co-ordinator/home.aspx");
        }
        string query4 = "select * from Admin where a_email = '" + txtuname.Text + "' AND a_pwd = '" + txtpass.Text + "' ";
        SqlDataAdapter da4 = new SqlDataAdapter(query4, conn);
        DataTable dt4 = new DataTable();
        da4.Fill(dt4);
        int l = dt4.Rows.Count;
        if (l > 0)
        {
            string temp = dt4.Rows[0][0].ToString();
            Session["userid"] = temp;
            Session["uname"] = dt4.Rows[0][1].ToString();
            Response.Redirect("dir1/Admin/home.aspx");
        }
        string query5 = "select * from company where com_email = '" + txtuname.Text + "' AND com_pwd = '" + txtpass.Text + "' ";
        SqlDataAdapter da5 = new SqlDataAdapter(query5, conn);
        DataTable dt5 = new DataTable();
        da5.Fill(dt5);
        int m = dt5.Rows.Count;
        if (m > 0)
        {
            string temp = dt5.Rows[0][0].ToString();
            Session["userid"] = temp;
            Session["uname"] = dt5.Rows[0][1].ToString();
            Response.Redirect("dir2/company/update_profile.aspx");
        }
        Response.Write("<script>alert('Please input valid username or password '); </script>");

    }
}
