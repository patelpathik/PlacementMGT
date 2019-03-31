<%@ Page Title="" Language="C#" MasterPageFile="~/dir2/student/student.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="dir2_student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
            var temp = "load_data.aspx?qs=job";
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
       

    </script>





   <!-- BEGIN: Subheader -->

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
								Apply for Job
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
					<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget11_tab1_content">
				<div class="m-widget11">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
                                    <td class="m-widget11__label">#</td>
									<td class="m-widget11__change">Name</td>
                                    <td class="m-widget11__app">Description</td>
									<td class="m-widget11__sales">Package</td>
                                    <td class="m-widget11__change">Location</td>
                                    <td class="m-widget11__change">Time</td>
                                    <td class="m-widget11__change">Date</td>
                                    <td class="m-widget11__change">Apply here</td>							
									
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
		</div>
	</div>
</div>		        </div>
</asp:Content>

