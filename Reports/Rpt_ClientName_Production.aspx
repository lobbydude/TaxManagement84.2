<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rpt_ClientName_Production.aspx.cs" Inherits="Admin_Rpt_ClientName_Production" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


  
    <div>
    
                             <asp:GridView ID="Grd_ClientName_Production" runat="server" 
                                 AutoGenerateColumns="False" 
          
            Visible="False">
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
                                  <asp:BoundField DataField="Client_Number" HeaderText="CLIENT ORDER ID" />
                                  <asp:BoundField DataField="County" HeaderText="AGENCY" />
                                  <asp:BoundField DataField="Tax_No" HeaderText="TAXID" />
                                  <asp:BoundField DataField="State" HeaderText="State" />
                                  <asp:BoundField DataField="Order_Status" HeaderText="STATUS" />
                                  <asp:BoundField DataField="Modified_Date" HeaderText="COMPLETED DATE" />
                                           </Columns>
                                 <HeaderStyle BackColor="Silver"/>
                             </asp:GridView>
    
    </div>
  

</html>
