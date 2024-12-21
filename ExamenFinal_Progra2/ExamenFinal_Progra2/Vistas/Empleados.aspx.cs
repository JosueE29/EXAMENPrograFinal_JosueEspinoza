using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal_Progra2.Vistas
{
    //Josue Espinoza Castillo
    //Cedula 3-0561-0426
    //Examen FInal Progra
    //Prof.Alexander Curling
    public partial class Empleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Agregamos un PostBack para evitar problemas y asegurarnos que la mayoria de funciones inicien en al iniciar pagina y la primera vez
            {
                LlenarGridEmpleados();
            }
        }

        protected void LlenarGridEmpleados()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Empleados", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridViewEmpleados.DataSource = dt;
                            GridViewEmpleados.DataBind();
                        }
                    }
                }
            }
        }
        protected void AgregarEmpleado_Click(object sender, EventArgs e)
        {
            //Realizazmos las validaciones agregando un .Trim para eliminar los epsacios enm blanco que pueda
            //tener el textbox tanto al inicio como al final para evitar errores.
            string numeroCarnet = CarnetEmpleadoTextBox.Text.Trim();
            string nombre = NombreEmpleadoTextBox.Text.Trim();
            DateTime fechaNacimiento;
            string categoria = CategoriaTextBox.Text.Trim();
            int salario;
            string direccion = DireccionEmpleadoTextBox.Text.Trim();
            string telefono = TelefonoTextBox.Text.Trim();
            string correo = CorreoEmpleadoTextBox.Text.Trim();

            //Realizamos validaciones para evitar que hayan null o espacios en blanco
            if (string.IsNullOrWhiteSpace(numeroCarnet) || string.IsNullOrWhiteSpace(nombre) ||
                string.IsNullOrWhiteSpace(categoria) || string.IsNullOrWhiteSpace(direccion) ||
                string.IsNullOrWhiteSpace(telefono) || string.IsNullOrWhiteSpace(correo))
            {
                Response.Write("<script>alert('Todos los campos son obligatorios.');</script>");
                return;
            }

            if (!DateTime.TryParse(FechaNacimientoTextBox.Text, out fechaNacimiento))
            {
                Response.Write("<script>alert('Ingrese una fecha de nacimiento válida.');</script>");
                return;
            }

            // Realizamos la validacion de la edad ya que ocupamos que el Empleado sea mayor de 18
            //Realizando una resta del año de nacimiento con el año actual si esta es menor de 18 mandara la alerta
            int edad = DateTime.Now.Year - fechaNacimiento.Year;
            if (fechaNacimiento > DateTime.Now.AddYears(-edad)) edad--;

            if (edad < 18)
            {
                Response.Write("<script>alert('El empleado debe tener al menos 18 años.');</script>");
                return;
            }

            if (!int.TryParse(SalarioTextBox.Text, out salario) || salario < 250000 || salario > 500000)
            {
                Response.Write("<script>alert('El salario debe estar entre 250,000 y 500,000.');</script>");
                return;
            }

            // Lógica para agregar empleado
            try
            {
                int resultado = Logica.EmpleadosLogica.AgregarEmpleado(
                    numeroCarnet, nombre, fechaNacimiento, categoria, salario, direccion, telefono, correo);

                if (resultado > 0)
                {
                    Response.Write("<script>alert('Empleado agregado exitosamente.');</script>");
                    LlenarGridEmpleados();
                    LimpiarCampos();
                }
                else
                {
                    Response.Write("<script>alert('Ocurrió un error al agregar el empleado. Verifique los datos.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        protected void BorrarEmpleado_Click(object sender, EventArgs e)
        {
            int empleadoId;

            if (!int.TryParse(IDEmpleadosTextBox.Text, out empleadoId))
            {
                Response.Write("<script>alert('El ID del empleado debe ser un número válido.');</script>");
                return;
            }

            try
            {
                int resultado = Logica.EmpleadosLogica.BorrarEmpleado(empleadoId);

                if (resultado > 0)
                {
                    Response.Write("<script>alert('Empleado eliminado exitosamente.');</script>");
                    LlenarGridEmpleados();
                    IDEmpleadosTextBox.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('No se encontró un empleado con el ID especificado.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        //Creamos una clase con el objetivo de limpiar los textbox una vez lo requiramos
        private void LimpiarCampos()
        {
            IDEmpleadosTextBox.Text = "";
            CarnetEmpleadoTextBox.Text = "";
            NombreEmpleadoTextBox.Text = "";
            FechaNacimientoTextBox.Text = "";
            CategoriaTextBox.Text = "";
            SalarioTextBox.Text = "";
            DireccionEmpleadoTextBox.Text = "";
            TelefonoTextBox.Text = "";
            CorreoEmpleadoTextBox.Text = "";
        }
    }
}
