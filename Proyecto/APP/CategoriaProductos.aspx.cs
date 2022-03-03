using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using LN.APP;
using AD.APP;
using AD.Datos;

namespace Proyecto.APP
{
    public partial class CategoriaProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]        
        public static String ConsultarCategoriaProductos()
        {
            ClsCategoriaProductosAD log = new ClsCategoriaProductosAD();
            ClsData DataJSon = new ClsData();

            return DataJSon.fGetJson(log.ConsultarCategoriaProductos());
        }

    }
}