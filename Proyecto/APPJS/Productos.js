$(document).ready(function () {

    initButtons();

    ConsultarDescripcionFiltro();
    ConsultarDescripcion();
    ConsultarProductoFiltro();
    ConsultarEstadoFiltro();

    ConsultarProductos();



});






var initButtons = function () {
    $('#inputPrecio').on('input', function () {
        this.value = this.value.replace(/[^0-9,.]/g, '');
    });



    $("#btnFiltro").click(function () {
        ConsultarProductos();
    });

    $("#btnSave").click(function () {
        MantenimientoProductos();
    });

    $("#btnNuevo").click(function () {
        NuevaProdcuto();
    });

    $("#file").change(function (event) {
        loadFile(event);

    });
    

    $('#Drop').empty();
    $('#Drop').append('<div id="dDropZone" class="dropzone needsclick dz-clickable" style="color: black;">' +
                                '<div class="dz-message needsclick">' +
                                    '<span>Arrastre el archivo hasta aca, o haga click aqui para subirlo.</span>' +
                                '</div>' +
                      '</div>');

    initDropZone();
    

}

var loadFile = function(event) {
    var image = document.getElementById('output');
    image.src = URL.createObjectURL(event.target.files[0]);
    
}

var NuevaProdcuto = function () {
    limpiarValores();
    $("#hdVista").val("1");
    $("#myModalLabel").html("Nuevo Producto");
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
                //console.log(v.codCategoriaProductos);
            });

        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Error cargando datos");
        }
    });
}

$("#selectDescripcionFiltro").change(function () {
    
    ConsultarProductoFiltroxCategoria();

});


var ConsultarDescripcion = function () {
    var $selectFiltro = $("#selectCategoria");

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


var ConsultarProductoFiltroxCategoria = function () {
    var $selectFiltro = $("#selectProductoFiltro");
    var codcategoria = $("#selectDescripcionFiltro").val();
    $.ajax({
        type: "POST",
        url: "Productos.aspx/ConsultarProductoFiltroxCategoria",
        contentType: "application/json; charset=utf-8",
        data: "{xcodcategoria :'" + codcategoria + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            $selectFiltro.html('');
            $selectFiltro.append(new Option("Todos", "-1"));
            $.each($.parseJSON(result.d), function (k, v) {
                $selectFiltro.append(new Option(v.Descripcion, v.codProducto));
            });
            $selectFiltro.selectpicker('refresh');
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Error cargando datos");
        }
    });
}

var ConsultarProductoFiltro = function () {
    var $selectFiltro = $("#selectProductoFiltro");

            $selectFiltro.html('');
            $selectFiltro.append(new Option("Todos", "-1"));
         

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




var ConsultarProductos = function () {
    var xCategoria = $("#selectDescripcionFiltro").val(),
        xProducto = $("#selectProductoFiltro").val(),
        xEstado = $("#selectEstadoFiltro").val();

    $.ajax({
        type: "POST",
        url: "Productos.aspx/ConsultarProductos",
        contentType: "application/json; charset=utf-8",
        data: "{ xCategoria :'" + xCategoria +
                "', xProducto :'" + xProducto +
                "', xEstado :'" + xEstado + "'}",
        dataType: "json",
        async: true,
        success: function (result) {
            $('#tbProductos tbody').empty();
            var row = '<tr>';
            $.each($.parseJSON(result.d), function (k, v) {

                var act = '';
                if (v.Activo != "True") {
                    act = '<i id="" title="Inactivo"  class="fa fa-circle text-danger" fa-align-justify></i>';
                } else {
                    act = '<i id="" title="Activo"  class="fa fa-circle  text-success fa-align-justify"></i>';
                }

                row += '<td style="width: 5%;">' + '</td>' +
                        '<td>' + v.Categoria + '</td>' +
                        '<td>' + v.Descripcion + '</td>' +
                        '<td>' + v.Precio + '</td>' +
                        '<td>' + act + '</td>' +
                        '<td>' + '<img src="../Imagenes/'+v.imagen+'" width="50" height="50"/>' + '</td>' +
                        '<td>' + '<i id="editBtn" title="Editar" data-id="' + v.codProducto + '" class="EditRow fa fa-pencil-square fa-2x text-primary"  style="cursor:pointer"></i>' + '</td>'

                row += '</tr>';
            });

            $('#tbProductos tbody').append(row);
            addListenerToGridProductos();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Ocurrio un error al intentar consultar las categorias!!!");
        }
    })

}
var addListenerToGridProductos = function () {
    $("#tbProductos tbody tr").on("click", '.EditRow', function () {
        EditRow(this);

    });;
}
var EditRow = function (el) {

    var codProducto = $(el).data('id');
    ConsultarProductoXcodProducto(codProducto);
}

var ConsultarProductoXcodProducto = function (codProducto) {

    limpiarValores();
    $("#inputcodProducto").val(codProducto);
    $("#hdvista").val("2");

    $.ajax({
        type: "POST",
        url: "Productos.aspx/ConsultarProductoXcodProducto",
        contentType: "application/json; charset=utf-8",
        data: "{xcodProducto :'" + codProducto + "'}",
        dataType: "json",
        async: true,
        success: function (result) {
            $.each($.parseJSON(result.d), function (k, v) {

                if (v.Activo == "True")
                    var checked = true;
                console.log(v.codCategoriaProductos);
                $("#selectCategoria").val(v.codCategoriaProductos);
                $("#selectCategoria").prop('disabled', 'disabled');
                $("#selectCategoria").selectpicker('refresh');
               
                $("#inputDescripcion").val(v.Descripcion);
                $("#inputPrecio").val(v.Precio);
                $("#chkActivo").prop('checked', checked);

                $("#myModalLabel").html("Editar Procucto");
                $("#myModal").modal('show');

            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
            toastr.error("Ocurrio un error al intentar consultar el producto!!!");
        }
    })
}



var MantenimientoProductos = function () {
    var xcodProducto = $("#inputcodProducto").val(),
         xcodCategoria = $("#selectCategoria").val(),
         xdescripcion = $("#inputDescripcion").val(),
         xprecio = $("#inputPrecio").val(),
        xactivo = $("#chkActivo").is(":checked") == true ? 1 : 0;

    var file = $("#FilesP").val() == "0" ? $("#FilesP").val().split(',')[0] : $("#FilesP").val();

    var vista = $("#hdVista").val();


    if (xcodCategoria == "-1") {
        toastr.error("Ingrese una categoria para el producto");
        return;
    }

    if (xdescripcion == "") {
        toastr.error("Ingrese una descripcion para el producto");
        return;
    }
    if (xprecio == "" || xprecio == "0.00") {
        toastr.error("Ingrese una precio para el producto");
        return;
    }

    //console.log(xcodProducto, xcodCategoria, xdescripcion, xactivo);


    $.ajax({
        type: "POST",
        url: "Productos.aspx/MantenimientoProductos",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: "{ xcodProducto:'" + xcodProducto +
                "', xcodCategoria:'" + xcodCategoria +
                "', xdescripcion:'" + xdescripcion +
                "', xprecio:'" + xprecio +
                "', xactivo:'" + xactivo +
                "', ximagen:'" + file + "'}",
        async: false,
        success: function (result) {
            $.each($.parseJSON(result.d), function (k, v) {
                if (v.Estado == "1") {
                    ConsultarProductoFiltro();
                    toastr.success(vista == "1" ? "Guardado exitosamente" : "Actualizado exitosamente");
                    ConsultarProductos();

                    $("#myModal").modal('toggle');


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
    $("#inputPrecio").val("0.00");
    $("#inputcodProducto").val("0")
    $("#inputDescripcion").val("");
    $("#chkActivo").prop('checked', false);
    $("#selectCategoria").val("-1");
    $("#selectCategoria").prop('disabled', false);
    $("#selectCategoria").selectpicker('refresh');
    $("#FilesP").val("0");


    $('#Drop').empty();
    $('#Drop').append('<div id="dDropZone" class="dropzone needsclick dz-clickable" style="color: black;">' +
                                '<div class="dz-message needsclick">' +
                                    '<span>Arrastre el archivo hasta aca, o haga click aqui para subirlo.</span>' +
                                '</div>' +
                      '</div>');

    initDropZone();
}

var initDropZone = function () {

    Dropzone.autoDiscover = false;

    var dDropZone = new Dropzone("div#dDropZone",
    {
        url: "FileUploadHandler.ashx?type=2&id=0",
        maxFiles: 10,
        maxFilesize: 1000, //MB
        acceptedFiles: ".jpg,.png",
        addRemoveLinks: true
    });

    dDropZone.on("init", function (file) { });
    dDropZone.on("processing", function (file) {
        var id = $("#inputMantenimientoId").val();
        var url = "FileUploadHandler.ashx?origendocumento=3&id=" + id + "&file=" + file.name + "&name=" + name + "&userId=" + "";
        this.options.url = url;
    });
    dDropZone.on("addedfile", function (file) {
        var fileName = file.name;
        var fileExtension = fileName.substring(fileName.lastIndexOf('.'));
        var acceptedFiles = [".jpg", ".png"];
        //alertify.error(fileExtension);
        if (acceptedFiles.indexOf(fileExtension) < 0) {
            alertify.error("Tipo de archivo no válido");
            this.removeFile(file);
        }
    });
    dDropZone.on("maxfilesexceeded", function (file) { alertify.error("Ya ha seleccionado un archivo"); });

    dDropZone.on("success", function (file, responseText) {
        $("#FilesP").val(responseText);
        file.previewElement.classList.add("dz-success");

    });
    dDropZone.on("error", function (file) { this.removeFile(file); });
}
