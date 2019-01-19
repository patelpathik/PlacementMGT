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

public partial class dir2_company_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
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
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string query = "select ct_name from city WHERE st_name = '" + ddlstate.SelectedValue + "'";
            SqlDataAdapter daa = new SqlDataAdapter(query, con);
            DataTable dtb = new DataTable();
            daa.Fill(dtb);
            ddlcity.DataSource = dtb;
            ddlcity.DataBind();
        }
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
                string query = "select * from company WHERE com_id='" + uid + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtname.Text = dt.Rows[0][1].ToString();
                txtcont.Text = dt.Rows[0][3].ToString();
                txtadd.Text = dt.Rows[0][8].ToString();
                ddlcity.SelectedValue = dt.Rows[0][4].ToString();
                ddlstate.SelectedValue = dt.Rows[0][5].ToString();
                txtemail.Text = dt.Rows[0][2].ToString();
                txtinfo.Text = dt.Rows[0][7].ToString();

                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("Exception:" + ex);
        }
    }

    protected void txtupdate_Click1(object sender, EventArgs e)
    {
        try
        {
            String uid = Session["userid"].ToString();
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\PlacementMGT\placement_management.mdf;Integrated Security=True;Connect Timeout=300");
            conn.Open();
            string q = "UPDATE company set com_name = '" + txtname.Text + "',com_email = '" + txtemail.Text + "', com_cno = '" + txtcont.Text + "', c_id = '" + ddlcity.SelectedValue + "', st_id = '" + ddlstate.SelectedValue + "', com_info = '" + txtinfo.Text + "', com_add = '" + txtadd.Text + "' WHERE com_id =" + uid;
            //Response.Write(q);
            //txtname.Text = q;
            //Label2.Text = q;
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