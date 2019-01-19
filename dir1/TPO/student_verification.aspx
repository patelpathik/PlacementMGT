<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO/dashboard.master" AutoEventWireup="true" CodeFile="student_verification.aspx.cs" Inherits="dir1_TPO_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <style type="text/css">
        #stu_tbody tr td{
            vertical-align:middle;
            text-align:center;
        }
        .stu_th tr th{
            text-align:center;
        }
        .patrick{
            width:auto;
            /*width:175px;*/
            text-align:center;
        }
        .patrick:disabled{
            border:0px solid black;
            background-color:transparent;
            box-shadow:none;
        }
    </style>
    <script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //alert("hi");
            var x = "<input type='hidden' id='type1' name='type1' value='pending'>";
            document.getElementById("patrick").innerHTML = x;
            load_data();
        });
        //setInterval(load_data, 3000);
        function load_data() {
            var type1 = document.getElementById("type1").value;
            $("#stu_tbody").fadeOut(1);
            var temp = "load_data.aspx?tb=signup&sortby="+type1;
            //alert(temp);
            document.getElementById("stu_tbody").innerHTML = "";
            //alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    $("#stu_tbody").html(data);
                    $("#stu_tbody2").html(data);
                    $("#stu_tbody3").html(data);
                }
            });
            $("#stu_tbody").fadeIn(1000);
        }
        function accept(x) {
            
            var temp = "load_data.aspx?tb=auth_signup&val=1&id=" + x;
            if (confirm('Are you sure you want to send Password for BVM Placement Portal through Email ?'))
                $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    load_data();
                    //alert(data);
                }
            });
            //load_data();
            //setTimeout(load_data, 2000);
        }
        function reject(x) {
            if (confirm('Are you sure you want to block this student ?'))
            $.ajax({
                method: "GET",
                url: "load_data.aspx?tb=auth_signup&val=0&id=" + x,
                success: function (data) {
                    load_data();
                }
            });
            //setTimeout(load_data, 2000);
            //load_data();
        }
        //setInterval(load_data, 5000);
        function load_p() {
            document.getElementById("type1").value = "pending";
            load_data();
        }
        function load_v() {
            document.getElementById("type1").value = "verified";
            load_data();
        }
        function load_b() {
            document.getElementById("type1").value = "blocked";
            load_data();
        }


        /*edit*/
        function upd_pc(x) {
            var x = x.substring(0, x.length - 1);
            // y=x+'t';
            // var u_v=document.getElementById(y).value;
            alert(x);
            var c1 = x + "c1";
            var c2 = x + "c2";
            var c3 = x + "c3";
            var c4 = x + "c4";
            var c5 = x + "c5";

            var v1 = document.getElementById(c1).value;
            var v2 = document.getElementById(c2).value;
            var v3 = document.getElementById(c3).value;
            var v4 = document.getElementById(c4).value;
            var v5 = document.getElementById(c5).value;

            // var temp='update.php?tn=elib_spec&c1=l_id&v1='+v1+'&c2=title&v2='+v2+'&c3=des&v3='+v3+'&r=es_id&v='+x;
            //var temp = 'update.php?tn=elib_clg_info&c1=coid&v1=' + v1 + '&c2=c_id&v2=' + v2 + '&c3=u_id&v3=' + v3 + '&c4=city_id&v4=' + v4 + '&c5=w_id&v5=' + v5 + '&c6=l_id&v6=' + v6 + '&c7=co_id&v7=' + v7 + '&c8=duration&v8=' + v8 + '&c9=entry_process&v9=' + v9 + '&c10=eligibility&v10=' + v10 + '&c11=fees&v11=' + v11 + '&r=eci_id&v=' + x;
            var temp = "update.aspx?tn=stu_auth&v1=" + v1 + "&v2=" + v2 + "&v3=" + v3 + "&v4=" + v4 + "&v5=" + v5 + "&ref=" + x;
            alert(temp);
            $.ajax({
                type: "GET",
                url: temp,
                success: function (data) {
                    alert(data);
                }
            });
            var ans = x + "m";
            var data1 = "<button type='button' class='btn btn-info btn-round' id='" + x + "' style='display: block;' onclick='edit1(this.id);'><i class='fa fa-edit'></i></button>";
            document.getElementById(ans).innerHTML = data1;

            document.getElementById(c1).disabled = true;
            document.getElementById(c2).disabled = true;
            document.getElementById(c3).disabled = true;
            document.getElementById(c4).disabled = true;
            document.getElementById(c5).disabled = true;
        }
        function rev(x) {
            x = x.substring(0, x.length - 1);
            var ans = x + "m";
            var data1 = "<button type='button' class='btn btn-info btn-round' id='" + x + "' style='display: block;' onclick='edit1(this.id);'><i class='fa fa-edit'></i></button>";
            document.getElementById(ans).innerHTML = data1;

            var c1 = x + "c1";
            var c2 = x + "c2";
            var c3 = x + "c3";
            var c4 = x + "c4";
            var c5 = x + "c5";

            document.getElementById(c1).disabled = true;
            document.getElementById(c2).disabled = true;
            document.getElementById(c3).disabled = true;
            document.getElementById(c4).disabled = true;
            document.getElementById(c5).disabled = true;
        }
        function edit1(e) {
            // var t=e+"t";
            // document.getElementById(t).disabled=false;
            var c1 = e + "c1";
            var c2 = e + "c2";
            var c3 = e + "c3";
            var c4 = e + "c4";
            var c5 = e + "c5";
            document.getElementById(c1).disabled = false;
            document.getElementById(c2).disabled = false;
            document.getElementById(c3).disabled = false;
            document.getElementById(c4).disabled = false;
            document.getElementById(c5).disabled = false;
            var u = e + "u";
            var c = e + "c";
            var md = e + "m";
            var data = "<button type='button' class='btn btn-success btn-round' onclick='upd_pc(this.id);' id='" + u + "'><i class='fa fa-check'></i></button>&nbsp;<button type='button' onclick='rev(this.id);' class='btn btn-danger btn-round' id='" + c + "' ><i class='fa fa-ban'></i></button>";
            document.getElementById(md).innerHTML = data;
        }
    </script>
    <div id="patrick"></div>
    <div class="m-subheader ">
	<div class="d-flex align-items-center">
 		<div class="mr-auto">
 			<h3 class="m-subheader__title ">Student Verification and Management</h3>			
			 		</div>
  		<div>
	</div>
	</div>
</div>
   

    <div class="col-xl-12 col-lg-8">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
			<div class="m-portlet__head">
				<div class="m-portlet__head-tools">
					<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab" onclick="load_p();">
								<i class="flaticon-share m--hide"></i>
								Pending Verificaion
							</a>
						</li>
						<li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab" onclick="load_v();">
								Verified Students 
							</a>
						</li>
                        <li class="nav-item m-tabs__item">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3" role="tab" onclick="load_b();">
								Blocked Students 
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
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget11_tab1_content">
				<div class="m-widget11">
					<div class="table-responsive">
						<table class="table">
								 <thead class="stu_th">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>College ID</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Branch</th>
                        <th>Semester</th>
                        <!--<th>Status</th>-->
                        <th>Change Access</th>
                        <th>Edit</th>
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
								 <thead class="stu_th">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>College ID</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Branch</th>
                        <th>Semester</th>
                        <!--<th>Status</th>-->
                        <th>Change Access</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody id="stu_tbody2"></tbody>

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
					<div class="m-portlet m-portlet--full-height ">
	
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget11_tab1_content">
				<div class="m-widget11">
					<div class="table-responsive">
						<table class="table">
								 <thead class="stu_th">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>College ID</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Branch</th>
                        <th>Semester</th>
                        <!--<th>Status</th>-->
                        <th>Change Access</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody id="stu_tbody3"></tbody>

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
			</div>
		</div>
	</div>


</asp:Content>

