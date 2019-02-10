<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO/dashboard.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="dir1_TPO_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //alert("hi");
            //load_data();
        });
        //setInterval(load_data, 3000);
       function load_tpoco() {
            $("#stu_tbody").fadeOut(1);
            var temp = "../Admin/load_data.aspx?req=dashtpoco";
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
      function load_tpo() {
            $("#stu_tbody1").fadeOut(1);
            var temp = "../Admin/load_data.aspx?req=dashtpo";
            //alert(temp);
            document.getElementById("stu_tbody").innerHTML = "";
            //alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    $("#stu_tbody1").html(data);
                }
            });
            $("#stu_tbody1").fadeIn(1000);
        }
        function load_comp() {
            $("#stu_tbody2").fadeOut(1);
            var temp = "../Admin/load_data.aspx?req=dashcomp";
            //alert(temp);
            document.getElementById("stu_tbody2").innerHTML = "";
            //alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    $("#stu_tbody2").html(data);
                }
            });
            $("#stu_tbody2").fadeIn(1000);
        } 
        function load_signup() {
            $("#stu_tbody3").fadeOut(1);
            var temp = "../Admin/load_data.aspx?req=dashsignup";
           // alert(temp);
            document.getElementById("stu_tbody3").innerHTML = "";
            //alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function (data) {
                    $("#stu_tbody3").html(data);
                }
            });
            $("#stu_tbody3").fadeIn(1000);
        }

    </script>








    <div class="m-subheader ">
	<div class="d-flex align-items-center">
 		<div class="mr-auto">
 			<h3 class="m-subheader__title ">Dashboard</h3>			
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
                        <li class="nav-item m-tabs__item" id="l_two">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
							Show Data
							</a>
                            </li>
                        <li class="nav-item m-tabs__item" id="l_upd1" onclick="load_signup();">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
								Students
							</a>
						</li>
                        <li class="nav-item m-tabs__item" id="l_upd3" onclick="load_tpo();">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_4" role="tab">
								TPO
							</a>
						</li>
                        <li class="nav-item m-tabs__item" id="l_upd4" onclick="load_tpoco();">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_5" role="tab">
								TPC Co-ordinator
							</a>
						</li>
                        <li class="nav-item m-tabs__item" id="l_upd5" onclick="load_comp();">
							<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_6" role="tab">
								Company
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
						
							<div class="row">
                                <div class="col-xl-1">
                                  </div>
  <div class="col-xl-3">
    <!--begin:: Widgets/Announcements 2-->
<div class="m-portlet m--bg-danger m-portlet--bordered-semi m-portlet--skin-dark m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">

				</h3>
			</div>
		</div>
	</div>
	<div class="m-portlet__body">
		<!--begin::Widget 7-->
		<div class="m-widget7 m-widget7--skin-dark">
			<div class="m-widget7__button">				    	 
				<a class="m-btn m-btn--pill btn btn-accent" href="#" role="button">Students</a>
			</div>
		</div>
		<!--end::Widget 7--> 
	</div>
</div>
      </div>
<!--end:: Widgets/Announcements 2-->  
                                  <div class="col-xl-3">

  <!--begin:: Widgets/Announcements 3-->
<div class="m-portlet m--bg-danger m-portlet--bordered-semi m-portlet--skin-dark m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">

				</h3>
			</div>
		</div>
	</div>
	<div class="m-portlet__body">
		<!--begin::Widget 7-->
		<div class="m-widget7 m-widget7--skin-dark">
			<div class="m-widget7__button">				    	 
				<a class="m-btn m-btn--pill btn btn-accent" href="#" role="button">Block Students</a>
			</div>
		</div>
		<!--end::Widget 7--> 
	</div>
</div>
      </div>
<!--end:: Widgets/Announcements 3-->
                              <div class="col-xl-3">

                              <!--begin:: Widgets/Announcements 4-->
<div class="m-portlet m--bg-danger m-portlet--bordered-semi m-portlet--skin-dark m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">

				</h3>
			</div>
		</div>
	</div>
	<div class="m-portlet__body">
		<!--begin::Widget 7-->
		<div class="m-widget7 m-widget7--skin-dark">
			<div class="m-widget7__button">				    	 
				<a class="m-btn m-btn--pill btn btn-accent" href="#" role="button">TPO</a>
			</div>
		</div>
		<!--end::Widget 7--> 
	</div>
</div>
      </div>
<!--end:: Widgets/Announcements 4--><br />
   <div class="col-xl-2">
     </div>
     <div class="col-xl-1">
     </div>
                          <div class="col-xl-3">

                          <!--begin:: Widgets/Announcements 5-->
<div class="m-portlet m--bg-danger m-portlet--bordered-semi m-portlet--skin-dark m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">

				</h3>
			</div>
		</div>
	</div>
	<div class="m-portlet__body">
		<!--begin::Widget 7-->
		<div class="m-widget7 m-widget7--skin-dark">
			<div class="m-widget7__button">				    	 
				<a class="m-btn m-btn--pill btn btn-accent" href="#" role="button">TPC Co-ordinator</a>
			</div>
		</div>
		<!--end::Widget 7--> 
	</div>
</div>
      </div>
<!--end:: Widgets/Announcements 5-->
                          <div class="col-xl-3">

                          <!--begin:: Widgets/Announcements 6-->
<div class="m-portlet m--bg-danger m-portlet--bordered-semi m-portlet--skin-dark m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">

				</h3>
			</div>
		</div>
	</div>
	<div class="m-portlet__body">
		<!--begin::Widget 7-->
		<div class="m-widget7 m-widget7--skin-dark">
			<div class="m-widget7__button">				    	 
				<a class="m-btn m-btn--pill btn btn-accent" href="#" role="button">Company</a>
			</div>
		</div>
		<!--end::Widget 7--> 
	</div>
</div>
      </div>
<!--end:: Widgets/Announcements 6-->
 
</div>
                            
							
					    </div>
						<div class="m-portlet__foot m-portlet__foot--fit" id="btn_def">
							<div class="m-form__actions">
                                <br />
								<div class="row">
                                    
									<div class="col-2">
									</div>
									<div class="col-7">


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
						<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget11_tab1_content1">
				<div class="m-widget11">
					<div class="table-responsive">
						<table class="table">
								 <thead class="stu_th">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>College ID</th>
                        <th>Email</th>
                        <th>Branch</th>
                        <th>Semester</th>
                        <th>View Profile</th>
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

                <div class="tab-pane " id="m_user_profile_tab_3">
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
                <tbody id="stu_tbody4"></tbody>

							</table>
						<!--end::Table-->
					</div>
					
				</div>
				<!--end::Widget 11--> 						             
			</div>
			
		</div>
	</div>
						
				</div>

             <div class="tab-pane " id="m_user_profile_tab_4">
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
                                            <tbody id="stu_tbody1"></tbody>

							</table>
					</div>
					
				</div>
			</div>
			</div>
		</div>
	</div>
</div> 
			    
                <div class="tab-pane " id="m_user_profile_tab_5">

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

              <div class="tab-pane " id="m_user_profile_tab_6">
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
                                            <tbody id="stu_tbody2"></tbody>

							</table>
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
</div>
				</div> 

                
			</div>
		</div>
	</div></asp:Content>

