<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Rpt_ClientName_Pending.aspx.cs" Inherits="Admin_Rpt_ClientName_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always"><Triggers><asp:PostBackTrigger ControlID="Export" /></Triggers><ContentTemplate>

      --%>
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Client Name Invoice</span>
                  
               </div>
               
               </td>
        </tr>
          <tr>
            <td>
               <div id="Divcreate" runat="server" style="height:100%;" class="DivContentBody">
               
                 <table style="width:100%;" >
                   <tr>
                                        <td  align="right">
                                            <asp:Button ID="Export" runat="server"   CssClass="WebButton"    
                                                OnClick="Export_Click" Text="Export" />
                                            <asp:Button ID="Back" runat="server"   CssClass="WebButton"    
                                                OnClick="Back_Click" Text="Back" />
                                         </td>
                                       
                                    </tr> 


                     <tr>
                         <td align="center">
                             <asp:GridView ID="Grd_ClientName_Invoice" runat="server" 
                                 AutoGenerateColumns="False">
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
                                           <asp:BoundField DataField="Order_Number" HeaderText="DRN REF ID" />
                                  <asp:BoundField DataField="Client_Order_Number" HeaderText="CLIENT ORDER ID" />
                                  <asp:BoundField DataField="County" HeaderText="AGENCY" />
                                  <asp:BoundField DataField="Tax_No" HeaderText="TAXID" />
                                  <asp:BoundField DataField="State" HeaderText="STATE" />
                                  <asp:BoundField DataField="Order_Status" HeaderText="STATUS" />
                                  <asp:BoundField DataField="Note1" HeaderText="PENDING REASON 1" />
                                           <asp:BoundField DataField="Note2" HeaderText="PENDING REASON 2" />
                                  <asp:BoundField DataField="Note3" HeaderText="PENDING REASON 3" />
                                  <asp:BoundField DataField="ETA_Date" HeaderText="ETA" />
                                           </Columns>
                                 <HeaderStyle BackColor="Silver"/>
                             </asp:GridView>
                         </td>
                     </tr>
                     <tr>
                         <td align="right">
                             &nbsp;</td>
                     </tr>


                 </table>
                 </div>
              </td>
              </tr>
      </table>
      
      <%--</ContentTemplate>      </asp:UpdatePanel>
--%>

    

</asp:Content>



