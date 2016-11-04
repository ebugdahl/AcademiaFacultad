﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Alumnos.aspx.cs" Inherits="Alumnos" MasterPageFile="Site.master"%>

<asp:Content ID="AlumnosContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsAlumnos">
        <Columns>
            <asp:BoundField DataField="IdPlan" HeaderText="IdPlan" SortExpression="IdPlan" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="Legajo" HeaderText="Legajo" SortExpression="Legajo" />
            <asp:BoundField DataField="FechaNacimiento" HeaderText="FechaNacimiento" SortExpression="FechaNacimiento" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsAlumnos" runat="server" SelectMethod="GetAll" TypeName="Data.Database.AlumnoAdapter"></asp:ObjectDataSource>
    <asp:Panel ID="gridActionsPanel" runat="server">
        <asp:LinkButton ID="nuevoLinkButton" runat="server" OnClick="nuevoLinkButton_Click" >Nuevo</asp:LinkButton>
        <asp:LinkButton ID="editarLinkButton" runat="server" >Editar</asp:LinkButton>
        <asp:LinkButton ID="eliminarLinkButton" runat="server" >Eliminar</asp:LinkButton>
    </asp:Panel>
    <asp:Panel ID="formPanel" Visible="false" runat="server">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        <br />
            <asp:Label ID="lblApellido" runat="server" Text="Apellido: "></asp:Label>
            <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
        <br />
             <asp:Label ID="lblDireccion" runat="server" Text="Dirección: "></asp:Label>
            <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
        <br />
            <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono: "></asp:Label>
            <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
         <br />
            <asp:Label ID="lblFecNac" runat="server" Text="Fecha de Nacimiento: "></asp:Label>        
            <asp:TextBox ID="txtFecNac" runat="server" type="datetime-local"></asp:TextBox>        
        <br />
        <asp:Label ID="lblLegajo" runat="server" Text="Legajo: "></asp:Label>
        <asp:TextBox ID="txtLegajo" runat="server"></asp:TextBox>      
        <br />      
            <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
            <asp:DropDownList ID="cbEspecialidad" runat="server" DataSourceID="odsEspecialidades" DataTextField="Descripcion" DataValueField="Descripcion" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="odsEspecialidades" runat="server" SelectMethod="GetAll" TypeName="Data.Database.EspecialidadAdapter"></asp:ObjectDataSource>
        <br />            
            <asp:Label ID="lblPlan" runat="server" Text="Plan:"></asp:Label>
            <asp:DropDownList ID="cbPlan" runat="server">
            </asp:DropDownList>
        <br />
        <asp:Label ID="lblTipoUsuario" runat="server" Text="Tipo Usuario:"></asp:Label>
            <asp:DropDownList ID="cbTipoPersona" runat="server">
                <asp:ListItem Value="alumno">Alumno</asp:ListItem>
                <asp:ListItem Value="docente">Docente</asp:ListItem>
                <asp:ListItem Value="admin">Administrador</asp:ListItem>
            </asp:DropDownList>
        <br />
        <asp:Panel ID="formActionsPanel" runat="server">
            <asp:LinkButton ID="aceptarLinkButton" runat="server" OnClick="aceptarLinkButton_Click">Aceptar</asp:LinkButton>
            <asp:LinkButton ID="cancelarLinkButton" runat="server" >Cancelar</asp:LinkButton>
        </asp:Panel>
    </asp:Panel>



</asp:Content>