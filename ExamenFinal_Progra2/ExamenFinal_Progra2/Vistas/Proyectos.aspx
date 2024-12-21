<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Master.Master" AutoEventWireup="true" CodeBehind="Proyectos.aspx.cs" Inherits="ExamenFinal_Progra2.Vistas.Empleados" %>
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
            <h2>Lista de Proyectos  </h2>

            <asp:GridView ID="GridViewProyectos" CssClass="grid-view" runat="server"></asp:GridView>

            <label for="IDProyectoTextBox">ID del Proyecto:</label>
            <asp:TextBox ID="IDProyectoTextBox" type="number" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="NombreProyectoTextBox">Nombre del Proyecto:</label>
            <asp:TextBox ID="NombreProyectoTextBox" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="DescripcionTextBox">Descripción del Proyecto:</label>
            <asp:TextBox ID="DescripcionTextBox" CssClass="input-field" runat="server" TextMode="MultiLine"></asp:TextBox>

            <label for="FechaInicioTextBox">Fecha de Inicio:</label>
            <asp:TextBox ID="FechaInicioTextBox" type="date" CssClass="input-field" runat="server"></asp:TextBox>

            <label for="FechaFinTextBox">Fecha de Finalización:</label>
            <asp:TextBox ID="FechaFinTextBox" type="date" CssClass="input-field" runat="server"></asp:TextBox>


            <asp:Button ID="AgregarProyecto" runat="server" CssClass="btn" Text="Agregar" OnClick="AgregarProyecto_Click" />
            <asp:Button ID="BorrarProyecto" runat="server" CssClass="btn" Text="Borrar" OnClick="BorrarProyecto_Click" />
        </div>
</asp:Content>