$(document).ready(function () {
    ConsultarCategoriaProductos();
    
});




var ConsultarCategoriaProductos = function () {

    $.ajax({
        type: "POST",
        url: "CategoriaProductos.aspx/ConsultarCategoriaProductos",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {

            var row = '<tr>';
            $.each($.parseJSON(result.d), function (k, v) {

                var act = '';
                if (v.Activo != "True") {
                    act = '<i id="" title="Inactivo"  class="fa fa-circle text-danger" fa-align-justify></i>';
                } else {
                    act = '<i id="" title="Activo"  class="fa fa-circle  text-success fa-align-justify"></i>';
                }

                row += '<td>' + v.Descripcion + '</td>' +
                        '<td>' + act + '</td>'

                row += '</tr>';
            });
            
            $('#tbCategorias tbody').append(row);

        },
        error: function (xhr, ajaxOptions, thrownError) {
           alert("Ocurrio un error al intentar consultar las categorias!!!");
        }
    })

}