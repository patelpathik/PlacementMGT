<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="test_subject.aspx.cs" Inherits="dir1_Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form runat="server">

    <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Test Subject</h1>
                </div>
            </div>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Add Test Subject                    
                 </div>
                <div class="panel-body">
                    <div class="row">




                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-12">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4"> <label>Subject </label>
                                    <asp:TextBox ID="txtsub" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtsub" runat="server" ErrorMessage="* Enter subject"></asp:RequiredFieldValidator>

                            </div>
                            </div>



                         <div class="col-sm-12">
                            &nbsp;
                        </div>  
                             <div class="col-sm-12">
                            &nbsp;
                        </div>                     
                           
                            <div class="col-sm-12">
                             <center><asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-info" OnClick="btnsubmit_Click" /></center>   
                            </div>
 
                                </div>
                        </div>
                     </div>
                </div>
                        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Update Subjects 
                 </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="ts_name" HeaderText="ts_name" SortExpression="ts_name" />
                    </Columns>
                </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT [ts_name] FROM [test_subject]"></asp:SqlDataSource>
                  </div>
                       
                      
           
  </form>
</asp:Content>

