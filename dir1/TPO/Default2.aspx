<%@ Page Title="" Language="C#" MasterPageFile="~/dir1/TPO/dashboard.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="dir1_TPO_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/css">
        .img-circle {
             border-radius: 50%;
            }
    </script>
    <form runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server"  onchange="loadFile(event)" />
  <!--  <input type="file" accept="image/*" onchange="loadFile(event)"> -->
<img class="img-circle" id="imgview" height="300" width="300"/>
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
        </form>
</asp:Content>

