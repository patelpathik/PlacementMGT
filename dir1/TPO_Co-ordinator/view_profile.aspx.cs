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
using System.IO;
using System.Text;

public partial class dir1_Admin_Default2 : System.Web.UI.Page
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

                String uid = Request.QueryString["uid"].ToString();
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
                conn.Open();
                string query = "select * from signup s, branch b where s.br_id=b.br_id AND sig_id='" + uid + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                //img.ImageUrl = Server.MapPath("~/profile/" + );
                String imgurl = dt.Rows[0][8].ToString();
                String imgurl2 = "../../profile/" + imgurl;
                Image1.AlternateText = imgurl2;
                Image1.ImageUrl = imgurl2;
                lblname.Text = dt.Rows[0][1].ToString();
                lblid.Text = dt.Rows[0][2].ToString();
                lblemail.Text = dt.Rows[0][3].ToString();
                txtmob.Text = dt.Rows[0][4].ToString();
                ddlbranch.Text = dt.Rows[0][5].ToString();
                ddlsem.Text = dt.Rows[0][6].ToString();
                txtenrol.Text = dt.Rows[0][10].ToString();
                txtadd.Text = dt.Rows[0][11].ToString();
                ddlcity.Text = dt.Rows[0][12].ToString();
                ddlstate.Text = dt.Rows[0][13].ToString();
                txtdob.Text = dt.Rows[0][14].ToString();
                txtcpi.Text = dt.Rows[0][18].ToString();
                Session["temp_url"] = "../../" + dt.Rows[0][19].ToString();
                //Response.Redirect(temp_url);
                //resume_dn.PostBackUrl = temp_url;
                //string data = "<a  class='btn btn-accent m - btn m - btn--air m-btn--custom' href='"+temp_url+"'>Download</a>";
                //Response.Write("<script>document.getElementById('res_link').innerHTML="+data+";</script>");
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("Exception:" + ex);
        }
    }

    protected void txtdown_Click(object sender, EventArgs e)
    {
        Response.Redirect(Session["temp_url"].ToString());
        Response.Redirect("view_profile.aspx");
    }
}