<%@ Page Title="" Language="C#" MasterPageFile="~/APP/Site.Master" AutoEventWireup="true" CodeBehind="CategoriaProductos.aspx.cs" Inherits="Proyecto.APP.CategoriaProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
                                <label class="control-label">Descripción</label>
                                <input id="inputDescripcion" type="text" class="form-control" value="" autocomplete="off" />
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

                </div>
                <div class="modal-footer">
                    <i id="btnSave" class="fa fa-floppy-o fa-3x text-danger" style="cursor:pointer" title="Guardar"></i>

                </div>


            </div>
        </div>
    </div>




    <section class="content-header">
        <h3>Categoría de Productos
        </h3>

    </section>
    <hr />
    
    <section >
        <h5>Filtros
        </h5>

    </section>
    <div class="row fa-border">
        <div class="col-md-4">
            <div class="form-group">
                <label class="control-label">Descripción</label>
                <select id="selectDescripcionFiltro" class="selectpicker" data-live-search="true" data-size="auto"></select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label class="control-label">Estado</label>
                <select id="selectEstadoFiltro" class="selectpicker" data-live-search="true" data-size="auto"></select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label class="control-label">Filtrar</label><br />
                <i id="btnFiltro"style="cursor:pointer"  class="fa fa-filter fa-2x text-danger"></i>
            </div>
        </div>
    </div>
    <br />
    <section class="text-center">
        <h4>Lista de Categorías
        </h4>

    </section>
    <hr />

    <div class="row">
        <div class="table-responsive">
            <table id="tbCategorias" class="table table-striped  dt-responsive nowrap">
                <thead>
                    <tr>
                        <th><i id="btnNuevo" style="width: 5%; cursor:pointer" title="Nueva Categoría" class="fa fa-plus fa-2x text-danger"></i></th>
                        <th>Descripción</th>
                        <th>Estado</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <input id="inputcodCategoria" type="hidden" value="" />
    <input id="inputEliminar" type="hidden" value="0" />
    <input id="hdVista" type="hidden" value="0" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="../APPJS/CategoriaProductos.js"></script>
</asp:Content>
