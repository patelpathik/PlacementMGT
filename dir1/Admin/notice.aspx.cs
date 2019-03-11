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
        txtpk.Visible = false;
        txtedat.Visible = false;
        txtetime.Visible = false;
        txtloc.Visible = false;
        txttech.Visible = false;
        Label1.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
        Label4.Visible = false;
        Label5.Visible = false;
        Label6.Visible = false;
        RequiredFieldValidator3.Visible = false;
        RequiredFieldValidator4.Visible = false;
        RequiredFieldValidator5.Visible = false;
        RequiredFieldValidator6.Visible = false;
        RequiredFieldValidator7.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\8TH SEM\PLACEMENTMGT\PLACEMENT_MANAGEMENT.MDF;Integrated Security=True;Connect Timeout=300");
            con.Open();
            string filename = Path.GetFileName(fileupload1.FileName);
            fileupload1.SaveAs(Server.MapPath("../../Upload file/" + filename));
            string placement="";
            string insertQuery="";
            if (cbplacement.Checked)
            {
                placement = "1";
               
                insertQuery = "";

            }
            else {
                insertQuery = "insert into notice (title,date,time,description,filename,filepath) values ('" + txttitle.Text+"',  '"+txtdate.Text+"', '"+txttime.Text+"', '"+txtdes.Text+"', '"+filename+"', 'Upload file/"+filename+"')";
            }
            SqlCommand cmd = new SqlCommand(insertQuery, con);
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {
            Response.Write("error:" + ex.ToString());
        }
    }

    protected void cbplacement_CheckedChanged(object sender, EventArgs e)
    {
        //
        if (cbplacement.Checked == true) {
            txtpk.Visible = true;
            txtedat.Visible = true;
            txtetime.Visible = true;
            txtloc.Visible = true;
            txttech.Visible = true;
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            RequiredFieldValidator3.Visible = true;
            RequiredFieldValidator4.Visible = true;
            RequiredFieldValidator5.Visible = true;
            RequiredFieldValidator6.Visible = true;
            RequiredFieldValidator7.Visible = true;
        }
        else if (cbplacement.Checked == false)
        {
            //hide
        }
    }
}