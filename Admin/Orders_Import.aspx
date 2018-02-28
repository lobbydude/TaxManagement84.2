<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Orders_Import.aspx.cs" Inherits="Admin_Orders_Import" %>

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
  
      <table style="width: 100%">
        <tr>
            <td>
                <div id="content">
                <span class="WebFont1">Order Import</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server" align="center" style="height:100%; float: left; width: 100%;" class="DivContentBody">

                <div class=" col-md-9 col-sm-12 col-xs-12">
                        <div class=" col-md-3 col-sm-12 col-xs-12"></div>
                        <div class=" col-md-9 col-sm-12 col-xs-12">
                            <table>
                                         
                                 <%--   <tr>
                                <td><asp:Label ID="Label1" runat="server" CssClass="Label" ForeColor="Red" Font-Size="14px"
                                                Text="Duplicate Records in Excel"></asp:Label></td>
                                <td><asp:Label ID="Label3" runat="server" CssClass="Label" ForeColor="Green" Font-Size="14px"
                                                Text="Exist Records are in Yellow Colors"></asp:Label></td>
                                </tr>--%>
                                    
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="Div1">
                                          <table style="width:100%;">
                                           
                                    
                                     <tr  style=" padding-bottom:10px; float:left;">
                                        
                                        <td >
                                          <asp:FileUpload ID="fileuploadExcel" runat="server" CssClass="DropDown" 
                                                onload="fileuploadExcel_Load" TabIndex="1" />
                                         </td>
                                        
                                        
                                        
                                    </tr>
                                    
                                   
                                          
                                              <tr>
                                                <td align="left" >
                                                      <asp:Button ID="btn_Export" runat="server"   CssClass="WebButton"    
                                                          Text="Get Import Excel Format " onclick="btn_Export_Click" Width="98%" 
                                                          TabIndex="2" />
                                                </td>

                                                  <td align="left"  colspan="3">
                                                      <asp:Button ID="btn_Extract" runat="server"   CssClass="WebButton"    
                                                          Text="Extract" onclick="News_Click" Width="200px" TabIndex="3" />
                                                  </td>
                                              </tr>
                                    
                                   
                                          
                                          </table>

                                          </div>
                                          
                                          </td>
                                       
                                    </tr> 
                                    
                            </table>
                        


                                  <asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always" style=" width:66%;"><ContentTemplate>
                            <table style="width:100%;" >
                           
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:100%;">
                                           
                                    
                                     <tr>
                                        <td  colspan="2" >
                                        <div  class="scrollbar" id="ex2" runat="server" style="height:350px; width:100%;">
                                           <asp:GridView ID="grd_order" runat="server" 
                                   AllowSorting="True" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" CellPadding="4" 
                                   CssClass="name"  Font-Size="Medium" 
                                   GridLines="None" Width="100%" 
                                 
                                   ForeColor="#333333" onrowdatabound="grd_order_RowDataBound" 
                                                onsorting="grd_order_Sorting">
                                   
                                   <Columns>
                                     <asp:TemplateField HeaderStyle-CssClass="head-label"  >
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkBxSelect" runat="server" AutoPostBack="true" 
                                                                    Checked="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label6" runat="server"></asp:Label>
                                                                <asp:CheckBox ID="chkBxHeader" runat="server" Checked="True" 
                                                                    onclick="javascript:HeaderClick(this);" />
                                                            </HeaderTemplate>
                                                        </asp:TemplateField>
                           
                                    <asp:TemplateField HeaderStyle-CssClass="head-label"     HeaderText="id" Visible="false">
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblOrder_id" CssClass="Label" Visible="false" runat="server" Text='<%#Eval("Temp_Order_Id") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"     HeaderText="Order #" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblOrder_Number" CssClass="Label" runat="server" Text='<%#Eval("Client_Order_Number") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"     HeaderText="Client" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblClientName" CssClass="Label" runat="server" Text='<%#Eval("Client_Name") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"     HeaderText="Sub Client" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblSubProcess" CssClass="Label" runat="server" Text='<%#Eval("Sub_Client") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="head-label"     HeaderText="Order Type" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblProduct_Type" CssClass="Label" runat="server" Text='<%#Eval("Product_Type") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="head-label"    Visible="false"  HeaderText="Client Address" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblClient_Address" Visible="false" CssClass="Label" runat="server" Text='<%#Eval("Client_Address") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"    Visible="false" HeaderText="Cleint City" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblCleint_City" Visible="false" CssClass="Label" runat="server" Text='<%#Eval("Cleint_City") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="head-label"    Visible="false"  HeaderText="Client State" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblClient_State" Visible="false" CssClass="Label" runat="server" Text='<%#Eval("Client_State") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="head-label"    Visible="false"  HeaderText="Client County" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblClient_County" Visible="false" CssClass="Label" runat="server" Text='<%#Eval("Client_County") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   Visible="false"  HeaderText="Cleint Zip" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblClient_Zip" Visible="false" CssClass="Label" runat="server" Text='<%#Eval("Cleint_Zip") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Cleint Email" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblCleint_Email" CssClass="Label" runat="server" Text='<%#Eval("Cleint_Email") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                   
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"    HeaderText="Loan Number">
                                        
                                           <ItemTemplate>
                                               <asp:Label ID="lblLoan_Number" CssClass="Label" runat="server" Text='<%#Eval("Loan_Number") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="First Name">
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblBorrower_Name" CssClass="Label" runat="server" Text='<%#Eval("Borrower_Name") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Last Name" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblLast_Name" CssClass="Label" runat="server" Text='<%#Eval("Last_Name") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Barrower Address" >
                                        
                                           <ItemTemplate>
                                               <asp:Label ID="lblBarrower_Address" CssClass="Label" runat="server" 
                                                   Text='<%#Eval("Barrower_Address") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                      
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Barrower State" >
                                         
                                           <ItemTemplate>
                                               <asp:Label ID="lblBarrower_State" CssClass="Label" runat="server" Text='<%#Eval("Barrower_State") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Barrower_County" >
                                      
                                           <ItemTemplate>
                                               <asp:Label ID="lblBarrower_County" CssClass="Label" runat="server" Text='<%#Eval("Barrower_County") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Barrower City" >
                                         
                                           <ItemTemplate>
                                               <asp:Label ID="lblBarrower_City" CssClass="Label" runat="server" Text='<%#Eval("Barrower_City") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Barrower Zip" >
                                           
                                           <ItemTemplate>
                                               <asp:Label ID="lblBarrower_Zip" CssClass="Label" runat="server" Text='<%#Eval("Barrower_Zip") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Parcel Id" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblParcel_Id" CssClass="Label" runat="server" Text='<%#Eval("Parcel_Id") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Phone Number" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblPhone_Number" CssClass="Label" runat="server" Text='<%#Eval("Phone_Number") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Contract Number" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblContract_Number" CssClass="Label" runat="server" Text='<%#Eval("Contract_Number") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Batch Number" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblBatch_Number" CssClass="Label" runat="server" Text='<%#Eval("Batch_Number") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Products" SortExpression="Products">
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblProducts" CssClass="Label" runat="server" Text='<%#Eval("Products") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
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
                                    
                                   
                                    
                                        
                                   
                                          
                                          </table>

                                          </div>
                                          
                                          </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                         <td align="center" colspan="2">
                                             <asp:Button ID="btn_Duplicate" runat="server"   CssClass="WebButton"    
                                                 Text="Remove Duplicates" onclick="btn_Duplicate_Click" Width="209px" 
                                                 TabIndex="4" />
                                             <asp:Button ID="btn_Save" runat="server" 
                                                 CssClass="WebButton" 
                                                 Text="Import" onclick="btn_Save_Click" Width="120px" TabIndex="5" />
                                             &nbsp;<asp:Button ID="btn_Exit" runat="server" 
                                                 CssClass="WebButton" 
                                                 Text="Exit" Width="70px" onclick="btn_Exit_Click" TabIndex="6" />
                                         </td>
                                     </tr>
                           
                                    <tr>
                                        <td align="right" colspan="2">
                                            <a href="#" class="back-to-top"><div class="imgbacktotop"></div></a>
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
                </div>

                <div class=" col-md-3 col-sm-12 col-xs-12" style="padding: 10px;">
                    <div class=" col-md-12 col-sm-12 col-xs-12" style=" border:1px solid #ddd; float:left;">
                       <div class=" col-md-12 col-sm-12 col-xs-12" style=" padding:10px 0px; float:left;">
                            <div class=" col-md-12 col-sm-12 col-xs-12" style=" float:left; padding-bottom:5px;">
                                <div class=" col-md-1 col-sm-12 col-xs-12" style="width:15px; height:15px; padding:0px; background-color:red; margin-top: 5px;"></div>
                                <div class=" col-md-11 col-sm-12 col-xs-12" style=" padding:0px 10px; text-align:left; font-size:16px;">some content</div>
                            </div>

                            <div class=" col-md-12 col-sm-12 col-xs-12" style=" float:left; padding-bottom:5px;">
                                <div class=" col-md-1 col-sm-12 col-xs-12" style="width:15px; height:15px; padding:0px; background-color:yellow; margin-top: 5px;"></div>
                                <div class=" col-md-11 col-sm-12 col-xs-12" style=" padding:0px 10px; text-align:left; font-size:16px;">some content</div>
                            </div>
                       </div>
                    </div>
                </div>
               </div>
                  
               </td>
        </tr>
    </table>
        <div>                            
    <asp:UpdateProgress id="updateProgress" runat="server">
    <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #DBDBDB; opacity: 0.7;">
            <asp:Image ID="imgUpdateProgress" runat="server" 
               ImageUrl="~/img/Loading.gif"   AlternateText="Loading ..." 
                ToolTip="Loading ..." style="padding: 10px;position:fixed;top:45%;left:50%;" />
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>


        
        <div>
            <ajaxToolkit:ModalPopupExtender ID="model1" TargetControlID="updateProgress" PopupControlID="updateProgress"  Enabled="true" runat="server" ViewStateMode="Enabled" >
            
            </ajaxToolkit:ModalPopupExtender>
        </div>
    </div>
</asp:Content>


