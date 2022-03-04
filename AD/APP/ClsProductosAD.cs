using AD.Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AD.APP
{
    public class ClsProductosAD
    {
        ClsData Data = new ClsData();

        public DataTable ConsultarProductoFiltroxCategoria(string _codcategoria)
        {
            String VSQL = " exec [dbo].[espConsultarProductoFiltro]" + _codcategoria;

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

        public DataTable ConsultarProductos(string _Categoria, string _Producto, string _Estado)
        {

            String VSQL = "exec [dbo].[espConsultarProductos]" + _Categoria + ","+ _Producto+"," + _Estado;

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

        public DataTable ConsultarProductoXcodProducto(string _codProducto)
        {
            String VSQL = " exec [dbo].[espConsultarProductoXcodProducto] " + _codProducto;

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

        public DataTable MantenimientoProductos(string _codProducto, string _codCategoria, string _descripcion, string _precio, string _activo, string _imagen)
        {
            String VSQL = "exec [dbo].[espMantenimientoProductos]" + _codProducto + "," + _codCategoria + ",'" + _descripcion + "'," + _precio + "," + _activo + ",'" + _imagen + "'";

            return Data.GET_DT(VSQL, Data.CONECTION);
        }


    }
}
