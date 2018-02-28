<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Import_County_Database_Information.aspx.cs" Inherits="Admin_Import_County_Database_Information" %>

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
                <span class="WebFont1">Import County Database</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server" align="center" style="height:100%;" class="DivContentBody">
                    <table style="width:50%;" >
                          
                                 
                            
                                    
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="Div1">
                                          <table style="width:100%;">
                                         <tr>
                                         <td colspan=4 align="right">
                                             &nbsp;</td>
                                         </tr>  
                                    
                                     <tr>
                                        <td align="right" style="width: 200px; padding-right: 50px;"   >
                                            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                                                Text="Select Excel File Path" Font-Size="14px"></asp:Label>
                                         </td>
                                        <td style="width: 200px; height: 48px;" >
                                          <asp:FileUpload ID="fileuploadExcel" runat="server" CssClass="DropDown" 
                                                TabIndex="1" />
                                                                                       
                                         
                                         </td>
                                        
                                    </tr>
                                    
                                   
                                          
                                              <tr>
                                                  <td align="center"  colspan="2">
                                         <asp:Button ID="Btn_ExampleExcel" runat="server" 
                                                  CssClass="WebButton"     onclick="btn_ExampleExcel_Click" 
                                                 TabIndex="2" Text="Click here to download sample excel" Width="241px" />
                                         &nbsp;
                                                      <asp:Button ID="btn_Extract" runat="server"   CssClass="WebButton"    
                                                          Text="Extract" onclick="News_Click" TabIndex="3" />
                                                  </td>
                                              </tr>
                                    
                                   
                                          
                                          </table>

                                          </div>
                                          
                                          </td>
                                       
                                    </tr> 
                                    
                                </table>
                                  <asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always"><ContentTemplate>
                 <table style="width:100%;" align="center" >
                          
                                 
                            
                                    
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:100%;" align="center">
                                           
                                    
                                     <tr>
                                        <td  align="center" >
                                        <div  class="scrollbar" id="ex2" runat="server" style="height:350px; width:100%;" 
                                                align="center">
                                           <asp:GridView ID="grd_order" runat="server" 
                                   AllowSorting="True" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CellPadding="4" 
                                   CssClass="name" 
                                   GridLines="None" Width="100%" 
                                 
                                   onrowdatabound="grd_order_RowDataBound" 
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
                                             
                                                      <asp:Label ID="lbTemp_County_database_Id" CssClass="Label" Visible="false" runat="server" Text='<%#Eval("Temp_County_database_Id") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"     HeaderText="State" >
                                       
                                         
                                           <ItemTemplate>
                                             
                                                      <asp:Label ID="lblState" CssClass="Label" runat="server" Text='<%#Eval("State") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"    HeaderText="County" >
                                        
                                           <ItemTemplate>
                                               <asp:Label ID="lblCounty" CssClass="Label" runat="server" Text='<%#Eval("County") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="City" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblCity" CssClass="Label" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   
                                           HeaderText="Tax Office Ph No" >
                                        
                                           <ItemTemplate>
                                               <asp:Label ID="lblTax_Office_Phone_No" CssClass="Label" runat="server" 
                                                   Text='<%#Eval("Tax_Office_Phone_No") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="200px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   
                                           HeaderText="School Tax Office Ph No" >
                                         
                                           <ItemTemplate>
                                               <asp:Label ID="lblSchool_Tax_Office_Ph_No" CssClass="Label" runat="server" Text='<%#Eval("School_Tax_Office_Ph_No") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="280px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   
                                           HeaderText="Make Changes Payable to" >
                                         
                                           <ItemTemplate>
                                               <asp:Label ID="lblMake_Changes_Payable_to" CssClass="Label" runat="server" Text='<%#Eval("Make_Changes_Payable_to") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="320px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="County" >
                                      
                                           <ItemTemplate>
                                               <asp:Label ID="lblPayee_Address" CssClass="Label" runat="server" Text='<%#Eval("Payee_Address") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   
                                           HeaderText="Physical Address" >
                                           
                                           <ItemTemplate>
                                               <asp:Label ID="lblPhysical_Address" CssClass="Label" runat="server" Text='<%#Eval("Physical_Address") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="190px" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Hours Open" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblHours_Open" CssClass="Label" runat="server" Text='<%#Eval("Hours_Open") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="150px" />
                                       </asp:TemplateField>
                                   
                                      <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Website" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblWebsite" CssClass="Label" runat="server" Text='<%#Eval("Website") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="100px" />
                                       </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Fax No" >
                                          
                                           <ItemTemplate>
                                               <asp:Label ID="lblFax_No" CssClass="Label" runat="server" Text='<%#Eval("Fax_No") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="35px" />
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
                                    
                                   
                                    
                                          <%--    <tr>
                                                  <td style="width:200px;">
                                                      <asp:Label ID="Label6" runat="server" CssClass="Label" 
                                                          Text="Record Imported By"></asp:Label>
                                                  </td>
                                                  <td style="height: 50px">
                                                      <asp:Label ID="lbl_Record_Addedby" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td >
                                                      <asp:Label ID="Label7" runat="server" CssClass="Label" 
                                                          Text="Record Imported On"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="lbl_Record_AddedDate" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>--%>
                                    
                                   
                                          
                                          </table>

                                          </div>
                                          
                                          </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                         <td align="center" colspan="2">
                                             <asp:Button ID="btn_Duplicate" runat="server"   CssClass="WebButton"    
                                                 Text="Remove Duplicates" onclick="btn_Duplicate_Click" TabIndex="4" />
                                             &nbsp;<asp:Button ID="btn_Save" runat="server" 
                                                 CssClass="WebButton" 
                                                 Text="Import" onclick="btn_Save_Click" TabIndex="5" />
                                             &nbsp;<asp:Button ID="btn_Exit" runat="server" 
                                                 CssClass="WebButton" 
                                                 Text="Exit" Width="70px" onclick="btn_Exit_Click" BackColor="#EC5E5E" 
                                                 ForeColor="White" TabIndex="6" />
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
                  
               </td>
        </tr>
    </table>
         <div>                            
    <asp:UpdateProgress id="updateProgress" runat="server">
    <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #DBDBDB; opacity: 0.7;">
            <asp:Image ID="imgUpdateProgress" runat="server" 
               ImageUrl="~/img/Loading.gif"  AlternateText="Loading ..." 
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



