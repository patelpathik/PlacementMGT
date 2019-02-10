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
                    for (int i = 0; i < count; i++)
                    {
                        data += "<tr><td>" + (i + 1) + "</td><td>" + dt.Rows[i][1] + "</td><td>" + dt.Rows[i][2] + "</td><td>" + dt.Rows[i][3] + "</td><td>" + dt.Rows[i][4] + "</td><td>" + dt.Rows[i][5] + "</td><td>" + dt.Rows[i][7] + "</td><td>" + dt.Rows[i][8] + "</td><td><a href='company_update.aspx?com_id=" + dt.Rows[i][0] + "'>Change</a></td></tr>";
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
                else if (req == "state1")
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
                else if (req == "city1")
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
                else if (req == "branch")           //display all in tab view all rows
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
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'><i class='la la-pencil'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder' id='" + dt1.Rows[i][0].ToString() + "' onclick='do_delete(this.id)'><i class='la la-trash'></i></button></td></tr>");
                        }
                    }
                }
                else if (req == "branch1")      //display in form (particular id) id->row only
                {
                    String id = Request.QueryString["id"].ToString();
                    String q1 = "select * from branch where br_id='" + id + "'";
                    //Response.Write(q1);
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    String data = dt1.Rows[0][0].ToString() + "," + dt1.Rows[0][2].ToString() + "," + dt1.Rows[0][3].ToString() + ":";
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
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][7] + "</td><td>" + dt1.Rows[i][8] + "</td><td>" + dt1.Rows[i][4] + "</td><td>" + dt1.Rows[i][5] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-pencil' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder' id='" + dt1.Rows[i][0].ToString() + "' onclick='do_delete(this.id);'><i class='la la-trash'></i></button></td></tr>");
                        }
                    }
                }
                else if (req == "compup")
                {
                    String id = Request.QueryString["id"].ToString();
                    String q1 = "select * from company where com_id='" + id + "'";
                    //Response.Write(q1);
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    String data = dt1.Rows[0][0].ToString() + "," + dt1.Rows[0][1].ToString() + "," + dt1.Rows[0][3].ToString() + "," + dt1.Rows[0][2].ToString() + "," + dt1.Rows[0][7].ToString() + "," + dt1.Rows[0][8].ToString() + "," + dt1.Rows[0][5].ToString() + "," + dt1.Rows[0][4].ToString() + ":";
                    Response.Write(data);
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
                else if (req == "subupd")
                {
                    String id = Request.QueryString["id"].ToString();
                    String q1 = "select * from subjects where sub_id='" + id + "'";
                    //Response.Write(q1);
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    String data = dt1.Rows[0][0].ToString() + "," + dt1.Rows[0][2].ToString() + "," + dt1.Rows[0][1].ToString() + "," + dt1.Rows[0][3].ToString() + "," + dt1.Rows[0][4].ToString() + ":";
                    Response.Write(data);
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
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][8] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][5] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-pencil' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder' id='" + dt1.Rows[i][0].ToString() + "' onclick='do_delete(this.id);'><i class='la la-trash'></i></button></td></tr>");
                        }
                    }
                }
                else if (req == "tpocoupd")
                {
                    String id = Request.QueryString["id"].ToString();
                    String q1 = "select * from coordinator where co_id='" + id + "'";
                    //Response.Write(q1);
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    String data = dt1.Rows[0][0].ToString() + "," + dt1.Rows[0][1].ToString() + "," + dt1.Rows[0][2].ToString() + "," + dt1.Rows[0][3].ToString() + ":";
                    Response.Write(data);
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
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][4] + "</td><td>" + dt1.Rows[i][6] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-pencil' id='" + dt1.Rows[i][0].ToString() + "' onclick='update(this.id);'></i></button>&nbsp;<button class='btn m-btn--pill    btn-warning m-btn m-btn--custom m-btn--label-brand m-btn--bolder'><i class='la la-trash' id='" + dt1.Rows[i][0].ToString() + "' onclick='de_delete(this.id);'></i></button></td></tr>");
                        }
                    }
                }
                else if (req == "tpo")
                {
                    String tid = Request.QueryString["tid"].ToString();
                    String q1 = "select * from tpo where tpo_id='" + tid + "'";
                    //Response.Write(q1);
                    SqlDataAdapter da1 = new SqlDataAdapter(q1, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    String data = dt1.Rows[0][0].ToString() + "," + dt1.Rows[0][1].ToString() + "," + dt1.Rows[0][2].ToString() + "," + dt1.Rows[0][3].ToString() + "," + dt1.Rows[0][4].ToString() + "," + dt1.Rows[0][6].ToString() + ":";
                    Response.Write(data);
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
                else if (req == "dashsignup")
                {
                    string comp = "select * from signup s, branch b where s.br_id=b.br_id AND s.status=1 order by s.status";
                    SqlDataAdapter da1 = new SqlDataAdapter(comp, con);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    int count = dt1.Rows.Count;
                    if (count != 0)
                    {
                        for (int i = 0; i < count; i++)
                        {
                            Response.Write("<tr><td>" + (i + 1) + "</td><td>" + dt1.Rows[i][1] + "</td><td>" + dt1.Rows[i][2] + "</td><td>" + dt1.Rows[i][3] + "</td><td>" + dt1.Rows[i][5] + "</td><td>" + dt1.Rows[i][6] + "</td><td><button class='btn m-btn--pill    btn-info m-btn m-btn--custom m-btn--label-brand m-btn--bolder' onclick='window.top.location=\"view_profile.aspx?uid=\"+this.id;' id='" + dt1.Rows[i][0].ToString() + "'><i class='la la-user'></i></button></td></tr>");
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
                if (update == "comp")
                {
                    string cn = Request.QueryString["cn"].ToString();
                    string no = Request.QueryString["no"].ToString();
                    string em = Request.QueryString["em"].ToString();
                    string det = Request.QueryString["det"].ToString();
                    string add = Request.QueryString["add"].ToString();
                    string ct = Request.QueryString["ct"].ToString();
                    string st = Request.QueryString["st"].ToString();
                    string cid = Request.QueryString["cid"].ToString();

                    string q1 = "update company set com_name ='" + cn + "',com_cno='" + no + "', com_email='" + em + "', com_info='" + det + "',com_add='" + add + "',c_id='" + ct + "',st_id='" + st + "'  where com_id=" + cid;
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }
                if (update == "subupd")
                {
                    string sid = Request.QueryString["sid"].ToString();
                    string sbrc = Request.QueryString["sbrc"].ToString();
                    string ssem = Request.QueryString["ssem"].ToString();
                    string scode = Request.QueryString["scode"].ToString();
                    string sname = Request.QueryString["sname"].ToString();
                   

                    string q1 = "update subjects set sem ='" + ssem + "',br_id='" + sbrc + "', sub_code ='" + scode + "', sub_name='" + sname+ "' where sub_id=" + sid;
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }
                if (update == "tpoco")
                {
                    string coid = Request.QueryString["coid"].ToString();
                    string tconame = Request.QueryString["tconame"].ToString();
                    string tcoemail = Request.QueryString["tcoemail"].ToString();
                    string tcomob = Request.QueryString["tcomob"].ToString();


                    string q1 = "update coordinator set co_name ='" + tconame + "',co_email='" + tcoemail + "', co_cno ='" + tcomob + "' where co_id=" + coid;
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }
                if (update == "tpo")
                {
                    string tid = Request.QueryString["tid"].ToString();
                    string tponame = Request.QueryString["tponame"].ToString();
                    string tpoemail = Request.QueryString["tpoemail"].ToString();
                    string tpomob = Request.QueryString["tpomob"].ToString();
                    string tpopro = Request.QueryString["tpopro"].ToString();
                    string tpoquali = Request.QueryString["tpoquali"].ToString();

                    string q1 = "update tpo set tpo_name ='" + tponame + "',tpo_email='" + tpoemail + "', tpo_cno ='" + tpomob + "', tpo_profile ='" + tpopro + "', tpo_quali ='" + tpoquali + "' where tpo_id=" + tid;
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }

            }
            else if (Request.QueryString["delete"] != null)
            {
                string delete = Request.QueryString["delete"].ToString();
                if (delete == "branch")
                {
                    string bid = Request.QueryString["bid"].ToString();
                    string q1 = "delete from branch where br_id=" + bid ;
                    Response.Write(q1);
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }
                if (delete == "company")
                {
                    string cid = Request.QueryString["cid"].ToString();
                    string q1 = "delete from company where com_id=" + cid;
                    Response.Write(q1);
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }
                if (delete == "coordinator")
                {
                    string coid = Request.QueryString["coid"].ToString();
                    string q1 = "delete from coordinator where co_id=" + coid;
                    Response.Write(q1);
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }
                if (delete == "tpo")
                {
                    string tid = Request.QueryString["tid"].ToString();
                    string q1 = "delete tpo where tpo_id=" + tid;
                    Response.Write(q1);
                    SqlCommand cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                }

            }

        }
        catch (Exception e1)
        {
            Response.Write(e1);
        }
    }
}