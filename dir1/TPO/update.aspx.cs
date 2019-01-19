using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

public partial class dir1_TPO_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["tn"]!= null)
        {
            if (Request.QueryString["tn"].ToString() == "stu_auth") {
                string clg_id = Request.QueryString["v1"].ToString();
                string email = Request.QueryString["v2"].ToString();
                string contact = Request.QueryString["v3"].ToString();
                string br_id = Request.QueryString["v4"].ToString();
                string sem = Request.QueryString["v5"].ToString();
                string sig_id = Request.QueryString["ref"].ToString();

                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF; Integrated Security = True; Connect Timeout = 3000";
                con.Open();
                string upd1 = "update signup set sig_id_no='" + clg_id + "', sig_email='" + email + "', sig_mobile='" + contact + "', br_id='" + br_id + "', sig_sem='" + sem + "' where sig_id='" + sig_id + "'";
                SqlCommand cmd = new SqlCommand(upd1, con);
                cmd.ExecuteNonQuery();


            }
        }
    }
}