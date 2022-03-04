<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto.APP.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BAC-LATAM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Scripts/alertify.min.css" rel="stylesheet" />
    <link href="../Scripts/bootstrap-select.css" rel="stylesheet" />
    <link href="../Content/toastr.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
</head>
<body class="text-center sing ">
    <form role="form" class="form-signin contenedor">

        <img class="m-xl-2" src="../IMG/logoBac.png" alt="" width="225" height="115" />

        <h1 class="h3  font-weight-normal mb-3">Ingrese sus datos</h1>
        <label for="inputUser" class="sr-only">Usuario</label>
        <input id="inputUser" type="text" class="form-control cajatexto" placeholder="Usuario" autocomplete="off" />
        <label for="inputPassword" class="sr-only">Contraseña</label>
        <input id="inputPassword" type="password" class="form-control cajatexto" placeholder="Contraseña" autocomplete="off" />


        <button class="btn btn-lg bt btn-block mt-3 btn-primary cajatexto" type="button" id="iniciarSesion" value="Log in">Iniciar Sesión</button>
        <br />
        <a  class="text-danger" style="cursor: pointer" id="Registrar">Regístrate aqui! </a>
        <br />
        <p class=" text-muted" style="margin-top: 5%">&copy; BAC  <%: DateTime.Now.Year %> </p>
    </form>
</body>

<script src="../Scripts/jQuery-2.2.0.min.js"></script>
<script src="../Scripts/bootstrap.js"></script>
<script src="../Scripts/bootstrap.min.js"></script>
<script src="../Scripts/popper.js"></script>
<script src="../Scripts/toastr.js"></script>
<script src="../Scripts/alertify.min.js"></script>
<script src="../Scripts/bootstrap-select.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="../APPJS/Login.js"></script>
</html>
<div class="modal fade" id="myModal" <%-- tabindex="-1"--%> role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>

            <div class="modal-body validateForm">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label">Nombre</label>
                            <input id="inputNombre" type="text" class="form-control" value="" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label">Apellido</label>
                            <input id="inputApellido" type="text" class="form-control" value="" autocomplete="off" />
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label">Usuario</label>
                            <input id="inputUsuario" type="text" class="form-control" value="" autocomplete="off" />
                        </div>
                    </div>
                      <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label">Contraseña</label>
                            <input id="inputContarseña" type="password" class="form-control" value="" autocomplete="off" />
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label">Confirmar Contraseña</label>
                            <input id="inputConfirmar" type="password" class="form-control" value="" autocomplete="off" />
                        </div>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <i id="btnSave" class="fa fa-sign-in fa-3x text-danger" style="cursor:pointer" title="Guardar"></i>

            </div>


        </div>
    </div>
</div>
