using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2008-'09%20Placement%20Details.pdf");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2009-'10 Placement Details.pdf");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2010-'11 Placement Details.pdf");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2011-'12 Placement Details.pdf");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2012-'13 Placement Details.pdf");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2_placement_record_final_2013-14.pdf");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2_placementrecords 2014-15_2.pdf");
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/Placement_2015-16.pdf");
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/Placement_2016-17.pdf");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/Placement_2017-18.pdf");
    }

    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/format for training.pdf");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2_campus placement eligibility.PDF");
    }

    protected void LinkButton13_Click(object sender, EventArgs e)
    {
        Response.Redirect("files/2_STUDENT_UNDERTAKING_CAMPUS_PLACEMENT_2018_19.pdf");
    }
}