<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="SpotDotFy.Album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Inserir novo album"></asp:Label>
    <br />
    <div class="row">
        <div class="col-6">
            <asp:Label ID="Label3" runat="server" Text="Titulo do album"></asp:Label>
            <br />
            <asp:TextBox ID="txbTitle" runat="server" Width="206px" CssClass="form-control"></asp:TextBox>
            <br />
        </div>
        <div class="col-6">
            <asp:Label ID="Label5" runat="server" Text="Nome do artista"></asp:Label>
            <br />
            <asp:TextBox ID="txbArtist" runat="server" Width="207px" CssClass="form-control"></asp:TextBox>
            <br />
        </div>
        <div class="col-6">
            <asp:Label ID="Label4" runat="server" Text="Data de lançamento"></asp:Label>
            <asp:Calendar ID="cldRelease" runat="server"></asp:Calendar>
        </div>
        <div class="col-6">
            <asp:Label ID="Label6" runat="server" Text="Genero"></asp:Label>
            <br />
            <asp:ListBox ID="lsbGenre" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Id" CssClass="form-control"></asp:ListBox>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [genre]"></asp:SqlDataSource>
        <br />
        <div class="col-6">
            <asp:Button ID="btInsert" runat="server" OnClick="btInsert_Click" Text="Inserir" CssClass="btn btn-primary"/>
            <br />
        </div>
    </div>
    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Lista de albuns"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource" AllowCustomPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <%--<asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />--%>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="album_title" HeaderText="Titulo do Album" SortExpression="album_title" />
            <asp:BoundField DataField="release_date" HeaderText="Data de lançamento" SortExpression="release_date" />
            <asp:BoundField DataField="artist_name" HeaderText="Nome do Artista" SortExpression="artist_name" />
            <asp:TemplateField HeaderText = "Genero" SortExpression="name">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlname" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Id">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="name" runat="server" Text='<%# Bind("name") %>' />
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [album] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [album] ([album_title], [release_date], [artist_name], [genre_id]) VALUES (@album_title, @release_date, @artist_name, @genre_id)" 
        SelectCommand="SELECT album.Id, album.album_title, album.release_date, album.artist_name, album.genre_id, genre.name FROM [album] INNER JOIN genre ON [album].genre_id = genre.Id" 
        UpdateCommand="UPDATE [album] SET [album_title] = @album_title, [release_date] = @release_date, [artist_name] = @artist_name, [genre_id] = @genre_id WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="album_title" Type="String" />
            <asp:Parameter Name="release_date" Type="DateTime" />
            <asp:Parameter Name="artist_name" Type="String" />
            <asp:ControlParameter Name="genre_id" ControlID="ddlname" PropertyName="DataValueField" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="album_title" Type="String" />
            <asp:Parameter Name="release_date" Type="DateTime" />
            <asp:Parameter Name="artist_name" Type="String" />
            <asp:ControlParameter Name="genre_id" ControlID="ddlname" PropertyName="DataValueField" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [genre]"></asp:SqlDataSource>
</asp:Content>
