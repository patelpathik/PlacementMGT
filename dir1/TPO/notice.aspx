<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO/dashboard.master" AutoEventWireup="true" CodeFile="notice.aspx.cs" Inherits="dir1_TPO_Co_ordinator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
            var temp = "../Admin/load_data.aspx?req=notice";
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
            var temp = "../Admin/load_data.aspx?req=not&id=" + x;
            alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    data = data.substring(0, data.indexOf(":"));
                    alert(data);
                    var data_all = data.split(",");
                    var id = data_all[0];
                    var title = data_all[1];
                    var description = data_all[2];

                    document.getElementById("pat1").innerHTML = "<input type='hidden' id='not_id' value='" + id + "'>";
                    //$("#m_user_profile_tab_1").show();
                    //$("#m_user_profile_tab_2").fadeOut();
                    $("#l_one").hide();
                    $("#l_two").hide();
                    $("#l_upd").show();
                    $("#m_user_profile_tab_1").hide();
                    $("#m_user_profile_tab_2").hide();
                    $("#m_user_profile_tab_3").show();

                    document.getElementById("ntitle").value = ntitle;
                    document.getElementById("ndes").value = ndes;
             
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
            var ntitle = document.getElementById("ntitle").value;
            var ndes = document.getElementById("ndes").value;
            var nid = document.getElementById("not_id").value;


            var temp = "../Admin/load_data.aspx?update=notice&nid=" + nid + "&ntitle=" + ntitle + "&ndes=" + ndes;
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
            var temp = "../Admin/load_data.aspx?delete=notice&nid=" + x;
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





<!-- END: Subheader -->		        
    <div class="m-content">
		            <div class="row"></div>
	
	<div class="col-xl-12 col-lg-8">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
			<div class="m-portlet__head">
				<div class="m-portlet__head-tools">
					<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
								Add Notice
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

							

							
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Current Date</label>
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
                             <div class="form-group m-form__group row" runat="server">
								<label for="example-text-input" class="col-2 col-form-label">Description</label>
								<div class="col-7">
                                    <asp:TextBox ID="txtdes" class="form-control m-input" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="col-3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtdes" runat="server" ErrorMessage="* Description is Required"></asp:RequiredFieldValidator>								
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
										<asp:Button ID="Button1" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Add" OnClick="Button1_Click" /> &nbsp;&nbsp;
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
                                                            <td class="m-widget11__app">#</td>
                                                            <td class="m-widget11__app">Title</td>
                                                            <td class="m-widget11__app">Decription</td>
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


                    	<div id="pat1"></div>


                <div class="tab-pane " id="m_user_profile_tab_3">
                        <form class="m-form m-form--fit m-form--label-align-right">
						<div class="m-portlet__body">

							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Title</label>
								<div class="col-7">
                                    <input ID="ntitle" class="form-control m-input" />
                            </div>
							</div>
							<div class="form-group m-form__group row">
								<label for="example-text-input" class="col-2 col-form-label">Description</label>
								<div class="col-7">
                                    <input ID="ndes" class="form-control m-input" />
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
        
       </div>


</asp:Content>

