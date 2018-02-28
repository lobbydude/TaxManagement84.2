<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Orders_View.aspx.cs" Inherits="Admin_Orders_View" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">

    <asp:UpdatePanel ID="uporder" runat="server" UpdateMode="Always"><ContentTemplate>
          <table style="width: 100%">
        <tr>
            <td>
                <div id="content">
                <span class="WebFont1">View Orders</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server"  align="center" style="height:100%; width:100%;" class="DivContentBody">
                  


                               
                 <table align="center" style="width:90%; height:400px;" >
                          
                                 
                            
                           
                                    <tr>
                                        <td   colspan="2" align="right">
                                              
                                              <asp:Label ID="lblassign" runat="server" CssClass="AdminHeader"></asp:Label>
                                          </td>
                                        
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="2" style="border: thin dotted #006666; height:100%;" 
                                            valign="top">
                                            <div ID="digrd" style="overflow:scroll; height:100%;">
                                                <asp:GridView ID="grd_Assigned_Orders" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" CssClass="name" Font-Size="Medium" 
                                                    ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" 
                                                    Width="100%">
                                                    
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status" SortExpression="Order_Status">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEmail" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Order ID" SortExpression="Order_Number">
                                                            <ItemTemplate>
                                                              
                                                              <asp:Label ID="lblOrder_Number" runat="server" CssClass="Label"  Text='<%#Eval("Order_Number") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="BATCH ID" SortExpression="Loan_Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblbatch_Id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("STATECOUNTY") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Order Date" SortExpression="Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDate" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle BackColor="#7C6F57" />
                                                    <EmptyDataRowStyle Font-Names="Verdana" ForeColor="#FF5050" />
                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Large" 
                                                        ForeColor="White" />
                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#E3EAEB" />
                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                </asp:GridView>
                                            </div>
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


