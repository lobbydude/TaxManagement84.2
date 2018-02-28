<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Order_Search.aspx.cs" Inherits="Admin_Order_Search" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  
          <table style="width: 100%">
        <tr>
            <td>
                <div id="content">
                <span class="WebFont1" >Search Orders</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server"  align="center" style="height:100%; width:100%;" class="DivContentBody">
                  


                               
                 <table align="center" style="width:95%; height:400px;" >
                          
                                 
                                    <tr>
                                        <td align="left"  
                                            valign="top">
                                        
                                            <table style="width:50%">
                                                <tr>
                                                    <td style="width: 150px">
                                                        <asp:Label ID="Label11" runat="server" CssClass="Label" Font-Size="14px" 
                                                            Text="Enter Order Number"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_Order_Number" runat="server" CssClass="searchText" 
                                                            TabIndex="1" AutoPostBack="True" placeholder="Search here..."
                                                            ontextchanged="txt_Order_Number_TextChanged"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btn_Search" runat="server" 
                                                              CssClass="WebButton"    onclick="btn_Update_Click" 
                                                            Text="Search" Visible="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                          
                                        </td>
                                    </tr>
                                 
                                    
                                  
                                    <tr>
                                        <td align="left" style=" height:100%;" valign="top">
                                         
                                                <asp:GridView ID="grd_Assigned_Orders" runat="server" 
                                                AutoGenerateColumns="False"   HorizontalAlign="Center" 
                  AllowPaging="True"   CssClass="name" CellPadding="4" Height="30px" 
                                                     GridLines="None" onselectedindexchanged="grd_Assigned_Orders_SelectedIndexChanged" 
                                                    ShowHeaderWhenEmpty="True" Width="100%" 
                                                    onrowdatabound="grd_Assigned_Orders_RowDataBound">
                                                    
                                                    <Columns>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                      
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="DRN Order" SortExpression="Order_Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Number" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Order_Number") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                              <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Client Order" SortExpression="Order_Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblClientOrder_Number" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Order_Number") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Batch Id" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblbatchid" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("STATECOUNTY") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Location">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Location" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Status" SortExpression="Order_Status">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Order_Status" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                      <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="User Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUser_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("User_Name") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Date" SortExpression="Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDate" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Document" SortExpression="Date">
                                                            <ItemTemplate>
                                                                <asp:ImageButton 
            ID="imgbtndoc" runat="server" CommandName="Select"  Height="24px" 
            OnClientClick="return PostToNewWindow();"  ImageUrl="~/img/DownloadLink.png"
            Width="30px" />
                                                                    <asp:Label  ID="lbl_order_doc_path" runat="server" CssClass="Label" Text='<%#Eval("Document_Path") %>' Visible="false">
            </asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="24px" />
                                                        </asp:TemplateField>
                                                    </Columns>
<EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <FooterStyle BackColor="#cccccc"  ForeColor="White" Font-Bold="True"/>
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
            
               </div>
                  
               </td>
        </tr>
    </table>
  
</asp:Content>



