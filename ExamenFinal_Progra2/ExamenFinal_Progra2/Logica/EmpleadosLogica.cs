using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ExamenFinal_Progra2.Logica
{
    public class EmpleadosLogica
    {
        public static int AgregarEmpleado(string NumeroCarnet, string Nombre, DateTime FechaNacimiento, string Categoria, int Salario, string Direccion, string Telefono, string Correo)
        {
            int retorno = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AgregarEmpleados", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@NumeroCarnet", NumeroCarnet));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@FechaNacimiento", FechaNacimiento));
                    cmd.Parameters.Add(new SqlParameter("@Categoria", Categoria));
                    cmd.Parameters.Add(new SqlParameter("@Salario", Salario));
                    cmd.Parameters.Add(new SqlParameter("@Direccion", Direccion));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", Telefono));
                    cmd.Parameters.Add(new SqlParameter("@Correo", Correo));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                retorno = 0;
                throw new Exception($"Error en la base de datos: {ex.Message}");
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
        public static int BorrarEmpleado(int EmpleadoID)
        {
            int retorno = 0;
            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BorrarEmpleado", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@Id", EmpleadoID));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                retorno = 0;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
    }
}
