<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Master.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="ExamenFinal_Progra2.Vistas.Empleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #808080;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .main-container {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: 15px auto;
            width: 90%;
            max-width: 1200px;
            text-align: center;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        .input-field {
            width: 100%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            text-align: left;
        }

        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
            padding: 8px;
        }
    </style>
            <div class="container">
            <h2>Lista de Empleados  </h2>

            <asp:GridView ID="GridViewEmpleados" CssClass="grid-view" runat="server"></asp:GridView>


            <label for="IDEmpleadosTextBox">ID del Empleado:</label>
            <asp:TextBox ID="IDEmpleadosTextBox" type="number" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="CarnetEmpleadoTextBox">Carnet del Empleado:</label>
            <asp:TextBox ID="CarnetEmpleadoTextBox" CssClass="input-field" runat="server"></asp:TextBox>
                
            <label for="NombreEmpleadoTextBox">Nombre del Empleado:</label>
            <asp:TextBox ID="NombreEmpleadoTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="FechaNacimientoTextBox">Fecha de Nacimiento:</label>
            <asp:TextBox ID="FechaNacimientoTextBox" type="date" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="CategoriaTextBox">Categoria del Empleado:</label>
            <asp:TextBox ID="CategoriaTextBox" CssClass="input-field" runat="server"></asp:TextBox>
                
            <label for="SalarioTextBox">Salario del empleado:</label> 
            <asp:TextBox ID="SalarioTextBox" type="number" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="DireccionEmpleadoTextBox">Direccion del Empleado:</label> 
            <asp:TextBox ID="DireccionEmpleadoTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="TelefonoTextBox">Telefono del Empleado:</label> 
            <asp:TextBox ID="TelefonoTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="CorreoEmpleadoTextBox">Correo del Empleado:</label> 
            <asp:TextBox ID="CorreoEmpleadoTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <asp:Button ID="AgregarEmpleado" runat="server" CssClass="btn" Text="Agregar" OnClick="AgregarEmpleado_Click" />
            <asp:Button ID="BorrarEmpleado" runat="server" CssClass="btn" Text="Borrar" OnClick="BorrarEmpleado_Click" />
        </div>
</asp:Content>
