<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Employee.master" AutoEventWireup="true" CodeFile="Employee_Home.aspx.cs" Inherits="Admin_Employee_Home" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
     <script language="javascript" type="text/javascript">
        function show()
        {
              document.write("<head id="Head1" runat='server'></head>");
        }
</script>
     <script type='text/javascript' charset='utf-8'>
         $(document).ready(function () {
             $('.popbox').popbox();
         });
  </script>
  <link  href="AdminStyle/pop.css" rel="Stylesheet" type="text/css"/>
  <script language="javascript" type="text/javascript">
      //Function to Hide ModalPopUp
      function Hidepopup() {
          $find('Employee').hide();
      }
      //Function to Show ModalPopUp
      function Showpopup() {
          $find('Employee').show();
      }
</script>
   <script type="text/javascript">
       var TotalChkBx;
       var Counter;

       window.onload = function () {
           //Get total no. of CheckBoxes in side the GridView.
           TotalChkBx = parseInt('<%= this.grd_order.Rows.Count %>');
           //Get total no. of checked CheckBoxes in side the GridView.
           Counter = 0;
       }

       function HeaderClick(CheckBox) {
           //Get target base & child control.
           var TargetBaseControl = document.getElementById('<%= this.grd_order.ClientID %>');
           var TargetChildControl = "chkBxSelect";

           //Get all the control of the type INPUT in the base control.
           var Inputs = TargetBaseControl.getElementsByTagName("input");

           //Checked/Unchecked all the checkBoxes in side the GridView.
           for (var n = 0; n < Inputs.length; ++n)
               if (Inputs[n].type == 'checkbox' && Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                   Inputs[n].checked = CheckBox.checked;
           //Reset Counter
           Counter = CheckBox.checked ? TotalChkBx : 0;
       }

       function ChildClick(CheckBox, HCheckBox) {
           //get target base & child control.
           var HeaderCheckBox = document.getElementById(HCheckBox);

           //Modifiy Counter;            
           if (CheckBox.checked && Counter < TotalChkBx)
               Counter++;
           else if (Counter > 0)
               Counter--;

           //Change state of the header CheckBox.
           if (Counter < TotalChkBx)
               HeaderCheckBox.checked = false;
           else if (Counter == TotalChkBx)
               HeaderCheckBox.checked = true;
       }
    </script>
   <script type="text/javascript" src="AdminJs/Expand1JScript.js"></script>
<script type="text/javascript" src="AdminJs/expandJScript.js"></script>


      <asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always"><ContentTemplate>
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Order Details</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               
                    <div id="DivView" runat="server" style="height:100%;" class="DivContentBody">
              
                   <table style="width: 100%;">
                 
                         <tr>
                             <td align="center">
                                 <table style="width: 100%">
                                     <tr>
                                         <td align="left">
                                         <asp:UpdatePanel ID="upbtn" runat="server" UpdateMode="Always"><ContentTemplate>
                                             <asp:Button ID="btn_Search"   runat="server" CssClass="WebHRButton green" 
                                                 onclick="btn_Search_Click" TabIndex="26" Text="Search" />
                                                 <asp:Button ID="btn_Refresh" runat="server" CssClass="WebHRButton red" 
                                                 TabIndex="26" Text="Refresh" onclick="btn_Refresh_Click" Width="75px" />
                                                 </ContentTemplate></asp:UpdatePanel>
                                         </td>
                                         <td align="right">
                                             &nbsp;</td>
                                     </tr>
                                 </table>
                             </td>
                         </tr>
                      
                      
                       <tr>
                           <td align="center" valign="top">
                                     <asp:GridView ID="grd_order" runat="server" AllowPaging="True" 
                                         AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                                         BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                         CssClass="name" DataKeyNames="Order_ID" Font-Size="Medium" ForeColor="#FF0066" 
                                         GridLines="Both" onrowdatabound="grd_order_RowDataBound" 
                                         onselectedindexchanged="grd_order_SelectedIndexChanged" 
                                         onsorting="grd_order_Sorting" PageSize="20" Width="100%">
                                         <AlternatingRowStyle BackColor="#F7F7F7" />
                                         <Columns>
                                             <asp:TemplateField Visible="false">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblSubprocessid" runat="server" 
                                                         Text='<%#Eval("Sub_ProcessId")%>'></asp:Label>
                                                 </ItemTemplate>
                                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField Visible="false">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblorderid" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("Order_ID")%>'></asp:Label>
                                                 </ItemTemplate>
                                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Order #" SortExpression="Order_Number">
                                                 <ItemTemplate>
                                                     <asp:Button ID="btnordernumber" runat="server" CommandName="Select" 
                                                         CssClass="WebHRButton cyan" Text='<%#Eval("Order_Number")%>' Width="100px" />
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Customer" SortExpression="Client_Name">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblcustomerName" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("Client_Name") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Customer No" SortExpression="Client_Number">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblcustomerNumber" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("Client_Number") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Sub Process" SortExpression="Sub_ProcessName">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblSub_ProcessName" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("Sub_ProcessName") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Submited" SortExpression="Date">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblSubmited" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("Date") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Order Type" SortExpression="Order_Type">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblOrderType" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("Order_Type") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Status" SortExpression="Order_Status">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblstatus" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="County" SortExpression="County">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblCounty" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("County") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="State" SortExpression="State">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblState" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("State") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Documents" SortExpression="Documents">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblDocuments" runat="server" CssClass="Label" 
                                                         Text='<%#Eval("Documents") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="100px" />
                                             </asp:TemplateField>
                                             <asp:TemplateField>
                                                 <ItemTemplate>
                                                     <asp:Button ID="btnEditOrder" runat="server" 
                                                         CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Order_ID") %>' 
                                                           CssClass="WebButton"    OnCommand="EditOrder_Details" 
                                                         Text="Edit" />
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" Width="50px" />
                                             </asp:TemplateField>
                                         </Columns>
                                         <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                         <HeaderStyle BackColor="White" Font-Bold="True" Font-Size="Large" 
                                             ForeColor="#3366CC" />
                                         <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                         <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                         <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#F7F7F7" />
                                         <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                         <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                         <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                         <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                     </asp:GridView>
                           </td>
                       </tr>
                      
            
                      
                      
                       <tr>
                           <td align="right">
                                <a href="#" class="back-to-top"><div class="imgbacktotop"></div></a></td>
                       </tr>
                   </table>
               
               </div>
          
                <%--  <div class="demo">
            <h2 class="expand">Title </h2>
            <div class="collapse">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore 
                et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip 
                ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore 
                eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa 
                qui officia deserunt mollit anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore 
                et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip 
                ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore 
                eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa 
                qui officia deserunt mollit anim id est laborum.</p>
           
            </div>
            </div>--%>
               </td>
        </tr>
         <tr>
                           <td align="center">
                                <a href="#" class="back-to-top"><div class="imgbacktotop"></div></a></td>
                       </tr>
                      
      
    </table>
    </ContentTemplate></asp:UpdatePanel>
   
      
      
             <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="ModalPopupBG"
            runat="server" CancelControlID="btnCancel" OkControlID="btnOkay" TargetControlID="LinkButton1"
            PopupControlID="Div1" Drag="true" PopupDragHandleControlID="PopupHeader">
        </cc1:ModalPopupExtender>
        <div id="Div1"  class="popupConfirmation">
              <div class="DivContentBody">
                
                 <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Always"><ContentTemplate>
                <div>
                   
                    <table align="center" style="width:100%;">
                           <tr class="tableHeader">
                                                       <td>
                                                         
                                                           <label class="AdminHeader">Search Record</label>
                                                           </td>
                                                       <td align="right">
                                                           <asp:Button ID="Button2" runat="server" 
                                                               CssClass="WebHRButton red" Text="X" onclick="Button2_Click1" />
                                                       </td>
                                                   </tr>
                        <tr>
                            <td colspan="2">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="1">Order Number Wise</asp:ListItem>
                                    <asp:ListItem Value="2">Client Wise</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                   <div id="divorderwise"   runat="server">
                             
                                 <table align="center" style="width:100%;">
                                     <tr>
                                         <td>
                                             <asp:Label ID="Label34" runat="server" CssClass="Label" Text="Order Number"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:TextBox ID="txt_orderserach_Number" runat="server" CssClass="textbox" 
                                                 style="text-transform:uppercase;" TabIndex="20"></asp:TextBox>
                                         </td>
                                     </tr>
                                 </table>
                             
                             </div>
                              </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                  <div id="divclientwise" runat="server">
                               <table align="center" style="width:100%;">
                                     <tr>
                                         <td>
                                             <asp:Label ID="Label35" runat="server" CssClass="Label" Text="Customer Name"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:DropDownList ID="ddl_Search_Client_type" runat="server" AutoPostBack="True" 
                                                 CssClass="DropDown" TabIndex="2" 
                                                 onselectedindexchanged="ddl_Search_Client_type_SelectedIndexChanged">
                                             </asp:DropDownList>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>
                                             <asp:Label ID="Label40" runat="server" CssClass="Label" Text="Sub Process"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:DropDownList ID="ddl_Search_SubProcess" runat="server" AutoPostBack="True" 
                                                 CssClass="DropDown" TabIndex="2">
                                             </asp:DropDownList>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>
                                             <asp:Label ID="Label36" runat="server" CssClass="Label" Text="Created Date"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:TextBox ID="txt_order_Search_Fromdate" runat="server" CssClass="textbox" 
                                                 style="text-transform:uppercase;" TabIndex="20" Width="115px"></asp:TextBox>
                                                     <ajax:FilteredTextBoxExtender ID="txt_order_Search_Fromdate_FilteredTextBoxExtender" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_order_Search_Fromdate" ValidChars="_/"></ajax:FilteredTextBoxExtender>

 <ajax:CalendarExtender ID="txt_order_Search_Fromdate_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_order_Search_Fromdate"></ajax:CalendarExtender>
                                             &nbsp;<asp:Label ID="Label39" runat="server" CssClass="Label" Text="to"></asp:Label>
                                             <asp:TextBox ID="txt_orderserach_Todate" runat="server" CssClass="textbox" 
                                                 style="text-transform:uppercase;" TabIndex="20" Width="115px"></asp:TextBox>
                                                   <ajax:FilteredTextBoxExtender ID="txt_orderserach_Todate_FilteredTextBoxExtender" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_orderserach_Todate" ValidChars="_/"></ajax:FilteredTextBoxExtender>

 <ajax:CalendarExtender ID="txt_orderserach_Todate_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_orderserach_Todate"></ajax:CalendarExtender>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>
                                             <asp:Label ID="Label37" runat="server" CssClass="Label" Text="Status"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:DropDownList ID="ddl_order_search_Status" runat="server" AutoPostBack="True" 
                                                 CssClass="DropDown" TabIndex="2">
                                             </asp:DropDownList>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>
                                             <asp:Label ID="Label38" runat="server" CssClass="Label" Text="Order Type"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:DropDownList ID="ddl_order_search_Order_Type" runat="server" AutoPostBack="True" 
                                                 CssClass="DropDown" TabIndex="2">
                                             </asp:DropDownList>
                                         </td>
                                     </tr>
                                 </table>

                              </div>
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                    <input id="btnCancel" value="Cancel"  style="display:none;" class="button_submitall" type="button" />
                                <asp:Button ID="btn_Sarch_Result" runat="server" 
                                      CssClass="WebButton"    TabIndex="26" Text="Submit" 
                                    onclick="btn_Sarch_Result_Click" Width="75px" />
                                <asp:Button ID="btn_Cancel_Search" runat="server" 
                                      CssClass="WebButton"    onclick="btn_Cancel_Search_Click" 
                                    TabIndex="26" Text="Cancel" Width="75px" />
                            </td>
                        </tr>
                    </table>
                  
                </div>
                <div class="popup_Buttons" align="center">
                    <input id="btnOkay" style="display:none;" value="Done"  type="button" />
                </div>
                  </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
           
         
  
            <asp:LinkButton ID="Lnkbutonorder" runat="server"></asp:LinkButton>
                        <cc1:ModalPopupExtender ID="ModalPopupOrder" BackgroundCssClass="ModalPopupBG"
            runat="server" CancelControlID="btnCancel" OkControlID="btnOkay" TargetControlID="Lnkbutonorder"
            PopupControlID="Div2" Drag="true" PopupDragHandleControlID="PopupHeader">
        </cc1:ModalPopupExtender>
        <div id="Div2"  class="popupConfirmation" style="width:90%; height:100%; overflow:scroll;">
              <div class="DivContentBody">
                
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always"><ContentTemplate>
            <div id="Divcreate" runat="server"  style="width:100%; height:100%;">
               
                 <table style="width:100%;" >
                          <tr>
                                        <td  align="center">
                                       <h2 class="AdminHeader">
                                               <asp:Label ID="lblhead" runat="server" CssClass="AdminHeader"></asp:Label></h2>
                                         
                                        </td>
                                        <td style="width:30px;" align="right">
                                            <asp:Button ID="btn_order_cancel" runat="server" CssClass="WebHRButton red" 
                                                onclick="btn_order_cancel_Click" Text="X" />
                                        </td>
                                        
                                       
                                         <td>
                                             &nbsp;</td>
                                        
                                    </tr>
                                  
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:100%;">
                                           
                                    
                                     
                                    
                                   
                                    
                              
                                
                                          
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label11" runat="server" CssClass="Label" Text="Order Number:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_OrderNumber" runat="server" Columns="1" CssClass="textbox" 
                                                          Enabled="False" style="text-transform:uppercase;"></asp:TextBox>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label12" runat="server" CssClass="Label" Text="Placed By:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Placedby" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="1"></asp:TextBox>
                                                  </td>
                                              </tr>
                                    
                                   
                                    
                              
                                
                                          
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label7" runat="server" CssClass="Label" Text="Order Type:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_ordertype" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" TabIndex="2">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label13" runat="server" CssClass="Label" Text="Date:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Date" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="3"></asp:TextBox>
                                                          <ajax:FilteredTextBoxExtender ID="filter_Date" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_Date" ValidChars="_/"></ajax:FilteredTextBoxExtender>

 <ajax:CalendarExtender ID="txt_Date_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="dd/MM/yyyy" TargetControlID="txt_Date"></ajax:CalendarExtender>
                                                  </td>
                                              </tr>
                                    
                                   
                                    
                              
                                
                                          
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label14" runat="server" CssClass="Label" Text="Customer Name:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_ClientName" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" 
                                                          onselectedindexchanged="ddl_ClientName_SelectedIndexChanged" TabIndex="4">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label15" runat="server" CssClass="Label" Text="Customer ID:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_ClientNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="5" Enabled="False"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label19" runat="server" CssClass="Label" 
                                                          Text="Sub Process Name:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_SubProcess" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" TabIndex="6" 
                                                          onselectedindexchanged="ddl_SubProcess_SelectedIndexChanged">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label9" runat="server" CssClass="Label" 
                                                          Text="Sub Process ID:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_SubprocessNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="7" Enabled="False"></asp:TextBox>
                                                  </td>
                                              </tr>
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td  >
                                            <asp:Label ID="Label16" runat="server" CssClass="Label" Text="Vendor Name:"></asp:Label>
                                        </td>
                                       
                                        <td >
                                            <asp:TextBox ID="txt_VendorName" runat="server" CssClass="textbox" 
                                                style="text-transform:uppercase;" TabIndex="8"></asp:TextBox>
                                        </td>
                                       
                                        <td  >
                                            <asp:Label ID="Label17" runat="server" CssClass="Label" Text="Vendor Number:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_VendorNumber" runat="server" CssClass="textbox" 
                                                style="text-transform:uppercase;" TabIndex="9"></asp:TextBox>
                                        </td>
                                       
                                    </tr>
                              
                                
                                     
                                          
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label20" runat="server" CssClass="Label" 
                                                          Text="Property Address:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Address" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="10"></asp:TextBox>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label21" runat="server" CssClass="Label" 
                                                          Text="Zip / City / State:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_ZipCode" runat="server" CssClass="textbox" 
                                                        Width="100px" TabIndex="11"></asp:TextBox>
                                                             <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_ZipCode" ValidChars=""></ajax:FilteredTextBoxExtender>
                                                      &nbsp;<asp:TextBox ID="txt_City" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" Width="80px" TabIndex="12"></asp:TextBox>
                                                      &nbsp;<asp:DropDownList ID="ddl_State" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" Width="100px" 
                                                          onselectedindexchanged="ddl_State_SelectedIndexChanged" TabIndex="13">
                                                      </asp:DropDownList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label24" runat="server" CssClass="Label" Text="County:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_County" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" TabIndex="14">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label25" runat="server" CssClass="Label" Text="Similar:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Similar" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="15"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label22" runat="server" CssClass="Label" Text="Borrower Name:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Borrowername" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="16"></asp:TextBox>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label23" runat="server" CssClass="Label" Text="Borrower Name 2:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_BorrowerName2" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="17"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label26" runat="server" CssClass="Label" Text="Effective Date:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Effectivedate" runat="server" CssClass="textbox" TabIndex="18"></asp:TextBox>
                                                            <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtenderEffectivedate" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_Effectivedate" ValidChars="_/"></ajax:FilteredTextBoxExtender>

 <ajax:CalendarExtender ID="CalendarExtendertxt_Effectivedate" runat="server" 
                                                       Enabled="True" Format="dd/MM/yyyy" TargetControlID="txt_Effectivedate"></ajax:CalendarExtender>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label27" runat="server" CssClass="Label" Text="Last Deed Info:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_LastDeed" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="19"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label28" runat="server" CssClass="Label" Text="Grantee:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Grantee" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="20"></asp:TextBox>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label29" runat="server" CssClass="Label" Text="APN:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_APN" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="21"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label30" runat="server" CssClass="Label" Text="Total Cost:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_TotalCost" runat="server" CssClass="textbox" 
                                                           TabIndex="22"></asp:TextBox>
                                                             <ajax:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_TotalCost" ValidChars="."></ajax:FilteredTextBoxExtender>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label31" runat="server" CssClass="Label" Text="Status:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_orderstatus" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" TabIndex="23">
                                                      </asp:DropDownList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label32" runat="server" CssClass="Label" Text="Notes:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Notes" runat="server" CssClass="textbox" 
                                                          Height="80px" style="text-transform:uppercase;" TabIndex="24"></asp:TextBox>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label33" runat="server" CssClass="Label" Text="Legal:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Legal" runat="server" CssClass="textbox" 
                                                          Height="80px" style="text-transform:uppercase;" TabIndex="25"></asp:TextBox>
                                                  </td>
                                              </tr>
                                    
                                  
                                          
                                           <tr style="display:none;">
                                        <td align="left" colspan="2">

                                          <h4 class="adminheading">Additional Information</h4>
                                         </td>
                                       
                                    </tr> 
                                              <tr style="display:none;">
                                                  <td>
                                                      <asp:Label ID="Label5" runat="server" CssClass="Label" Text="Record Added By:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="lbl_Record_Addedby" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                              <tr style="display:none;">
                                                  <td >
                                                      <asp:Label ID="Label6" runat="server" CssClass="Label" Text="Record Added On:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="lbl_Record_AddedDate" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                          </table>

                                          </div>
                                          
                                          </td>
                                       
                                    </tr> 
                                    
                                  
                                     
                                     <tr>
                                         <td align="center" colspan="2">
                                             <br />
                                         </td>
                                     </tr>
                           
                                    <tr>
                                         <td align="center" colspan="2" valign="middle">
                                             <asp:Button ID="btn_Save" runat="server" 
                                                   CssClass="WebButton"    onclick="btn_Save_Click" 
                                                 Text="Add New Order" TabIndex="26" Width="120px" />
                                             &nbsp;<asp:Button ID="btn_Cancel" runat="server" 
                                                   CssClass="WebButton"    onclick="btn_Cancel_Click" 
                                                 Text="Clear" TabIndex="27" />
                                         </td>
                                     </tr>
                           
                                </table>
               
               </div>
                <div class="popup_Buttons" align="center">
                    <input id="Button5" style="display:none;" value="Done"  type="button" />
                </div>
                  </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
       
</asp:Content>


