<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Airline_Reservation_System.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Components/Plugins/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Components/Plugins/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
    <link href="Components/css/Genral.css" rel="stylesheet" />
   <style>
       .imageslider {
           /*margin-top: 35px;*/
           background: #abababc7;
       }
    </style>
</head>
<body >
    <form id="form1" runat="server">
      <%--  <header>
            Airline Reservation System
        </header>--%>

        <div class="navbar">
            <div class="nav-tabs activetab">
            <a>Home</a>
            </div>
            <div class="nav-tabs">
                <a href="FlightList.aspx">Flight List</a>
                </div>
            <div class="nav-tabs">
<a href="TicketBooking.aspx">Book Your Flight</a>
                </div>
            <div class="nav-tabs admintabs" id="admintabs" runat="server">
            <a href="AddFlight.aspx">Customize Flight</a>
                </div>
            <div class="nav-tabs">
            <a href="BookingList.aspx">Booking Status</a>
                </div>
            <%--<div class="nav-tabs">
            <a>About</a>
                </div>--%>
            <div class="nav-tabs">
            <a onclick="Logout()">Logout</a>
                </div>
        </div>
    
        <div class="imageslider">
            <div class="slideshow-container">

<div class="mySlides">
  <%--<div class="numbertext">1 / 3</div>--%>
  <img src="Components/Images/Sale_extended_Landingpage.jpeg" style="width:100%" />
  <%--<div class="text">Caption Text</div>--%>
</div>

<div class="mySlides">
  <%--<div class="numbertext">2 / 3</div>--%>
  <img src="Components/Images/Banner_1_1_banglore-london.jpg" style="width:100%" />
  <%--div class="text">Caption Two</div>--%>
</div>

<div class="mySlides">
  <%--<div class="numbertext">3 / 3</div>--%>
  <img src="Components/Images/Banner_1_1_night-flight-edited.jpg" style="width:100%" />
  <%--<div class="text">Caption Three</div>--%>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br />

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

        </div>

        <div class="content-box">
    <div class="content-header">Airline Reservation System</div>
        <div class="content-content">Airline reservation systems incorporate airline schedules, fare tariffs, passenger reservations and ticket records. An airline's direct distribution works within their own reservation system, as well as pushing out information to the GDS. The second type of direct distribution channel are consumers who use the internet or mobile applications to make their own reservations. Travel agencies and other indirect distribution channels access the same GDS as those accessed by the airline reservation systems, and all messaging is transmitted by a standardized messaging system that functions on two types of messaging that transmit on SITA's high level network (HLN). These messaging types are called Type A [usually EDIFACT format] for real time interactive communication and Type B [TTY] for informational and booking type of messages. Message construction standards set by IATA and ICAO, are global, and apply to more than air transportation. Since airline reservation systems are business critical applications, and they are functionally quite complex, the operation of an in-house airline reservation system is relatively expensive.</div>
    </div>
        <footer >
            <div class="footer">
                <span>Copyright &copy; 2019</span>
            </div>
        </footer>
    </form>
    <script src="Components/js/General.js"></script>
    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }

        
        //$(window).load(function () {

        //});
    </script>
</body>
</html>
