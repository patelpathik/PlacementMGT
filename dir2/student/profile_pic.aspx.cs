﻿using System;
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


public partial class dir2_student_profile_pic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            String uid = Session["userid"].ToString();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            //string insertQuery = "insert into tpo (imagename,imagepath) values (@imagename, @imagepath);
            //string insertimg = "update tpo SET imagename =  where tpo_id = " + uid;


            string filename = Path.GetFileName(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath("../../profile/" + filename));
            //cmd.Parameters.AddWithValue("@imagename", filename);
            //cmd.Parameters.AddWithValue("@imagepath", "profile/" + filename);

            string insertimg = "update signup SET imagename = '" + filename + "' , imagepath= 'profile/" + filename + "' where sig_id = " + uid;
            SqlCommand cmd = new SqlCommand(insertimg, con);

            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Profile Picture Successfully Selected');</script>");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }
}