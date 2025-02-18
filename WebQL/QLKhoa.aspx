<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQL.QLKhoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function showAddForm() {
            var form = document.getElementById('addForm');
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h2>QUẢN LÝ MÔN HỌC</h2>
<hr />
<div>
     <%-- Nút Thêm --%>
    <asp:Button ID="btShowForm" runat="server" Text="Thêm" CssClass="btn btn-info" OnClientClick="showAddForm(); return false;" OnClick="btShowForm_Click" />
    
    <%-- Form thêm môn học --%>
    <div id="addForm" style="display:none;">
        <h4>THÊM MỚI MÔN HỌC</h4>
        <hr>
        <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2">Mã môn:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtMaMH" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Tên môn</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTenMH" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="btThem" runat="server" Text="Thêm" CssClass="btn btn-info" OnClick="btShowForm_Click" />
                </div>
            </div>
            <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server" Text=""></asp:Label>
        </div>
    </div>
    
    
    
    <asp:GridView ID="gvKhoa" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="odsKhoa" DataKeyName="MaKH">
        <Columns>
            <asp:BoundField DataField="MaKH" HeaderText="Mã Khoa" ReadOnly="True"/>
            <asp:BoundField DataField="TenKH" HeaderText="Tên Khoa" />
            <asp:CommandField HeaderText="Chọn Tác Vụ" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsKhoa" runat="server"
        SelectMethod="getAll"
        TypeName="WebQL.Models.KhoaDAO"
        DataObjectTypeName="WebQL.Models.Khoa"
        UpdateMethod="Update" 
        DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="makh" Type="String" />
        </DeleteParameters>
    </asp:ObjectDataSource>

</asp:Content>
