$(document).ready(function () {

    initButtons();




});

var initButtons = function () {


    $("#Registrar").click(function () {
        NuevoUsuario();
    });

    $("#btnSave").click(function () {
        ValidarUsuario();
    });

    $("#iniciarSesion").click(function () {
        ValidarSesion();
    });


}


var ValidarSesion = function () {
    var xinputUser = $("#inputUser").val(),
        xcontrasena = $("#inputPassword").val();

    if (xinputUser == "") {
        toastr.warning("Ingrese un usuario");
        return;
    }
    if (xcontrasena == "") {
        toastr.warning("Ingrese una contraseña");
        return;
    }

    $.ajax({
        type: "POST",
        url: "Login.aspx/ValidarSesion",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: "{ xUsuario:'" + xinputUser +
                "', xcontrasena:'" + xcontrasena + "'}",
        async: false,
        success: function (result) {
            $.each($.parseJSON(result.d), function (k, v) {
                if (v.Estado == "1") {
                    IniciarSesion(xinputUser);

                } else {
                    toastr.error("Revise sus datos");
                }
            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Ha ocurrido un error al procesar los datos");
        }
    })
}

var IniciarSesion = function (xinputUser) {

    $.ajax({
        type: "POST",
        url: "Login.aspx/IniciarSesion",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: "{ xUsuario:'" + xinputUser + "'}",
        async: false,
        success: function (result) {
            $.each($.parseJSON(result.d), function (k, v) {
                if (v.Estado == "1") {
                    window.location.href = "../Default.aspx";
                } else {
                    toastr.error("Ocurrio un error al iniciar sesión");
                }
            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Ha ocurrido un error al procesar los datos");
        }
    })
}


var NuevoUsuario = function () {
    limpiarValores();
    $("#myModalLabel").html("Nuevo Usuario");
    $("#myModal").modal('show');

}

var limpiarValores = function () {
    $("#inputNombre").val("");
    $("#inputApellido").val("");
    $("#inputUsuario").val("");
    $("#inputContarseña").val("");
    $("#inputConfirmar").val("");

}

var ValidarUsuario = function () {
    var xNombre =  $("#inputNombre").val(),
   xApellido = $("#inputApellido").val(),
  xUsuario =  $("#inputUsuario").val(),
  xContraseña = $("#inputContarseña").val(),
 xConfirmacion =   $("#inputConfirmar").val();

    if (xNombre == "") {
        toastr.error("Ingrese un nombre");
        return;
    }
    if (xApellido == "") {
        toastr.error("Ingrese un apellido");
        return;
    }
    if (xUsuario == "") {
        toastr.error("Ingrese un usuario");
        return;
    }
    if (xContraseña == "") {
        toastr.error("Ingrese una contraseña");
        return;
    }
    if (xConfirmacion == "") {
        toastr.error("Confirme su contraseña");
        return;
    }
    if (xContraseña != xConfirmacion) {
        toastr.error("Las contraseñas no coinciden");
        return;
    }


    $.ajax({
        type: "POST",
        url: "Login.aspx/ValidarUsuario",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: "{ xUsuario:'" + xUsuario + "'}",
        async: false,
        success: function (result) {
            $.each($.parseJSON(result.d), function (k, v) {
                if (v.Estado == "1") {
                    GuardarUsuario(xNombre,xApellido,xUsuario,xContraseña);
                   
                } else {
                    toastr.error("El usuario ya existe");
                }
            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Ha ocurrido un error al procesar los datos");
        }
    })

}

var GuardarUsuario = function (xNombre, xApellido, xUsuario, xContraseña) {

    $.ajax({
        type: "POST",
        url: "Login.aspx/GuardarUsuario",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: "{ xNombre:'" + xNombre +
               "', xApellido:'" + xApellido +
               "', xUsuario:'" + xUsuario +
               "', xContraseña:'" + xContraseña +"'}",
        async: false,
        success: function (result) {
            $.each($.parseJSON(result.d), function (k, v) {
                if (v.Estado == "1") {
                    toastr.success("El usuario ha sido registrado exitosamente");
                    $("#myModal").modal('toggle');
                } else {
                    toastr.error("Ocurrio un error al registrar el usuario");
                }
            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Ha ocurrido un error al procesar los datos");
        }
    })
}