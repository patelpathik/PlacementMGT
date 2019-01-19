<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="subjects.aspx.cs" Inherits="dir1_Admin_Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //alert("hi");
            load_data();
        });
        //setInterval(load_data, 3000);
        function load_data() {
            $("#stu_tbody").fadeOut(1);
            var temp = "load_data.aspx?req=sub";
            //alert(temp);
            document.getElementById("stu_tbody").innerHTML = "";
            //alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    $("#stu_tbody").html(data);
                }
            });
            $("#stu_tbody").fadeIn(1000);
        }
        function update(x) {
            var temp = "load_data.aspx?req=branch1?id=" + x;
            alert(temp);
            $.ajax({
                method: "GET",
                url:temp,
                success: function (data) {
                    //var d1 = data.split(",");
                    alert(data);
                }
            });
        }
       

    </script>

     <div class="m-subheader ">
	<div class="d-flex align-items-center">
 		<div class="mr-auto">
 			<h3 class="m-subheader__title ">Subjects</h3>			
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
					<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
								<i class="flaticon-share m--hide"></i>
								Add Subjects 
							</a>
						</li>
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
								View Subjects 
							</a>
						</li>
						
					</ul>
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
		
							<div class="form-group m-form__group row" runat="server">
								<label for="example-text-input" class="col-2 col-form-label">Branch Name</label>
								<div class="col-7">
                                      <asp:DropDownList ID="ddlbname" class="form-control m-input" runat="server" DataSourceID="SqlDataSource1" DataTextField="br_sname" DataValueField="br_sname"></asp:DropDownList> 
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT [br_sname] FROM [branch]"></asp:SqlDataSource>
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Semester</label>
								<div class="col-7">
                                     <asp:DropDownList ID="ddlsem" class="form-control m-input" runat="server">
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
								<label for="example-text-input" class="col-2 col-form-label">Subject Code</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtcode" class="form-control m-input" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtcode" runat="server" ErrorMessage="* Enter subject code"></asp:RequiredFieldValidator>
                                 </div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Subject Name</label>
								<div class="col-7">
                                     <asp:TextBox ID="txtsubject" class="form-control m-input" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtsubject" runat="server" ErrorMessage="* Enter subject name"></asp:RequiredFieldValidator>
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
										<asp:Button ID="btnsubmit" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Add" OnClick="btnsubmit_Click" /> &nbsp;&nbsp;
                                        <button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">Cancel</button>
									</div>
								</div>
							</div>
						</div>
                        <br />


			<div class="m-portlet__foot m-portlet__foot--fit">

                </div>

					</form>
				</div>

				<div class="tab-pane " id="m_user_profile_tab_2">

                 
                    <div class="m-portlet m-portlet--full-height ">
	
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget11_tab1_content">
				<div class="m-widget11">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<td class="m-widget11__app">#</td>
									<td class="m-widget11__sales">Branch Name</td>
									<td class="m-widget11__change">Semester</td>
    								<td class="m-widget11__change">Subject Code</td>
                                    <td class="m-widget11__change">Subject Name</td>

									
								</tr>
							</thead>
                                            <tbody id="stu_tbody"></tbody>

							</table>
						<!--end::Table-->
					</div>
					<div class="m-widget11__action m--align-right">
					</div>
				</div>
				<!--end::Widget 11--> 						             
			</div>
			
		</div>
	</div>
</div>					 
				</div>
				<div class="tab-pane " id="m_user_profile_tab_3">
					
				</div>
			</div>
		</div>
	</div>
</div>		   
    </asp:Content>


