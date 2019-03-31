<%@ Page Language="C#" AutoEventWireup="true" CodeFile="api.aspx.cs" Inherits="api" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
	x=1;
	function fun()
		{
			var divv=document.getElementById("div1");
			var element1=document.createElement("input");  
			//create input element
			var idattribute=document.createAttribute("id");
			idattribute.value="img"+x;
			var typrattribute=document.createAttribute("type");
			typrattribute.value="file";
			var valueattribute=document.createAttribute("name");
			valueattribute.value="pic"+x;
			var st=document.createAttribute("style");
			
			element1.setAttributeNode(valueattribute);
			element1.setAttributeNode(typrattribute);
			element1.setAttributeNode(idattribute);
			divv.appendChild(element1);
			//apend child node

			//div1.setAttribute("style","display:block;height:1000px;width:150px;")
			div1.setAttribute("style","margin-right:1000px;")
			//set style to element


			var element2=document.createElement("input"); 
			 //create a button elements
			var i=document.createAttribute("type");      
			i.value="button";
			var q=document.createAttribute("id");
			q.value="bt"+x;
			var v=document.createAttribute("value");
			v.value="@";
			var b=document.createAttribute("onclick")
			b.value="fun2(this)"
			element2.setAttributeNode(b);
			element2.setAttributeNode(q);
			element2.setAttributeNode(i);
			element2.setAttributeNode(v);
			divv.appendChild(element2);


			x=x+1;
		}	

		function fun2(x) {

			var divv=document.getElementById("div1")
			alert(x.id);
			val=x.id;
		var j=	val.substring(2,4);
		alert(j);
		var txt=document.getElementById("txt"+j);
		divv.removeChild(txt);

			divv.removeChild(x);    //remove child node

		
			//divv.removeChild(idattribute);
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
  max-width: 1000px;
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

.active, .dot:hover {
  background-color: #717171;
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
    
</head>

<body>
    <form id="form1" runat="server">
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
      <asp:Image ID="Image1" runat="server" style="width:100%" height="400" />
    <div class="text">Mega Placement</div>
  </div>
  <div class="mySlides fade">
    <div class="numbertext">2 / 3</div>
      <asp:Image ID="Image2" runat="server" style="width:100%" height="400" />
    <div class="text">Hackthon</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 3</div>
      <asp:Image ID="Image3" runat="server" style="width:100%" height="400" />
    <div class="text">Duo Programme</div>
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
</div>


        

<a href="#" onclick="fun()" >add content</a>
<input type="button" value="@" >
<div id="div1" >
	
</div>

        <asp:Panel ID="pnlQuestions" runat="server" Width="100%">
</asp:Panel>

    </form>
</body>
</html>