<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Airline_Reservation_System.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Components/Plugins/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Components/Plugins/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
    <link href="Components/css/Genral.css" rel="stylesheet" />
    <link href="Components/css/Login.css" rel="stylesheet" />
    
  
</head>
<body>
    <form id="form1" runat="server">
        <header>
            Airline Reservation System
        </header>
    <div>
        <div class="col-sm-12" style="margin-top: 80px;    margin-left: 20px;">
    <div class="col-sm-8"></div>
            <div class="panel-box col-sm-offset-8 col-sm-4">
                <div class="panel-header">
                    User Login
                   
                </div>
            
                <div class="form-group">
                    <label for="lbluserid" runat="server" class="control-label">Username</label>
                    <asp:TextBox runat="server" class="form-control"  ID="txtuserid" MaxLength="20" ></asp:TextBox>
                    
                </div>
                    <div class="form-group">
                    <label for="lblpwd" runat="server" class="control-label">Password</label>
                    <asp:TextBox runat="server" class="form-control" TextMode="Password" MaxLength="20"  ID="txtpassword" ></asp:TextBox>
                    
                </div>
                  <div class="form-group">
                    <label for="lblerror" runat="server" class="control-label" style="color:red"></label>
                    
                    
                </div>
                <div class="form-group btns">

                   <asp:Button ID="btnSignup" runat="server" class="btn btn-primary" Text="Sign Up" OnClick="btnSignup_Click1" />
                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary submitbtn" Text="Log In" OnClick="btnSubmit_Click" />
                </div>
                   
            </div>
            </div>

    </div>
     <asp:ScriptManager runat="server" ID="scriptman" EnablePageMethods="true"></asp:ScriptManager> 
    </form>
   <%-- <button type="button" hidden="hidden" id="hdnSessionbtn" onclick="RedirectToHome()" runat="server"></button>
      <input type="hidden" id="hdnUserId" runat="server" />
        <input type="hidden" id="hdnUserType" runat="server" />
        <input type="hidden" id="hdnTitle" runat="server" />
        <input type="hidden" id="hdnName" runat="server" />
        <input type="hidden" id="hdnGender" runat="server" />
        <input type="hidden" id="hdnMail" runat="server" />--%>
<script type="text/javascript">
   
</script>

</body>
<script src="Components/Plugins/Jquery/jquery-3.3.1.min.js"></script>
    <script src="Components/Plugins/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="Components/Plugins/bootstrap-4.2.1-dist/js/bootstrap.min.js"></script>
<script src="Components/js/General.js"></script>
</html>
