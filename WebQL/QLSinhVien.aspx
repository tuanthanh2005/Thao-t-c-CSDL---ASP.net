<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQL.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản Lý SINH VIÊN</h2>
    <%--hr--%>
    <asp:GridView ID ="gvSinhVien" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False"  DataSourceID="odsSinhVien" AllowPaging="True" PageSize="5" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
         
            <asp:BoundField DataField="MaSV" HeaderText="MaSV" SortExpression="MaSV" />
            <asp:BoundField DataField="HoSV" HeaderText="HoSV" SortExpression="HoSV" />
            <asp:BoundField DataField="TenSV" HeaderText="TenSV" SortExpression="TenSV" />
            <asp:CheckBoxField DataField="GioiTinh" HeaderText="GioiTinh" SortExpression="GioiTinh" />
            <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" />
            <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="DiaChi" HeaderText="DiaChi" SortExpression="DiaChi" />
            <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" />
         
        </Columns>

        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />

     <PagerStyle CssClass ="pagination-ys" HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
        <asp:ObjectDataSource ID="odsSinhVien" runat="server" SelectMethod="getAll" TypeName="WebQL.Models.SinhVienDAO"></asp:ObjectDataSource>

</asp:Content>

