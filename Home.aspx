<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
     <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        
     <script type="text/javascript">
         $(document).ready(function () {
             //alert("hi");
             load_data();
             load_slider();
             document.getElementById("pref_v").value = "today";
         });
        function load_data() {
            $("#stu_tbody").fadeOut(1);
            var dis = document.getElementById("pref_v").value;
            //alert(dis);
            var temp = "dir2/student/load_data.aspx?qs=notice&dis="+dis;
            //alert(temp);
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
        function load_slider() {
            var slider_url = "dir2/student/load_data.aspx?qs=slider";
            $.ajax({
                method: "GET",
                url:slider_url,
                success: function (data) {
                    $("#slider_body").html(data);



                    var slideIndex = 1;
                    showSlides(slideIndex);

                    function plusSlides(n) {
                        showSlides(slideIndex += n);
                    }

                    function currentSlide(n) {
                        showSlides(slideIndex = n);
                    }

                    function showSlides(n) {
                        var i;
                        var slides = document.getElementsByClassName("mySlides");
                        var dots = document.getElementsByClassName("dot");
                        if (n > slides.length) { slideIndex = 1 }
                        if (n < 1) { slideIndex = slides.length }
                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                        }
                        for (i = 0; i < dots.length; i++) {
                            dots[i].className = dots[i].className.replace(" active", "");
                        }
                        slides[slideIndex - 1].style.display = "block";
                        dots[slideIndex - 1].className += " active";
                    }



                }
            });
        }
        function set_pref(x) {
            //alert(x);
            document.getElementById("pref_v").value = x;
            load_data();
        }
     </script>
    <script type="text/javascript">
        var slideIndex = 1;
        showSlides(slideIndex);

        // Next/previous controls
        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        // Thumbnail image controls
        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) {slideIndex = 1} 
            if (n < 1) {slideIndex = slides.length}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none"; 
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block"; 
            dots[slideIndex-1].className += " active";
        }
    </script>
    <style type="text/css">
         * {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}


/* Slideshow container */
.slideshow-container {
  max-width: 1200px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}
    </style>
    
    



<!-- END: Subheader -->	
    
    
    
     	    
        <div class="m-content">
		


            <div class="m-portlet m-portlet--full-height ">
       <input type="hidden" id="pref_v" value="today" />
	
	<div class="m-portlet__body">
		<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 5</div>
      <asp:Image ID="Image1" runat="server" style="width:100%" height="400" />
    <div class="text"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>
  </div>
  <div class="mySlides fade">
    <div class="numbertext">2 / 5</div>
      <asp:Image ID="Image2" runat="server" style="width:100%" height="400" />
    <div class="text"><asp:Label ID="Label2" runat="server" Text=""></asp:Label></div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 5</div>
      <asp:Image ID="Image3" runat="server" style="width:100%" height="400" />
    <div class="text"><asp:Label ID="Label3" runat="server" Text=""></asp:Label></div>
  </div>
  <div class="mySlides fade">
    <div class="numbertext">4 / 5</div>
      <asp:Image ID="Image4" runat="server" style="width:100%" height="400" />
    <div class="text"><asp:Label ID="Label4" runat="server" Text=""></asp:Label></div>
  </div>
  <div class="mySlides fade">
    <div class="numbertext">5 / 5</div>
      <asp:Image ID="Image5" runat="server" style="width:100%" height="400" />
    <div class="text"><asp:Label ID="Label5" runat="server" Text=""></asp:Label></div>
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 

</div>
	</div>
</div>

       
<!--Begin::Section-->

<!--End::Section-->

<!--Begin::Section-->
<div class="row">
  <div class="col-xl-6 col-lg-12">
    <!--Begin::Portlet-->
<div class="m-portlet m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					Mission
				</h3>
			</div>
		</div>
		
	</div>
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget2_tab1_content">
				<!--Begin::Timeline 3 -->
				<div class="m-timeline-3">
					<div class="m-timeline-3__items">
						<div class="m-timeline-3__item m-timeline-3__item--info">
							<span class="m-timeline-3__item-time"></span> 
							<div class="m-timeline-3__item-desc">							 
								<span class="m-timeline-3__item-text">
								Re-engineer curricula to meet global employment requirements.
                                Promote innovative practices at all levels. 
                                Imbibe core values. 
                                Reform policies, systems and processes at all levels.
                                Develop faculty and staff members to meet the challenges 
								</span><br>
								<span class="m-timeline-3__item-user-name">
								<a href="#" class="m-link m-link--metal m-timeline-3__item-link">
								By BVM Engineering College
								</a>
								</span>		 
							</div>
						</div>
					</div>
				</div>
				<!--End::Timeline 3 -->
			</div>
			
		</div>
	</div>
</div>
<!--End::Portlet-->  </div>
  <div class="col-xl-6 col-lg-12">
    <!--Begin::Portlet-->	    
<div class="m-portlet m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					Vision
				</h3>
			</div>
		</div>
		
	</div>
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget2_tab1_content">
				<!--Begin::Timeline 3 -->
				<div class="m-timeline-3">
					<div class="m-timeline-3__items">
						<div class="m-timeline-3__item m-timeline-3__item--info">
							<span class="m-timeline-3__item-time"></span> 
							<div class="m-timeline-3__item-desc">							 
								<span class="m-timeline-3__item-text">
								"Produce globally employable innovative engineers with core values" 
								</span><br>
								<span class="m-timeline-3__item-user-name">
								<a href="#" class="m-link m-link--metal m-timeline-3__item-link">
								By BVM Engineering College
								</a>
								</span>		 
							</div>
						</div>
					</div>
				</div>
				<!--End::Timeline 3 -->
			</div>

			
		</div>
	</div>
</div>
<!--End::Portlet-->    </div>
</div>
<!--End::Section-->


    <!--notice-->
<div class="m-portlet m-portlet--full-height ">
       <input type="hidden" id="pref_v" value="today" />
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					News And Notice
				</h3>
			</div>
		</div>
		<div class="m-portlet__head-tools">
			<ul class="nav nav-pills nav-pills--brand m-nav-pills--align-right m-nav-pills--btn-pill m-nav-pills--btn-sm" role="tablist">
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_tab1_content" role="tab" onclick="set_pref('today');">
					Today
					</a>
				</li>
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_tab2_content" role="tab" onclick="set_pref('week');">
					Week
					</a>
				</li>
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link" data-toggle="tab" href="#m_tab3_content" role="tab" onclick="set_pref('month');">
					Month
					</a>  
				</li>
			</ul>
		</div>
	</div>
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_tab1_content">
                            <div class="m-portlet__body">
                                    <div class="tab-pane active" id="m_widget11_tab1_content">
                                        <div class="m-widget11">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <td class="m-widget11__label"></td>
                                                            <td class="m-widget11__sales">Title</td>
                                                            <td class="m-widget11__app">Description</td>
                                                            <td class="m-widget11__app">Download File</td>	
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
			<div class="tab-pane" id="m_tab2_content">
                <div class="m-portlet m-portlet--full-height ">
                            <div class="m-portlet__body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="m_widget11_tab2_content">
                                        <div class="m-widget11">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <td class="m-widget11__label"></td>
                                                            <td class="m-widget11__sales">Title</td>
                                                            <td class="m-widget11__app">Description</td>
                                                            <td class="m-widget11__app">Download File</td>	
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
			<div class="tab-pane" id="m_tab3_content">
                <div class="m-portlet m-portlet--full-height ">
                            <div class="m-portlet__body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="m_widget11_tab3_content">
                                        <div class="m-widget11">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <td class="m-widget11__label"></td>
                                                            <td class="m-widget11__sales">Title</td>
                                                            <td class="m-widget11__app">Description</td>
                                                            <td class="m-widget11__app">Download File</td>	
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

    <!--end notice-->



    <div class="row">
  <div class="col-xl-8">
    <div class="m-portlet m-portlet--mobile ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					Placement
				</h3>
			</div>
		</div>
		<div class="m-portlet__head-tools">
			<ul class="m-portlet__nav">
				<li class="m-portlet__nav-item">
					<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
	<a href="#" class="m-portlet__nav-link btn btn-lg btn-secondary  m-btn m-btn--icon m-btn--icon-only m-btn--pill  m-dropdown__toggle">
		<i class="la la-ellipsis-h m--font-brand"></i>
	</a>
	
</div>				</li>
			</ul>
		</div>
	</div>
	<div class="m-portlet__body">
		<!--begin: Datatable -->
		<div>
            <div class="m-timeline-3">
					<div class="m-timeline-3__items">
						<div class="m-timeline-3__item m-timeline-3__item--info">
							<span class="m-timeline-3__item-time"></span> 
							<div class="m-timeline-3__item-desc">							 
								<span class="m-timeline-3__item-text">
                                    <br>
								BVM, a premier engineering college, is considered to be top 1% among all engineering colleges in Gujarat. Since inception, BVM has a record of best Placement all over Gujarat. Around 35+companies, including MNCs like Infosys, Essar, TCS, L&T, ABB, Torrent Power, Seimens, etc.. visit BVM every year for placement.
								</span><br>
								<span class="m-timeline-3__item-user-name">
								<a href="#" class="m-link m-link--metal m-timeline-3__item-link">
								By BVM Engineering College
								</a>
								</span>
                                <br /><br /><br /><br /><br />		 
							</div>
						</div>
					</div>
				</div>
		</div>
		<!--end: Datatable -->
	</div>
</div>  </div>
  <div class="col-xl-4">
    <!--begin:: Widgets/Audit Log-->
<div class="m-portlet m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					Placement Management
				</h3>
			</div>
		</div>
		
	</div>
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="m_widget4_tab1_content">
				<div class="m-scrollable" data-scrollable="true">
					<div class="m-list-timeline m-list-timeline--skin-light">
						<div class="m-list-timeline__items">
							<div class="m-list-timeline__item">
								<span class="m-list-timeline__badge m-list-timeline__badge--success"></span>
								<span class="m-list-timeline__text">Mr. Mehul Patel</span>
                                <span class="m-list-timeline__text"><span class="m-badge m-badge--success m-badge--wide">I/C Training and Placement</span></span>

							</div>
							<div class="m-list-timeline__item">
								<span class="m-list-timeline__badge m-list-timeline__badge--danger"></span>
								<span class="m-list-timeline__text">Dr. Mehul Shah</span>
                                <span class="m-list-timeline__text"><span class="m-badge m-badge--info m-badge--wide">Asst. Training And Placement</span></span>

							</div>
							<div class="m-list-timeline__item">
								<span class="m-list-timeline__badge m-list-timeline__badge--warning"></span>
								<span class="m-list-timeline__text">Contact Number</span>
								<span class="m-list-timeline__text">+91 9978997088</span>
							</div>
							<div class="m-list-timeline__item">
								<span class="m-list-timeline__badge m-list-timeline__badge--warning"></span>
								<span class="m-list-timeline__text">&nbsp;</span>
								<span class="m-list-timeline__text">+91 9909529395</span>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end:: Widgets/Audit Log-->  </div>
</div>

        <form runat="server">

<div class="m-portlet " id="m_portlet">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<span class="m-portlet__head-icon">
				</span>
				<h3 class="m-portlet__head-text">
					Placement Details
				</h3>
			</div>			
		</div>
		<div class="m-portlet__head-tools">
			<ul class="m-portlet__nav">
				<li class="m-portlet__nav-item">
				</li>
			</ul>
		</div>
	</div>
	<div class="m-portlet__body">
		<div>
<div class="m-portlet__body">
		<table class="table">
							<!--begin::Thead-->
							<thead>
								
							</thead>
							<!--end::Thead-->
							<!--begin::Tbody-->
							<tbody>
								<tr>
									<td>
										
									</td>
									<td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">2008-2009</asp:LinkButton>
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">2009-2010</asp:LinkButton>
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">2010-2011</asp:LinkButton>
                                    	</span>
									</td>
                                   <td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">2011-2012</asp:LinkButton>
                                    	</span>
									</td>
								</tr>
                                <tr>
									<td>
										
									</td>
									<td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">2012-2013</asp:LinkButton>
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click">2013-2014</asp:LinkButton>
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click">2014-2015</asp:LinkButton>
                                    	</span>
									</td>
                                   <td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click">2015-2016</asp:LinkButton>
                                    	</span>
									</td>
								</tr>
                                <tr>
									<td>
										
									</td>
									<td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton9" runat="server" OnClick="LinkButton9_Click">2016-2017</asp:LinkButton>
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                        <asp:LinkButton ID="LinkButton10" runat="server" OnClick="LinkButton10_Click">2017-2018</asp:LinkButton>
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                    	</span>
									</td>
                                   <td>
										<span class="m-widget11__title">
                                    	</span>
									</td>
								</tr>
                                <tr>
									<td>
										
									</td>
									<td>
										<span class="m-widget11__title"></span>
									</td>
									<td>
										<span class="m-widget11__title"></span>
									</td>
									<td>
										<span class="m-widget11__title"></span>
									</td>
                                    <td>
										<span class="m-widget11__title"></span>
									</td>
								</tr>
								
							</tbody>
							<!--end::Tbody-->										     
						</table>
	</div>
		</div>
	</div>
</div>



<div class="row">

            <div class="col-xl-4">
    <!--begin:: Widgets/Product Sales-->
<div class="m-portlet m-portlet--bordered-semi m-portlet--space m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					Vacation Training Letter
				</h3>
			</div>
		</div>
		<div class="m-portlet__head-tools">
			
		</div>
	</div>
	<div class="m-portlet__body">
		<div class="m-widget25">
			<span class="m-widget25__desc">For Autonomous Students, Please Click belowlink to download the vocational traininglatter and get signed by training and placement cell.</span>
			<div class="m-widget25--progress">
				<div class="m-widget25__progress">

					<span class="m-widget25__progress-number">
						<asp:LinkButton ID="LinkButton11"  class="btn m-btn--pill btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder" runat="server" OnClick="LinkButton11_Click">Download</asp:LinkButton>
				    </span>				         
				</div>
			</div>				
		</div>			 
	</div>
</div>
<!--end:: Widgets/Product Sales-->

				 					 
				     		      
				   </div>
            <div class="col-xl-4">
    <!--begin:: Widgets/Product Sales-->
<div class="m-portlet m-portlet--bordered-semi m-portlet--space m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					 Placement Eligibility Circular
				</h3>
			</div>
		</div>
		<div class="m-portlet__head-tools">
			
		</div>
	</div>
	<div class="m-portlet__body">
		<div class="m-widget25">
			<span class="m-widget25__desc">To Download, Campus Placement Eligibility Circular, please click below link.</span><br /><br /><br />
			<div class="m-widget25--progress">
				<div class="m-widget25__progress">
					<span class="m-widget25__progress-number">
						<asp:LinkButton ID="LinkButton12" class="btn m-btn--pill btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder" runat="server" OnClick="LinkButton12_Click">Download</asp:LinkButton>
				    </span>				         
				</div>
			</div>				
		</div>			 
	</div>
</div>
<!--end:: Widgets/Product Sales-->

				 					 
				     		      
				   </div>
            <div class="col-xl-4">
    <!--begin:: Widgets/Product Sales-->
<div class="m-portlet m-portlet--bordered-semi m-portlet--space m-portlet--full-height ">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<h3 class="m-portlet__head-text">
					Undertaking for Placement
				</h3>
			</div>
		</div>
		<div class="m-portlet__head-tools">
			
		</div>
	</div>
	<div class="m-portlet__body">
		<div class="m-widget25">
			<span class="m-widget25__desc">To Download, Form for Undertaking for Placement,please click below link.</span><br /><br /><br />
			<div class="m-widget25--progress">
				<div class="m-widget25__progress">
					<span class="m-widget25__progress-number">
						<asp:LinkButton ID="LinkButton13" class="btn m-btn--pill btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder" runat="server" OnClick="LinkButton13_Click">Download</asp:LinkButton>
				    </span>				         					
				</div>
			</div>				
		</div>			 
	</div>
</div>
<!--end:: Widgets/Product Sales-->




				 					 
				     		      
				   </div>
    </div>

            <div class="m-portlet " id="m_portlet">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<span class="m-portlet__head-icon">
				</span>
				<h3 class="m-portlet__head-text">
					Birla Vishvakarma Mahavidyalaya
				</h3>
			</div>			
		</div>
		<div class="m-portlet__head-tools">
			<ul class="m-portlet__nav">
				<li class="m-portlet__nav-item">
				</li>
			</ul>
		</div>
	</div>
	<div class="m-portlet__body">
		<div>
<div class="m-portlet__body">
		<table class="table">
							<tbody>
								<tr>
									<td>
										
									</td>
									<td>
										<span class="m-widget11__title">
                                        388120,Vallabh Vidyanagar,Anand,Gujarat.
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                        PH: +91-2692-230103/4
                                    	</span>
									</td>
                                   <td>
										<span class="m-widget11__title">
                                    	</span>
									</td>
								</tr>
                                <tr>
									<td>
										
									</td>
									<td>
										<span class="m-widget11__title">
                                            e-mail: placement@bvmengineering.ac.in 
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                    	</span>
									</td>
									<td>
										<span class="m-widget11__title">
                                            Fax: +91-2692-236672	
                                    	</span>
									</td>
                                   <td>
										<span class="m-widget11__title">
                                    	</span>
									</td>
								</tr>
                              
								
							</tbody>
							<!--end::Tbody-->										     
						</table>
	</div>
		</div>
	</div>
</div>
            </form>



   </div>
			    		   
				<!-- end:: Body -->

				
<!-- begin::Footer -->
<footer class="m-grid__item		m-footer ">
	<div class="m-container m-container--fluid m-container--full-height m-page__container">
		<div class="m-stack m-stack--flex-tablet-and-mobile m-stack--ver m-stack--desktop">
			<div class="m-stack__item m-stack__item--left m-stack__item--middle m-stack__item--last">
				<span class="m-footer__copyright">
				</span>
			</div>
			<div class="m-stack__item m-stack__item--right m-stack__item--middle m-stack__item--first">
				
			</div>	
		</div>
	</div>
</footer>
</asp:Content>

