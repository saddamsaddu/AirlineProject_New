<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Airline_Reservation_System.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

      <link href="Components/Plugins/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Components/Plugins/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
    <link href="Components/css/Genral.css" rel="stylesheet" />
    
    <style>
        .panel-box{
            margin:8%;
            padding:10px
        }
        .form-group {
   
    margin-top: 2rem;
}
        #btnSubmit{
float:right
        }
        .auto-style1 {
            height: 51px;
        }
        .auto-style2 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="panel-box">
        <div class="panel-header">
                    Register
                   
                </div>
            
          <div class="form-group col-md-12">
            
                   

              <table class="w-100">
                  <tr>
                      <td><label for="lblTitle" runat="server" class="control-label">TITLE</label>&nbsp;</td>
                      <td> <asp:DropDownList runat="server" class="form-control" ID="ddlTitle" AutoPostBack="true"  OnSelectedIndexChanged="ddlTitle_SelectedIndexChanged">
                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                           </asp:DropDownList>
                          <%--<label for="lblTitleError" runat="server" class="control-label" style="color:red" hidden="hidden">Select A Title</label>--%>
                          <asp:RequiredFieldValidator ID="valtitlt" runat="server" InitialValue="--Select--" ControlToValidate="ddlTitle" ErrorMessage="Select A Title" ForeColor="Red"></asp:RequiredFieldValidator>
                          &nbsp;
                      </td>

                  </tr>
                  <tr>
                      <td><label for="lblfname" runat="server" class="control-label">First Name</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="20"  ID="txtfname" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valfname" runat="server" ControlToValidate="txtfname" ErrorMessage="Enter First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td><label for="lbllname" runat="server" class="control-label">Last Name</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="20"  ID="txtlname" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="vallname" runat="server" ControlToValidate="txtlname" ErrorMessage="Enter Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                   <tr>
                      <td style="padding: 9px 0px;"><label for="lbllname" runat="server" class="control-label">Gender</label>&nbsp;</td>
                      <td><asp:RadioButton GroupName="Gender" ID="rbmale" Enabled="false" Text="Male" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:RadioButton GroupName="Gender" ID="rbfmale" Enabled="false" Text="Female" runat="server" />
                      </td>
                        
                  </tr>
                  <tr>
                     <td class="auto-style1"><label for="lbladdress" runat="server" class="control-label">Address</label>&nbsp;</td>
                      <td class="auto-style1"> <asp:TextBox runat="server" class="form-control" MaxLength="50"  ID="txtaddress" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valaddress" runat="server" ControlToValidate="txtaddress" ErrorMessage="Enter Address" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                     <td><label for="lblmail" runat="server" class="control-label">E-Mail</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="30"  ID="txtemail" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valmail" runat="server" ControlToValidate="txtemail" ErrorMessage="Enter E-Mail" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                   <tr>
                     <td><label for="lblmobno" runat="server" class="control-label">Mobile Number</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="10"  ID="txtmobno" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valmob" runat="server" ControlToValidate="txtmobno" ErrorMessage="Enter Mobile Number" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                  </tr>
                  <tr>
                     <td><label for="lblmobno" runat="server" class="control-label">Passport Number</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="9"  ID="txtPassportNo" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valpassport" runat="server" ControlToValidate="txtPassportNo" ErrorMessage="Enter Passport Number" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                     <td><label for="lblAdno" runat="server" class="control-label">Aadhar Number</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="12"  ID="txtAadharNo" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valaadhar" runat="server" ControlToValidate="txtAadharNo" ErrorMessage="Enter Aadhar Number" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                     <td><label for="lblpanno" runat="server" class="control-label">PAN Number</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="10"  ID="txtPanNo" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valpanno" runat="server" ControlToValidate="txtPanNo" ErrorMessage="Enter PAN Number" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                     <td><label for="lblusername" runat="server" class="control-label">User Name</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="20" ID="txtusername" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="valusername" runat="server" ControlToValidate="txtusername" ErrorMessage="Enter User Name" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                     <td><label for="lblpassword" runat="server" class="control-label">Password</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="20" ID="txtpassword" TextMode="Password" ></asp:TextBox>
                          <asp:CompareValidator ID="PasswordValidator" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirmpassword" ErrorMessage="Password Not Matched" ForeColor="Red"></asp:CompareValidator>
                          &nbsp;</td>
                  </tr>
                  <tr>
                     <td><label for="lblconfirmpassword" runat="server" class="control-label">Confirm Password</label>&nbsp;</td>
                      <td> <asp:TextBox runat="server" class="form-control" MaxLength="20"  ID="txtconfirmpassword" TextMode="Password" ></asp:TextBox>&nbsp;</td>
                  </tr>
                  
                  <tr>
                      <td class="auto-style2"></td>
                      <td class="auto-style2">
                          <asp:Label ID="lblerrormsg" runat="server" ForeColor="Red"></asp:Label>
                      </td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                     <td><asp:Button ID="btnBack" text="Back" class="btn btn-primary" CausesValidation="false" runat="server" OnClick="btnBack_Click" /></td>
                      <td><asp:Button ID="btnSubmit" text="Submit"  class="btn btn-primary"  runat="server" OnClick="btnSubmit_Click" />&nbsp;</td>
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

        <footer >
            <div class="footer">
                <span>Copyright &copy; 2019</span>
            </div>
        </footer>
</body>
      <script src="Components/Plugins/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="Components/Plugins/bootstrap-4.2.1-dist/js/bootstrap.min.js"></script>
</html>
