using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AD.Transaccion;
using System.Data;
using AD.Datos;

namespace AD.APP
{
    public class ClsCategoriaProductosAD
    {
        ClsData Data = new ClsData();

        public DataTable ConsultarCategoriaFiltro()
        {
            String VSQL = " exec [dbo].[espConsultarCategoriaFiltro] ";

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

        public DataTable ConsultarEstadoFiltro()
        {
            String VSQL = " exec [dbo].[espConsultarEstadoFiltro] ";

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

        public DataTable ConsultarCategoriaProductos(string _Categoria, string _Estado)
        {

            String VSQL = "exec [dbo].[ConsultarCategoriaProductos]" + _Categoria + "," + _Estado;

            return Data.GET_DT(VSQL, Data.CONECTION);
        }


        public DataTable ConsultarCategoriXcodCategoria(string _codCategoria)
        {
            String VSQL = " exec [dbo].[espConsultarCategoriXcodCategoria] " + _codCategoria;

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

        public DataTable MantenimientoCategoriaProductos(string _codcategoria, string _descripcion, string _activo, string _eliminar)
        {
            String VSQL = "exec [dbo].[MantenimientoCategoriaProductos]" + _codcategoria + ",'" + _descripcion + "'," + _activo + "," + _eliminar;

            return Data.GET_DT(VSQL, Data.CONECTION);
        }
    }
}
