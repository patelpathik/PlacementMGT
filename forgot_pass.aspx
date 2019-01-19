<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgot_pass.aspx.cs" Inherits="forgot_pass" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Forgot Password</title>
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
				<div class="login100-pic js-tilt" data-tilt>
					<img src="Login-Signup/images/BVM Logo-1.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" runat="server">
					<span class="login100-form-title">
						Forgot Password
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						 <asp:TextBox ID="txtemail" class="input100" placeholder="Username" runat="server"></asp:TextBox>
                        <!--<input class="input100" type="text" name="email" placeholder="Email">-->
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

                    <div class="wrap-input100">
						 <asp:TextBox ID="txtidno" class="input100" placeholder="ID Number" runat="server"></asp:TextBox>
                        <!--<input class="input100" type="text" name="email" placeholder="Email">-->
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
                    <div class="text-center p-t-12">
						<span class="txt1">
                            Students must enter their ID Number. <br />Other user enter only email-id
						</span>


					
					<div class="container-login100-form-btn">
                    <asp:Button ID="Button1" class="login100-form-btn" runat="server" Text="Send Mail" OnClick="Button1_Click"/>

					<!--	<button class="login100-form-btn">
							Login
						</button> -->
					</div>

					

					<div class="text-center p-t-136">
						<a class="txt2" href="Login.aspx">
							Go to Login
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
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












