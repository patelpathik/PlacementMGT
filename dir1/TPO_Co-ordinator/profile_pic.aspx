<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO_Co-ordinator/dashboard.master" AutoEventWireup="true" CodeFile="profile_pic.aspx.cs" Inherits="dir1_TPO_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<link href="../../assets/vendors/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
                <!--end::Page Vendors -->


				<link href="../../assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
				<link href="../../assets/demo/demo3/base/style.bundle.css" rel="stylesheet" type="text/css" />

   <script type="text/css">
        .img-circle {
             border-radius: 50%;
            }
    </script>
<script>
  var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('imgview');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
</script>

    

<div class="col-xl-12 col-lg-8">
		<div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
			

			<div class="tab-content">
				<div class="tab-pane active" id="m_user_profile_tab_1">
					<form class="m-form m-form--fit m-form--label-align-right" runat="server">
						<div class="m-portlet__body">
							<div class="form-group m-form__group m--margin-top-10 m--hide">
							=
							</div>

							

							
							<div class="form-group m-form__group row">
								<div class="col-3">
                               <center><img class="img-circle" id="imgview" height="180" width="180"/></center> 

								</div>
							</div>
							<div class="form-group m-form__group row">
								<div class="col-3">
                                        <center><asp:FileUpload ID="FileUpload1" class="btn btn-secondary m-btn m-btn--air m-btn--custom" runat="server"  onchange="loadFile(event)" /></center>

								</div>
							</div>
                            <div class="form-group m-form__group row">
								<div class="col-3">
							    <center><asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-accent m-btn m-btn--air m-btn--custom" OnClick="btnsubmit_Click"/><br /></center>

								</div>
							</div>
							

					</div>
						
					</form>
				</div>
				<div class="tab-pane " id="m_user_profile_tab_2">
					<div class="m-portlet m-portlet--full-height ">
	
	
</div>
				</div>
				<div class="tab-pane " id="m_user_profile_tab_3">
					
				</div>
			</div>
		</div>
	</div>
</asp:Content>

