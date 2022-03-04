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
    public partial class Productos : System.Web.UI.Page
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
        public static String ConsultarProductoFiltroxCategoria(String xcodcategoria)
        {
            ClsProductosAD log = new ClsProductosAD();
            ClsData DataJSon = new ClsData();

            return DataJSon.fGetJson(log.ConsultarProductoFiltroxCategoria(xcodcategoria));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String ConsultarProductos(String xCategoria,String xProducto, String xEstado)
        {
            ClsProductosAD log = new ClsProductosAD();

            ClsData DataJSon = new ClsData();

            return DataJSon.fGetJson(log.ConsultarProductos(xCategoria, xProducto, xEstado));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String ConsultarProductoXcodProducto(String xcodProducto)
        {
            ClsProductosAD log = new ClsProductosAD();
            ClsData DataJSon = new ClsData();

            return DataJSon.fGetJson(log.ConsultarProductoXcodProducto(xcodProducto));
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static String MantenimientoProductos(String xcodProducto, String xcodCategoria, String xdescripcion, String xprecio, String xactivo, String ximagen)
        {
            ClsProductosAD log = new ClsProductosAD();
            ClsData DataJSon = new ClsData();


            return DataJSon.fGetJson(log.MantenimientoProductos(xcodProducto, xcodCategoria, xdescripcion, xprecio, xactivo, ximagen));
        }


    }
}