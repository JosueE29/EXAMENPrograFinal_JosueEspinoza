using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ExamenFinal_Progra2.Logica { 
     public class ProyectosLogica { 

    public static int AgregarProyecto(int Id, string Nombre, string Descripcion, DateTime FechaInicio, DateTime FechaFin)
    {

        if (string.IsNullOrWhiteSpace(Nombre))
        {
            throw new ArgumentException("El nombre del proyecto es obligatorio.");
        }

        if (FechaInicio >= FechaFin)
        {
            throw new ArgumentException("La fecha de inicio debe ser anterior a la fecha de finalización.");
        }

        int retorno = 0;
        SqlConnection Conn = new SqlConnection();
        try
        {
            using (Conn = DBconn.obtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("AgregarProyectos", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.Add(new SqlParameter("@Id", Id));
                cmd.Parameters.Add(new SqlParameter("@Nombre", Nombre));
                cmd.Parameters.Add(new SqlParameter("@Descripcion", Descripcion));
                cmd.Parameters.Add(new SqlParameter("@FechaInicio", FechaInicio));
                cmd.Parameters.Add(new SqlParameter("@FechaFin", FechaFin));

                retorno = cmd.ExecuteNonQuery();
            }
        }
        catch (SqlException ex)
        {
            throw new Exception($"Error en la base de datos: {ex.Message}");
        }
        finally
        {
            Conn.Close();
        }

        return retorno;
    }

    public static int EliminarProyecto(int ProyectoID)
    {
        if (ProyectoID <= 0)
        {
            throw new ArgumentException("El ID del proyecto debe ser existente.");
        }

        int retorno = 0;
        SqlConnection Conn = new SqlConnection();

        try
        {
            using (Conn = DBconn.obtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("EliminarProyecto", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.Add(new SqlParameter("@Id", ProyectoID));

                retorno = cmd.ExecuteNonQuery();
            }
        }
        catch (SqlException ex)
        {
            throw new Exception($"Error en la base de datos: {ex.Message}");
        }
        finally
        {
            Conn.Close();
        }

        return retorno;
    }
}
}