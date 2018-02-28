<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="QualityQue.aspx.cs" Inherits="Admin_Web_Call_Order_Research" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:UpdatePanel ID="uporder" runat="server" UpdateMode="Always"><ContentTemplate>
          <table style="width: 100%">
        <tr>
            <td>
                <div id="content">
                <span class="WebFont1">Quality Check Queue</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server"  align="center" style="height:100%; width:100%;" class="DivContentBody">
                  


                               
                 <table align="center" style="width:90%; height:800px;" >
                          
                                            <tr>
                                        <td   colspan="2" align="center">
                                              
                                              <table style="width:25%">
                                                  <tr>
                                                      <td align="center">
                                                          <asp:Button ID="btn_My_Order" runat="server" Height="40"
                                                              CssClass="WebButton" onclick="btn_My_Order_Click" />
                                                      </td>
                                                      <td align="center">
                                                          <asp:Button ID="btn_User_Order" runat="server" Height="40" 
                                                              CssClass="WebButton" onclick="btn_User_Order_Click" />
                                                      </td>
                                                  </tr>
                                              </table>
                                          </td>
                                        
                                    </tr>
                            
                           
                                    <tr>
                                        <td   align="left">
                                              <table style="width:100%;">
                                              <tr>
                                              <td>  <asp:Label ID="lblassign" runat="server" CssClass="AdminHeader" Font-Bold="true" Text="Assigned Orders"></asp:Label></td>
                                              <td align="right">
                                                <asp:TextBox ID="txt_Search_By" runat="server" AutoPostBack="true" Columns="1" 
                                                              CssClass="searchText" Height="30px" ontextchanged="txt_Search_By_TextChanged" 
                                                              placeholder="Search here..." TabIndex="4"></asp:TextBox>
                                              </td>
                                              </tr>
                                              </table>
                                            
                                          </td>
                                        
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="2" style=" height:350px;" 
                                            valign="top">
                                            <div ID="digrd" style="overflow:scroll; height:100%;">
                                            <asp:GridView ID="grd_Assigned_Orders" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" CssClass="name" Font-Size="Medium" 
                                                    ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" 
                                                    Width="100%" onrowcommand="grd_Assigned_Orders_RowCommand" 
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
                                                     
                                                      
                                                              <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Number">
                                                            <ItemTemplate>
                                                              
                                                                      <asp:Button ID="btn_ClientOrder_Number" runat="server" CommandName="SelectDetails" Width="150px" CssClass="GridButton" Text='<%# Eval("Client_Order_Number") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Customer" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomer" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Name") %>'></asp:Label>
                                                                     <asp:Label ID="lbl_Clientid" runat="server"  Visible="false"
                                                                    CssClass="Label" Text='<%#Eval("Client_Id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Sub Process" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubProcess" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Sub_ProcessName") %>'></asp:Label>
                                                                     <asp:Label ID="lbl_Subrocessid" runat="server"  Visible="false"
                                                                    CssClass="Label" Text='<%#Eval("Sub_ProcessId") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                             <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Customer" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomerCode" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Number") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Sub Process" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubProcessCode" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Subprocess_Number") %>'></asp:Label>
                                                                  
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Recived Date" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDate" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>

                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="State County" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblStateCounty" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("STATECOUNTY") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProduct_TypeOrder_Location" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Product_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Source Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Location" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Status" >
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
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"  Visible="false" HeaderText="User Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProduct_Type_Id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Product_Type_Id") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"    HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
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
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td   align="left">
                                              <table style="width:100%;">
                                              <tr>
                                              <td>  <asp:Label ID="Label1" runat="server" CssClass="AdminHeader" 
                                                  Text="Pending Orders" Font-Bold="True"></asp:Label></td>
                                              <td align="right">
                                              <asp:TextBox ID="txt_Pending_Search" runat="server" AutoPostBack="true" Columns="1" 
                                                              CssClass="searchText" Height="30px" 
                                                              placeholder="Search here..." TabIndex="4" 
                                                      ontextchanged="txt_Pending_Search_TextChanged"></asp:TextBox>
                                              </td>
                                              </tr>
                                              </table>
                                            
                                          </td>
                                        
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height:350px;">
                                          <div id="Div1" style="overflow:scroll; height:100%;">
                                             <asp:GridView ID="grd_Pending_Orders" runat="server" AllowSorting="True" 
                                                AutoGenerateColumns="False" CellPadding="4" CssClass="name" Font-Size="Medium" 
                                                ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" 
                                                Width="100%" onrowcommand="grd_Pending_Orders_RowCommand" 
                                                  onrowdatabound="grd_Pending_Orders_RowDataBound" >
                                                
                                                 <Columns>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingOrder_id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                     
                                                      
                                                              <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Number">
                                                            <ItemTemplate>
                                                                
                                                                      <asp:Button ID="btnPending_ClientOrder_Number" runat="server" CommandName="EditRecordDetails" Width="150px" CssClass="GridButton" Text='<%# Eval("Client_Order_Number") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Customer" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingCustomer" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Name") %>'></asp:Label>
                                                                       <asp:Label ID="lblPendingCustomer_Id" Visible="false" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Sub Process" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingSubProcess" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Sub_ProcessName") %>'></asp:Label>

                                                                     <asp:Label ID="lbl_PendigSubrocessid" runat="server"  Visible="false"
                                                                    CssClass="Label" Text='<%#Eval("Sub_ProcessId") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                          <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Customer" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingCustomer_Code" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Number") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Sub Process" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingSubProcess_Code" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Subprocess_Number") %>'></asp:Label>

                                                                     <asp:Label ID="lbl_PendigSubrocessid" runat="server"  Visible="false"
                                                                    CssClass="Label" Text='<%#Eval("Sub_ProcessId") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Recived Date" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingDate" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>

                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="State County" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingStateCounty" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("STATECOUNTY") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        
                                                      <asp:TemplateField HeaderStyle-CssClass="head-label"  HeaderText="Order Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingOrder_Type" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Product_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"    HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"  HeaderText="Source Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendingOrder_Location" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"    HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Status" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPending_Order_Status" runat="server" CssClass="Label" 
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
                                                      
                                               <asp:TemplateField HeaderStyle-CssClass="head-label"  Visible="false" HeaderText="User Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPendProduct_Type_Id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Product_Type_Id") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"    HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
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
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style=" colspan="2">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width:90px;">
                                                        &nbsp;</td>
                                                    <td  style="width:150px;">
                                                        &nbsp;</td>
                                                    <td  style="width:90px;">
                                                        &nbsp;</td>
                                                    <td  style="width:200px;">
                                                        &nbsp;</td>
                                                    <td align="right">
                                                        <asp:Button ID="btn_View_Histroy" runat="server" Height="40"
                                                              CssClass="WebButton"    Text="View Histroy" 
                                                            onclick="btn_Reallocate_Click" />
                                                        <asp:Button ID="btn_Refresh" runat="server" Height="40"
                                                              CssClass="WebButton"    onclick="btn_Search_Click" 
                                                            Text="Refresh" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                 
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
            
               </div>
                  
               </td>
        </tr>
    </table>
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>


