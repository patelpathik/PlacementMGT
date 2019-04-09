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
                String q1 = "select * from slider";
                SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                DataTable dt = new DataTable();
                da1.Fill(dt);
                int count = dt.Rows.Count;
                String data = "<div class='slideshow - container'>";
                String btns = "";
                for (int i = 0; i < count; i++)
                {
                    String src = dt.Rows[i][2].ToString();
                    int demo = i + 1;
                    data += "<div class='mySlides fade'><div class='numbertext'>" + i + "/" + demo + "</div><img src = '" + src + "' style='width:100%'></div>";
                    btns += "<span class='dot' onclick='currentSlide(" + demo + ")'></span>";
                }
                data += "<a class='prev' onclick='plusSlides(-1)'>&#10094;</a><a class='next' onclick='plusSlides(1)'>&#10095;</a></div><br>";
                data += "<div style='text - align:center'>" + btns + "</div>";
                Response.Write(data);
            }
            else if(qs == "job")
            {
                String uid = Request.QueryString["userid"].ToString();
                String qtemp = "select br_id from signup where sig_id='" + uid + "'";
                //Response.Write("<h1>" + qtemp + "</h1>");
                SqlDataAdapter datemp = new SqlDataAdapter(qtemp, con);
                DataTable dttemp = new DataTable();
                datemp.Fill(dttemp);

                String br_id = dttemp.Rows[0][0].ToString();
                //Response.Write("<h1>"+br_id+"</h1>");
                try
                {
                    String q1 = "select * from placement p, company c where p.com_id=c.com_id  AND p.plc_id NOT IN (select plc_id from job where stu_id='" + uid + "')";
                    //Response.Write("<h1>" + q1 + "</h1>");
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt = new DataTable();
                    da1.Fill(dt);
                    int count = dt.Rows.Count;
                    //Response.Write("<h1>" + count + "</h1>");
                    int emptyflag = 0;
                    if (count != 0)
                    {
                        int count11 = 0;
                        for (int i = 0; i < count; i++)
                        {
                            String br_ids = dt.Rows[i][7].ToString();
                            String[] br_arr = null;
                            char[] splitchar = { ',' };
                            int pos = -1;
                            br_arr = br_ids.Split(splitchar);
                            try
                            {
                                pos = Array.IndexOf(br_arr, br_id);
                                if (pos > -1)
                                {
                                    emptyflag = 1;
                                    count11++;
                                    Response.Write("<tr><td>" + count11 + "</td><td>" + dt.Rows[i][10] + "</td><td>" + dt.Rows[i][2] + "</td><td>" + dt.Rows[i][3] + "</td><td>" + dt.Rows[i][4] + "</td><td>" + dt.Rows[i][5] + "</td><td>" + dt.Rows[i][6] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder' id='" + dt.Rows[i][0].ToString() + "' onclick='apply(this.id);'>Apply</button></tr>");
                                }
                            }
                            catch (Exception e12) { }
                        }
                    }
                    else
                    {
                        emptyflag = 1;
                        Response.Write("<tr><td colspan='8' align='center'><h1>No Entries</h1></td></tr>");
                    }
                    if (emptyflag == 0)
                    {
                        Response.Write("<tr><td colspan='8' align='center'><h1>No Entries</h1></td></tr>");
                    }
                }
                catch(Exception e11)
                {
                    Response.Write("<script>console.log("+e11.Message+");</script>");
                }
            }
            else if (qs == "savejob")
            {
                String plc_id = Request.QueryString["plc_id"].ToString();
                String user_id = Request.QueryString["userid"].ToString();

                String q1 = "insert into job (plc_id,stu_id) values ('" + plc_id + "','" + user_id + "')";
                SqlCommand cmd1 = new SqlCommand(q1,con);
                cmd1.ExecuteNonQuery();

                Response.Write("1");
            }
            else if (qs == "appliedjob")
            {
                string userid = Request.QueryString["userid"].ToString();
                String q1 = "select * from job j, placement p,company c where p.com_id=c.com_id AND j.plc_id=p.plc_id AND stu_id='" + userid + "'";
                //Response.Write("<h1>" + q1 + "</h1>");
                SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                if(dt1.Rows.Count > 0)
                {
                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        String status = "N/A";
                        //String stcode = dt1.Rows[i][13].ToString();
                        String stcode = dt1.Rows[i][4].ToString();
                        if (stcode.Equals("-1")) {
                            status = "Pending";
                        }
                        else if (stcode.Equals("0"))
                        {
                            status = "Rejected";
                        }
                        else if (stcode.Equals("1"))
                        {
                            status = "Accepted";
                        }
                        String data = "<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][15] + "</td><td>" + dt1.Rows[i][16] + "</td><td>" + dt1.Rows[i][17] + "</td><td>" + dt1.Rows[i][18] + "</td><td>" + dt1.Rows[i][10] + "</td><td>" + dt1.Rows[i][11] + "</td><td>" + status + "</td></tr>";
                        Response.Write(data);
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