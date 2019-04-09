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


public partial class dir2_student_student : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("../../Login.aspx");
        }
        try
        {
            if (Request.QueryString["logout"] != null)
            {
                if (Session["userid"] == null)
                {
                    Response.Redirect("../../Login.aspx");
                }
                if (Request.QueryString["logout"] == "1")
                {
                    if (Session["userid"] != null)
                    {
                        Session["userid"] = null;
                        Response.Redirect("../../Login.aspx");
                    }
                }
            }
            if (!Page.IsPostBack)
            {

                String uid = Session["userid"].ToString();
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
                conn.Open();
                string query = "select * from company WHERE com_id='" + uid + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                //img.ImageUrl = Server.MapPath("~/profile/" + );
   
                lblname.Text = dt.Rows[0][1].ToString();
                lblname1.Text = dt.Rows[0][1].ToString();
                lblemail.Text = dt.Rows[0][3].ToString();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("Exception:" + ex);
        }
    }
}

