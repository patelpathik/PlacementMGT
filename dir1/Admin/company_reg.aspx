<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="company_reg.aspx.cs" Inherits="dir1_TPO_Default" %>

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
            //alert('hey');
        });
        //setInterval(load_data, 3000);
        function load_data() {
            $("#stu_tbody").fadeOut(1);
            var temp = "load_data.aspx?req=comp";
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
            var temp = "load_data.aspx?req=compup&id=" + x;
            //alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    data = data.substring(0, data.indexOf(":"));
                    //alert(data);
                    var data_all = data.split(",");
                    var id = data_all[0];
                    var name = data_all[1];
                    var no = data_all[2];
                    var mail = data_all[3];
                    var detail = data_all[4];
                    var add = data_all[5];
                    var city = data_all[6];
                    var state = data_all[7];
                    document.getElementById("pat1").innerHTML = "<input type='hidden' id='com_id' value='" + id + "'>";
                    //$("#m_user_profile_tab_1").show();
                    //$("#m_user_profile_tab_2").fadeOut();
                    $("#l_one").hide();
                    $("#l_two").hide();
                    $("#l_upd").show();
                    $("#m_user_profile_tab_1").hide();
                    $("#m_user_profile_tab_2").hide();
                    $("#m_user_profile_tab_3").show();

                    document.getElementById("cn").value = name;
                    document.getElementById("no").value = no;
                    document.getElementById("em").value = mail;
                    document.getElementById("det").value = detail;
                    document.getElementById("add").value = add;
                    
                    $.ajax({
                        method: "GET",
                        url: "load_data.aspx?req=state1",
                        success: function (data) {
                            console.log(data);
                            $("#st").html(data);
                            //$("#st").val(state);
                        }
                    });
                    $.ajax({
                        method: "GET",
                        url: "load_data.aspx?req=city1&s=" + state,
                        success: function (data) {
                            $("#ct").html(data);
                            //$("#ct").val(city);
                        }
                    });
                    $("#st").val(state);
                    $("#ct").val(city);
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
            var cn = document.getElementById("cn").value;
            var no = document.getElementById("no").value;
            var em = document.getElementById("em").value;
            var det = document.getElementById("det").value;
            var add = document.getElementById("add").value;
            var ct = document.getElementById("ct").value;
            var st = document.getElementById("st").value;
            var cid = document.getElementById("com_id").value;


            var temp = "load_data.aspx?update=comp&cid=" + cid + "&cn=" + cn + "&no=" + no + "&em=" + em + "&det=" + det + "&add=" + add + "&ct=" + ct + "&st=" + st ;
            $.ajax({
                method: "GET",
                url: temp,
                success: function(data){
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
            var temp = "load_data.aspx?delete=company&cid=" + x;
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
 			<h3 class="m-subheader__title ">My Profile</h3>			
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
								Add Company Data
							</a>
						</li>
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
								View Company Data
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtname" runat="server" ErrorMessage="* Enter comapny name"></asp:RequiredFieldValidator>
                            
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Contact</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtcont" class="form-control m-input" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtcont" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcont" ErrorMessage="validate only 10 digit" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                                </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Email ID</label>
								<div class="col-7">
                                   <asp:TextBox ID="txtemail" class="form-control m-input" runat="server" TextMode="Email"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="txtemail" runat="server" ErrorMessage="* Enter email id"></asp:RequiredFieldValidator>

								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Company Detail</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtdetail" class="form-control m-input" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Red" ControlToValidate="txtdetail" runat="server" ErrorMessage="* Enter company detail"></asp:RequiredFieldValidator>
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
                                    <asp:TextBox ID="txtadd"  class="form-control m-input" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtadd" runat="server" ErrorMessage="* Enter address"></asp:RequiredFieldValidator>

								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">State</label>
								<div class="col-7">
                              <asp:DropDownList ID="ddlstate" class="form-control m-input" runat="server" DataTextField="st_name" DataValueField="st_name" AutoPostBack="True">
                              </asp:DropDownList>
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">City</label>
								<div class="col-7">
                                    <asp:DropDownList ID="ddlcity" runat="server" class="form-control m-input" DataTextField="ct_name" DataValueField="ct_name"></asp:DropDownList>
								</div>
							</div>
							
						

							


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
	
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget11_tab1_content">
				<div class="m-widget11">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<td class="m-widget11__label">#</td>
									<td class="m-widget11__app">Company Name</td>
									<td class="m-widget11__sales">Email Id</td>
									<td class="m-widget11__change">Number</td>
									<td class="m-widget11__change">Company Detail</td>
									<td class="m-widget11__change">Address</td>
									<td class="m-widget11__change">State</td>
									<td class="m-widget11__change">City</td>
									
									
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
                                    <input ID="cn" class="form-control m-input" />
                            </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Contact</label>
								<div class="col-7">
                                    <input ID="no" class="form-control m-input" />
                                 </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Email ID</label>
								<div class="col-7">
                                    <input ID="em" class="form-control m-input" type="email" />
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Company Detail</label>
								<div class="col-7">
                                    <input ID="det" class="form-control m-input" />
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
                                    <input ID="add" class="form-control m-input" />
								</div>
							</div>
                            <div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">State</label>
								<div class="col-7">
                                   <input ID="st" class="form-control m-input" />
                                   <!--<select id="st">
                                        <option selected disabled>Select State</option>
                                    </select>-->
								</div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">City</label>
								<div class="col-7">
                                    <input ID="ct" class="form-control m-input" />
                                    <!--<select id="ct">
                                        <option selected disabled>Select City</option>
                                    </select>-->
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
</div>		        </div>
</asp:Content>

