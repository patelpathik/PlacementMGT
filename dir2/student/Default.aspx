<%@ Page Title="" Language="C#" MasterPageFile="~/dir2/student/student.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="dir2_student_Default" %>

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
    <br /><br />
    <div class="row">
				<div class="span12">
					<div class="cform" id="contact-form">
						<form action="" runat="server" method="post" role="form" class="contactForm">
							<div class="row">
                            <div class="span12"><b><asp:Label ID="Label1" runat="server" Width="150px" Text="ID Number"></asp:Label> :</b> &nbsp;&nbsp;&nbsp; <asp:Label ID="lblid" runat="server" Text="Label"></asp:Label></div><br /><br />

                                <div class="span6">
                                    <div class="field your-name form-group">
                                        <label>Name</label>
										<!--<input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-msg="Please insert your name" /> -->
                                        <asp:textbox runat="server" ID="txtname" class="form-control" data-rule="required"  data-msg="Please insert your name"></asp:textbox>
                                        <div class="validation"></div>
									</div>
                                    <div class="field your-email form-group"><label>Email ID</label>
                                       <asp:textbox runat="server" ID="txtemail" class="form-control" data-rule="email" data-msg="Please enter a valid email" ></asp:textbox>

										<!--<input type="text" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />-->
										<div class="validation"></div>
									</div>
                                    <div class="field subject form-group"><label>Mobile Number</label>
                                        <asp:textbox runat="server" ID="txtmob" class="form-control" data-rule="minlen:10" data-msg="Please enter at least 10 chars of subject" ></asp:textbox>
										<!--<input type="text" class="form-control" name="mobile" id="subject" placeholder="Subject" data-rule="minlen:10" data-msg="Please enter at least 10 chars of subject" />-->
										<div class="validation"></div>
									</div>
                                    <div class="field subject form-group"><label>Branch</label>
                                        <asp:DropDownList ID="ddlbranch" Height="50px" Width="570px" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="br_name" DataValueField="br_id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT * FROM [branch]"></asp:SqlDataSource>

                                    </div>
                                    <br />
                                    <div class="field subject form-group"><label>Semester</label>
                                        <asp:DropDownList ID="ddlsem" class="form-control" Height="50px" Width="570px" runat="server">
                                            <asp:ListItem>--Select Semester--</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                        </asp:DropDownList>
                                    </div><br />
                                  <div class="field your-name form-group">
                                        <label>Date Of Birth</label>
                                         <asp:TextBox ID="txtdob" runat="server" class="form-control" TextMode="Date" Height="40px" Width="560px" data-rule="required"  data-msg="Please insert Date Of Birth" ></asp:TextBox>
                                    
                                         <div class="validation"></div>
									</div>
                                </div>

								<div class="span6">
                                     <div class="field subject form-group"><label>Enrolment Number</label>
                                         <asp:textbox runat="server" id="txtenrol" class="form-control" data-rule="required"  data-msg="Please insert Enrolment Number"></asp:textbox>
                                        <!-- <input type="text" class="form-control" name="mobile" id="txtenrol" placeholder="Subject" data-rule="minlen:12" data-msg="Please enter at least 12 numbers of Enrolment Number" /> -->
										<div class="validation"></div>
									</div>
									<div class="field message form-group"><label>Address</label>
                                        <asp:textbox runat="server" id="txtadd" rows="5" class="form-control" data-rule="required"  data-msg="Please insert Address"></asp:textbox>
										<!--<textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write Address" placeholder="Message"></textarea>-->
										<div class="validation"></div>
									</div><br />
                                     <div class="field subject form-group"><label>City</label>
                                        <asp:DropDownList ID="ddlcity" Height="50px" Width="570px" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div><br />
                                     <div class="field subject form-group"><label>State</label>
                                        <asp:DropDownList ID="ddlstate" Height="50px" Width="570px" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>                                    
								</div>
                                <div class="span12">
                                  	<center>
                                                <asp:Button runat="server" Text="Submit" class="btn btn-theme" OnClick="Unnamed1_Click"></asp:Button>
                                    </center>
                                </div>
							</div>
						</form>
					</div>
				</div>
				<!-- ./span12 -->
			</div>
</asp:Content>

