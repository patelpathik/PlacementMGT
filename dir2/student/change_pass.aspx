<%@ Page Title="" Language="C#" MasterPageFile="~/dir2/student/student.master" AutoEventWireup="true" CodeFile="change_pass.aspx.cs" Inherits="dir2_student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
<html lang="en">
    <%
        if (Session["userid"] == null) {
            Response.Redirect("../../Login.aspx");
        }
    %>
     <section class="spacer green">
		<div class="container">
			<div class="row">
				<div class="span12 aligncenter flyUp">
					<h2 class="pagetitle">Change <strong>Password</strong></h2>
				</div>
			</div>
		</div>
	</section>

    <br />
 
       <form method="post" runat="server"> 

           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Email ID</b></div>
           <div class="span4"><asp:TextBox ID="txtemail" runat="server" Height="50" Width="410px"></asp:TextBox></div>
            </div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Current Password</b></div>
           <div class="span4"><asp:TextBox ID="txtpass" runat="server" Height="40" Width="400px" TextMode="Password"></asp:TextBox></div>
           </div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>New Password</b></div>
           <div class="span4"><asp:TextBox ID="txtnpass" runat="server" Height="40" Width="400px" TextMode="Password"></asp:TextBox></div>
           </div>
           <div class="span12"></div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Confirm New Password</b></div>
           <div class="span4"><asp:TextBox ID="txtcnpass" runat="server" Height="40" Width="400px" TextMode="Password"></asp:TextBox>
           </div>
           </div>
           
           <center>
           <asp:Button ID="btnpass" class="btn btn-danger" Height="40px" Width="200px" runat="server" Text="Change Password" OnClick="btnpass_Click"   />
            </center>
                 </form>
</asp:Content>

