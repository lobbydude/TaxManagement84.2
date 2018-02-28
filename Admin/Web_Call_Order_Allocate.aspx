<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Web_Call_Order_Allocate.aspx.cs" Inherits="Admin_Web_Call_Order_Allocate" %>

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
     <script type="text/javascript">
         var TotalAllocatedChkBx;
         var AllocatedCounter;

         window.onload = function () {
             //Get total no. of CheckBoxes in side the GridView.
             TotalAllocatedChkBx = parseInt('<%= this.grd_order_Allocated.Rows.Count %>');
             //Get total no. of checked CheckBoxes in side the GridView.
             AllocatedCounter = 0;
         }

         function chkAllocatedHeader(CheckBox) {
             //Get target base & child control.
             var TargetBaseControl = document.getElementById('<%= this.grd_order_Allocated.ClientID %>');
             var TargetChildControl = "chkAllocatedSelect";

             //Get all the control of the type INPUT in the base control.
             var Inputs = TargetBaseControl.getElementsByTagName("input");

             //Checked/Unchecked all the checkBoxes in side the GridView.
             for (var n = 0; n < Inputs.length; ++n)
                 if (Inputs[n].type == 'checkbox' && Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                     Inputs[n].checked = CheckBox.checked;
             //Reset AllocatedCounter
             AllocatedCounter = CheckBox.checked ? TotalAllocatedChkBx : 0;
         }

         function ChildClick(CheckBox, HCheckBox) {
             //get target base & child control.
             var HeaderCheckBox = document.getElementById(HCheckBox);

             //Modifiy Counter;            
             if (CheckBox.checked && AllocatedCounter < TotalAllocatedChkBx)
                 AllocatedCounter++;
             else if (AllocatedCounter > 0)
                 AllocatedCounter--;

             //Change state of the header CheckBox.
             if (AllocatedCounter < TotalAllocatedChkBx)
                 HeaderCheckBox.checked = false;
             else if (AllocatedCounter == TotalAllocatedChkBx)
                 HeaderCheckBox.checked = true;
         }
    </script>
  <asp:UpdatePanel ID="uporder" runat="server" UpdateMode="Always"><ContentTemplate>
          <table style="width: 100%">
        <tr>
            <td>
                <div id="content">
                <span class="WebFont1"><asp:Label ID="LblHeader" runat="server" ></asp:Label></span>
                  
               </div>
               
               </td>
        </tr>
      
              <tr>
                  <td align="center">
                      <table style="width: 55%">
                          <tr>
                              <td style="width: 20px">
                                  <asp:Label ID="Label10" runat="server" CssClass="Label" Text="Client:" 
                                      Font-Size="14px"></asp:Label>
                              </td>
                              <td width="100">
                                  <asp:DropDownList ID="ddl_ClientName" runat="server" AutoPostBack="True" 
                                      CssClass="DropDown" 
                                      onselectedindexchanged="ddl_ClientName_SelectedIndexChanged" Width="200px">
                                  </asp:DropDownList>
                              </td>
                              <td style="width: 80px">
                                  <asp:Label ID="Label11" runat="server" CssClass="Label" Text="Sub Process" Font-Size="14px"></asp:Label>
                              </td>
                              <td style="width: 150px">
                                  <asp:DropDownList ID="ddl_SubProcess" runat="server" CssClass="DropDown" 
                                      onselectedindexchanged="ddl_SubProcess_SelectedIndexChanged" Width="200px" 
                                      AutoPostBack="True">
                                  </asp:DropDownList>
                              </td>
                          </tr>
                      </table>
                  </td>
              </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server" align="center" style="height:100%;" class="DivContentBody">
                  


                                  <asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always"><ContentTemplate>
                 <table style="width:100%; height:600px;" >
                          
                                 
                            
                           
                                    <tr>
                                        <td style="border: width:300px; height:100%;" align="left" valign="top">
                                           <div id="Div1" style="overflow:scroll; height:100%;">
                                           <asp:UpdatePanel ID="uptreeview" runat="server" UpdateMode="Always"><ContentTemplate>
                                            <asp:TreeView Width="100%" ID="TreeView1"  runat="server" 
                                                   onselectednodechanged="TreeView1_SelectedNodeChanged" 
                                                   ontreenodecheckchanged="TreeView1_TreeNodeCheckChanged">
                                                <LeafNodeStyle  CssClass="Label" ImageUrl="~/img/Arrow1.png"  
                                                    Font-Names="Verdana" Font-Size="10pt" ForeColor="#003399" />
                                                <ParentNodeStyle Font-Names="Verdana" Font-Size="10pt" 
                                                    ImageUrl="~/img/Arrow1.png" />
                                                <RootNodeStyle Font-Bold="False" Font-Names="Verdana" Font-Size="10pt" 
                                                    ForeColor="#006666" ImageUrl="~/img/user1.png" />
                                                <SelectedNodeStyle ForeColor="#CC0000" />
                                            </asp:TreeView>
                                            </ContentTemplate></asp:UpdatePanel>
                                            </div>
                                        </td>
                                        <td valign="top" style=" height:100%;">
                                        <div id="digrd" style="overflow:scroll; height:100%;">
                                            <asp:GridView ID="grd_order" runat="server" AllowSorting="True" 
                                                AutoGenerateColumns="False" CellPadding="4" CssClass="name"
                                                 GridLines="None" ShowHeaderWhenEmpty="True" 
                                                Width="100%" onrowcommand="grd_order_RowCommand">
                                                
                                                <Columns>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"  >
                                                        <ItemTemplate>
                                                        <%--<div class="SingleCheckbox">
                                                        <asp:CheckBox ID="chkBxSelect" runat="server" AutoPostBack="true"  Checked="True" OnCheckedChanged="chkSelect_CheckedChanged" />
                                                <asp:Label ID="Label3" AssociatedControlID="chkBxSelect" runat="server" 
                                                            Text="" CssClass="CheckBoxLabel"><span style="width:1em;height:1em"></span></asp:Label></div>--%>
                                                            <asp:CheckBox ID="chkBxSelect" runat="server" AutoPostBack="true" 
                                                                Checked="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                        <%--<div class="SingleCheckbox">
                                                        <asp:CheckBox ID="chkBxHeader" runat="server" AutoPostBack="true"  Checked="True" onclick="javascript:HeaderClick(this);" />
                                                <asp:Label ID="Label3" AssociatedControlID="chkBxHeader" runat="server" 
                                                            Text="" CssClass="CheckBoxLabel"><span ></span></asp:Label></div>--%>
                                                            <asp:Label ID="Label6" runat="server" CssClass="label"></asp:Label>
                                                            <asp:CheckBox ID="chkBxHeader" runat="server" Checked="True" 
                                                                onclick="javascript:HeaderClick(this);" />
                                                        </HeaderTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                          <ItemStyle   CssClass="grid-item" HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOrder_id" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_ID") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Client Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClient_Name" runat="server" 
                                                                Text='<%#Eval("Client_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" 
                                                              VerticalAlign="Middle" Wrap="True" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" 
                                                              VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Sub Process">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSubProcess" runat="server" 
                                                                Text='<%#Eval("Sub_ProcessName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProduct_TypeType" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Product_Type") %>'></asp:Label>
                                                                <asp:Label ID="lbl_Product_Type_Id" runat="server" Visible="false" CssClass="Label" 
                                                                Text='<%#Eval("Product_Type_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Source Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOrderType" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Type") %>'></asp:Label>
                                                                <asp:Label ID="lbl_OrderType_Id" runat="server" Visible="false" CssClass="Label" 
                                                                Text='<%#Eval("Order_Type_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Batch ID" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbatch_Id" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("STATECOUNTY") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Number" >
                                                        <ItemTemplate>
                                                            
                                                                <asp:LinkButton ID="lnk_Order_Number" runat="server" CommandName="View_Order" CssClass="Link_Button"  Text='<%#Eval("Order_Number") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Task" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOrderTask" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Task") %>'></asp:Label>
                                                                 <asp:Label ID="lblOrderTask_Id" runat="server" Visible="false" CssClass="Label" 
                                                                Text='<%#Eval("Order_Task_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Status" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Order_Status"  runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                                     <asp:Label ID="lbl_order_status_id"  Visible="false" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Status_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Date" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDate" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <FooterStyle BackColor="#cccccc"  ForeColor="White" Font-Bold="True"/>
                                       <PagerStyle CssClass="PagerStyle" HorizontalAlign="Center" />
                                       <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                       <SelectedRowStyle CssClass="SelectedRowStyle" Font-Bold="True" ForeColor="White" />
                                       <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                       <SortedAscendingHeaderStyle BackColor="#808080" />
                                       <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                       <SortedDescendingHeaderStyle BackColor="#383838" />

                                            </asp:GridView>

                                            </div>
                                        </td>
                                        
                                    </tr>
                                    <tr style="border: thin dotted #008000">
                                        <td>
                                            <asp:Label ID="Label8" runat="server" CssClass="Label" Text="Allocated To:" 
                                                Font-Size="13px"></asp:Label>
                                            <asp:Label ID="lbl_allocated_user" runat="server" CssClass="Label" 
                                                Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width:90px;" valign="middle">
                                                        <asp:Button ID="btn_Allocate" runat="server" 
                                                              CssClass="WebButton"    Text="Allocate" 
                                                            onclick="btn_Allocate_Click" Width="150px" />
                                                    </td>
                                                    <td valign="middle">
                                                        <asp:Button ID="btn_Refresh" runat="server" 
                                                              CssClass="WebButton"    Text="Refresh" 
                                                            onclick="btn_Refresh_Click" />
                                                    </td>
                                                    <td align="right" valign="middle">
                                                        <asp:Label ID="Label2" runat="server" CssClass="Label" 
                                                            Text="Orders to be Allocated" Font-Size="13px"></asp:Label>
                                                    </td>
                                                    <td style="width:32px;" valign="middle">
                                                    <div class="Notifer">
                                                    <asp:Label ID="lbl_count_order" runat="server" Font-Bold="True" 
                                                            Font-Names="Verdana" ForeColor="White" Font-Size="14px"></asp:Label>
                                                    </div>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                    
                                        <td colspan="2" style="height:200px;"  valign="top">
                                            <div id="Div2" style="overflow:scroll; height:100%;">
                                              <asp:GridView ID="grd_order_Allocated" runat="server" AllowSorting="True" 
                                                AutoGenerateColumns="False" CellPadding="4" CssClass="name" Font-Size="Medium" 
                                                ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%" 
                                                    onrowcommand="grd_order_Allocated_RowCommand">
                                                
                                                <Columns>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"  >
                                                        <ItemTemplate>
                                                         <%--<div class="SingleCheckbox">
                                                        <asp:CheckBox ID="chkAllocatedSelect" runat="server" AutoPostBack="true"  Checked="True"  OnCheckedChanged="chkAllocatedSelect_CheckedChanged" />
                                                <asp:Label ID="Label3" AssociatedControlID="chkAllocatedSelect" runat="server" 
                                                            Text="" CssClass="CheckBoxLabel"><span style="width:1em;height:1em"></span></asp:Label></div>--%>
                                                            <asp:CheckBox ID="chkAllocatedSelect" runat="server" AutoPostBack="true" 
                                                                Checked="true" OnCheckedChanged="chkAllocatedSelect_CheckedChanged" />
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                        <%--<div class="SingleCheckbox">
                                                        <asp:CheckBox ID="chkAllocatedHeader" runat="server" AutoPostBack="true"  Checked="True" onclick="javascript:chkAllocatedHeader(this);" />
                                                <asp:Label ID="Label3" AssociatedControlID="chkAllocatedHeader" runat="server" 
                                                            Text="" CssClass="CheckBoxLabel"><span ></span></asp:Label></div>--%>
                                                            <asp:Label ID="Label6" runat="server" CssClass="head_style"></asp:Label>
                                                            <asp:CheckBox ID="chkAllocatedHeader" runat="server" Checked="True" 
                                                                onclick="javascript:chkAllocatedHeader(this);" />
                                                        </HeaderTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAllocated_id" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Assign_Id") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAllocatedOrder_id" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_ID") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Batch ID" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAllocatedbatch_Id" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("STATECOUNTY") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                          <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Number" >
                                                        <ItemTemplate>
                                                           
                                                                 <asp:LinkButton ID="lnk_Pending_Order_Number" runat="server" CssClass="Link_Button" CommandName="View_Order"  Text='<%#Eval("Order_Number") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Type" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAllocatedProduct_Type" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Product_Type") %>'></asp:Label>
                                                                  <asp:Label ID="lblAllocatedProduct_id" Visible="false" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Product_Type_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Source Type" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAllocatedOrder_Type" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Type") %>'></asp:Label>
                                                                  <asp:Label ID="lblAllocatedOrder_Type_id" Visible="false" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Type_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                              
                                                      <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Task" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblpendingOrder_Task" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Task") %>'></asp:Label>
                                                                  <asp:Label ID="lbl_Pending_Order_task_id" Visible="false" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Task_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Status" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblpending_Order_Status" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                                 <asp:Label ID="lbl_Pending_Status_Id" runat="server" Visible="false" CssClass="Label" 
                                                                Text='<%#Eval("Order_Status_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Order Date" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAllocatedDate" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="User" >
                                                        <ItemTemplate>
                                                          <asp:Label ID="Lbl_user_id" runat="server" Visible="false" CssClass="Label" 
                                                                Text='<%#Eval("User_id") %>'></asp:Label>
                                                            <asp:Label ID="lblAllocatedUser_Name" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("User_Name") %>'></asp:Label>
                                                        </ItemTemplate>
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
                                            </div>
                                           
                                           </td>
                                  
                                    </tr>
                                  <tr><td><br /></td></tr>
                                    <tr>
                                        <td colspan="2">
                                            <table style="width: 65%" align="center">
                                                <tr>
                                                    <td style="width:100px;">
                                                        <asp:Label ID="Label9" Visible="false" runat="server" CssClass="Label" Font-Size="14px" Text="Order No:"></asp:Label>
                                                    </td>
                                                    <td  >
                                                        <asp:TextBox ID="txt_order_Number" Visible="false" runat="server" CssClass="searchText" 
                                                            style="text-transform:uppercase;" Width="230px" AutoPostBack="True" 
                                                            ontextchanged="txt_order_Number_TextChanged"></asp:TextBox>
                                                    </td>
                                                    <%--<td  style="width:90px;">
                                                        <asp:Button ID="btn_Search" runat="server" 
                                                              CssClass="WebButton"    Text="Search" 
                                                            onclick="btn_Search_Click" Width="150px" />
                                                    </td>--%>
                                                    <td  style="width:100px;">
                                                        <asp:Label ID="Label1" runat="server" CssClass="Label" Font-Size="14px" 
                                                            Text="User Name:"></asp:Label>
                                                    </td>
                                                    <td  style="width:200px;">
                                                        <asp:DropDownList ID="ddl_UserName" runat="server" CssClass="DropDown" 
                                                            Width="150px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btn_Reallocate" runat="server" 
                                                              CssClass="WebButton"    Text="Re Allocate" 
                                                            onclick="btn_Reallocate_Click" Width="150px" />
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
                </ContentTemplate></asp:UpdatePanel>
               </div>
                  
               </td>
        </tr>
    </table>
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>


