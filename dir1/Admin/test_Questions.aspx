<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/Admin/dashboard.master" AutoEventWireup="true" CodeFile="test_Questions.aspx.cs" Inherits="dir1_Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form runat="server">

    <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Test Questions</h1>
                </div>
            </div>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Add Test Questions and Answers                   
                 </div>
                <div class="panel-body">
                    <div class="row">



                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8"> <label>Select Subject </label><br />
                            <asp:DropDownList ID="ddl" runat="server" DataSourceID="SqlDataSource1" DataTextField="ts_name" DataValueField="ts_id" Height="30px" Width="200px"></asp:DropDownList>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT * FROM [test_subject]"></asp:SqlDataSource>
                       
                            </div>
                            </div>
                            </div>
                        
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8"> <label>Question </label>
                                    <asp:TextBox ID="txtque" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtque" runat="server" ErrorMessage="* Enter Question"></asp:RequiredFieldValidator>

                            </div>
                            </div>
                            </div>

              

                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-4">
                                <label>Add Options</label>
                            </div>
                              <div class="col-sm-2">
                                  <label>Select Correct Answer</label>
                            </div>

                         <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-4">
                            </div>
                             </div>
                             

                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-4">
                                    <asp:TextBox ID="txta" class="form-control" runat="server" placeholder="Answer [A]"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txta" runat="server" ErrorMessage="* Enter Option A"></asp:RequiredFieldValidator>
                            </div>
                              <div class="col-sm-2">
                                <center><asp:RadioButton ID="op1" runat="server" GroupName="ans"  /></center></div>
                            </div>

                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-4">
                                    <asp:TextBox ID="txtb" class="form-control" runat="server" placeholder="Answer [B]"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtb" runat="server" ErrorMessage="* Enter Option B"></asp:RequiredFieldValidator>
                            </div>
                              <div class="col-sm-2">
                                <center><asp:RadioButton ID="op2" runat="server" GroupName="ans" /></center></div>
                            </div>

                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-4">
                                    <asp:TextBox ID="txtc" class="form-control" runat="server" placeholder="Answer [C]"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtc" runat="server" ErrorMessage="* Enter Option C"></asp:RequiredFieldValidator>
                            </div>
                              <div class="col-sm-2">
                                <center><asp:RadioButton ID="op3" runat="server" GroupName="ans" /></center></div>
                            </div>

                        <div class="col-sm-12">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-4">
                                    <asp:TextBox ID="txtd" class="form-control" runat="server" placeholder="Answer [D]"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="txtd" runat="server" ErrorMessage="* Enter Option D"></asp:RequiredFieldValidator>
                            </div>
                              <div class="col-sm-2">
                                <center><asp:RadioButton ID="op4" runat="server" GroupName="ans" /></center></div>
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
               
                      
           
         </div>
                                 
                      
           
  </form>
                                    
</asp:Content>

