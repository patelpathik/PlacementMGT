<%@ Page Title="" Language="C#" MasterPageFile="~/dir2/company/company.master" AutoEventWireup="true" CodeFile="update_profile.aspx.cs" Inherits="dir2_company_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="spacer green">
		<div class="container">
			<div class="row">
				<div class="span12 aligncenter flyUp">
					<h2 class="pagetitle">Company's<strong> Update Profile</strong></h2>
				</div>
			</div>
		</div>
	</section>


    <br />
 
       <form method="post" runat="server"> 
           <div class="span3"></div>

           <div class="span8">
               
            Company Name<br /><asp:TextBox ID="txtname" runat="server" Height="40px" Width="500px"></asp:TextBox>
               <br />

            Contact<br /><asp:TextBox ID="txtcont" runat="server" Height="40px" Width="500px"></asp:TextBox>
               <br />

            Address<br /><asp:TextBox ID="txtadd" TextMode="MultiLine" runat="server" Height="40px" Width="500px"></asp:TextBox>
               <br />

            City<br />    <asp:DropDownList ID="ddlstate" runat="server" Height="40px" Width="500px" DataTextField="st_name" DataValueField="st_name" AutoPostBack="True"></asp:DropDownList>

               <br />
                                        
            State<br />    <asp:DropDownList ID="ddlcity" runat="server" Height="40px" Width="500px" DataTextField="ct_name" DataValueField="ct_name"></asp:DropDownList>

               <br />

             Information<br /><asp:TextBox ID="txtinfo" TextMode="MultiLine" runat="server" Height="40px" Width="500px"></asp:TextBox>
               <br />
           
            Email<br /><asp:TextBox ID="txtemail" runat="server" Height="40px" Width="500px" TextMode="Email"></asp:TextBox>
               <br />
            

               </div>
            <div class="span3"></div>

           <div class="span5">
            <center><div class="form-group"><asp:Button ID="txtupdate" class="btn btn-danger" Height="40px" Width="200px" runat="server" Text="Update" OnClick="txtupdate_Click1"  /></div></center>
            <center><asp:Label ID="Label1" runat="server" Text=""></asp:Label></center>
               </div>
                    </form>
</asp:Content>

