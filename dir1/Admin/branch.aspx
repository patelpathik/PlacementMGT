<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="branch.aspx.cs" Inherits="dir1_Admin_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="../../jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            load_data(); //1st time run

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
            var temp = "load_data.aspx?req=branch";
            alert(temp);
            document.getElementById("stu_tbody").innerHTML = "";
            //alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function(data) {
                    $("#stu_tbody").html(data);
                }
            });
            $("#stu_tbody").fadeIn(1000);
        }
        function update(x) {
            var temp = "load_data.aspx?req=branch1&id=" + x;
            // alert(temp);
            $.ajax({
                method: "GET",
                url:temp,
                success: function (data) {
                    //var d1 = data.split(",");
                    //alert(data);
                    data = data.substring(0, data.indexOf(":"));
                    alert(data);
                    var data_all = data.split(",");
                    var id = data_all[0];
                    var name = data_all[1];
                    var sname = data_all[2];
                    document.getElementById("pat1").innerHTML = "<input type='hidden' id='branch_id' value='" + id + "'>";
                    //$("#m_user_profile_tab_1").show();
                    //$("#m_user_profile_tab_2").fadeOut();
                    $("#l_one").hide();
                    $("#l_two").hide();
                    $("#l_upd").show();
                    $("#m_user_profile_tab_1").hide();
                    $("#m_user_profile_tab_2").hide();
                    $("#m_user_profile_tab_3").show();

                    document.getElementById("bfn").value = name;
                    document.getElementById("bsn").value = sname;
                }
            });
        }
        function upd_rev() {                //cancel
            $("#l_one").show();
            $("#l_two").show();
            $("#l_upd").hide();

            $("#l_two").click();

            //$("#m_user_profile_tab_1").show();
            //$("#m_user_profile_tab_2").hide();
            $("#m_user_profile_tab_3").hide();
        }
        function do_update() {              //submit (update)
            var bfn = document.getElementById("bfn").value;
            var bsn = document.getElementById("bsn").value;
            var bid = document.getElementById("branch_id").value;

            var temp = "load_data.aspx?update=branch&bid=" + bid + "&bfn=" + bfn + "&bsn=" + bsn;
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
        function do_delete(x)
        {
            var temp = "load_data.aspx?delete=branch&bid=" + x;
            alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function(data){
                    load_data();
                }
            });
        }
    </script>
    <div id="pat1"></div>
    <div class="m-subheader ">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <h3 class="m-subheader__title ">Branch</h3>			
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
                            <li class="nav-item m-tabs__item" id="l_one">
                                <a class="nav-link m-tabs__link active" id="one" data-toggle="tab" href="#m_user_profile_tab_1" role="tab"><i class="flaticon-share m--hide"></i>Add Branch Data</a>
                            </li>
                            <li class="nav-item m-tabs__item" id="l_two">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">View Branch Data</a>
                            </li>
                            <li class="nav-item m-tabs__item" id="l_upd" style="display:none;">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3" role="tab">Update Data</a>
                            </li>
                        </ul>
                    </div>
                    <div class="m-portlet__head-tools">
                        <ul class="m-portlet__nav">
                            <li class="m-portlet__nav-item m-portlet__nav-item--last">
                                <div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
                                    <!--</a>-->
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
                                        The example form below demonstrates common HTML form elements that receive updated styles from Bootstrap with additional classes.
                                    </div>
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <label for="example-text-input" class="col-2 col-form-label">Branch Full Name</label>
                                    <div class="col-7">
                                        <asp:TextBox ID="txtbname" class="form-control m-input" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtbname" runat="server" ErrorMessage="* Enter branch name"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label for="example-text-input" class="col-2 col-form-label">Branch Short Name</label>
                                    <div class="col-7">
                                        <asp:TextBox ID="txtbsname" class="form-control m-input" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtbsname" runat="server" ErrorMessage="* Enter branch short name"></asp:RequiredFieldValidator>
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
                                                            <td class="m-widget11__label">#</td>
                                                            <td class="m-widget11__sales">Branch Full Name</td>
                                                            <td class="m-widget11__change">Branch Short Name</td>
                                                            <td class="m-widget11__app">Change/Delete</td>					
                                                        </tr>
                                                    </thead>
                                                    <tbody id="stu_tbody"></tbody>
                                                </table>
                                                <!--end::Table-->
                                            </div>
                                            <div class="m-widget11__action m--align-right">
                                                <button type="button" class="btn m-btn--pill btn-secondary m-btn m-btn--custom m-btn--hover-brand">Generate Report</button>
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
                                    <label for="example-text-input" class="col-2 col-form-label">Branch Full Name</label>
                                    <div class="col-7">
                                        <input id="bfn" type="text" class="form-control m-input" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row">
                                    <label for="example-text-input" class="col-2 col-form-label">Branch Short Name</label>
                                    <div class="col-7">
                                        <input id="bsn" type="text" class="form-control m-input" />
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
    </div>
</asp:Content>