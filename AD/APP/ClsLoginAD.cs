using AD.Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace AD.APP
{
    public class ClsLoginAD
    {
        ClsData Data = new ClsData();


        public DataTable ValidarUsuario(string _Usuario)
        {
            String VSQL = "exec [dbo].[espValidarUsuario]" + "'" + _Usuario + "'";

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

        public DataTable ValidarSesion(string _Usuario, string _Contraseña)
        {
            String VSQL = "exec [dbo].[espValidarSesion]" + "'" + _Usuario + "','" + _Contraseña + "'";

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

        
       

        public DataTable GuardarUsuario(string _Nombre, string _Apellido, string _Usuario, string _Contraseña)
        {
            String VSQL = "exec [dbo].[espRegistrarUsuario]" + "'" + _Nombre + "'," + "'" + _Apellido + "'," + "'" + _Usuario + "'," + "'" + _Contraseña + "'";

            return Data.GET_DT(VSQL, Data.CONECTION);
        }

    }
}
