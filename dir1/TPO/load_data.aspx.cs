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

public partial class load_data : System.Web.UI.Page
{
    private int javascript;
    private int text;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF; Integrated Security = True; Connect Timeout = 3000";
            con.Open();
            string qs = Request.QueryString["tb"].ToString();
            if (qs == "signup")
            {
                //string signup = "select * from signup s, branch b where s.br_id=b.br_id AND s.status=-1";
                string sortby = Request.QueryString["sortby"].ToString();
                string signup = "select * from signup s, branch b where s.br_id=b.br_id order by s.status";
                if (sortby == "pending")
                {
                    signup = "select * from signup s, branch b where s.br_id=b.br_id AND s.status=-1 order by s.status";
                }
                else if (sortby == "verified")
                {
                    signup = "select * from signup s, branch b where s.br_id=b.br_id AND s.status=1 order by s.status";
                }
                else if (sortby == "blocked")
                {
                    signup = "select * from signup s, branch b where s.br_id=b.br_id AND s.status=0 order by s.status";
                }
                //Response.Write(signup);
                SqlDataAdapter da1 = new SqlDataAdapter(signup, con);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                int count = dt1.Rows.Count;
                if (count != 0)
                {
                    for (int i = 0; i < count; i++)
                    {
                        string id = dt1.Rows[i][0].ToString();
                        //string status = dt1.Rows[i][7].ToString();
                        string status = dt1.Rows[i][15].ToString();
                        string s = "";
                        string data = "";
                        if (status == "-1")
                        {
                            s = "Pending";
                            data = "<button type = 'button' class='btn btn-success btn-round' id='" + id + "' onclick='accept(this.id);'><i class='fa fa-check'></i></button>&nbsp;&nbsp;&nbsp;<button type = 'button' class='btn btn-danger btn-round' id='" + id + "' onclick='reject(this.id);'><i class='fa fa-times'></i></button>";
                        }
                        else if (status == "0")
                        {
                            s = "Blocked";
                            //data = "<button type = 'button' class='btn btn-success btn-circle' id='" + id + "' onclick='accept(this.id);'><i class='fa fa-check'></i></button>&nbsp;&nbsp;&nbsp;<button type = 'button' class='btn btn-warning btn-circle' id='" + id + "' onclick='reject(this.id);' disabled><i class='fa fa-times'></i></button>";
                            data = "<button type = 'button' class='btn btn-success btn-round' id='" + id + "' onclick='accept(this.id);'><i class='fa fa-check'></i></button>";
                        }
                        else if (status == "1")
                        {
                            s = "Verified";
                            //data = "<button type = 'button' class='btn btn-danger btn-circle' id='" + id + "' onclick='accept(this.id);' disabled><i class='fa fa-check'></i></button>&nbsp;&nbsp;&nbsp;<button type = 'button' class='btn btn-warning btn-circle' id='" + id + "' onclick='reject(this.id);'><i class='fa fa-times'></i></button>";
                            data = "<button type = 'button' class='btn btn-danger btn-round' id='" + id + "' onclick='reject(this.id);'><i class='fa fa-times'></i></button>";
                        }
                        
                        SqlDataAdapter dda = new SqlDataAdapter("select * from branch", con);
                        DataTable ddt = new DataTable();
                        dda.Fill(ddt);
                        int p;
                        string dd;

                        string temp2 = dt1.Rows[i][0].ToString();
                        string id1 = dt1.Rows[i][0].ToString();
                        string c1 = id1 + "c1";
                        string c2 = id1 + "c2";
                        string c3 = id1 + "c3";
                        string c4 = id1 + "c4";
                        string c5 = id1 + "c5";
                        string md = temp2 + "m";


                        dd = "<select class='patrick form-control' disabled id='" + c4 + "' style='max-width:250px;'>";
                        string dd1 = "";
                        for (p = 0; p < ddt.Rows.Count-1; p++)
                        {
                            string token1 = ddt.Rows[p][0].ToString();
                            string token2 = dt1.Rows[i][18].ToString();
                            if (token1==token2) {
                                dd1 +="<option value='"+token1+"' selected>"+ ddt.Rows[p][2]+" ("+ ddt.Rows[p][3] + ")</option>";
                            }
                            else
                            {
                                dd1 += "<option value='" + token1 + "'>" + ddt.Rows[p][2] + " (" + ddt.Rows[p][3] + ")</option>";
                            }
                        }
                        dd += dd1;
                        dd += "</select>";


                        string semdd = "<select class='patrick form-control' disabled id='" + c5 + "' style='width:auto;'>";
                        string dd2 = "";
                        for (p = 1; p <=8; p++)
                        {
                            string token2 = dt1.Rows[i][6].ToString();
                            if (p.ToString()== token2)
                            {
                                dd2 += "<option value='" + p + "' selected>" + p + "</option>";
                            }
                            else
                            {
                                dd2 += "<option value='" + p + "'>" + p + "</option>";
                            }
                        }
                        semdd += dd2;
                        semdd += "</select>";


                        String eu = "<button type = 'button' class='btn btn-info btn-round' id='"+temp2+ "' onclick='edit1(this.id);'><i class='fa fa-edit'></i></button>";

                        //dd = "";
                        String imgurl = "../../profile/" + dt1.Rows[i][8];
                        //Response.Write("<tr><td>"+(i+1)+"</td><td>"+dt1.Rows[i][1]+ "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][4] + "</td><td>" + dt1.Rows[i][12] + "</td><td>" + dt1.Rows[i][6] + "</td><td>" + dt1.Rows[i][7] + "</td><td>"+ "<button type = 'button' class='btn btn-info btn-circle' id='"+id+ "' onclick='accept(this.id);'><i class='fa fa-check'></i></button>&nbsp;&nbsp;&nbsp;<button type = 'button' class='btn btn-warning btn-circle' id='" + id + "' onclick='reject(this.id);'><i class='fa fa-times'></i></button>" + "</td></tr>");
                        //Response.Write("<tr><td>" + (i + 1) + "</td><td><img style='background:url(" + imgurl + "); background-position:center; background-size:cover; border-radius:50px; height:50px; width:50px;'><br>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][4] + "</td><td>" + dt1.Rows[i][20] + " (" + dt1.Rows[i][21] + ")</td><td>" + dt1.Rows[i][6] + "</td><td>" + s + "</td><td align='center'>" + data + "</td><td>" + eu + "</td></tr>");
                        Response.Write("<tr><td>" + (i + 1) + "</td><td><img style='background:url(" + imgurl + "); background-position:center; background-size:cover; border-radius:50px; height:50px; width:50px;'><br>" + dt1.Rows[i][1] + "</td><td><input type='text' id='"+c1+ "' class='patrick form-control' disabled style='max-width:100px;' value='" + dt1.Rows[i][2] + "'></td><td><input type='text' id='" + c2 + "' class='patrick form-control' disabled value='" + dt1.Rows[i][3] + "'></td><td><input type='text' id='" + c3 + "' disabled class='patrick form-control' style='max-width:150px;' value='" + dt1.Rows[i][4] + "'></td><td>" + dd + "</td><td>" + semdd + "</td><!--<td>" + s + "</td>--><td align='center'>" + data + "</td><td><div style='align:center' id='" + md + "'>" + eu + "</div></td></tr>");
                    }
                }
                else
                {
                    Response.Write("<tr><td colspan='10' align='center'><i>No records found!</i></td></tr>");
                }
            }
            else if (qs == "auth_signup")
            {
                try
                {
                    string val = Request.QueryString["val"].ToString();
                    string id = Request.QueryString["id"].ToString();
                    string q1 = "update signup set status=" + val + " where sig_id=" + id;
                    if (val == "1")
                    {
                        MailMessage msg = new MailMessage();
                        msg.From = new MailAddress("jaladhipatel46@gmail.com");
                        string q2 = "select sig_email from signup where sig_id = " + id;
                        SqlDataAdapter da1 = new SqlDataAdapter(q2, con);
                        DataTable dt1 = new DataTable();
                        da1.Fill(dt1);
                        string email_to = dt1.Rows[0][0].ToString();
                        msg.To.Add(email_to);
                        int ans;
                        int min = 100000;
                        int max = 999999;
                        Random rdm = new Random();
                        ans = rdm.Next(min, max);
                        string q3 = "update signup set pass=" + ans + " where sig_id=" + id;
                        SqlCommand up = new SqlCommand(q3, con);
                        up.ExecuteNonQuery();
                        //msg.Subject = "Your password for BVM Placement is : "+ ans;
                        msg.Subject = "Your password for BVM Placement Portal.";
                        msg.Body = "This is your password for BVM Placement portal is : " + ans + " P.S.: Dont share with anyone!";
                        SmtpClient smt = new SmtpClient();
                        smt.Host = "smtp.gmail.com";
                        System.Net.NetworkCredential ntwd = new NetworkCredential();
                        ntwd.UserName = "jaladhipatel46@gmail.com"; //Your Email ID  
                        ntwd.Password = "jaladhi@27733688"; // Your Password  
                        smt.UseDefaultCredentials = true;
                        smt.Credentials = ntwd;
                        smt.Port = 587;
                        smt.EnableSsl = true;
                        smt.Send(msg);
                        Response.Write("Email Sent Successfully");
                    }
                    //lbmsg.ForeColor = System.Drawing.Color.ForestGreen;
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
            else if (qs == "comp")
            {
                string comp = "select * from company";
                SqlDataAdapter da1 = new SqlDataAdapter(comp, con);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                int count = dt1.Rows.Count;
                if (count != 0)
                {
                    for (int i = 0; i < count; i++)
                    {
                        Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][7] + "</td><td>" + dt1.Rows[i][8] + "</td><td>" + dt1.Rows[i][4] + "</td><td>" + dt1.Rows[i][5] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-pencil' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-trash'></i></button></td></tr>");
                    }
                }
            }
            else if (qs == "tpoco")
            {
                string coord = "select * from coordinator";
                SqlDataAdapter da1 = new SqlDataAdapter(coord, con);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                int count = dt1.Rows.Count;
                if (count != 0)
                {
                    for (int i = 0; i < count; i++)
                    {
                        Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][8] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][5] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-pencil' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-trash'></i></button></td></tr>");
                    }
                }
            }
            else if (qs == "job")
            {
                String sortby = Request.QueryString["sortby"].ToString();

                String query1 = "select * from placement p,signup s, company c, job j where p.com_id=c.com_id AND p.plc_id=j.plc_id AND j.stu_id=s.sig_id AND j.status='" + sortby + "'";

                SqlDataAdapter da = new SqlDataAdapter(query1, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    for(int i = 0; i < dt.Rows.Count; i++)
                    {
                        String temp = "";
                        if (dt.Rows[i][43].ToString().Equals("-1"))
                        {
                            temp = "<button type = 'button' class='btn btn-success btn-round' id='" + dt.Rows[i][39].ToString() + "' onclick='accept(this.id);'><i class='fa fa-check'></i></button>&nbsp;&nbsp;&nbsp;<button type = 'button' class='btn btn-danger btn-round' id='" + dt.Rows[i][39].ToString() + "' onclick='reject(this.id);'><i class='fa fa-times'></i></button>";
                        }
                        else if (dt.Rows[i][43].ToString().Equals("0"))
                        {
                            temp = "<button type = 'button' class='btn btn-success btn-round' id='" + dt.Rows[i][39].ToString() + "' onclick='accept(this.id);'><i class='fa fa-check'></i></button>";
                        }
                        else if (dt.Rows[i][43].ToString().Equals("1"))
                        {
                            temp = "<button type = 'button' class='btn btn-danger btn-round' id='" + dt.Rows[i][39].ToString() + "' onclick='reject(this.id);'><i class='fa fa-times'></i></button>";
                        }

                        String data = "";
                        data = "<tr><td>" + (i + 1) + "</td><td>" + dt.Rows[i][31].ToString() + "<br>(" + dt.Rows[i][32].ToString() + ")</td><td>" + dt.Rows[i][2].ToString() + "</td><td>" + dt.Rows[i][3].ToString() + "</td><td>" + dt.Rows[i][4].ToString() + "</td><td>" + dt.Rows[i][6].ToString() + "<br>" + dt.Rows[i][5].ToString() + "</td><td>" + dt.Rows[i][11].ToString() + " (" + dt.Rows[i][10].ToString() + ")<br>" + dt.Rows[i][12].ToString() + "</td><td>" + temp + "</td></tr>";
                        Response.Write(data);
                    }
                }
                else
                {
                    Response.Write("<tr><td colspan='8' align='center'>No Entries</td></tr>");
                }
            }
            else if (qs == "updjob")
            {
                String job_id = Request.QueryString["job_id"].ToString();
                String status = Request.QueryString["status"].ToString();

                String query1 = "update job set status='" + status + "' where job_id='" + job_id + "'";
                SqlCommand up = new SqlCommand(query1, con);
                up.ExecuteNonQuery();
            }
        }
        catch (Exception e2)
        {
            Response.Write(e2);
        }
    }
}
