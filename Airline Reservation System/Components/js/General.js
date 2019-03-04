function Logout() {
    sessionStorage.clear();
    window.location.href = "Login.aspx"
}


function RedirectToHome() {
    debugger;
    sessionStorage.setItem("LoginId", hdnUserId.val());
    sessionStorage.setItem("UserType", hdnUserType.val());
    sessionStorage.setItem("Title", hdnTitle.val());
    sessionStorage.setItem("Name", hdnName.val());
    sessionStorage.setItem("Gender", hdnGender.val());
    sessionStorage.setItem("Mail", hdnMail.val());
    return true;
    //window.location.href = "Login.aspx";
}

