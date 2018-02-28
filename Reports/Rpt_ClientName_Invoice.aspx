<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rpt_ClientName_Invoice.aspx.cs" Inherits="Admin_Rpt_ClientName_Invoice1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


TABLE { font-family: Trebuchet MS, Arial; font-size:11px; color:#5a5a5a; text-align:left;}
TH { font-family: Trebuchet MS, Arial; font-weight: BOLD; font-size:11px; color:#395584; }


TD { font-family: Trebuchet MS, Arial; font-size:11px; color:#5a5a5a;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                             <asp:GridView ID="Grd_ClientName_Invoice" runat="server" 
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
    </form>
</body>
</html>
