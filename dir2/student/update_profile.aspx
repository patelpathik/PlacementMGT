<%@ Page Title="" Language="C#" MasterPageFile="~/dir2/student/student.master" AutoEventWireup="true" CodeFile="update_profile.aspx.cs" Inherits="dir2_student_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section class="spacer green">
		<div class="container">
			<div class="row">
				<div class="span12 aligncenter flyUp">
					<h2 class="pagetitle">Student's <strong>Profile</strong></h2>
				</div>
			</div>
		</div>
	</section>

    <br />
 
       <form method="post" runat="server"> 

           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Profile Photo</b></div>
           <div class="span4"> <center><asp:Image ID="Image1" runat="server" style="width: 200px; height: 200px;" class="img-circle"></asp:Image>
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="PreviewImage();"></asp:FileUpload></center></div>
           <div class="span4"></div>
            </div>

           <div class="span12"><br /><br /></div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Name</b></div>
           <div class="span4"><asp:TextBox ID="txtname" class="field your-name form-group" runat="server" Height="40" Width="400px"></asp:TextBox>  
           </div>
           <div class="span2"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" runat="server" ErrorMessage=" * Name" ControlToValidate="txtname"></asp:RequiredFieldValidator></div>
           </div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>ID Number</b></div>
           <div class="span4"><asp:TextBox ID="txtid" runat="server" Height="40" Width="400px"></asp:TextBox></div>
           <div class="span2"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="red" runat="server" ErrorMessage=" * ID Number" ControlToValidate="txtID"></asp:RequiredFieldValidator></div>
           </div>
        
             <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Email ID</b></div>
           <div class="span4"><asp:TextBox ID="txtemail" runat="server" Height="40" Width="400px"></asp:TextBox></div>
          <div class="span2"> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * Email id" ControlToValidate="txtemail" ForeColor="red"></asp:RequiredFieldValidator></div>
             </div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Mobile Number</b></div>
           <div class="span4"><asp:TextBox ID="txtmob" runat="server" Height="40" Width="400px"></asp:TextBox></div>
           <div class="span2"> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" * Mobile no" ControlToValidate="txtmob" ForeColor="red"></asp:RequiredFieldValidator></div>

           </div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Branch</b></div>
           <div class="span4"><asp:DropDownList ID="ddlbranch" Height="40px" Width="400px" runat="server" DataSourceID="SqlDataSource1" DataTextField="br_name" DataValueField="br_id">                                            </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT * FROM [branch]"></asp:SqlDataSource>
               </div>
           </div>
           <div class="span12"></br></div>
           <div class="span12">
           <div class="span2"></div>
           
           <div class="span2"><b>Semester</b></div>
           <div class="span4"><asp:DropDownList ID="ddlsem" runat="server" Height="40px" Width="400px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                     </asp:DropDownList></div>
           </div>
           <div class="span12"></br></div>

           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Enrolment Number</b></div>
           <div class="span4"><asp:TextBox ID="txtenrol" runat="server" Height="40" Width="400px"></asp:TextBox></div>
                    <div class="span2"> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage=" * Enrollment no" ControlToValidate="txtenrol" ForeColor="red"></asp:RequiredFieldValidator></div>

                </div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Address</b></div>
           <div class="span4"><asp:TextBox ID="txtadd" runat="server" Height="40" Width="400px"></asp:TextBox></div>
                    <div class="span2"> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage=" * Address" ControlToValidate="txtadd" ForeColor="red"></asp:RequiredFieldValidator></div>

                </div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>City</b></div>
           <div class="span4"><asp:DropDownList ID="ddlstate" runat="server" Height="40px" Width="400px" DataTextField="st_name" DataValueField="st_name" AutoPostBack="True"></asp:DropDownList>

                </div>                     </div>
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>State</b></div>
           <div class="span4"><asp:DropDownList ID="ddlcity" runat="server" Height="40px" Width="400px" DataTextField="ct_name" DataValueField="ct_name"></asp:DropDownList>

                </div> 
               </div>     
           <div class="span12">
           <div class="span2"></div>
           <div class="span2"><b>Date of birth</b></div>
           <div class="span4"><asp:TextBox ID="txtdob" runat="server" Height="40" Width="400px" TextMode="Date"></asp:TextBox></div>
                     <div class="span2"> &nbsp &nbsp<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="   * DOB" ControlToValidate="txtdob" ForeColor="red"></asp:RequiredFieldValidator><br />
                         <asp:RangeValidator ID="valrDate" runat="server" ControlToValidate="txtdob" MinimumValue="12/31/1980" MaximumValue="1/1/2005" Type="Date" ForeColor="Red" text=" * Invalid Date" Display="Dynamic"/>
                     </div>

           </div>
           <center>
           <asp:Button ID="txtupdate" class="btn btn-danger" Height="40px" Width="200px" runat="server" Text="Update" OnClick="txtupdate_Click"   />
            </center>
                 </form>
</asp:Content>

