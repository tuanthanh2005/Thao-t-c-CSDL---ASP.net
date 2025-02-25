﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLMonHoc.aspx.cs" Inherits="WebQL.QLMonHoc" %>

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
        <asp:Button ID="btShowForm" runat="server" Text="Thêm" CssClass="btn btn-info" OnClientClick="showAddForm(); return false;" />
        
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
                    <label class="control-label col-sm-2">Số tiết</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtSoTiet" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button ID="btThem" runat="server" Text="Thêm" CssClass="btn btn-info" OnClick="btThem_Click" />
                    </div>
                </div>
                <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <%--hiển thị dữ liệu--%>


          <asp:GridView ID="gvMonhoc" runat="server" AutoGenerateColumns="False"
            OnRowCancelingEdit="gvMonhoc_RowCancelingEdit" OnRowEditing="gvMonhoc_RowEditing" OnSelectedIndexChanged="gvMonhoc_SelectedIndexChanged"
            OnSelectedIndexChanging="gvMonhoc_SelectedIndexChanging" DataKeyNames="MaMH" OnRowUpdating="gvMonhoc_RowUpdating" OnRowDeleting="gvMonhoc_RowDeleting" AllowPaging="True" PageSize="2" OnPageIndexChanging="gvMonhoc_PageIndexChanging1">
            <AlternatingRowStyle CssClass="table table-bordered" />

              <%--AutoGenerateColumns="False" ko sản sinh ra cột--%> 
            <Columns>
                <asp:BoundField HeaderText="Mã môn học" DataField="MaMH" />
                <asp:BoundField HeaderText="Tên môn học" DataField="TenMH" />
                <asp:BoundField HeaderText="Số tiết" DataField="SoTiet" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowDeleteButton="true" />

            </Columns>
                    <PagerStyle CssClass ="pagination-ys" HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099" />


        </asp:GridView>
    </div>
    <sorteddescendingheaderstyle backcolor="#6F8DAE" />
</asp:Content>