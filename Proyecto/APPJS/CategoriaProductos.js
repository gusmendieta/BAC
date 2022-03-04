$(document).ready(function () {

    initButtons();

    ConsultarDescripcionFiltro();
    

    ConsultarEstadoFiltro();

    ConsultarCategoriaProductos();
    
    
});


var initButtons = function () {
 
    $("#btnFiltro").click(function () {
        ConsultarCategoriaProductos();
    });

    $("#btnSave").click(function () {
        MantenimientoCategoriaProductos();
    });

    $("#btnNuevo").click(function () {
        NuevaCategoria();
    });


}


var NuevaCategoria = function () {
    limpiarValores();
    $("#hdVista").val("1");
    $("#myModalLabel").html("Nueva Categoría");
    $("#myModal").modal('show');
 
}


var ConsultarDescripcionFiltro = function () {
    var $selectFiltro = $("#selectDescripcionFiltro");

    $.ajax({
        type: "POST",
        url: "CategoriaProductos.aspx/ConsultarCategoriaFiltro",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $selectFiltro.html('');
            $selectFiltro.append(new Option("Todos", "-1"));
            $.each($.parseJSON(result.d), function (k, v) {
                $selectFiltro.append(new Option(v.Descripcion, v.codCategoriaProductos));
            });

        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Error cargando datos");
        }
    });
}

var ConsultarEstadoFiltro = function () {
    var $selectFiltro = $("#selectEstadoFiltro");

    $.ajax({
        type: "POST",
        url: "CategoriaProductos.aspx/ConsultarEstadoFiltro",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $selectFiltro.html('');
            $selectFiltro.append(new Option("Todos", "-1"));
            $.each($.parseJSON(result.d), function (k, v) {
                $selectFiltro.append(new Option(v.Descripcion, v.codEstado));
            });

        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Error cargando datos");
        }
    });
}




var ConsultarCategoriaProductos = function () {
    var xCategoria = $("#selectDescripcionFiltro").val(),
        xEstado = $("#selectEstadoFiltro").val();

    $.ajax({
        type: "POST",
        url: "CategoriaProductos.aspx/ConsultarCategoriaProductos",
        contentType: "application/json; charset=utf-8",
        data: "{ xCategoria :'" + xCategoria +
                "', xEstado :'" + xEstado + "'}",
        dataType: "json",
        async: true,
        success: function (result) {
            $('#tbCategorias tbody').empty();
            var row = '<tr>';
            $.each($.parseJSON(result.d), function (k, v) {

                var act = '';
                if (v.Activo != "True") {
                    act = '<i id="" title="Inactivo"  class="fa fa-circle text-danger" fa-align-justify></i>';
                } else {
                    act = '<i id="" title="Activo"  class="fa fa-circle  text-success fa-align-justify"></i>';
                }

                row += '<td style="width: 5%;">'+'</td>' +
                        '<td>' + v.Descripcion + '</td>' +
                        '<td>' + act + '</td>'+
                        '<td>' + '<i id="editBtn" title="Editar" data-id="' + v.codCategoriaProductos + '" class="EditRow fa fa-pencil-square fa-2x text-primary" style="cursor:pointer"></i>' + '</td>'+
                        '<td>' + '<i id="deleteBtn" title="Eliminar" data-id="' + v.codCategoriaProductos + '" class="DeleteRow fa fa-trash-o fa-2x text-danger" style="cursor:pointer"></i>' + '</td>'

                row += '</tr>';
            });
            
            $('#tbCategorias tbody').append(row);
            addListenerToGridVehiculos();
        },
        error: function (xhr, ajaxOptions, thrownError) {
           toastr.error("Ocurrio un error al intentar consultar las categorias!!!");
        }
    })

}
var addListenerToGridVehiculos = function () {
    $("#tbCategorias tbody tr").on("click", '.EditRow', function () {
        EditRow(this);

    });;

    $("#tbCategorias tbody tr").on("click", '.DeleteRow', function () {
        DeleteRow(this);

    });;

}
var EditRow = function (el) {

    var codCategoriaProductos = $(el).data('id');
    ConsultarCategoriXcodCategoria(codCategoriaProductos);
}

var DeleteRow = function (el) {

    var codCategoriaProductos = $(el).data('id');
    EliminarCategoria(codCategoriaProductos);
}

var ConsultarCategoriXcodCategoria = function (codCategoriaProductos) {

     limpiarValores();
     $("#inputcodCategoria").val(codCategoriaProductos);
     $("#hdvista").val("2");
   
    $.ajax({
        type: "POST",
        url: "CategoriaProductos.aspx/ConsultarCategoriXcodCategoria",
        contentType: "application/json; charset=utf-8",
        data: "{xcodCategoria :'" + codCategoriaProductos + "'}",
        dataType: "json",
        async: true,
        success: function (result) {

            $.each($.parseJSON(result.d), function (k, v) {
                if (v.Activo == "True")
                    var checked = true;


                $("#inputDescripcion").val(v.Descripcion);
                $("#chkActivo").prop('checked', checked);

                $("#myModalLabel").html("Editar Categoria");
                $("#myModal").modal('show');

            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Ocurrio un error al intentar consultar el Reclamo!!!");
        }
    })
}


var EliminarCategoria = function (codCategoriaProductos) {

    limpiarValores();
    $("#inputcodCategoria").val(codCategoriaProductos);
    $("#hdvista").val("2");
    $("#inputEliminar").val("1");

    bootbox.confirm({
        message: "<center><h3>¿Desea eliminar esta categoría?<h3><center>",
        buttons: {
            confirm: {
                label: 'Aceptar',
                className: 'btn-primary'
            },
            cancel: {
                label: 'Cancelar',
                className: 'btn-danger'

            }

        },

        callback: function (result) {

            if (result) {
                MantenimientoCategoriaProductos();
                
            }
        }
    });

}


var MantenimientoCategoriaProductos = function () {
    var xcodcategoria = $("#inputcodCategoria").val(),
         xdescripcion = $("#inputDescripcion").val(),
        xactivo = $("#chkActivo").is(":checked") == true ? 1 : 0,
        xeliminar = $("#inputEliminar").val();

    var vista = $("#hdVista").val();
    if (xeliminar == "0") {
        if (xdescripcion == "") {
            toastr.error("Ingrese una descripcion para la categoria");
            return;
        }
    }
    
    

    $.ajax({
        type: "POST",
        url: "CategoriaProductos.aspx/MantenimientoCategoriaProductos",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: "{ xcodcategoria:'" + xcodcategoria +
                "', xdescripcion:'" + xdescripcion +
                "', xactivo:'" + xactivo +
                "', xeliminar:'" + xeliminar + "'}",
        async: false,
        success: function (result) {
            $.each($.parseJSON(result.d), function (k, v) {
                if (v.Estado == "1") {
                    ConsultarDescripcionFiltro();
                    toastr.success(vista == "1" ? "Guardado exitosamente" : "Actualizado exitosamente" );
                    ConsultarCategoriaProductos();
                    if (xeliminar == "0") {
                        $("#myModal").modal('toggle');
                    }
                    


                } else {
                    toastr.error("Ha ocurrido un error al procesar los datos");
                }
            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Ha ocurrido un error al procesar los datos");
        }
    })

}


var limpiarValores = function () {
    $("#hdVista").val("0");
    $("#inputcodCategoria").val("0");
    $("#inputEliminar").val("0");
    $("#inputDescripcion").val("");
    $("#chkActivo").prop('checked', false);

}

