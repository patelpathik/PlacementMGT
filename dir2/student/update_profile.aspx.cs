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

public partial class dir2_student_Default2 : System.Web.UI.Page
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
                string query = "select * from signup s, branch b where s.br_id=b.br_id AND sig_id='" + uid + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                  //img.ImageUrl = Server.MapPath("~/profile/" + );
                String imgurl = dt.Rows[0][8].ToString();
                String imgurl2 = "../../profile/" + imgurl;
                Image1.AlternateText = imgurl2;
                Image1.ImageUrl = imgurl2;
                txtname.Text = dt.Rows[0][1].ToString();
                txtid.Text = dt.Rows[0][2].ToString();
                txtemail.Text = dt.Rows[0][3].ToString();
                txtmob.Text = dt.Rows[0][4].ToString();
                ddlbranch.SelectedValue =dt.Rows[0][18].ToString();
                ddlsem.SelectedValue = dt.Rows[0][6].ToString();
                txtenrol.Text = dt.Rows[0][10].ToString();
                txtadd.Text = dt.Rows[0][11].ToString();
                ddlcity.SelectedValue = dt.Rows[0][12].ToString();
                ddlstate.SelectedValue = dt.Rows[0][13].ToString();
                //txtdob.Text = dt.Rows[0][14].ToString();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write("Exception:" + ex);
        }
    }

    protected void txtupdate_Click(object sender, EventArgs e)
    {
        try
        {
            String uid = Session["userid"].ToString();
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            conn.Open();
            string insertQuery = "update signup set sig_name = '"+txtname.Text+ "',sig_id_no= '" + txtid.Text + "',sig_email= '" + txtemail.Text + "',sig_mobile= '" + txtmob.Text + "',br_id= '" + ddlbranch.SelectedValue + "',sig_sem= '" + ddlsem.SelectedValue + "',enrolment= '" + txtenrol.Text + "',address= '" + txtadd.Text + "',sig_city= '" + ddlcity.SelectedValue + "',sig_state= '" + ddlstate.SelectedValue + "',sig_dob= '" + txtdob.Text + "',imagename=@imagename,imagepath=imagepath where sig_id=" + uid;
            SqlCommand cmd = new SqlCommand(insertQuery, conn);
            string filename = Path.GetFileName(FileUpload1.FileName);
            if (filename != null)
            {
                try
                {
                    FileUpload1.SaveAs(Server.MapPath("~/profile/" + filename));
                }
                catch (Exception e2)
                {

                }
            }
            else
            {
                filename = "";
            }
            cmd.Parameters.AddWithValue("@imagename", filename);
            cmd.Parameters.AddWithValue("@imagepath", "profile/" + filename);
            //Response.Write("<script>alert('"+insertQuery+"');</script>");
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Data Successfully Updated');</script>");
            Response.Redirect("update_profile.aspx");
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }
}



