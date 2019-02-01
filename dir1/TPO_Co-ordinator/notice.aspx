<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO_Co-ordinator/dashboard.master" AutoEventWireup="true" CodeFile="notice.aspx.cs" Inherits="dir1_TPO_Co_ordinator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<!-- END: Subheader -->		        <div class="m-content">
		            <div class="row">
	
	<div class="col-xl-12 col-lg-8">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
			<div class="m-portlet__head">
				<div class="m-portlet__head-tools">
					<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
								<i class="flaticon-share m--hide"></i>
								Add Notice
							</a>
						</li>
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
								Notice Data
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
								<label for="example-text-input" class="col-2 col-form-label">Date</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtdate" class="form-control m-input" runat="server" BorderColor="White"></asp:TextBox>
								
                                </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Time</label>
								<div class="col-7">
                                    <asp:TextBox ID="txttime" class="form-control m-input" runat="server" BorderColor="White"></asp:TextBox>
								
                                </div>
							</div>
                            <div class="form-group m-form__group row" runat="server">
								<label for="example-text-input" class="col-2 col-form-label">Title</label>
								<div class="col-7">
                                    <asp:TextBox ID="txttitle" class="form-control m-input" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txttitle" runat="server" ErrorMessage="* Title is Required"></asp:RequiredFieldValidator>								
                                    </div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Upload File</label>
								<div class="col-7">
                                    <asp:FileUpload ID="fileupload" class="form-control m-input" runat="server" />                              								
                                </div>
                                <div class="col-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="fileupload" runat="server" ErrorMessage="* please select file"></asp:RequiredFieldValidator>
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
										<asp:Button ID="Button1" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Add" OnClick="Button1_Click" /> &nbsp;&nbsp;
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
</div>		        </div>

</asp:Content>

