<%@ Page Title="" Language="C#" MasterPageFile="~/APP/Site.Master" AutoEventWireup="true" CodeBehind="CategoriaProductos.aspx.cs" Inherits="Proyecto.APP.CategoriaProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <h1>Categoría de Productos
        </h1>

    </section>

    <div class="row">
        <div class="table-responsive">
            <table id="tbCategorias" class="table table-striped  dt-responsive nowrap">
                <thead>
                    <tr>
                        <th>Descripción</th>
                        <th>Activo</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
     <script src="../Scripts/jQuery-2.2.0.min.js"></script>
    <script src="../APPJS/CategoriaProductos.js"></script>
</asp:Content>
