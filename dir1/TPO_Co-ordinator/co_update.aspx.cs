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

public partial class dir1_TPO_Co_ordinator_Default : System.Web.UI.Page
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
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
                conn.Open();
                string query = "select * from coordinator WHERE co_id='" + uid + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtname.Text = dt.Rows[0][1].ToString();
                txtmail.Text = dt.Rows[0][2].ToString();
                txtcont.Text = dt.Rows[0][3].ToString();
                txtidno.Text = dt.Rows[0][8].ToString();
                ddlbname.SelectedValue = dt.Rows[0][5].ToString();
              
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
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            conn.Open();
            string q = "UPDATE coordinator set co_name = '" + txtname.Text + "',id_no = '"+txtidno.Text+"' ,co_email = '" + txtmail.Text + "', co_cno = '" + txtcont.Text + "', br_id = '" + ddlbname.SelectedValue + "' WHERE co_id =" + uid;
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