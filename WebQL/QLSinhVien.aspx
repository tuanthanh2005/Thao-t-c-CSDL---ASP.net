<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQL.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản Lý SINH VIÊN</h2>
    <%--hr--%>
    <div class="table-responsive">
    <asp:GridView ID ="gvSinhVien" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" 
        DataSourceID="odsSinhVien" AllowPaging="True" PageSize="5"
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaSV">
        <Columns>
         
            <asp:BoundField DataField="MaSV" HeaderText="MaSV" SortExpression="MaSV" ReadOnly="true"/>
            <asp:BoundField DataField="HoSV" HeaderText="HoSV" SortExpression="HoSV" />
            <%--hạn chế khoảng cách khi sửa chỉnh controlstyle--%>
            <asp:BoundField DataField="TenSV" HeaderText="TenSV" SortExpression="TenSV" ControlStyle-Width="60px" />          
            <%--<asp:CheckBoxField DataField="GioiTinh" HeaderText="GioiTinh" SortExpression="GioiTinh" />--%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%# Convert.ToBoolean(Eval("GioiTinh"))==true?"Nam":"Nữ" %>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="DiaChi" HeaderText="DiaChi" SortExpression="DiaChi" />
            <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" />
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button"
                EditText="Sửa" DeleteText="Xóa" ItemStyle-Wrap="false"/>
        </Columns>

        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <%--liên kết css--%>
     <PagerStyle CssClass ="pagination-ys" HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099" />

        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
        <asp:ObjectDataSource ID="odsSinhVien" runat="server" SelectMethod="getAll" TypeName="WebQL.Models.SinhVienDAO"
            DataObjectTypeName="WebQLDaoTao.Models.SinhVien"
            UpdateMethod="Update" 
            DeleteMethod="Delete">
        </asp:ObjectDataSource>

    </div> 
    <%--responsive để hiển thị thanh kéo ngang--%>
</asp:Content>

