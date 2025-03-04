<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQL.QLSinhVien" %>

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
        <div id="addForm" style="display: none;">
            <h4>THÊM MỚI MÔN HỌC</h4>
            <hr>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-2">Mã sinh viên</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Họ sinh viên</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtHoSv" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <label class="control-label col-md-2">Tên sinh viên</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                  <div class="form-group">
                    <label class="control-label col-md-2">Giới tính</label>
                    <div class="col-md-4">
                        <asp:RadioButton ID="rdNam" runat="server" Text="Nam" CssClass="radio-inline" Checked="true"
                            GroupName="GT" />
                        <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" CssClass="radio-inline" GroupName="GT" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Ngày sinh</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtNgaysinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                    </div>
                    <label class="control-label col-md-2">Nơi sinh</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Địa chỉ</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Chọn khoa</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlMaKhoa" runat="server" DataSourceID="odsKhoa" DataValueField="makh" DataTextField="tenkh" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2"></label>
                    <div class="col-md-4">
                        <asp:Button ID="btThem" runat="server" Text="Thêm Mới" CssClass="btn btn-success" OnClick="btThem_Click" />
                    </div>
                </div>
            </div>
        </div>


        <div class="table-responsive">
            <asp:GridView ID="gvSinhVien" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False"
                DataSourceID="odsSinhVien" AllowPaging="True" PageSize="5"
                BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaSV">
                <Columns>

                    <asp:BoundField DataField="MaSV" HeaderText="MaSV" SortExpression="MaSV" ReadOnly="true" />
                    <asp:BoundField DataField="HoSV" HeaderText="HoSV" SortExpression="HoSV" />
                    <%--hạn chế khoảng cách khi sửa chỉnh controlstyle--%>
                    <asp:BoundField DataField="TenSV" HeaderText="TenSV" SortExpression="TenSV" ControlStyle-Width="60px" />
                    <%--<asp:CheckBoxField DataField="GioiTinh" HeaderText="GioiTinh" SortExpression="GioiTinh" />--%>
                    <asp:TemplateField HeaderText="Phái">
                        <ItemTemplate>
                            <%# Convert.ToBoolean(Eval("GioiTinh"))==true?"Nam":"Nữ" %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="ckphai" runat="server" Checked='<%# Bind("gioitinh") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh" SortExpression="NoiSinh" />
                    <asp:BoundField DataField="DiaChi" HeaderText="DiaChi" SortExpression="DiaChi" />
                    <%--<asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" />--%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%# Eval("Makh") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlKhoa" runat="server" DataSourceID="odsKhoa" DataTextField="TenKh" DataValueField="MaKh"
                                SelectedValue ='<%# Bind("MaKH") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
               
                    
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button"
                        EditText="Sửa" DeleteText="Xóa" ItemStyle-Wrap="false" />
                </Columns>

                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <%--liên kết css--%>
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099" />

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
                DeleteMethod="Delete"></asp:ObjectDataSource>

        </div>
        <asp:ObjectDataSource ID="odsKhoa" runat="server" SelectMethod="getAll" TypeName="WebQL.Models.KhoaDAO" DataObjectTypeName="WebQL.Models.Khoa" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"></asp:ObjectDataSource>
        <%--responsive để hiển thị thanh kéo ngang--%>
</asp:Content>
