<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlight.aspx.cs" Inherits="Airline_Reservation_System.AddFlight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="Components/Plugins/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Components/Plugins/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
    <link href="Components/Plugins/Datetime_Picker/rome.css" rel="stylesheet" />
    <link href="Components/css/Genral.css" rel="stylesheet" />

    <style>
        .panel-box{
                margin-top: 40px;
                padding:60px;
                    /*height: 650px;*/
                                  margin-top: 70px;
                    padding: 55px; 
    width: 90%;
    margin-left: 60px;
        margin-bottom: 50px;
        }
        .pull-right{
   margin-left: 50%;
        }
    </style>
</head>
<body style="background-image:url('Components/Images/Flight-1.jpg')">
    <form id="form1" runat="server">
    <div>
           <div class="navbar">
            <div class="nav-tabs ">
            <a href="Home.aspx">Home</a>
            </div>
            <div class="nav-tabs">
                <a href="FlightList.aspx">Flight List</a>
                </div>
            <div class="nav-tabs">
            <a href="TicketBooking.aspx">Book Your Flight</a>
               </div>
            <div class="nav-tabs admintabs activetab" id="admintabs" runat="server" >
            <a >Customize Flight</a>
                </div>
            <div class="nav-tabs">
            <a href="BookingList.aspx">Booking Status</a>
                </div>
          <%--  <div class="nav-tabs">
            <a>About</a>
                </div>--%>
            <div class="nav-tabs">
            <a onclick="Logout()">Logout</a>
                </div>
        </div>
    <div class="panel-box" >
        <div class="panel-header">
                    Add Flight
                   
                </div>
        
        <div class="form-group col-md-12">
            
                   

              <table class="w-100">
                  <tr>
                      <td><label for="lblFlightName" runat="server" class="control-label">Flight Name</label>&nbsp;</td>
                      <td> <asp:DropDownList runat="server" CssClass="form-control" ID="ddlFlight">
                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                           </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="valtitlt" runat="server" InitialValue="--Select--" ControlToValidate="ddlFlight" ErrorMessage="Select A Flight Name" ForeColor="Red"></asp:RequiredFieldValidator>
                          &nbsp;

                      </td>
                  </tr>
                  <tr>
                      <td><label for="lblFrom" runat="server" class="control-label">From Place</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" CssClass="form-control" MaxLength="30"  ID="txtFrom" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFrom" ErrorMessage="Enter From Place" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td><label for="lblTo" runat="server" class="control-label">To Place</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" CssClass="form-control" MaxLength="30"  ID="txtTo" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTo" ErrorMessage="Enter To Place" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td><label for="lblArrival" runat="server" class="control-label">Arrival Time</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" CssClass="form-control"  ID="txtArrival" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valfname" runat="server" ControlToValidate="txtArrival" ErrorMessage="Enter Arrival Time" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td><label for="lblDepature" runat="server" class="control-label">Depature Time</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" CssClass="form-control"  ID="txtDepature" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="vallname" runat="server" ControlToValidate="txtDepature" ErrorMessage="Enter Depature Time" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                     <td class="auto-style1"><label for="lblSeats" runat="server" class="control-label">Seats</label>&nbsp;</td>
                      <td class="auto-style1"> <asp:TextBox runat="server" CssClass="form-control"  ID="txtSeats" Text="20" readonly="true" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valaddress" runat="server" ControlToValidate="txtSeats" ErrorMessage="Enter Seats" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                     <td><label for="lblTicketPrice" runat="server" class="control-label">Ticket Price</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" CssClass="form-control"  ID="txtTicketPrice" MaxLength="5" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valmail" runat="server" ControlToValidate="txtTicketPrice" ErrorMessage="Enter Ticket Price" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                     
                      <td colspan="2"><asp:Button ID="btnAdd" text="Add"  CssClass="btn btn-primary pull-right"  runat="server" OnClick="btnAdd_Click" />&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
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
    <script src="Components/Plugins/Jquery/jquery-3.3.1.min.js"></script>
    <script src="Components/Plugins/Datetime_Picker/rome.js"></script>
    <script src="Components/js/General.js"></script>
    <script type="text/javascript">
        //jQuery('#txtArrival').datetimepicker({
        //    format: 'd.m.Y H:i',
           
        //});
        //jQuery('#txtDepature').datetimepicker({
        //    format: 'd.m.Y H:i',
           
            
        //});
        rome(txtArrival);
        rome(txtDepature);
        </script>
        <footer >
            <div class="footer">
                <span>Copyright &copy; 2019</span>
            </div>
        </footer>
</body>
</html>
