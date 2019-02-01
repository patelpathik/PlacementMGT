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


public partial class dir1_TPO_Co_ordinator_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtdate.Text = DateTime.Now.ToShortDateString();
        txttime.Text = DateTime.Now.ToShortTimeString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string path = "~/Upload file/" + fileupload.FileName;
            if (fileupload.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(fileupload.FileName);
                if (fileExtension.ToLower() != ".pdf")
                {
                    Response.Write("<script>alert('Please select only pdf file')</script>");

                }
                fileupload.SaveAs(Server.MapPath(path + fileExtension).ToString());
            }
            else
            {
                Response.Write("<script>alert('Please select file to upload')</script>");
            }

            string insertQuery = "insert into notice (title,date,time,file) values (@title,@date,@time,@file)";
            SqlCommand cmd = new SqlCommand(insertQuery, con);
           cmd.Parameters.AddWithValue("@title", txttitle.Text);
            cmd.Parameters.AddWithValue("@date", txtdate.Text);
            cmd.Parameters.AddWithValue("@time", txttime.Text);
            cmd.Parameters.AddWithValue("@file", fileExtension);
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }
}