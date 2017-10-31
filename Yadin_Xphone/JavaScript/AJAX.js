
var webService = "WebService2.asmx";


function CheckSignIn() {
    var re = /[0-9]/;
    if (!re.test($('#PasswordInput').val())) {
        alert("Password must contains only digits!");
    }
    else {
        name = $('#UserNameINPUT').val();
        pass = $('#PasswordInput').val();
        var user = {
            userNamePar: name,
            passPar: pass
        }
        $.ajax({
            url: webService + "/CheckLoginCodeBehind1",
            dataType: "json",
            type: "POST", //use only POST!
            data: JSON.stringify(user),
            contentType: "application/json; charset=utf-8",
            error: function (jqXHR, exception) {
                alert(formatErrorMessage(jqXHR, exception));
            },
            async: false,
            success: function (result) {
                if (result.d == "User Not Found") {
                    alert("User Not found");
                } else {
                   window.location = "ProductsPage.aspx?showProduct=1";


                    //location.href = "ProductsPage.aspx";
                    //window.location.replace("ProductsPage.aspx");
                }
            }
        });
    }
}




//Error Section

function formatErrorMessage(jqXHR, exception) {
    if (jqXHR.status === 0) {
        return ('Not connected.\nPleaseverify your network connection.');
    } else if (jqXHR.status == 404) {
        return ('The requested page not found. [404]');
    } else if (jqXHR.status == 500) {
        return ('Internal Server Error [500].');
    } else if (exception === 'parsererror') {
        return ('Requested JSON parse failed.');
    } else if (exception === 'timeout') {
        return ('Time out error.');
    } else if (exception === 'abort') {
        return ('Ajax request aborted.');
    } else {
        return ('Uncaught Error.\n' + jqXHR.responseText);
    }
}