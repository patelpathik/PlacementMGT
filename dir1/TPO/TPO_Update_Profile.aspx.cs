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

public partial class dir1_TPO_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["logout"] != null)
            {
                if (Request.QueryString["logout"] == "1")
                {
                    Session["userid"] = null;
                    Session["utype"] = null;
                    Response.Redirect("../../Login.aspx");
                }
            }
            if (!Page.IsPostBack)
            {
                String uid = Session["userid"].ToString();
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
                conn.Open();
                string query = "select * from tpo WHERE tpo_id='" + uid + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtname.Text = dt.Rows[0][1].ToString();
                txtprofile.Text = dt.Rows[0][4].ToString();
                txtqul.Text = dt.Rows[0][6].ToString();
                txtmob.Text = dt.Rows[0][3].ToString();
                txtemail.Text = dt.Rows[0][2].ToString();
           
                conn.Close();
             }
        }
        catch (Exception ex)
        {
            Response.Write("Exception:" + ex);
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            String uid = Session["userid"].ToString();
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
            conn.Open();
            string q = "UPDATE tpo set tpo_name = '"+ txtname.Text + "',tpo_email = '" + txtemail.Text + "', tpo_cno = '" + txtmob.Text + "', tpo_profile = '" + txtprofile.Text + "' , tpo_quali = '" + txtqul.Text + "' WHERE tpo_id =" + uid ;
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Profile Successfully Updated');</script>");
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }
}