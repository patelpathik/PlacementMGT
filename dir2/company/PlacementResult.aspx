﻿<%@ Page Title="" Language="C#" MasterPageFile="~/dir2/company/company.master" AutoEventWireup="true" CodeFile="PlacementResult.aspx.cs" Inherits="dir2_company_PlacementResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
	<script type="text/javascript">
		window.onload = function () {
			console.log("hi");
		};
		$(document).ready(function () {
			//alert("hi");
			load_data();
			load_data();
			$("#m_user_profile_tab_2").hide();
			$("#m_user_profile_tab_3").hide();
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

			$("#l_three").click(function () {
				$("#m_user_profile_tab_1").hide();
				$("#m_user_profile_tab_2").hide();
				$("#m_user_profile_tab_3").show();
			});
		});
		//setInterval(load_data, 3000);
		function load_data() {

			var url = "";
			var userid = $("#userid").val();
			url = "load_data.aspx?tb=job&userid=" + userid;
			console.log(url);
			$.ajax({
				method: "GET",
				url: url,
				success: function (data) {
					$("#pending").html(data);
				}
			});
		}
		function accept(job_id) {
			var userid = $("#userid").val();
			//console.log(userid);
			console.log(job_id);

			var url = "load_data.aspx?tb=updjob&job_id=" + job_id + "&status=1";
			//alert(url);
			console.log(url);
			$.ajax({
				type: "GET",
				url: url,
				success: function (data) {
					load_data();
				}
			})
		}
		function reject(job_id) {
			var userid = $("#userid").val();
			//console.log(userid);
			console.log(job_id);

			var url = "load_data.aspx?tb=updjob&job_id=" + job_id + "&status=0";
			//alert(url);
			console.log(url);
			$.ajax({
				type: "GET",
				url: url,
				success: function (data) {
					load_data();
				}
			})
		}
	</script>



	

	<!-- BEGIN: Subheader -->
	<!-- END: Subheader -->
	<div class="m-content">
		<div class="row">
			<div id="pat1"></div>
			<div class="col-xl-12 col-lg-8">
				<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
					<div class="m-portlet__head">
						<div class="m-portlet__head-tools">
							<ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
								<li class="nav-item m-tabs__item" id="l_one">
									<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
										<i class="flaticon-share m--hide"></i>
										Placement Result
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
															<td class="m-widget11__change">Contact</td>
															<td class="m-widget11__app">Email</td>
															<td class="m-widget11__sales">ID</td>
															<td class="m-widget11__change">Change Status</td>
														</tr>
													</thead>
													<tbody id="pending"></tbody>
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
	</div>
</asp:Content>