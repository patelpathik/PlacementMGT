<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="tpo_co_ordinator_reg.aspx.cs" Inherits="dir1_Admin_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            load_data();
            $("#l_one").click(function () {
                $("#m_user_profile_tab_1").show();
                $("#m_user_profile_tab_2").hide();
                $("#m_user_profile_tab_3").hide();
            });

            $("#l_two").click(function () {
                $("#m_user_profile_tab_1").hide();
                $("#m_user_profile_tab_2").show();
                $("#m_user_profile_tab_3").hide();
            });
        });
        //setInterval(load_data, 3000);
        function load_data() {
            $("#stu_tbody").fadeOut(1);
            var temp = "load_data.aspx?req=tpoco";
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
            var temp = "load_data.aspx?req=tpocoupd&id=" + x;
            alert(temp);
            $.ajax({
                method: "GET",
                url:temp,
                success: function (data) {
                    data = data.substring(0, data.indexOf(":"));
                    //alert(data);
                    var data_all = data.split(",");
                    var id = data_all[0];
                    var tconame = data_all[1];
                    var tcoemail = data_all[2];
                    var tcomob = data_all[3];
                    document.getElementById("pat1").innerHTML = "<input type='hidden' id='tco_id' value='" + id + "'>";
                    //$("#m_user_profile_tab_1").show();
                    //$("#m_user_profile_tab_2").fadeOut();
                    $("#l_one").hide();
                    $("#l_two").hide();
                    $("#l_upd").show();
                    $("#m_user_profile_tab_1").hide();
                    $("#m_user_profile_tab_2").hide();
                    $("#m_user_profile_tab_3").show();

                    document.getElementById("tconame").value = tconame;
                    document.getElementById("tcoemail").value = tcoemail;
                    document.getElementById("tcomob").value = tcomob;
                  
                }
            });
        }
        function upd_rev() {
            $("#l_one").show();
            $("#l_two").show();
            $("#l_upd").hide();

            $("#l_two").click();

            //$("#m_user_profile_tab_1").show();
            //$("#m_user_profile_tab_2").hide();
            $("#m_user_profile_tab_3").hide();
        }
        function do_update() {

            var tconame = document.getElementById("tconame").value;
            var tcoemail = document.getElementById("tcoemail").value;
            var tcomob = document.getElementById("tcomob").value;
            var coid = document.getElementById("tco_id").value;


            var temp = "load_data.aspx?update=tpoco&coid=" + coid + "&tconame=" + tconame + "&tcoemail=" + tcoemail + "&tcomob=" + tcomob;
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    $("#l_one").show();
                    $("#l_two").show();
                    $("#l_upd").hide();

                    $("#l_two").click();

                    //$("#m_user_profile_tab_1").show();
                    //$("#m_user_profile_tab_2").hide();
                    $("#m_user_profile_tab_3").hide();
                }
            });
        }
        function do_delete(x) {
            var temp = "load_data.aspx?delete=coordinator&coid=" + x;
            alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    load_data();
                }
            });
        }
    </script>





   <!-- BEGIN: Subheader -->
<div class="m-subheader ">
	<div class="d-flex align-items-center">
 		<div class="mr-auto">
 			<h3 class="m-subheader__title ">TPO Co-ordinator Registration</h3>			
			 		</div>
  		<div>
	</div>
	</div>
</div>
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
								TPO Co-ordinator Registration
							</a>
						</li>
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
								TPO Co-ordinator's Data
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtidno" runat="server" ErrorMessage="* Require ID No"></asp:RequiredFieldValidator>
                            
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Contact</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtcont" class="form-control m-input" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtcont" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
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
                                     <asp:DropDownList ID="ddlbname" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="br_sname" DataValueField="br_sname"></asp:DropDownList> 
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT [br_sname] FROM [branch]"></asp:SqlDataSource>
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
                                        <asp:Button ID="btnsubmit" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
										<button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">Cancel</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane " id="m_user_profile_tab_2">
					<div class="m-portlet m-portlet--full-height ">
		<div id="pat1"></div>

	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget11_tab1_content">
				<div class="m-widget11">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<td class="m-widget11__label">#</td>
									<td class="m-widget11__app">Name</td>
									<td class="m-widget11__app">ID Number</td>
                                   	<td class="m-widget11__change">Email-ID</td>
									<td class="m-widget11__sales">Contact</td>
									<td class="m-widget11__change">Branch</td>
							
									
									
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
				</div>
				<div class="tab-pane " id="m_user_profile_tab_3">
					 <form class="m-form m-form--fit m-form--label-align-right">
                            <div class="m-portlet__body">
                                <div class="form-group m-form__group m--margin-top-10 m--hide">
                                    <div class="alert m-alert m-alert--default" role="alert">
                                        The example form below demonstrates common HTML form elements that receive updated styles from Bootstrap with additional classes.
                                    </div>
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <label for="example-text-input" class="col-2 col-form-label">Name</label>
                                    <div class="col-7">
                                        <input id="tconame" type="text" class="form-control m-input" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label for="example-text-input" class="col-2 col-form-label">Email ID</label>
                                    <div class="col-7">
                                        <input id="tcoemail" type="text" class="form-control m-input" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label for="example-text-input" class="col-2 col-form-label">Contact No.</label>
                                    <div class="col-7">
                                        <input id="tcomob" type="text" class="form-control m-input" />
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
                                            <button class="btn btn-info m-btn m-btn--air m-btn--custom" onclick="do_update();">Update</button>
                                            &nbsp;&nbsp;&nbsp;
                                            <button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom" onclick="upd_rev();">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="m-portlet__foot m-portlet__foot--fit">
                            </div>
                        </form>
				</div>
			</div>
		</div>
	</div>
</div>		        </div>



           
  
</asp:Content>
 

