<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="tpo_registration.aspx.cs" Inherits="dir1_Admin_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //alert("hi");
            load_data();
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
            var temp = "load_data.aspx?req=tpo";
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
            var temp = "load_data.aspx?req=tpo&id=" + x;
            alert(temp);
            $.ajax({
                method: "GET",
                url:temp,
                success: function (data) {
                    data = data.substring(0, data.indexOf(":"));
                    //alert(data);
                    var data_all = data.split(",");
                    var id = data_all[0];
                    var tponame = data_all[1];
                    var tpoemail = data_all[2];
                    var tpomob = data_all[3];
                    var tpopro = data_all[4];
                    var tpoquali = data_all[5];

                    document.getElementById("pat1").innerHTML = "<input type='hidden' id='tpo_id' value='" + id + "'>";
                    //$("#m_user_profile_tab_1").show();
                    //$("#m_user_profile_tab_2").fadeOut();
                    $("#l_one").hide();
                    $("#l_two").hide();
                    $("#l_upd").show();
                    $("#m_user_profile_tab_1").hide();
                    $("#m_user_profile_tab_2").hide();
                    $("#m_user_profile_tab_3").show();

                    document.getElementById("tponame").value = tponame;
                    document.getElementById("tpoemail").value = tpoemail;
                    document.getElementById("tpomob").value = tpomob;
                    document.getElementById("tpopro").value = tpopro;
                    document.getElementById("tpoquali").value = tpquali;

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

            var tponame = document.getElementById("tponame").value;
            var tpoemail = document.getElementById("tpoemail").value;
            var tpomob = document.getElementById("tpomob").value;
            var tpopro = document.getElementById("tpopro").value;
            var tpoquali = document.getElementById("tpoquali").value;
            var tid = document.getElementById("tpo_id").value;

            var temp = "load_data.aspx?update=tpo&tid=" + tid + "&ttoname=" + tponame + "&tpoemail=" + tpoemail + "&tpomob=" + tpomob + "&tpopro=" + tpopro + "&tpoquali=" + tpoquali;
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
            var temp = "load_data.aspx?delete=tpo&tid=" + x;
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
 			<h3 class="m-subheader__title ">TPO Registration</h3>			
			 		</div>
  		<div>
	</div>
	</div>
</div>
<!-- END: Subheader -->		        <div class="m-content">
		            <div class="row">
			<div id="pat1"></div>

	<div class="col-xl-12 col-lg-8">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
			<div class="m-portlet__head">
				<div class="m-portlet__head-tools">
					<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
								<i class="flaticon-share m--hide"></i>
								TPO Registration
							</a>
						</li>
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
								TPO Data
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
								<label for="example-text-input" class="col-2 col-form-label">Name</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtname" class="form-control m-input" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtname" runat="server" ErrorMessage="* Enter comapny name"></asp:RequiredFieldValidator>
                            
								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Designation</label>
								<div class="col-7">
                                   <asp:TextBox ID="txtprofile" class="form-control m-input" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtprofile" runat="server" ErrorMessage="* Enter profile"></asp:RequiredFieldValidator>

								</div>
							</div><div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Qualification</label>
								<div class="col-7">
                                   <asp:TextBox ID="txtqul" class="form-control m-input" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtqul" runat="server" ErrorMessage="* Enter qulification"></asp:RequiredFieldValidator>
                           
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Contact</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtmob" class="form-control m-input" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="txtmob" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmob" ErrorMessage="validate only 10 digit" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Email ID</label>
								<div class="col-7">
                                   <asp:TextBox ID="txtemail" class="form-control m-input" runat="server" TextMode="Email"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="txtemail" runat="server" ErrorMessage="* Enter email id"></asp:RequiredFieldValidator>

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
                                        <asp:Button ID="btnsubmit" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Update" OnClick="btnsubmit_Click" />
										<button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">Cancel</button>
									</div>
								</div>
							</div>
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
									<td class="m-widget11__label">#</td>
									<td class="m-widget11__app">Name</td>
                                    <td class="m-widget11__change">Email-ID</td>
									<td class="m-widget11__sales">Contact</td>
                                    <td class="m-widget11__change">Designation</td>
                                    <td class="m-widget11__change">Qualification</td>
							
									
									
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
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <label for="example-text-input" class="col-2 col-form-label">Name</label>
                                    <div class="col-7">
                                        <input id="tponame" type="text" class="form-control m-input" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label for="example-text-input" class="col-2 col-form-label">Email ID</label>
                                    <div class="col-7">
                                        <input id="tpoemail" type="text" class="form-control m-input" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label for="example-text-input" class="col-2 col-form-label">Contact No.</label>
                                    <div class="col-7">
                                        <input id="tpomob" type="text" class="form-control m-input" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label for="example-text-input" class="col-2 col-form-label">Designation</label>
                                    <div class="col-7">
                                        <input id="tpopro" type="text" class="form-control m-input" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label for="example-text-input" class="col-2 col-form-label">Qualification</label>
                                    <div class="col-7">
                                        <input id="tpoquali" type="text" class="form-control m-input" />
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

