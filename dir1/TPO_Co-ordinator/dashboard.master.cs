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

public partial class dir1_dashboard : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("../../Login.aspx");
        }
        if (Request.QueryString["logout"] == "1")
        {
            if (Session["userid"] != null)
            {
                Session["userid"] = null;
                Response.Redirect("../../Login.aspx");
            }
        }
    }
}
