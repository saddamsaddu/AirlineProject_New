<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketBooking.aspx.cs" Inherits="Airline_Reservation_System.TicketBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="Components/Plugins/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Components/Plugins/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
    <link href="Components/css/Genral.css" rel="stylesheet" />

    <style>
        .panel-box{
                margin-top: 70px;
                    padding: 55px;
    padding-top: 11px;
    width: 90%;
    margin-left: 60px;
    height:900px;
        margin-bottom: 50px;
        }
                .pull-right{
   margin-left: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
           <div class="navbar">
            <div class="nav-tabs ">
            <a href="Home.aspx">Home</a>
            </div>
            <div class="nav-tabs ">
                <a href="FlightList.aspx">Flight List</a>
                </div>
            <div class="nav-tabs activetab">
<a href="TicketBooking.aspx">Book Your Flight</a>
                </div>
            <div class="nav-tabs admintabs"  id="admintabs" runat="server" >
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
                    Book Your Ticket
                   
                </div>
<div>
<table class="w-100">
<tr>
<td><label for="lblFlightName" runat="server" class="control-label">Flight ID</label>&nbsp;</td>
<td> <asp:DropDownList runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlFlightId_SelectedIndexChanged" AutoPostBack="true" ID="ddlFlightId">
<asp:ListItem Value="0">--Select--</asp:ListItem>
</asp:DropDownList>
     <asp:RequiredFieldValidator ID="valtitlt" runat="server" InitialValue="--Select--" ControlToValidate="ddlFlightId" ErrorMessage="Select A Flight ID" ForeColor="Red"></asp:RequiredFieldValidator>
    &nbsp;</td>
</tr>
<tr>
<td><label for="lblFlightName" runat="server" class="control-label">Flight Name</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtFlightName" readonly="true" ></asp:TextBox>&nbsp;
</td>
</tr>
<tr>
<td><label for="lblFrom" runat="server" class="control-label">From Place</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtFrom" readonly="true" ></asp:TextBox>&nbsp;
</td>
</tr>
<tr>
<td><label for="lblTo" runat="server" class="control-label">To Place</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtTo" readonly="true" ></asp:TextBox>&nbsp;
</td>
</tr>
<tr>
<td><label for="lblArrival" runat="server" class="control-label">Arrival Time</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtArrival" readonly="true" ></asp:TextBox>&nbsp;
</td>
</tr>
<tr>
<td><label for="lblDepature" runat="server" class="control-label">Depature Time</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtDepature" readonly="true" ></asp:TextBox>&nbsp;
</td>
</tr>
<tr>
<td><label for="lblavailableSeats" runat="server" class="control-label">No of Seats Available</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtAvailableSeats" readonly="true" ></asp:TextBox>&nbsp;
</td>
</tr>
<tr>
<td><label for="lblTickprice" runat="server" class="control-label">Ticket Price</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtTicketPrice" readonly="true" ></asp:TextBox>&nbsp;
</td>
</tr>
<tr>
<td><label for="lblName" runat="server" class="control-label">Name</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtName" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDepature" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td><label for="lblNoOfSeats" runat="server" class="control-label">No Of Seats</label>&nbsp;</td>
<td> <asp:DropDownList runat="server" CssClass="form-control" ID="ddlNoofSeats" OnSelectedIndexChanged="ddlNoofSeats_SelectedIndexChanged1" AutoPostBack="true">
<%--<asp:ListItem Value="1">1</asp:ListItem>
<asp:ListItem Value="2">2</asp:ListItem>
<asp:ListItem Value="3">3</asp:ListItem>
<asp:ListItem Value="4">4</asp:ListItem>
<asp:ListItem Value="5">5</asp:ListItem>--%>
</asp:DropDownList>&nbsp;</td>
</tr>
<tr>
<td><label for="lblTicketPrice" runat="server" class="control-label">Total Ticket Price</label>&nbsp;</td>
<td> <asp:TextBox runat="server" CssClass="form-control" ID="txtTotTicketPrice" readonly="true" ></asp:TextBox>&nbsp;
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
    <tr>
                     
                      <td colspan="2"><asp:Button ID="btnBook" text="Book"  CssClass="btn btn-primary pull-right"  runat="server" OnClick="btnBook_Click" />&nbsp;</td>
                  </tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
</div>
        </div>
    </div>
    </form>
    <script src="Components/js/General.js"></script>
        <footer >
            <div class="footer">
                <span>Copyright &copy; 2019</span>
            </div>
        </footer>
</body>
</html>
