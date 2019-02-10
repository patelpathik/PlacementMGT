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

public partial class dir2_student_load_data : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF; Integrated Security = True; Connect Timeout = 3000";
            con.Open();
            String qs = Request.QueryString["qs"].ToString();
            if (qs == "notice")
            {
                string dis = Request.QueryString["dis"].ToString();
                string not = "";
                if (dis.Equals("today"))
                {
                    not = "select * from notice";
                }
                else if (dis.Equals("week"))
                {
                    not = "select * from notice";
                }
                else if (dis.Equals("month"))
                {
                    not = "select * from notice";
                }
                SqlDataAdapter da1 = new SqlDataAdapter(not, con);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                int count = dt1.Rows.Count;
                if (count != 0)
                {
                    for (int i = 0; i < count; i++)
                    {
                        Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][7] + "</td><td><a target='_blank' href='../../" + dt1.Rows[i][6] + "'>Download File</a></td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td></tr>");
                    }
                }
            }
        }
        catch(Exception e1)
        {
            Response.Write(e1);
        }
    }
}