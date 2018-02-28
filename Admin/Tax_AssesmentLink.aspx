<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Tax_AssesmentLink.aspx.cs" Inherits="Admin_Tax_AssesmentLink" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always"><Triggers><asp:PostBackTrigger ControlID="btn_Extract" /></Triggers><ContentTemplate>
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Taxes and Assessment Link</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>

               <div id="Divcreate" runat="server" style="height:100%;" class="DivContentBody">
               
               <table style="width:100%">
               <tr>
                                        <td  align="right">
                                            &nbsp;</td>
                                       
                                    </tr> 
                   <tr>
                       <td align="left">
                           <asp:Button ID="btn_Import" runat="server" CssClass="WebButton" OnClick="btn_Import_Click" 
                               Text="Import" TabIndex="1" />
                           <asp:Button ID="btn_Add_New" runat="server" CssClass="WebButton" 
                               OnClick="btn_Add_New_Click" Text="Add New" TabIndex="2" />
                       </td>
                   </tr>
                   <tr>
                       <td align="center">
                       <asp:UpdatePanel ID="upexport" runat="server"><Triggers><asp:PostBackTrigger ControlID="btn_Export"/></Triggers><ContentTemplate>
                               <table id="tblimport" runat="server" style="width:100%;">
                                           
                                    
                                     <tr>
                                        <td   >
                                            <asp:Label ID="Label2" runat="server" CssClass="Label" Font-Size="14px" Width="200px"
                                                Text="Select Excel File Path"></asp:Label>
                                         </td>
                                        <td >
                                          <asp:FileUpload ID="fileuploadExcel" runat="server" CssClass="dropdown" TabIndex="3" 
                                             />
                                         </td>
                                        
                                        <td align="center" >
                                                      <asp:Button ID="btn_Export" runat="server"   CssClass="WebButton"    
                                                          Text="Get Import Excel Format " onclick="btn_Export_Click" Width="170px" 
                                                          TabIndex="4" />
                                         </td>
                                        
                                    </tr>
                                    
                                   
                                          
                                              <tr>
                                                  <td align="center"  colspan="3">
                                                      <asp:Button ID="btn_Extract" runat="server"   CssClass="WebButton"    
                                                          Text="Extract" onclick="News_Click" Width="120px" TabIndex="5" />
                                                      <asp:Button ID="btn_Cance_Export" runat="server" CssClass="WebButton" 
                                                          onclick="btn_Cance_Export_Click" Text="Cancel" Width="120px" 
                                                          TabIndex="6" />
                                                  </td>
                                              </tr>
                                    
                                   
                                          
                                          <tr>
                                              <td align="center" colspan="3">
                                              <div class="scrollbar" id="ex2" runat="server" style="height:350px; width:98%;">
                                                  <asp:GridView ID="grd_Import" runat="server" 
                                                      AutoGenerateColumns="False" CellPadding="4" CssClass="name" GridLines="None" 
                                                      onpageindexchanging="grd_SubProcess_PageIndexChanging" 
                                                      onrowdatabound="grd_Import_RowDataBound" 
                                                      onrowdeleting="grd_SubProcess_RowDeleting" 
                                                      onselectedindexchanged="grd_SubProcess_SelectedIndexChanged" PageSize="20" 
                                                      Width="98%">
                                                      <Columns>
                                                        
                                                       
                                                          <asp:BoundField DataField="State" 
                                                              HeaderStyle-HorizontalAlign="Center" HeaderText="State" 
                                                              ItemStyle-HorizontalAlign="Center">
                                                          <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" 
                                                              Width="150px" />
                                                          <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="County" HeaderText="County">
                                                          <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                          <ItemStyle CssClass="grid-item" Width="100px" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="CountyTax_Link" HeaderText="County Taxes Link">
                                                          <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                          <ItemStyle CssClass="grid-item" Width="200px" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="Tax_PhoneNo" HeaderText="Tax Office Phone No">
                                                          <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                          <ItemStyle CssClass="grid-item" Width="200px" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="Assessor_Link" HeaderText="Property Assessor Link">
                                                          <ItemStyle CssClass="grid-item" Width="150px" />
                                                          <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                          </asp:BoundField>
                                                          <asp:BoundField DataField="Assessor_PhoneNo" HeaderText="Assessor Phone No">
                                                          <ItemStyle CssClass="grid-item" Width="150px" />
                                                          <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                          </asp:BoundField>
                                                      </Columns>
                                                      <EmptyDataRowStyle BackColor="#f9f9f9" BorderColor="#D9D9D9" 
                                                          BorderStyle="Solid" BorderWidth="1px" ForeColor="#333333" />
                                                      <FooterStyle BackColor="#cccccc" Font-Bold="True" ForeColor="White" />
                                                      <PagerStyle CssClass="PagerStyle" HorizontalAlign="Center" />
                                                      <SelectedRowStyle CssClass="SelectedRowStyle" Font-Bold="True" 
                                                          ForeColor="White" />
                                                      <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                      <SortedAscendingHeaderStyle BackColor="#808080" />
                                                      <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                      <SortedDescendingHeaderStyle BackColor="#383838" />
                                                  </asp:GridView>
                                                  </div>
                                              </td>
                                     </tr>
                                     <tr>
                                         <td align="center" colspan="3">
                                             <asp:Button ID="btn_Insert" runat="server" CssClass="WebButton" 
                                                 onclick="btn_Insert_Click" Text="Import" Width="120px" TabIndex="7" />
                                         </td>
                                     </tr>
                                    
                                   
                                          
                                          </table>
                                          </ContentTemplate></asp:UpdatePanel>
                           </td>
                   </tr>
               </table>

                 <table id="tbl_Add_New" runat="server"  style="width:60%;" align="center" >
                          
                                     
                                    
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="btn_Back" runat="server" CssClass="WebButton" 
                                                onclick="btn_Back_Click" Text="Back" Width="120px" TabIndex="21" />
                                        </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="center">

                                            <h2 align="center" class="AdminHeader">
                                                <asp:Label ID="lblhead" runat="server" CssClass="AdminHeader">Taxes and Assessment Link</asp:Label>
                                            </h2>
                                         </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="center" colspan="2">
                                        
                                       
                                            <table style="width:100%;">
                                                <tr>
                                                    <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                        <asp:Label ID="Label7" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                            Text="State:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_State" runat="server" AutoPostBack="True" 
                                                            CssClass="DropDown" 
                                                            onselectedindexchanged="ddl_State_SelectedIndexChanged" Width="260px" 
                                                            TabIndex="10">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                        <asp:Label ID="Label9" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                            Text="County"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_County" runat="server" AutoPostBack="True" 
                                                            CssClass="DropDown" Width="260px" TabIndex="12">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                        <asp:Label ID="Label10" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                            Text="County Taxes Link"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_County_Taxes_Link" runat="server" CssClass="textbox" 
                                                          Width="250px" ontextchanged="txt_County_Taxes_Link_TextChanged" 
                                                            TabIndex="13"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                        <asp:Label ID="Label11" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                            Text="Tax Office Phone No"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_tax_office_phone_no" runat="server" CssClass="textbox" 
                                                            Width="250px" TabIndex="14"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                        <asp:Label ID="Label12" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                            Text="Property Assessor Link"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_poperty_Assessor_link" runat="server" CssClass="textbox" 
                                                            Width="250px" TabIndex="15"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                        <asp:Label ID="Label13" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                            Text="Assessor Phone No"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_assessor_phone_no" runat="server" CssClass="textbox" 
                                                            Width="250px" TabIndex="16"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" colspan="2">
                                                        <h4 class="AdminHeader">
                                                            Additional Information</h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                        <asp:Label ID="Label5" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                            Text="Record Added By:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbl_Record_Addedby" runat="server" CssClass="Label" 
                                                            Font-Size="14px" TabIndex="17"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                        <asp:Label ID="Label6" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                            Text="Record Added On:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbl_Record_AddedDate" runat="server" CssClass="Label" 
                                                            Font-Size="14px" TabIndex="18"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>

                                          
                                          
                                          </td>
                                       
                                    </tr> 
                                    
                                  
                               
                    
                           
                                    <tr>
                                        <td align="center" colspan="2">
&nbsp;</td>
                                        
                                    </tr>
                           
                                     
                                     <tr>
                                         <td align="center" colspan="2">
                                             <br />
                                         </td>
                                     </tr>
                           
                                    <tr>
                                         <td align="center" colspan="2">
                                             <asp:Button ID="btn_Add_New_Tax" runat="server" 
                                                 CssClass="WebButton" onclick="btn_Add_New_Tax_Click" 
                                                 Text="Add New TaxAssesment" TabIndex="19" />
                                             &nbsp;<asp:Button ID="btn_Cancel" runat="server" 
                                                 CssClass="WebButton" onclick="btn_Cancel_Click" 
                                                 Text="Clear" Width="58px" BackColor="#EC5E5E" ForeColor="White" 
                                                 TabIndex="20" />
                                         </td>
                                     </tr>
                           <tr>
                           <td><br /></td></tr>
                             
                                </table>
               <table id="tr_AddNew" runat="server" style="width: 100%; height:500px;">
                       
                         <tr>
                                                  <td class="lbltd" align="right" colspan="2">
                                                      <table style="width: 100%">
                                                          <tr>
                                                              <td>
                                                                  <asp:Label ID="Label1" runat="server" CssClass="Label" Font-Size="14px" Width="200px" 
                                                                      Text="State Name: "></asp:Label>
                                                              </td>
                                                              <td>
                                                                  <asp:DropDownList ID="ddl_State_Wise" runat="server" CssClass="DropDown" 
                                                                      onselectedindexchanged="ddl_ClientWiseSearch_SelectedIndexChanged" 
                                                                      Width="200px" AutoPostBack="True" TabIndex="8">
                                                                  </asp:DropDownList>
                                                              </td>
                                                              <td align="Right">
                                                                  <asp:Button ID="btn_Submit" runat="server" CssClass="WebButton" 
                                                                      OnClick="btn_Submit_Click" Text="Add New TaxAssesment" TabIndex="9" />
                                                              </td>
                                                          </tr>
                                                      </table>
                                                  </td>
                                              </tr>
                       <tr >
                           <td class="lbltd" align="center">
                           
                               </td>
                           
                       </tr>
                         <tr>
                             <td align="center"  colspan="2">
                                 <asp:GridView ID="Grd_Tax_County_Link" runat="server" AllowPaging="True" 
                                     AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                  
                                    PageSize="20" 
                                     Width="98%" 
                                       GridLines="None" onrowcommand="Grd_Tax_County_Link_RowCommand" 
                                     onpageindexchanging="Grd_Tax_County_Link_PageIndexChanging">
                                       
                                     <Columns>
                                        <asp:TemplateField Visible="false">
                                                          <ItemTemplate>
                                                          <asp:Label ID="lbl_County_Assement_Link_Id" runat="server" Visible="false"  Text='<%#Eval("County_Assement_Link_Id") %>'></asp:Label>
                                                          </ItemTemplate>
                                                          </asp:TemplateField>
                                                              <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="State">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblState" runat="server"  
                                                                    Text='<%#Eval("State") %>' ></asp:Label>
                                                                    <asp:Label ID="lbl_State_Id" runat="server" Visible="false"  
                                                                    Text='<%#Eval("State_ID") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                            <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="County">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCounty" runat="server"  
                                                                    Text='<%#Eval("County") %>' ></asp:Label>
                                                                    <asp:Label ID="lbl_county_Id" runat="server" Visible="false"  
                                                                    Text='<%#Eval("County_ID") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                            <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="County Taxes Link">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCountyTax_Link" runat="server"  
                                                                    Text='<%#Eval("CountyTax_Link") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                            <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Tax Office Phone No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTax_PhoneNo" runat="server"  
                                                                    Text='<%#Eval("Tax_PhoneNo") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>

                                                      <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Property Assessor Link">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAssessor_Link" runat="server"  
                                                                    Text='<%#Eval("Assessor_Link") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                              <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Assessor Phone No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAssessor_PhoneNo" runat="server"  
                                                                    Text='<%#Eval("Assessor_PhoneNo") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                          
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                                             <ItemTemplate>
                                                 <asp:ImageButton ID="imgbtnExamEdit" runat="server" CommandName="EditRecord" 
                                                     Height="15px" ImageUrl="~/images/Gridview/View.png" Width="15px" />
                                             </ItemTemplate>
                                             <HeaderStyle CssClass="head_style"  Height="30px" HorizontalAlign="Center"     />
                                             <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                                             <ItemTemplate>
                                                 <asp:ImageButton ID="imgbtnExamDelete" runat="server" CommandName="DeleteRecord" 
                                                     Height="15px" ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                      OnClientClick="javascript:return confirm('Are you sure to proceed?');"
                                                     Width="12px" />
                                             </ItemTemplate>
                                             <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"   />
                                             <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
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
                           <td valign="top" align="center">
                                   &nbsp;</td>
                       </tr>
                       <tr>
                           <td valign="top">
                               &nbsp;</td>
                       </tr>
                       <tr>
                           <td align="right">
                                <a href="#" class="back-to-top"><div class="imgbacktotop"></div></a></td>
                       </tr>
                   </table>
               </div>

                    <div id="DivView" runat="server" style="height:100%;" class="DivContentBody" visible="false">
           
                   
               
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
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>


