<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Client_Prod_Report.aspx.cs" Inherits="Client_Prod_Report" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">
        function show()
        {
              document.write("<head id="Head1" runat='server'></head>");
        }

        
</script>

    <div id="DivNewcreate" class="DivContentBody" runat="server" align="center" style="height:100%; width:100%;">
<%--    <asp:UpdatePanel ID="Up_1" runat="server" UpdateMode="Always"><ContentTemplate>--%>
    <table style="width: 100%">

        <tr>
            <td>
                      <div id="Div1">
                <span class="WebFont1">Production Report</span>
                  
               </div></td>
        </tr>
        <tr>
            <td  align="center" style="height: 23px">
            <asp:UpdatePanel ID="upreport" runat="server" UpdateMode="Always"><ContentTemplate>
                <table>
                    <tr align="center">
                    <td>
                      <asp:RadioButton ID="rdo_Pending" runat="server" AutoPostBack="True" 
                                               CssClass="radio" Font-Bold="False" Font-Names="Segoe UI" 
                                               Font-Size="13px" oncheckedchanged="rdo_Pending_CheckedChanged" 
                                               TabIndex="1" Text="Pending" Width="150px" />
                    </td>
                    <td>
                      <asp:RadioButton ID="rbtn_Completed" runat="server" AutoPostBack="True" 
                                               CssClass="radio" Font-Bold="False" Font-Names="Segoe UI" 
                                               Font-Size="13px" oncheckedchanged="rbtn_Completed_CheckedChanged" 
                                               TabIndex="1" Text="Completed" Width="150px" />
                    </td>
                        <td align="center">
          
                                         
                                           <asp:RadioButton ID="rbtn_All" runat="server" AutoPostBack="True" 
                                               CssClass="radio" Font-Bold="False" Font-Names="Segoe UI" 
                                               Font-Size="13px" oncheckedchanged="rbtn_All_CheckedChanged" 
                                               TabIndex="1" Text="All" Width="150px" />
                           
                        </td>
                      <td></td>
                    </tr>
                    <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" CssClass="Label" Text="From Date"></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" CssClass="Label" Text="To Date"></asp:Label>
                    </td>
                    <td></td>
                    </tr>
                    <tr align="center">
                        <td align="left">
                            <asp:TextBox ID="txt_From_Date" runat="server" CssClass="textbox" TabIndex="1" 
                                Width="150px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="txt_From_Date_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                TargetControlID="txt_From_Date" ValidChars="_/">
                            </cc1:FilteredTextBoxExtender>
                            <cc1:CalendarExtender ID="txt_From_Date_CalendarExtender" runat="server" 
                                CssClass="sample" Enabled="True" Format="dd/MM/yyyy" 
                                TargetControlID="txt_From_Date">
                            </cc1:CalendarExtender>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="left">
                            <asp:TextBox ID="txt_Todate" runat="server" CssClass="textbox" TabIndex="1" 
                                Width="150px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="txt_Todate_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                TargetControlID="txt_Todate" ValidChars="_/">
                            </cc1:FilteredTextBoxExtender>
                            <cc1:CalendarExtender ID="txt_Todate_CalendarExtender" runat="server" 
                                CssClass="sample" Enabled="True" Format="dd/MM/yyyy" 
                                TargetControlID="txt_Todate">
                            </cc1:CalendarExtender>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
              
                    <tr>
                        <td align="center" colspan="4">
                            &nbsp;</td>
                      
                    </tr>
                </table>
                </ContentTemplate></asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td align="center">
<asp:Button ID="btn_Submit" runat="server" CssClass="WebButton"  Text="Submit" 
        onclick="btn_Submit_Click" TabIndex="4" Width="61px" />

<asp:Button ID="btn_Clear" runat="server" CssClass="WebButton"  Text="Clear" 
        onclick="btn_Clear_Click" TabIndex="4" />
<asp:Button ID="btn_Export" runat="server" CssClass="WebButton"  Text="Export" 
        TabIndex="5" onclick="btn_Export_Click" />
                                         </td>
        </tr>
        <tr>
            <td>
                        <asp:GridView ID="grd_Orders" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" 
                    CellPadding="4" CssClass="name" GridLines="None" 
                                                    ShowHeaderWhenEmpty="True" Width="100%" AllowPaging="True" 
                                                    onpageindexchanging="grd_Orders_PageIndexChanging" 
                                                    onrowcommand="grd_Orders_RowCommand" 
                    PageSize="50" onrowdatabound="grd_Orders_RowDataBound">
                                                    
                                                    <Columns>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_id" runat="server" 
                                                                    Text='<%#Eval("Order_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle" Height="50px"   HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"  HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                     
                                                      
                                                              <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Order Number">
                                                            <ItemTemplate>
                                                              <asp:Button ID="btn_ClientOrder_Number" runat="server" TabIndex="23" CommandName="EditDetails" Width="150px" Height="28px" CssClass="GridButton" Text='<%# Eval("Client_Order_Number") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px"  VerticalAlign="Middle"/>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Customer" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomer" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Sub Process" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubProcess" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Sub_ProcessName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px"  
                                                                VerticalAlign="Middle"/>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Fields" Visible="False" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Borrower_Addres" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Barrower_Address") %>'></asp:Label>
                                                                       <asp:Label ID="lbl_Borrower_Name" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Borrower_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px"  
                                                                VerticalAlign="Middle"/>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Recived Date" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDate" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" Width="150px" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px" />
                                                        </asp:TemplateField>

                                                         <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="State" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblState" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("State_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                           <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="County" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCounty" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("County_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                           <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Order Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Product_Type" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Product_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" Width="150px" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Source Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Location" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" Width="150px" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Task" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Order_task" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Task") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Status">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Order_Status" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                            </ItemTemplate>
                                                           <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                      <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="User Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUser_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("User_Name") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" Width="200px"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="200px" />
                                                        </asp:TemplateField>
                                                      
                                                      

                                                    </Columns>
                                                    <EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <FooterStyle BackColor="#cccccc"  ForeColor="White" Font-Bold="True"/>
                                       <HeaderStyle BackColor="#ccc" />
                                       <PagerStyle CssClass="PagerStyle" HorizontalAlign="Center" />
                                       <SelectedRowStyle CssClass="SelectedRowStyle" Font-Bold="True" ForeColor="White" />
                                       <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                       <SortedAscendingHeaderStyle BackColor="#808080" />
                                       <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                       <SortedDescendingHeaderStyle BackColor="#383838" />

                                                </asp:GridView>
                                                
                                                
                                                </td>
        </tr>
    </table>
 <%--   </ContentTemplate></asp:UpdatePanel>--%>
    </div>
</asp:Content>

