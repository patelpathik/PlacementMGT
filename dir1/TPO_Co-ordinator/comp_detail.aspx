<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO_Co-ordinator/dashboard.master" AutoEventWireup="true" CodeFile="comp_detail.aspx.cs" Inherits="dir1_TPO_Co_ordinator_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="m-content">
		            <div class="row"></div>
	
	<div class="col-xl-12 col-lg-8">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
			<div class="m-portlet__head">
				<div class="m-portlet__head-tools">
					<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
								Add Company
							</a>
						</li>
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
								Update Data
							</a>
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

							

							
							 <div class="form-group m-form__group row" runat="server"><label for="example-text-input" class="col-2 col-form-label"><asp:Label ID="Label2" runat="server" Text="Placement Date"></asp:Label></label>
								<div class="col-7">
                                    <asp:TextBox ID="txtcdat" clss="form-control m-input" Height="40px" runat="server" TextMode="Date"></asp:TextBox><asp:Label ID="Label6" runat="server" Text="[MM/DD/YYYY]"></asp:Label>
                                </div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtcdat" runat="server" ErrorMessage="* Date is Required"></asp:RequiredFieldValidator>								
                                    </div>
							</div>

                            <div class="form-group m-form__group row" runat="server">
								<label for="example-text-input" class="col-2 col-form-label">Time</label>
								<div class="col-7">
                                    <asp:TextBox ID="txttime" class="form-control m-input" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txttime" runat="server" ErrorMessage="* Time is Required"></asp:RequiredFieldValidator>								
                                    </div>
							</div>
                             <div class="form-group m-form__group row" runat="server">
								<label for="example-text-input" class="col-2 col-form-label">Company Name</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtname" class="form-control m-input" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtname" runat="server" ErrorMessage="* Name is Required"></asp:RequiredFieldValidator>								
                                    </div>
							</div>
                             <div class="form-group m-form__group row" runat="server">
								<label for="example-text-input" class="col-2 col-form-label">Placement Location</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtloc" class="form-control m-input" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtloc" runat="server" ErrorMessage="* Location is Required"></asp:RequiredFieldValidator>								
                                    </div>
							</div>
                             <div class="form-group m-form__group row" runat="server">
								<label for="example-text-input" class="col-2 col-form-label">Package</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtpack" class="form-control m-input" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" ControlToValidate="txtpack" runat="server" ErrorMessage="* Package is Required"></asp:RequiredFieldValidator>								
                                    </div>
							</div>
                            <div>
                               
                            </div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Select Branch</label>
                                
								<div class="col-3">
                                    <asp:checkboxlist runat="server" id="chkbranch">
                                            <asp:ListItem Text="ME" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="CE" Value=""></asp:ListItem>
                                            <asp:ListItem Text="EE" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="EC" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="CP" Value=""></asp:ListItem>
                                            <asp:ListItem Text="IT" Value=""></asp:ListItem>
                                            <asp:ListItem Text="PE" Value="8"></asp:ListItem>
                                        </asp:checkboxlist>
                                </div>
                                 
							
							</div>

                            
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Upload File</label>
								<div class="col-7">
                                    <asp:FileUpload ID="fileupload1" class="form-control m-input" runat="server" />                              								
                                </div>
                                <div class="col-3">
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
										<asp:Button ID="Button1" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Submit" OnClick="Button1_Click" /> &nbsp;&nbsp;
                                        <button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">Cancel</button>
									</div>
								</div>
							</div>
						</div>
                        <br />



			

					</form>
				</div>



				<div class="tab-pane " id="m_user_profile_tab_2">   
                     <form class="m-form m-form--fit m-form--label-align-right">        
                        <div class="m-portlet m-portlet--full-height ">
                            <div class="m-portlet__body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="m_widget11_tab1_content">
                                        <div class="m-widget11">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <td class="m-widget11__label">#</td>
                                                            <td class="m-widget11__sales">Title</td>
                                                            <td class="m-widget11__change">Decription</td>
                                                            <td class="m-widget11__app">File</td>
                                                            <td class="m-widget11__app">Update</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="stu_tbody"></tbody>
                                                </table>
                                                <!--end::Table-->
                                            </div>
                                        </div>
                                        <!--end::Widget 11--> 						             
                                    </div>
                                </div>
                            </div>
                        </div>
                         </form>
                    </div>




                <div class="tab-pane " id="m_user_profile_tab_3">
                        <form class="m-form m-form--fit m-form--label-align-right">
						<div class="m-portlet__body">

							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Title</label>
								<div class="col-7">
                                    <input ID="ntile" class="form-control m-input" />
                            </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Description</label>
								<div class="col-7">
                                    <input ID="ndes" class="form-control m-input" />
                                 </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Email ID</label>
								<div class="col-7">
                                    <input ID="em" class="form-control m-input" type="email" />
								</div>
							</div>
							</div>
						<div class="m-portlet__foot m-portlet__foot--fit">
							<div class="m-form__actions">
								<div class="row">
									<div class="col-2">
									</div>
									<div class="col-7">
                                        <button class="btn btn-info m-btn m-btn--air m-btn--custom" onclick="do_update();">Update</button>
                                        <button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom" onclick="upd_rev();">Cancel</button>
									</div>
								</div>
							</div>
						</div>
                        </form>
					
				</div>

            </div>

		</div>
            </div>
	</div>
</asp:Content>

