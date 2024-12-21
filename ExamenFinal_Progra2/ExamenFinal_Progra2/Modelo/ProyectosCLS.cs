using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenFinal_Progra2.Modelo
{
    public class ProyectosCLS
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string NombreProyecto { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
    }
}