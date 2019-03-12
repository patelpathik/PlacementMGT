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
                        Response.Write("<tr><td>" + dt1.Rows[i][3] + "  " + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][7] + "</td><td><a target='_blank' href='../../" + dt1.Rows[i][6] + "'>Download File</a></td></tr>");
                    }
                }
            }
            else if(qs == "slider")
            {
                String q1 = "select * from slider"; //change tablename
                SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                DataTable dt = new DataTable();
                da1.Fill(dt);
                int count = dt.Rows.Count;
                String data = "<div class='slideshow - container'>";
                String btns = "";
                for (int i = 0; i < count; i++)
                {
                    String src = dt.Rows[i][2].ToString(); //replace 1 with column no. which contains image source/path
                    data += "<div class='mySlides fade'>< div class='numbertext'>" + i + "/" + (i + 1) + "</div><img src = '" + src + "' style='width:100%'></div>";
                    btns += "<span class='dot' onclick='currentSlide("+(i+1)+")'></span>";
                }
                data += "<a class='prev' onclick='plusSlides(-1)'>&#10094;</a>< a class='next' onclick='plusSlides(1)'>&#10095;</a></div><br>";
                data += "<div style='text - align:center'>" + btns + "</div>";
                Response.Write(data);
            }
        }
        catch(Exception e1)
        {
            Response.Write(e1);
        }
    }
}