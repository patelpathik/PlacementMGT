<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="update_profile.aspx.cs" Inherits="dir2_student_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    /* The Modal (background) */
    .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
      background-color: #fefefe;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 80%; /* Could be more or less, depending on screen size */
    }

    /* The Close Button */
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
    </style>



      <div class="m-subheader ">
	<div class="d-flex align-items-center">
 		<div class="mr-auto">
 			<h3 class="m-subheader__title ">My Profile</h3>			
	    </div>
  		<div>
  							
	</div>
	</div>
</div>

 <div class="m-content">
					        <div class="row">
	<div class="col-lg-3">
		<div class="m-portlet m-portlet--full-height   m-portlet--rounded">
			<div class="m-portlet__body">
				<div class="m-card-profile">
					<div class="m-card-profile__title m--hide">
						Your Profile
					</div>
					<div class="m-card-profile__pic">
						<div class="m-card-profile__pic-wrapper">	
                            <asp:Image ID="Image1" runat="server"></asp:Image>
						</div>
					</div>
					<div class="m-card-profile__details">
                        <asp:Label ID="lblname" class="m-card-profile__name" runat="server" Text=""></asp:Label>

                        <asp:Label ID="lblemail" class="m-card-profile__email m-link" runat="server" Text=""></asp:Label>
                    

					</div>
                    
            	</div>
				<div class="m-portlet__body-separator"></div>
               <center><button id="myBtn" class="btn btn-secondary m-btn m-btn--air m-btn--custom">Update Profile pic</button></center>
                				<div class="m-portlet__body-separator"></div>

				
			</div>			
		</div>	
	</div>
	<div class="col-lg-9">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs   m-portlet--rounded">
			
			<div class="tab-content">
				<div class="tab-pane active" id="m_user_profile_tab_1">
					<form class="m-form m-form--fit m-form--label-align-right" runat="server">
						<div class="m-portlet__body">

							<div class="form-group m-form__group row">
								<div class="col-10 ml-auto">
									<h3 class="m-form__section">Personal Details</h3>
								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">ID Number :</label>
								<div class="col-7">
                                        <asp:TextBox ID="lblid" class="form-control m-input" runat="server" BorderColor="White"></asp:TextBox>
								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Branch</label>
								<div class="col-7">
                                    <asp:DropDownList ID="ddlbranch" class="form-control m-input" runat="server" DataSourceID="SqlDataSource1" DataTextField="br_sname" DataValueField="br_id" >
                                        
                                    </asp:DropDownList>
								    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT * FROM [branch]"></asp:SqlDataSource>
								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Enrolment Number</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtenrol" class="form-control m-input" runat="server"></asp:TextBox>
								</div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="red" runat="server" ErrorMessage=" * Require Enrolment No." ControlToValidate="txtenrol"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtenrol" ForeColor="Red" ErrorMessage="enter valid Enrolment No" ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>							</div>
                                 </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Full Name</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtname" class="form-control m-input" runat="server" ></asp:TextBox>
								</div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" runat="server" ErrorMessage=" * Name Require" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                                 </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Email</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtemail" class="form-control m-input" runat="server" TextMode="Email"></asp:TextBox>
								</div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * Email ID Require" ControlToValidate="txtemail" ForeColor="red"></asp:RequiredFieldValidator>                                 </div>
							</div>
							
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Semester</label>
								<div class="col-7">
                                    <asp:DropDownList ID="ddlsem" runat="server" class="form-control m-input">
                                        <asp:ListItem>-- select semester --</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                         </asp:DropDownList>
                                   </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Mobile No.</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtmob" class="form-control m-input" runat="server"></asp:TextBox>
								</div>
                             <div class="col-3">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="red" runat="server" ErrorMessage=" * Require Mobile Number" ControlToValidate="txtmob"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmob" ErrorMessage="enter valid mobile number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>							</div>
							</div>
                        <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Date of Birth</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtdob" runat="server" class="form-control m-input" TextMode="Date"></asp:TextBox> [MM/DD/YYYY Format]		
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtdob" MinimumValue="12/31/1980" MaximumValue="1/1/2005" Type="Date" ForeColor="Red" text=" * Invalid Date" Display="Dynamic"/>							</div>

                             <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" * DOB Require" ControlToValidate="txtdob" ForeColor="red"></asp:RequiredFieldValidator>
                               </div>
                       </div>


							<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

							<div class="form-group m-form__group row">
								<div class="col-10 ml-auto">
									<h3 class="m-form__section">2. Address</h3>
								</div>
							</div>

							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Address</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine" class="form-control m-input"></asp:TextBox>
								</div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage=" * Address Require" ControlToValidate="txtadd" ForeColor="red"></asp:RequiredFieldValidator>
								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">State</label>
								<div class="col-7">
                                    <asp:DropDownList ID="ddlstate" runat="server" class="form-control m-input" type="text" DataTextField="st_name" DataValueField="st_name" AutoPostBack="True"></asp:DropDownList>
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">City</label>
								<div class="col-7">
                                    <asp:DropDownList ID="ddlcity" class="form-control m-input" runat="server" DataTextField="ct_name" DataValueField="ct_name"  AutoPostBack="True" ></asp:DropDownList>
								</div>
							</div>
							

											<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>
                         <div class="form-group m-form__group row">
								<div class="col-10 ml-auto">
									<h3 class="m-form__section">Education Details</h3>
								</div>
							</div>
                        <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">CPI</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtcpi" class="form-control m-input" runat="server" ></asp:TextBox>
								</div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="red" runat="server" ErrorMessage=" * CPI Require" ControlToValidate="txtcpi"></asp:RequiredFieldValidator>
                                 </div>
							</div>
                        
                        
                        <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

                        </div>
					
							<div class="m-form__actions">
								<div class="row">
									<div class="col-2">
									</div>
									<div class="col-7">
                                        <asp:Button ID="txtupdate" class="btn btn-accent m-btn m-btn--air m-btn--custom"  runat="server" Text="Update" OnClick="txtupdate_Click"   />&nbsp;
										<button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">Cancel</button>
									</div>
								</div>
							</div><br /><br />


                  </div>

            <div id="myModal" class="modal">

                      <!-- Modal content -->
                      <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>Some text in the Modal..</p>
                          <div class="form-group m-form__group row">
								<div class="col-3">
                               <center><img class="img-circle" id="imgview" height="180" width="180"/></center> 

								</div>
							</div>
							<div class="form-group m-form__group row">
								<div class="col-3">
                                        <center><asp:FileUpload ID="FileUpload2"  runat="server"  onchange="loadFile(event)" /></center>

								</div>
							</div>
                            <div class="form-group m-form__group row">
								<div class="col-3">
							    <center><asp:Button ID="btnsubmit" runat="server" Text="Upload" class="btn btn-accent m-btn m-btn--air m-btn--custom" /><br /></center>

								</div>
							</div>
                    </div>

                    </div>


	          </form>
				</div>
				
			</div>
		</div>
	</div>
     <div id="myModal" class="modal">

  <!-- Modal content -->
  

</div>


     <script>
    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
    <script>
  var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('imgview');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
</script>




</asp:Content>

