<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="slider.aspx.cs" Inherits="dir1_Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/css">
        .img-circle {
             border-radius: 15%;
            }
    </script>

    <div class="m-subheader ">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <h3 class="m-subheader__title ">Slider</h3>			
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
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">Add Slider Images</a>
                            </li>s
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

                                </div>
                                 <div class="form-group m-form__group row" runat="server">
                                    <div class="col-3">
                                        <asp:Image ID="Image1" runat="server" Height="130" Width="270" />
                                    </div>
                                     <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:Image ID="Image2" runat="server" Height="130" Width="270" />
                                    </div>
                                     <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:Image ID="Image3" runat="server" Height="130" Width="270" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <div class="col-3">
                                        <asp:TextBox ID="txt1" class="form-control m-input" runat="server" placeholder="Title"></asp:TextBox>
                                    </div>
                                     <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:TextBox ID="txt2" class="form-control m-input" runat="server" placeholder="Title"></asp:TextBox>
                                    </div>
                                    <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:TextBox ID="txt3" class="form-control m-input" runat="server" placeholder="Title"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <div class="col-3">
                                        <asp:FileUpload ID="fl1" class="form-control m-input" runat="server" />
                                    </div>
                                     <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:FileUpload ID="fl2" class="form-control m-input" runat="server" />
                                    </div>
                                    <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:FileUpload ID="fl3" class="form-control m-input" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <div class="col-3"><center>
                                       <asp:Button ID="btnupd1" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Add" OnClick="btnupd1_Click"/> </center>
                                     </div>
                                     <div class="col-1"></div>
                                     <div class="col-3"><center>
                                         <asp:Button ID="btnupd2" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Add" OnClick="btnupd2_Click"/> </center>
                                    </div>
                                    <div class="col-1"></div>
                                     <div class="col-3"><center>
                                        <asp:Button ID="btnupd3" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Add" OnClick="btnupd3_Click"/> </center>
                                     </div>
                                </div>



                                 <div class="form-group m-form__group row" runat="server">
                                    <div class="col-3">
                                        <asp:Image ID="Image4" runat="server" Height="130" Width="270" />
                                    </div>
                                     <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:Image ID="Image5" runat="server" Height="130" Width="270" />
                                    </div>
                                     <div class="col-1"></div>
                                    
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <div class="col-3">
                                        <asp:TextBox ID="txt4" class="form-control m-input" runat="server" placeholder="Title"></asp:TextBox>
                                    </div>
                                     <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:TextBox ID="txt5" class="form-control m-input" runat="server" placeholder="Title"></asp:TextBox>
                                    </div>
                                    
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <div class="col-3">
                                        <asp:FileUpload ID="fl4" class="form-control m-input" runat="server" />
                                    </div>
                                     <div class="col-1"></div>
                                     <div class="col-3">
                                        <asp:FileUpload ID="fl5" class="form-control m-input" runat="server" />
                                    </div>
                                    
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <div class="col-3"><center>
                                       <asp:Button ID="btnupd4" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Add" OnClick="btnupd4_Click"/> </center>
                                     </div>
                                     <div class="col-1"></div>
                                     <div class="col-3"><center>
                                         <asp:Button ID="btnupd5" class="btn btn-accent m-btn m-btn--air m-btn--custom" runat="server" Text="Add" OnClick="btnupd5_Click"/> </center>
                                    </div>
                                </div>
                            </div>
                            <div class="m-portlet__foot m-portlet__foot--fit">
                                
                            </div>
                            <br /><br />
                            <div class="m-portlet__foot m-portlet__foot--fit">
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane " id="m_user_profile_tab_2">           
                        
                    </div>
                    <div class="tab-pane " id="m_user_profile_tab_3">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

