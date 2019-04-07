using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dir2_student_job : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void Page_LoadComplete(object sender, EventArgs e)
    {
        if (!Session["userid"].ToString().Equals(null))
        {
            String temp = Session["userid"].ToString();
            Response.Write("<input type='hidden' id='userid' /><script>document.getElementById('userid').value='" + temp + "';</script>");
        }
    }
}