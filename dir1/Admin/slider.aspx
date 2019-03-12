<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="slider.aspx.cs" Inherits="dir1_Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">Add Slider Images</a>
                            </li>
                            <li class="nav-item m-tabs__item" id="l_upd" style="display:none;">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3" role="tab">Delete Slider Image</a>
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
                                    <label for="example-text-input" class="col-2 col-form-label">Event Name</label>
                                    <div class="col-7">
                                        <asp:TextBox ID="txtname" class="form-control m-input" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtname" runat="server" ErrorMessage="* Enter event name"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group m-form__group row" runat="server">
                                    <label for="example-text-input" class="col-2 col-form-label">Choose Image File</label>
                                    <div class="col-7">
                                        <asp:FileUpload ID="FileUpload"  class="form-control m-input" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="FileUpload" runat="server" ErrorMessage="* Select File"></asp:RequiredFieldValidator>
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
                        
                    </div>
                    <div class="tab-pane " id="m_user_profile_tab_3">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

