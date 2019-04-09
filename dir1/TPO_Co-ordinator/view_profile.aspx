<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO_Co-ordinator/dashboard.master" AutoEventWireup="true" CodeFile="view_profile.aspx.cs" Inherits="dir1_Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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

				
			</div>			
		</div>	
	</div>
	<div class="col-lg-9">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs   m-portlet--rounded">
			<div class="m-portlet__head">
				<div class="m-portlet__head-tools">
					<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
								<i class="flaticon-share m--hide"></i>
								Student Profile
							</a>
						</li>

					</ul>
				</div>
				
			</div>


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
								<label for="example-text-input" class="col-2 col-form-label">ID No :</label>
								<div class="col-4">
                                        <asp:Label ID="lblid" class="form-control m-input" runat="server" Text="" BorderColor="White"></asp:Label>
								</div>
                                <label for="example-text-input" class="col-2 col-form-label">Branch :</label>
								<div class="col-4">
                                    <asp:Label ID="ddlbranch" runat="server"  class="form-control m-input" Text="" DataSourceID="SqlDataSource1" BorderColor="White"></asp:Label>
                                     <asp:SqlDataSource ID="SqlDataSource1"  runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT * FROM [branch]"></asp:SqlDataSource>
								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Enrol No :</label>
								<div class="col-4">
                                    <asp:Label ID="txtenrol" class="form-control m-input" runat="server" Text="" BorderColor="White"></asp:Label>
								</div>
                                <label for="example-text-input" class="col-2 col-form-label">Semester :</label>
								<div class="col-4">
                                   <asp:Label ID="ddlsem" class="form-control m-input" runat="server" Text="" BorderColor="White"></asp:Label>
                                   </div>
                                 </div>
						
							
							
						
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Mobile No :</label>
								<div class="col-4">
                                    <asp:Label ID="txtmob" class="form-control m-input" runat="server" Text="" BorderColor="White"></asp:Label>
								</div>
                             <label for="example-text-input" class="col-2 col-form-label">Date of Birth :</label>
								<div class="col-4">
                                    <asp:Label ID="txtdob" class="form-control m-input" runat="server" Text="" BorderColor="White"></asp:Label>
                               </div>
							</div>
                        
                            	</div>

							<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

							<div class="form-group m-form__group row">
								<div class="col-10 ml-auto">
									<h3 class="m-form__section">Address</h3>
								</div>
							</div>

							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Address :</label>
								<div class="col-7">
                                    <asp:Label ID="txtadd" runat="server" Text="" BorderColor="White" class="form-control m-input"></asp:Label>
								</div>
							</div>
                            <div class="form-group m-form__group row">
                                <label for="example-text-input" class="col-2 col-form-label">City :</label>
								<div class="col-4">
                                    <asp:Label ID="ddlcity" runat="server" Text="" class="form-control m-input" BorderColor="White"></asp:Label>
								</div>
								<label for="example-text-input" class="col-2 col-form-label">State :</label>
								<div class="col-4">
                                    <asp:Label ID="ddlstate" runat="server" Text="" class="form-control m-input" BorderColor="White"></asp:Label>
								</div>
                                
							</div>
							
							

											<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>
                         <div class="form-group m-form__group row">
								<div class="col-10 ml-auto">
									<h3 class="m-form__section">Education Details</h3>
								</div>
							</div>
                        <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">CPI :</label>
								<div class="col-4">
                                    <asp:Label ID="txtcpi" runat="server" Text="Label"  class="form-control m-input" BorderColor="White"></asp:Label>
								</div>
                            <label for="example-text-input" class="col-2 col-form-label">Download Resume :</label>
								<div class="col-4">
                                    <asp:Button ID="txtdown" class="btn btn-accent m-btn m-btn--air m-btn--custom"  runat="server" Text="Download" OnClick="txtdown_Click" />
                                    <!--<asp:LinkButton ID="resume_dn" class="btn btn-accent m-btn m-btn--air m-btn--custom" Text="Download" runat="server" ></asp:LinkButton>-->
								</div>
                               
							
                        
                        
					
							<div class="m-form__actions">
								<div class="row">
									<div class="col-2">
									</div>
									<div class="col-7">
                                        </div>
								</div>
							</div><br /><br />
	          </form>
				</div>
				
			</div>
		</div>
	</div>

     </div>




</asp:Content>
