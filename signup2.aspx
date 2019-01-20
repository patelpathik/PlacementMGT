<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup2.aspx.cs" Inherits="signup2" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Signup</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Login-Signup/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login-Signup/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login-Signup/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login-Signup/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login-Signup/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login-Signup/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login-Signup/css/util.css">
	<link rel="stylesheet" type="text/css" href="Login-Signup/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt">
					<img src="Login-Signup/images/BVM Logo-1.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" runat="server">
					<span class="login100-form-title">
						Student Signup
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Name is Required">
						 <asp:TextBox ID="txtname" class="input100" placeholder="Name" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>

					</div>

                    <div class="wrap-input100 validate-input" data-validate = "ID Number is Required">
						 <asp:TextBox ID="txtid" class="input100" placeholder="ID Number" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						
					</div>

                    <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						 <asp:TextBox ID="txtemail" class="input100" placeholder="Email ID" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

                    <div class="wrap-input100 validate-input" data-validate = "Mobile Number is Required">
						 <asp:TextBox ID="txtmob" class="input100" placeholder="Mobile Number" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						
					</div>

                    <div class="wrap-input100">

                    <asp:DropDownList ID="ddlsem" class="input100" runat="server" DataSourceID="SqlDataSource1" DataTextField="br_sname" DataValueField="br_id">
                           
                             </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:placement_managementConnectionString %>" SelectCommand="SELECT * FROM [branch]"></asp:SqlDataSource>
                    <span class="focus-input100"></span>
						
					</div>

                    <div class="wrap-input100">

                    <asp:DropDownList ID="ddlbranch" class="input100" runat="server">
                         <asp:ListItem >-- Semester --</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                             </asp:DropDownList>
                    <span class="focus-input100"></span>
						
					</div>

					
					
					<div class="container-login100-form-btn">
                    <asp:Button ID="Button" class="login100-form-btn" runat="server" Text="Signup" OnClick="Button1_Click"/>

					<!--	<button class="login100-form-btn">
							Login
						</button> -->
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Go to
						</span>
                       <asp:LinkButton ID="LinkButton1" class="txt2" runat="server" href="forgot_pass.aspx"><b>Home</b></asp:LinkButton>

					</div>

					
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="Login-Signup/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Login-Signup/vendor/bootstrap/js/popper.js"></script>
	<script src="Login-Signup/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Login-Signup/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Login-Signup/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="Login-Signup/js/main.js"></script>

</body>
</html>














