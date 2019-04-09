using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class dir2_company_load_data : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF; Integrated Security = True; Connect Timeout = 3000";
            con.Open();
            String tb = Request.QueryString["tb"].ToString();
            if (tb == "job")
            {
                String userid = Request.QueryString["userid"].ToString();
                String query1 = "select * from job j,signup s where plc_id=(select plc_id from placement where com_id='" + userid + "') AND j.stu_id=s.sig_id AND j.status='1'";
                //Response.Write("<h1>" + query1 + "</h1>");
                SqlDataAdapter da = new SqlDataAdapter(query1, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    for(int i = 0; i < dt.Rows.Count; i++)
                    {
                        String status = "";
                        if (dt.Rows[i][3].ToString().Equals("-1"))
                        {
                            status = "<button type = 'button' class='btn btn-success btn-round' id='" + dt.Rows[i][0].ToString() + "' onclick='accept(this.id);'><i class='fa fa-check'></i></button>&nbsp;&nbsp;&nbsp;<button type = 'button' class='btn btn-danger btn-round' id='" + dt.Rows[i][0].ToString() + "' onclick='reject(this.id);'><i class='fa fa-times'></i></button>";
                        }
                        else if (dt.Rows[i][3].ToString().Equals("0"))
                        {
                            status = "<button type = 'button' class='btn btn-success btn-round' id='" + dt.Rows[i][0].ToString() + "' onclick='accept(this.id);'><i class='fa fa-check'></i></button>";
                        }
                        else if (dt.Rows[i][3].ToString().Equals("1"))
                        {
                            status = "<button type = 'button' class='btn btn-danger btn-round' id='" + dt.Rows[i][0].ToString() + "' onclick='reject(this.id);'><i class='fa fa-times'></i></button>";
                        }
                        String data = "<tr><td>" + (i + 1) + "</td><td>" + dt.Rows[i][6].ToString() + "</td><td>" + dt.Rows[i][9].ToString() + "</td><td>" + dt.Rows[i][8].ToString() + "</td><td>" + dt.Rows[i][7].ToString() + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder' onclick='window.top.location=\"view_profile.aspx?uid=\"+this.id;' id='" + dt.Rows[i][5].ToString() + "'><i class='la la-user'></i></button></td><td>" + status + "</td></tr>";
                        Response.Write(data);
                    }
                }
            }
            else if (tb == "updjob")
            {
                String job_id = Request.QueryString["job_id"].ToString();
                String status = Request.QueryString["status"].ToString();

                String query1 = "update job set approve='" + status + "' where job_id='" + job_id + "'";
                SqlCommand up = new SqlCommand(query1, con);
                up.ExecuteNonQuery();
            }
        }
        catch (Exception e1)
        {
            Response.Write("<script>console.log(" + e1.Message + ");</script>");
        }
    }
}