using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AD.Transaccion
{
    public class EnTransaccion
    {
        public EnTransaccion()
        {
            ResultadoDevuelto = new object();
            EjecutadaCorrectamente = true;
        }

        public EnTransaccion(object resultadoDevuelto)
        {
            ResultadoDevuelto = resultadoDevuelto;
            EjecutadaCorrectamente = true;
        }

        public EnTransaccion(string metodo, string capa, string mensaje, bool errorRegistrado = false)
        {
            ErrorRegistrado = errorRegistrado;
            ResultadoDevuelto = new object();
            Metodo = metodo;
            Capa = capa;
            Mensaje = mensaje;
            EjecutadaCorrectamente = false;
            MensajeUsuario = "Se produjo un error en el procesamiento de los datos, por favor consulte la persona encargada.";
        }

        public string Metodo { get; set; }

        public string Capa { get; set; }

        public object ResultadoDevuelto { get; set; }

        public bool ErrorRegistrado { get; set; }

        public string MensajeUsuario { get; set; }

        public bool EjecutadaCorrectamente { get; set; }

        public string Mensaje { get; set; }

        public string Valor { get; set; }
    }
}
