<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Order_Export.aspx.cs" Inherits="Admin_Order_Export" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
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
      <asp:UpdatePanel ID="uporder" runat="server" UpdateMode="Always"><ContentTemplate>
          <table style="width: 100%">
        <tr>
            <td>
                <div id="content">
                <span class="WebFont1">Orders Waiting For Export</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server"  align="center" style="height:100%; width:100%;" class="DivContentBody">
                  


                               
                 <table align="center" style="width:80%; height:400px;" >
                          
                                 
                            
                           
                                    <tr>
                                        <td   colspan="2" >
                                              
                                              &nbsp;</td>
                                        
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style=" height:100%;" 
                                            valign="top">
                                      
                                                <asp:GridView ID="grd_order" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" CssClass="name" GridLines="None"
                                                     ShowHeaderWhenEmpty="True" 
                                                    Width="100%" onrowcommand="grd_order_RowCommand">
                                                    
                                                    <Columns>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"  >
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkBxSelect" runat="server" AutoPostBack="true" 
                                                                    Checked="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" VerticalAlign="Middle" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label6" runat="server"></asp:Label>
                                                                <asp:CheckBox ID="chkBxHeader" runat="server" Checked="True" 
                                                                    onclick="javascript:HeaderClick(this);" />
                                                            </HeaderTemplate>
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="id" Visible="false">
                                                        </asp:TemplateField>
                                                       
                                                     
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order ID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_id" runat="server" Visible="false" CssClass="Label" 
                                                                    Text='<%#Eval("Order_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                          
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Number" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Number") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                          
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Client Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblClient_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Client_Name") %>'></asp:Label>
                                                                         <asp:Label ID="lblPendingCustomer_Id" Visible="false" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                          
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="SubProcess">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSub_ProcessName" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Sub_ProcessName") %>'></asp:Label>
                                                                        <asp:Label ID="lbl_PendigSubrocessid" runat="server"  Visible="false"
                                                                    CssClass="Label" Text='<%#Eval("Subprocess_Id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                          
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Type" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Type") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                          
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Borrower Name" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBarrower_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Borrower_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="300px" />
                                                            
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="300px" />
                                                        </asp:TemplateField>
                                                     
                                                         <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="View Details">
                                                            <ItemTemplate>
                                                              <asp:Button ID="btn_Order" runat="server" TabIndex="23" CommandName="EditDetails" Width="150px" Height="28px" CssClass="GridButton" Text="View" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px"  VerticalAlign="Middle"/>
                                                        </asp:TemplateField>
                                                           <asp:TemplateField HeaderStyle-CssClass="head-label" Visible="False"   HeaderText="Order Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProduct_Type_Id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Product_Type") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                          
                                                            <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
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
                                      
                                        </td>
                                    </tr>
                                    <tr>
                                        <td   colspan="2" style="height: 24px;" 
                                            align="right">
                                              
                                              <asp:Button ID="btn_Export" runat="server" 
                                                    CssClass="WebButton"    onclick="btn_Export_Click" 
                                                  Text="Export" Width="74px" />
                                        </td>
                                        
                                    </tr>
                                  
                          
                                 
                                    <tr>
                                        <td align="center" colspan="2" 
                                            style="height: 24px;">
                                              <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="ModalPopupBG"
            runat="server" CancelControlID="btnCancel" OkControlID="btnOkay" TargetControlID="LinkButton1"
            PopupControlID="Div1" Drag="true" PopupDragHandleControlID="PopupHeader">
        </cc1:ModalPopupExtender>
        <div id="Div1"  class="popupConfirmation">
              <div class="DivContentBody">
                
                 <%--<asp:UpdatePanel ID="up1" runat="server" UpdateMode="Always"><Triggers><asp:PostBackTrigger ControlID="btn_Ok" /></Triggers><ContentTemplate>
                <div>
                   
                    <table align="center" style="width:100%;">
                           <tr class="tableHeader">
                                                       <td>
                                                         
                                                           <label class="AdminHeader">Choose Path</label>
                                                           </td>
                                                       <td align="right">
                                                           <asp:Button ID="Button2" runat="server" 
                                                               CssClass="WebHRButton red" Text="X" onclick="Button2_Click" />
                                                       </td>
                                                   </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                   <div id="divorderwise"   runat="server">
                             
                             </div>
                              </td>
                        </tr>
                  
                        <tr>
                            <td align="center" colspan="2">
                    <input id="btnCancel" value="Cancel"  style="display:none;" class="button_submitall" type="button" />
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </td>
                        </tr>
                           <tr>
                               <td align="center" colspan="2">
                                   <asp:Button ID="btn_Ok" runat="server"   CssClass="WebButton"    
                                       onclick="btn_Ok_Click" Text="OK" Width="74px" />
                               </td>
                           </tr>
                    </table>
                  
                </div>
                <div class="popup_Buttons" align="center">
                    <input id="btnOkay" style="display:none;" value="Done"  type="button" />
                </div>
                  </ContentTemplate></asp:UpdatePanel>--%>
            </div>
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


