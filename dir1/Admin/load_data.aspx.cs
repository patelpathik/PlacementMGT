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

public partial class dir1_Admin_load_data : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF; Integrated Security = True; Connect Timeout = 3000";
            con.Open();

            if (Request.QueryString["req"] != null)
            {
                string req = Request.QueryString["req"].ToString();
                if (req == "com_req")
                {
                    String q1 = "select * from company";
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt = new DataTable();
                    da1.Fill(dt);
                    int count = dt.Rows.Count;
                    String data = "";
                    for(int i=0;i< count; i++)
                    {
                        data += "<tr><td>"+(i+1)+"</td><td>"+dt.Rows[i][1]+ "</td><td>" + dt.Rows[i][2] + "</td><td>" + dt.Rows[i][3] + "</td><td>" + dt.Rows[i][4] + "</td><td>" + dt.Rows[i][5] + "</td><td>" + dt.Rows[i][7] + "</td><td>" + dt.Rows[i][8] + "</td><td><a href='company_update.aspx?com_id="+dt.Rows[i][0]+"'>Change</a></td></tr>";
                    }
                    Response.Write(data);
                }
                else if (req == "state")
                {
                    String q1 = "select distinct(st_name) from city";
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt = new DataTable();
                    da1.Fill(dt);
                    int count = dt.Rows.Count;
                    String data = "";
                    for (int i = 0; i < count; i++)
                    {
                        string temp = dt.Rows[i][0].ToString();
                        data += "<option value='" + temp + "'>" + temp + "</option>";
                    }
                    Response.Write(data);
                }
                else if (req == "city")
                {
                    var s = Request.QueryString["s"].ToString();
                    String q1 = "select ct_name from city where st_name='" + s + "'";
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt = new DataTable();
                    da1.Fill(dt);
                    int count = dt.Rows.Count;
                    String data = "";
                    for (int i = 0; i < count; i++)
                    {
                        string temp = dt.Rows[i][0].ToString();
                        data += "<option value='" + temp + "'>" + temp + "</option>";
                    }
                    Response.Write(data);
                }
                else if (req == "com_data")
                {
                    var com_id = Request.QueryString["com_id"].ToString();
                    String q1 = "select * from company where com_id='" + com_id + "'";
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt = new DataTable();
                    da1.Fill(dt);
                    String data = "{'name':'" + dt.Rows[0][1] + "','email':'" + dt.Rows[0][2] + "','contact':'" + dt.Rows[0][3] + "','state':'" + dt.Rows[0][5] + "','info':'" + dt.Rows[0][7] + "','add':'" + dt.Rows[0][8] + "'}";
                    Response.Clear();
                    //Response.ContentType = "application/json; charset=utf-8";
                    Response.Write(data);
                }
                else if (req == "branch")
                {
                    string branch = "select * from branch";
                    //Response.Write(branch);
                    SqlDataAdapter da1 = new SqlDataAdapter(branch, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    int count = dt1.Rows.Count;
                    if (count != 0)
                    {
                        for (int i = 0; i < count; i++)
                        {
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'><i class='la la-pencil'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-trash'></i></button></td></tr>");
                        }
                    }
                }
                else if (req == "branch1")
                {
                    String id = Request.QueryString["id"].ToString();
                    String q1 = "select * from branch where br_id='"+id+"'";
                    //Response.Write(q1);
                    SqlDataAdapter da1 = new SqlDataAdapter(q1,con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    String data = dt1.Rows[0][0].ToString() + "," + dt1.Rows[0][2].ToString() + "," + dt1.Rows[0][3].ToString()+":";
                    Response.Write(data);
                }
                else if (req == "comp")
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
                else if (req == "sub")
                {
                    string sub = "select * from subjects";
                    SqlDataAdapter da1 = new SqlDataAdapter(sub, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    int count = dt1.Rows.Count;
                    if (count != 0)
                    {
                        for (int i = 0; i < count; i++)
                        {
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][4] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-pencil' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-trash'></i></button></td></tr>");
                        }
                    }
                }
                else if (req == "tpoco")
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
                else if (req == "tpo")
                {
                    string tpo = "select * from tpo";
                    SqlDataAdapter da1 = new SqlDataAdapter(tpo, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    int count = dt1.Rows.Count;
                    if (count != 0)
                    {
                        for (int i = 0; i < count; i++)
                        {
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][4] + "</td><td>" + dt1.Rows[i][6] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-pencil' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-trash'></i></button></td></tr>");
                        }
                    }
                }
                else if (req == "dashtpoco")
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
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][8] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][5] + "</td></tr>");
                        }
                    }
                }
                else if (req == "dashtpo")
                {
                    string tpo = "select * from tpo";
                    SqlDataAdapter da1 = new SqlDataAdapter(tpo, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    int count = dt1.Rows.Count;
                    if (count != 0)
                    {
                        for (int i = 0; i < count; i++)
                        {
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][4] + "</td><td>" + dt1.Rows[i][6] + "</td></tr>");
                        }
                    }
                }
                else if (req == "dashcomp")
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
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][7] + "</td><td>" + dt1.Rows[i][8] + "</td><td>" + dt1.Rows[i][4] + "</td><td>" + dt1.Rows[i][5] + "</td></tr>");
                        }
                    }
                }
            }
            else if (Request.QueryString["update"] != null)
            {
                string update = Request.QueryString["update"].ToString();
                if (update == "branch")
                {
                    string bid = Request.QueryString["bid"].ToString();
                    string bfn = Request.QueryString["bfn"].ToString();
                    string bsn = Request.QueryString["bsn"].ToString();

                    string q1 = "update branch set br_name='" + bfn + "',br_sname='" + bsn + "' where br_id=" + bid;
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        catch(Exception e1)
        {
            Response.Write(e);
        }
    }
}