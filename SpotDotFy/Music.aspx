<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Music.aspx.cs" Inherits="SpotDotFy.Music" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" Font-Size="Large" runat="server" Text="Selecione o album"></asp:Label>
    </p>
    <p>
        <asp:ListBox ID="lbAlbum" runat="server" DataSourceID="SqlAlbum" DataTextField="album_title" DataValueField="Id" ItemType="int" CssClass="form-control"></asp:ListBox>
        <asp:SqlDataSource ID="SqlAlbum" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [album]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Selecionar" CssClass="btn btn-primary" />
    </p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="music_nameLabel" runat="server" Text='<%# Eval("music_name") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #000000;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="music_nameTextBox" runat="server" Text='<%# Bind("music_name") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>Nenhum dado foi retornado.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Inserir" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Limpar" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="music_nameTextBox" runat="server" Text='<%# Bind("music_name") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="music_nameLabel" runat="server" Text='<%# Eval("music_name") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" class="table">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="table" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#990000;color: #FFFFFF;">
                                    <th runat="server" ></th>
                                    <th runat="server">Id</th>
                                    <th runat="server">music_name</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="music_nameLabel" runat="server" Text='<%# Eval("music_name") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [music] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [music] ([music_name], [album_id]) VALUES (@music_name, @sql)" 
            SelectCommand="SELECT * FROM [music] WHERE album_id = @sql" 
            UpdateCommand="UPDATE [music] SET [music_name] = @music_name, [album_id] = @sql WHERE [Id] = @Id">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbAlbum" Type="Int32" PropertyName="SelectedValue" Name="sql" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="music_name" Type="String" />
                <asp:Parameter Name="album_id" Type="Int32" />
                <asp:ControlParameter ControlID="lbAlbum" Type="Int32" PropertyName="SelectedValue" Name="sql" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="music_name" Type="String" />
                <asp:Parameter Name="album_id" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:ControlParameter ControlID="lbAlbum" Type="Int32" PropertyName="SelectedValue" Name="sql" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlMusic" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [music] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [music] ([music_name], [album_id]) VALUES (@name, @album_id)" 
            SelectCommand="SELECT * FROM [music] WHERE album_id = @sql" 
            UpdateCommand="UPDATE [music] SET [music_name] = @name, [album_id] = @album_id WHERE [Id] = @Id">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbAlbum" Type="Int32" PropertyName="SelectedValue" Name="sql" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="album_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="album_id" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
