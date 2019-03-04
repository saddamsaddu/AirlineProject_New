<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlightList.aspx.cs" Inherits="Airline_Reservation_System.FlightList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="Components/Plugins/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Components/Plugins/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
    <link href="Components/css/Genral.css" rel="stylesheet" />

    <style>
        .panel-box{
                margin-top: 13%;
                 /*padding: 55px;*/
    padding-top: 11px;
    width: 90%;
    margin-left: 60px;
        }
        .Grid-Box{
                padding: 11px 202px;
    padding-bottom: 39px;
        }
        footer{
            position:absolute;
        }
    </style>
</head>
<body  style="background-image:url('Components/Images/Flight-1.jpg')">
    <form id="form1" runat="server">
    <div>
           <div class="navbar">
            <div class="nav-tabs ">
            <a href="Home.aspx">Home</a>
            </div>
            <div class="nav-tabs activetab">
                <a>Flight List</a>
                </div>
            <div class="nav-tabs">
<a href="TicketBooking.aspx">Book Your Flight</a>
                </div>
            <div class="nav-tabs admintabs" id="admintabs" runat="server"  >
            <a href="AddFlight.aspx">Customize Flight</a>
                </div>
            <div class="nav-tabs">
            <a href="BookingList.aspx">Booking Status</a>
                </div>
           <%-- <div class="nav-tabs">
            <a>About</a>
                </div>--%>
            <div class="nav-tabs">
            <a onclick="Logout()">Logout</a>
                </div>
        </div>
    <div class="panel-box">
        <div class="panel-header">
                    Flight List
                   
                </div>

        
        <div class="Grid-Box">
                    <%--<asp:Label ID="lblGridHeader" runat="server" Text=""></asp:Label>--%>
            <asp:GridView id="gridFlightList" runat="server" ></asp:GridView>
                   
                </div>
        </div>
    </div>
    </form>
        <footer >
            <div class="footer">
                <span>Copyright &copy; 2019</span>
            </div>
        </footer>
    <script src="Components/js/General.js"></script>
</body>
</html>
