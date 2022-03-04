<%@ Page Title="" Language="C#" MasterPageFile="~/APP/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto.APP.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modal fade" id="myModal" <%-- tabindex="-1"--%> role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Nueva Incidente</h4>
                </div>

                <div class="modal-body validateForm">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Categoría</label>
                                <select id="selectCategoria" class="selectpicker" data-live-search="true" data-size="auto"></select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Descripción</label>
                                <input id="inputDescripcion" type="text" class="form-control" value="" autocomplete="off" />
                            </div>
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Precio</label>
                                <input id="inputPrecio" type="text" class="form-control" value="0.00" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Activo</label>
                                <br />
                                <input id="chkActivo" type="checkbox" />
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12 " id="Drop">
                            <p>
                                <input type="file" accept="image/*" name="image" id="file" onchange="loadFile(event)" style="display: none;"></p>
                            <p> 
                                  <label class="control-label">Subir Imagen</label><br />
                                <label for="file" class="fa fa-cloud-upload fa-3x text-success" style="cursor: pointer;"></label></p>
                            <p>
                                <img id="output" width="200" /></p>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <i id="btnSave" class="fa fa-floppy-o fa-3x text-danger" title="Guardar"></i>

                </div>


            </div>
        </div>
    </div>




    <section class="content-header">
        <h3>Productos
        </h3>

    </section>
    <hr />

    <div class="row fa-border">
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Categoría</label>
                <select id="selectDescripcionFiltro" class="selectpicker" data-live-search="true" data-size="auto"></select>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Producto</label>
                <select id="selectProductoFiltro" class="selectpicker" data-live-search="true" data-size="auto"></select>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Estado</label>
                <select id="selectEstadoFiltro" class="selectpicker" data-live-search="true" data-size="auto"></select>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Filtrar</label><br />
                <i id="btnFiltro" class="fa fa-filter fa-2x text-danger"></i>
            </div>
        </div>
    </div>
    <div style="float: right">
    </div>

    <div class="row">
        <div class="table-responsive">
            <table id="tbProductos" class="table table-striped  dt-responsive nowrap">
                <thead>
                    <tr>
                        <th><i id="btnNuevo" style="width: 5%;" title="Nuevo Producto" class="fa fa-plus fa-2x text-danger"></i></th>
                        <th>Categoría</th>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Estado</th>
                        <th>Imagen</th>
                        <th>Editar</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <input id="inputcodProducto" type="hidden" value="" />
    <input id="hdVista" type="hidden" value="0" />
     <input id="FilesP" type="hidden" value="0" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="../APPJS/Productos.js"></script>
</asp:Content>
