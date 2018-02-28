<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Upload_Orders_Type_Assign_to_State.aspx.cs" Inherits="Admin_Upload_Orders" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <script  type="text/javascript">
        function btnreturn() {
            return confirm('Are You Proceed?');
        }
   
    
</script>
      <%--<asp:Label ID="lblSubprocess_Number" runat="server" Text='<%# Eval("Subprocess_Number")%>' Visible ="true"></asp:Label>--%><ContentTemplate>
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Import Order Type Assign to State</span>
                  
               </div>
                 </td>
        </tr>
        </table>
          <div id="div4"   runat="server" style="height:100%;" class="DivContentBody" >
                             
                                 <table align="center" style="width:100%;">
                                     <tr>
                                         <td align="center">
                                             </td>
                                     </tr>
                                     <tr>
                                         <td align="center">
                                             <asp:Button ID="Btn_ExampleExcel" runat="server" 
                                                   CssClass="WebButton"    
                                                 TabIndex="26" Text="Click here to download sample excel" Width="241px" 
                                                 onclick="Btn_ExampleExcel_Click" />
                                         </td>
                                         
                                     </tr>

                                     <tr>
                                         <td align="center">
                                             </td>
                                         
                                     </tr>

                                     <tr>
                                         <td align="center">
                                             <asp:FileUpload ID="fileuploadExcel" runat="server" Visible="true" />
                                             <asp:Button ID="btn_Import" runat="server" 
                                                   CssClass="WebButton"    onclick="btn_ImportExcel_Click" 
                                                 TabIndex="26" Text="Import Orders" Width="143px" />
                                         </td>
                                     
                                     </tr>
                                     <tr>
                                         <td>
                                             <asp:Label ID="lblMessage" runat="server" CssClass="Label" ForeColor="#990000"></asp:Label>
                                         </td>
                                         
                                     </tr>

                                     <tr>
                                         <td align="center">
                                             <asp:GridView ID="Grd_Assign_order_Type_to_State" runat="server" 
                                                 AutoGenerateColumns="False">
                                                 <Columns>
                                                     <asp:BoundField DataField="Sl#No" HeaderText="Sl.No" />
                                                     <asp:BoundField DataField="States" HeaderText="States" />
                                                     <asp:BoundField DataField="Abbreviation" HeaderText="Abbreviation" />
                                                     <asp:BoundField DataField="Tools" HeaderText="Tools" />
                                                 </Columns>
                                             </asp:GridView>
                                         </td>
                                         
                                     </tr>

                                     <tr>
                                    
                                         <td align="center">
                                             </td>
                                         
                                     </tr>
                                     <tr>
                                         <td>
                                             </td>
                                         
                                     </tr>
                                     <tr>
                                         <td align="center">
                                             <asp:Button ID="btn_Submit" runat="server" CssClass="WebHRButton green" 
                                                 TabIndex="26" Text="Submit" onclick="btn_Submit_Click" Visible="False" />
                                             <asp:Button ID="btn_Cancel" runat="server" CssClass="WebHRButton green" 
                                                 TabIndex="26" Text="Cancel" onclick="btn_Cancel_Click" Visible="False" />
                                             </td>
                                         
                                     </tr>
                                     <tr>
                                         <td>
                                             </td>
                                         
                                     </tr>
                                 </table>
                             
                            
                             <tr>
                             </tr>
          <tr>
          



              <td>
              </td>
          </tr>
       </div>
 </ContentTemplate><%--  <asp:BoundField DataField="Borrower_Name" HeaderStyle-HorizontalAlign="Center" 
                              HeaderText="Borrower_Name" ItemStyle-HorizontalAlign="Center">
                          <HeaderStyle HorizontalAlign="Center" />
                          <ItemStyle HorizontalAlign="Center" Width="30px" />
                          </asp:BoundField>
                          <asp:BoundField DataField="Borrower_Name2" HeaderStyle-HorizontalAlign="Center" 
                              HeaderText="Borrower_Name2" ItemStyle-HorizontalAlign="Center">
                          <HeaderStyle HorizontalAlign="Center" />
                          <ItemStyle HorizontalAlign="Center" Width="30px" />
                          </asp:BoundField>--%>

</asp:Content>


