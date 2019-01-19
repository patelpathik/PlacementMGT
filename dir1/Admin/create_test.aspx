<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="create_test.aspx.cs" Inherits="dir1_Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <form runat="server">
    <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Create Test</h1>
                </div>
            </div>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Create Test Form
                 </div>
                <div class="panel-body">
                    <div class="row">

                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                                <div class="col-sm-6"><label>Name</label>
                                    <asp:TextBox ID="txtname" class="form-control" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtname" runat="server" ErrorMessage="* Enter Test name"></asp:RequiredFieldValidator>

                                </div>
                                   
                                 </div>
                        
                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                                <div class="col-sm-6"><label>Description</label>
                                    <asp:TextBox ID="txtdec" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtdec" runat="server" ErrorMessage="* Enter Test Description"></asp:RequiredFieldValidator>

                                </div>
                                 </div>

                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                                <div class="col-sm-3"><label>Date</label>
                                    <asp:TextBox ID="txtdate" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtdate" runat="server" ErrorMessage="* Enter date of test"></asp:RequiredFieldValidator>

                                </div>
                            <div class="col-sm-3"><label>Time</label>
                                    <asp:TextBox ID="txttime" class="form-control" runat="server" TextMode="Time"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txttime" runat="server" ErrorMessage="* Enter date of time"></asp:RequiredFieldValidator>

                                </div>
                                 </div>

                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                                <div class="col-sm-3"><label>Hour</label>
                                    <asp:TextBox ID="txthour" class="form-control" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txthour" runat="server" ErrorMessage="* Enter test hour"></asp:RequiredFieldValidator>

                                </div>
                                 </div>

                         <div class="col-sm-12">
                            &nbsp;
                        </div>
                         <div class="col-sm-12">
                            &nbsp;
                        </div>                       
                           
                            <div class="col-sm-12">
                             <center><asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-info btn-round" OnClick="btnsubmit_Click" /></center>   
                            </div>
                      


                                                
                                </div>
                            </div>
                       </div>

              <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Test  
                 </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                        <asp:BoundField DataField="hour" HeaderText="hour" SortExpression="hour" />
                        <asp:BoundField DataField="sch_date" HeaderText="sch_date" SortExpression="sch_date" />
                        <asp:BoundField DataField="sch_time" HeaderText="sch_time" SortExpression="sch_time" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT [name], [description], [hour], [sch_date], [sch_time] FROM [test]"></asp:SqlDataSource>
                </div>
                  </div>
         </form>  
</asp:Content>

