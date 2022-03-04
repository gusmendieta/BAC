using AD.APP;
using AD.Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.APP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["user"] = null;
            }
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String ValidarUsuario(String xUsuario)
        {
            ClsLoginAD log = new ClsLoginAD();
            ClsData DataJSon = new ClsData();


            return DataJSon.fGetJson(log.ValidarUsuario(xUsuario));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String GuardarUsuario(String xNombre, String xApellido, String xUsuario, String xContraseña)
        {
            ClsLoginAD log = new ClsLoginAD();
            ClsData DataJSon = new ClsData();


            return DataJSon.fGetJson(log.GuardarUsuario(xNombre, xApellido,  xUsuario, xContraseña));
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String ValidarSesion(String xUsuario, String xcontrasena)
        {
            ClsLoginAD log = new ClsLoginAD();
            ClsData DataJSon = new ClsData();


            return DataJSon.fGetJson(log.ValidarSesion(xUsuario, xcontrasena));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String IniciarSesion(String xUsuario)
        {
            ClsData DataJSon = new ClsData();
            HttpContext.Current.Session["user"] = xUsuario.ToString();

            DataTable tabla = new DataTable();

            // Variables para las columnas y las filas
            DataColumn column;
            DataRow row;

            // Se tiene que crear primero la columna asignandole Nombre y Tipo de datos    
            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "Estado";
            tabla.Columns.Add(column);

            row = tabla.NewRow();
            row["Estado"] = 1;
            tabla.Rows.Add(row);

            return DataJSon.fGetJson(tabla);
        }

       
       

    }
}