using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenFinal_Progra2.Modelo
{
    public class EmpleadosCLS
    {
        public int Id { get; set; }
        public string NumeroCarnet { get; set; }
        public string Nombre { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Categoria { get; set; }
        public int Salario { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
    }
}