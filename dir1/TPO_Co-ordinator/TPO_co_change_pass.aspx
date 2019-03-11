<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO_Co-ordinator/dashboard.master" AutoEventWireup="true" CodeFile="TPO_co_change_pass.aspx.cs" Inherits="dir1_Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="m-subheader ">
	<div class="d-flex align-items-center">
 		<div class="mr-auto">
 			<h3 class="m-subheader__title ">Change Password</h3>			
			 		</div>
  		<div>
  							<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
					<a href="#" class="m-portlet__nav-link btn btn-lg btn-secondary  m-btn m-btn--outline-2x m-btn--air m-btn--icon m-btn--icon-only m-btn--pill  m-dropdown__toggle">
						<i class="la la-plus m--hide"></i>
						<i class="la la-ellipsis-h"></i>
					</a>
					
				</div>
			  		</div>
	</div>
</div>

    <div class="m-content">
		            <div class="row">
			
	</div>
	<div class="col-xl-12">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
			<div class="m-portlet__head">
				<div class="m-portlet__head-tools">
					
				</div>
				<div class="m-portlet__head-tools">
					<ul class="m-portlet__nav">
						<li class="m-portlet__nav-item m-portlet__nav-item--last">
							<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
	</a>
	
</div>						</li>
					</ul>
				</div>
			</div>
			<div class="tab-content">
				<div class="tab-pane active" id="m_user_profile_tab_1">
					<form class="m-form m-form--fit m-form--label-align-right" runat="server">
						<div class="m-portlet__body">
							<div class="form-group m-form__group m--margin-top-10 m--hide">
								<div class="alert m-alert m-alert--default" role="alert">
								</div>
							</div>

							

							<div class="form-group m-form__group row" runat="server">
								<label for="example-text-input" class="col-2 col-form-label">Email-ID</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtemail" class="form-control m-input" runat="server" TextMode="Email"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="id1" ForeColor="Red" ControlToValidate="txtemail" runat="server" ErrorMessage="* Email ID is Required"></asp:RequiredFieldValidator>								</div>
							</div>
        
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Old Password</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtcupass" class="form-control m-input" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtcupass" runat="server" ErrorMessage="* Enter your current password"></asp:RequiredFieldValidator>
								
                                </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">New Password</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtpass" class="form-control m-input" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="txtpass" runat="server" ErrorMessage="* Enter Password"></asp:RequiredFieldValidator>
								
                                </div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Confirm New Password</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtcpass" class="form-control m-input" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="txtcpass" runat="server" ErrorMessage="* Enter Confirm Password"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator2" ForeColor="Red" ControlToCompare="txtpass" ControlToValidate="txtcpass" runat="server" ErrorMessage="Password dosen't match"></asp:CompareValidator>
                              								
                                </div>
							</div>

							
						

						</div>
						<div class="m-portlet__foot m-portlet__foot--fit">
							<div class="m-form__actions">
                                <br />
								<div class="row">
                                    
									<div class="col-2">
									</div>
									<div class="col-7">
										<asp:Button ID="btnsubmit" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Change Password" OnClick="btnsubmit_Click" /> &nbsp;&nbsp;
                                        <button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">Cancel</button>
									</div>
								</div>
							</div>
						</div>
                        <br />


			

					</form>
				</div>
			</div>
		</div>
	</div>
</div>







</asp:Content>

