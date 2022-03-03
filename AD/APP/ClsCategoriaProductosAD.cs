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
        public DataTable ConsultarCategoriaProductos()
        {

            String VSQL = "exec [dbo].[ConsultarCategoriaProductos]";

            return Data.GET_DT(VSQL, Data.CONECTION);
        }
    }
}
