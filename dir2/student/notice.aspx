<%@ Page Title="" Language="C#" MasterPageFile="~/dir2/student/student.master" AutoEventWireup="true" CodeFile="notice.aspx.cs" Inherits="dir2_student_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             //alert("hi");
             load_data();
             document.getElementById("pref_v").value = "today";
         });
        function load_data() {
            $("#stu_tbody").fadeOut(1);
            var dis = document.getElementById("pref_v").value;
            //alert(dis);
            var temp = "load_data.aspx?qs=notice&dis="+dis;
            alert(temp);
            document.getElementById("stu_tbody").innerHTML = "";
            //alert(temp);
            $.ajax({
                method: "GET",
                url: temp,
                success: function(data) {
                    $("#stu_tbody").html(data);
                    $("#stu_tbody2").html(data);
                    $("#stu_tbody3").html(data);
                }
            });
            $("#stu_tbody").fadeIn(1000);
        }
        function set_pref(x) {
            //alert(x);
            document.getElementById("pref_v").value = x;
            load_data();
        }
     </script>

   <div class="m-portlet m-portlet--full-height ">
       <input type="hidden" id="pref_v" value="today" />
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					Notice
				</h3>
			</div>
		</div>
		<div class="m-portlet__head-tools">
			<ul class="nav nav-pills nav-pills--brand m-nav-pills--align-right m-nav-pills--btn-pill m-nav-pills--btn-sm" role="tablist">
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_widget4_tab1_content" role="tab" onclick="set_pref('today');">
					Today
					</a>
				</li>
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_widget4_tab2_content" role="tab" onclick="set_pref('week');">
					Week
					</a>
				</li>
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_widget4_tab3_content" role="tab" onclick="set_pref('month');">
					Month
					</a>  
				</li>
			</ul>
		</div>
	</div>
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget4_tab1_content">
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
                                                            <td class="m-widget11__sales">Title</td>
                                                            <td class="m-widget11__app">Description</td>
                                                            <td class="m-widget11__app">Download File</td>	
                                                            <td class="m-widget11__change">Date</td>
                                                            <td class="m-widget11__change">Time</td>					
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
			<div class="tab-pane" id="m_widget4_tab2_content">
                <div class="m-portlet m-portlet--full-height ">
                            <div class="m-portlet__body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="m_widget11_tab2_content">
                                        <div class="m-widget11">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <td class="m-widget11__label">#</td>
                                                            <td class="m-widget11__sales">Title</td>
                                                            <td class="m-widget11__app">Description</td>
                                                            <td class="m-widget11__app">Download File</td>	
                                                            <td class="m-widget11__change">Date</td>
                                                            <td class="m-widget11__change">Time</td>					
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
			<div class="tab-pane" id="m_widget4_tab3_content">
                <div class="m-portlet m-portlet--full-height ">
                            <div class="m-portlet__body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="m_widget11_tab3_content">
                                        <div class="m-widget11">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <td class="m-widget11__label">#</td>
                                                            <td class="m-widget11__sales">Title</td>
                                                            <td class="m-widget11__app">Description</td>
                                                            <td class="m-widget11__app">Download File</td>	
                                                            <td class="m-widget11__change">Date</td>
                                                            <td class="m-widget11__change">Time</td>					
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

