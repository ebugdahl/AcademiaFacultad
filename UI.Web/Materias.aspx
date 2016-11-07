﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Materias.aspx.cs" Inherits="Materias" MasterPageFile="Site.master"%>

<asp:Content ID="materiasContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">





    <asp:GridView ID="dgvMaterias" runat="server" AutoGenerateColumns="False" DataSourceID="obsMaterias"
        SelectedRowStyle-BackColor="Black"
        SelectedRowStyle-ForeColor="White" OnSelectedIndexChanged="dgvMaterias_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
            <asp:BoundField DataField="HsSemanales" HeaderText="Hs Semanales" SortExpression="HsSemanales" />
            <asp:BoundField DataField="HsTotales" HeaderText="Hs Totales" SortExpression="HsTotales" />
            <asp:BoundField DataField="IdPlan" HeaderText="IdPlan" SortExpression="IdPlan" Visible="False" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" Visible="False" />
            <asp:CommandField SelectText="Seleccionar" ShowSelectButton="true" />
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="obsMaterias" runat="server" SelectMethod="GetAll" TypeName="Data.Database.MateriaAdapter"></asp:ObjectDataSource>
    <asp:Panel ID="gridActionsPanel" runat="server">
        <asp:LinkButton ID="nuevoLinkButton" runat="server" OnClick="nuevoLinkButton_Click" >Nuevo</asp:LinkButton>
        <asp:LinkButton ID="editarLinkButton" runat="server" OnClick="editarLinkButton_Click" >Editar</asp:LinkButton>
        <asp:LinkButton ID="eliminarLinkButton" runat="server" OnClick="eliminarLinkButton_Click" >Eliminar</asp:LinkButton>        
    </asp:Panel>






    <asp:Panel ID="panelABM" runat="server" Visible="False">
        <asp:Label ID="Label1" runat="server" Text="Descripcion: "></asp:Label>
        <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Horas Semanales: "></asp:Label>
        <asp:TextBox ID="txtHorasSemales" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Horas Totales:"></asp:Label>
        <asp:TextBox ID="txtHorasTotales" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Plan:"></asp:Label>

        <asp:DropDownList ID="cbPlanes" runat="server" DataSourceID="obsPlanes" DataTextField="Descripcion" DataValueField="Descripcion">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="obsPlanes" runat="server" SelectMethod="GetAll" TypeName="Data.Database.PlanAdapter"></asp:ObjectDataSource>

    </asp:Panel>

    <asp:Panel ID="formActionsPanel" runat="server">
            <asp:LinkButton ID="aceptarLinkButton" runat="server" OnClick="aceptarLinkButton_Click">Aceptar</asp:LinkButton>
            <asp:LinkButton ID="cancelarLinkButton" runat="server" OnClick="cancelarLinkButton_Click">Cancelar</asp:LinkButton>
    </asp:Panel>





</asp:Content>


