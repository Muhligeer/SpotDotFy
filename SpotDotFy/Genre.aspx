<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Genre.aspx.cs" Inherits="SpotDotFy.Genre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Inserir novo genero"></asp:Label>
    <br />
    <div class="row">
        <div class="col-12">
            <asp:Label ID="labelGenre" runat="server" Text="Genero"></asp:Label>
            <br />
            <asp:TextBox ID="txbGenre" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
        </div>
        <div class="col-12">
            <asp:Button ID="btInsert" runat="server" OnClick="btInsert_Click" Text="Inserir" CssClass="btn btn-primary" />
            <br />
        </div>
    </div>
    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Lista de generos"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="name" HeaderText="Genero" SortExpression="name" />
            <asp:BoundField DataField="created_at" HeaderText="Criado em" SortExpression="created_at" ReadOnly="True" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [genre] WHERE [Id] = @Id" InsertCommand="INSERT INTO [genre] ([name], [created_at]) VALUES (@name, @created_at)" SelectCommand="SELECT * FROM [genre]" UpdateCommand="UPDATE [genre] SET [name] = @name, [created_at] = @created_at WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="created_at" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="created_at" Type="DateTime" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
