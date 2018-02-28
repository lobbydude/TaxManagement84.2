<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Gls_Tax_Order_Report.aspx.cs" Inherits="Gls_Gls_Tax_Order_Report" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    
          <table style="width:100%">
        <tr>
            <td>
                <div id="content">
                <span class="WebFont1">Reports</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server"  align="center" style="height:100%; width:100%;" class="DivContentBody">
                  


                               
                 <table align="center" style="width:100%; height:100%;" >
                          
                                 
                                    <tr>
                                        <td align="right" colspan="2"  style="width:95%; " 
                                            valign="top">
                                            <asp:Button ID="btn_Export" runat="server" CssClass="WebButton" 
                                                onclick="btn_Export_Click" Text="Export" Width="74px" />
                                        </td>
                                    </tr>
                                    
                                            
                                 
                                    <tr>
                                        <td align="center" colspan="2" style="border: thin dotted #006666; height:400px;" 
                                            valign="top">
                                            <div ID="digrd" style="overflow:scroll; width:1200px; height:100%;">
                             <asp:GridView ID="grd_Orders" runat="server" 
                                 AutoGenerateColumns="True">
                              <Columns>
                               <asp:TemplateField HeaderText="SI.NO">
                                               <HeaderTemplate>
                                                   <asp:Label ID="lblColemp1" runat="server" Text="Sl No." />
                                               </HeaderTemplate>
                                               <ItemTemplate> 
                                                   <%#Container.DataItemIndex+1 %>
                                               </ItemTemplate>
                                               <ItemStyle HorizontalAlign="Center"  Width="30px" />
                                           </asp:TemplateField>
                                        
                                
                                           </Columns>
                                 <HeaderStyle BackColor="Silver"/>
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
   
</asp:Content>


