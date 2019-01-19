using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["logout"] != null)
        {
            if (Request.QueryString["logout"].ToString() == "1")
            {
                Session["userid"] = null;
                Session["utype"] = null;
                Session["uname"] = null;
                Response.Write("Logged out Successfully!");
            }
        }
    }
}