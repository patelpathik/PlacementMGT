<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO_Co-ordinator/dashboard.master" AutoEventWireup="true" CodeFile="co_update.aspx.cs" Inherits="dir1_TPO_Co_ordinator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <div class="m-subheader ">
	<div class="d-flex align-items-center">
 		<div class="mr-auto">
 			<h3 class="m-subheader__title ">Profile</h3>			
			 		</div>
  		<div>
	</div>
	</div>
    </div>
    

    <div class="m-content">
		            <div class="row">
	
	<div class="col-xl-12 col-lg-8">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
			<div class="m-portlet__head">
				<div class="m-portlet__head-tools">
					<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
								<i class="flaticon-share m--hide"></i>
								Update Your Profile
							</a>
						</li>
					</ul>
				</div>
				<div class="m-portlet__head-tools">
					<ul class="m-portlet__nav">
						<li class="m-portlet__nav-item m-portlet__nav-item--last">
							<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
	<a href="#" class="m-portlet__nav-link btn btn-lg btn-secondary  m-btn m-btn--icon m-btn--icon-only m-btn--pill  m-dropdown__toggle">
		<i class="la la-gear"></i>
	</a>
</div>	
                            </li>
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

							<div class="form-group m-form__group row">
								<div class="col-10 ml-auto">
									<h3 class="m-form__section">1. Personal Details</h3>
								</div>
							</div>

							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Name</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtname" class="form-control m-input" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtname" runat="server" ErrorMessage="* Require Name"></asp:RequiredFieldValidator>
                            
								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">ID Number</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtidno" class="form-control m-input" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtidno" runat="server" ErrorMessage="* Require ID Number"></asp:RequiredFieldValidator>
                            
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Contact</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtcont" class="form-control m-input" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="txtcont" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcont" ErrorMessage="validate only 10 digit" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Email ID</label>
								<div class="col-7">
                                   <asp:TextBox ID="txtmail" class="form-control m-input" runat="server" TextMode="Email"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="txtmail" runat="server" ErrorMessage="* Require Email-ID"></asp:RequiredFieldValidator>

								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Branch</label>
								<div class="col-7">
                                     <asp:DropDownList ID="ddlbname" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="br_sname" DataValueField="br_sname"></asp:DropDownList> 
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT [br_sname] FROM [branch]"></asp:SqlDataSource>
                          </div>
							</div>
							
							<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

					</div>
						<div class="m-portlet__foot m-portlet__foot--fit">
							<div class="m-form__actions">
								<div class="row">
									<div class="col-2">
									</div>
									<div class="col-7">
                                        <asp:Button ID="btnupdate" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Submit" OnClick="btnupdate_Click" />
										<button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">Cancel</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane " id="m_user_profile_tab_2">
					<div class="m-portlet m-portlet--full-height ">
	
	
</div>
				</div>
				<div class="tab-pane " id="m_user_profile_tab_3">
					
				</div>
			</div>
		</div>
	</div>
</div>		        </div>
    
      
</asp:Content>

