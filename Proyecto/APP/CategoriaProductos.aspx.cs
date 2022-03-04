using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AD.APP;
using AD.Datos;

namespace Proyecto.APP
{
    public partial class CategoriaProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = HttpContext.Current.Session["user"];

            if (user == null)
            {
                Response.Redirect("Login.aspx");
            }

        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String ConsultarCategoriaFiltro()
        {
            ClsCategoriaProductosAD log = new ClsCategoriaProductosAD();
            ClsData DataJSon = new ClsData();

            return DataJSon.fGetJson(log.ConsultarCategoriaFiltro());
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String ConsultarEstadoFiltro()
        {
            ClsCategoriaProductosAD log = new ClsCategoriaProductosAD();
            ClsData DataJSon = new ClsData();

            return DataJSon.fGetJson(log.ConsultarEstadoFiltro());
        }



      
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String ConsultarCategoriaProductos(String xCategoria, String xEstado)
        {
            ClsCategoriaProductosAD log = new ClsCategoriaProductosAD();

            ClsData DataJSon = new ClsData();

            return DataJSon.fGetJson(log.ConsultarCategoriaProductos(xCategoria, xEstado));
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String ConsultarCategoriXcodCategoria(String xcodCategoria)
        {
            ClsCategoriaProductosAD log = new ClsCategoriaProductosAD();
            ClsData DataJSon = new ClsData();

            return DataJSon.fGetJson(log.ConsultarCategoriXcodCategoria(xcodCategoria));
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String MantenimientoCategoriaProductos(String xcodcategoria, String xdescripcion, String xactivo, String xeliminar)
        {
            ClsCategoriaProductosAD log = new ClsCategoriaProductosAD();
            ClsData DataJSon = new ClsData();


            return DataJSon.fGetJson(log.MantenimientoCategoriaProductos(xcodcategoria, xdescripcion, xactivo, xeliminar));
        }

    }
}