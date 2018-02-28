<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Create_Branch.aspx.cs" Inherits="Admin_Create_Order_Type" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%--<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>--%>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always"><ContentTemplate>
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Branch </span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server" style="height:100%;" class="DivContentBody">
               
                 <table style="width:100%;" >
                          
                                     <tr>
                                        <td  align="right" colspan="2">
                                            <asp:Button ID="News" runat="server"   CssClass="WebButton"    
                                                OnClick="News_Click" Text="Back" TabIndex="20" />
                                         </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="center" colspan="2">
                                          <h2 class="AdminHeader">
                                          <asp:Label   ID="lblhead" runat="server" 
                                                  CssClass="AdminHeader" ></asp:Label>
                                            </h2></td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="left" colspan="2">
                                            <%--<ul id="navigation">
	<li class="one"><a href="#view1">Details</a></li>
	<li class="two"><a href="#view2">Schedule</a></li>
	<li class="shadow"></li>
</ul>--%>
                                         
                                            <asp:Label  Font-Size="14px" ID="lbl_branch_id" runat="server" Text="Label" Visible="False"></asp:Label>
                                         
                                         </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:85%;" align="center">
                                           
                                    
                                     <tr>
                                        <td class="lbltd" style="height: 31px">
                                            <asp:Label  Font-Size="14px" ID="Label2" runat="server" CssClass="Label" Text="Company Name:"></asp:Label>
                                         </td>
                                        <td style="height: 31px" >
                                            <asp:DropDownList ID="ddl_Company" runat="server" AutoPostBack="True" 
                                                CssClass="DropDown" TabIndex="2" Width="210px">
                                            </asp:DropDownList>
                                         </td>
                                      <td>
                                                  <asp:Label  Font-Size="14px" ID="Label10" runat="server" CssClass="Label" Text="City:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Branch_city" runat="server" CssClass="textbox" 
                                                          TabIndex="9" Width="200px"></asp:TextBox>
                                                  </td>
                                    </tr>
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td class="lbltd" style="height: 31px">
                                            <asp:Label  Font-Size="14px" ID="Label28" runat="server" CssClass="Label" Text="Branch Name:"></asp:Label>
                                        </td>
                                       
                                        <td style="height: 31px" >
                                            <asp:TextBox ID="txt_Branchname" runat="server" CssClass="textbox" TabIndex="3" 
                                                Width="200px"></asp:TextBox>
                                        </td>
                                       <td>
                                                  <asp:Label  Font-Size="14px" ID="Label17" runat="server" CssClass="Label" Text="Pin Code:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_branch_Pincode" runat="server" CssClass="textbox" 
                                                          TabIndex="10" Width="200px"></asp:TextBox>
                                                      <asp:FilteredTextBoxExtender ID="txt_branch_Pincode_FilteredTextBoxExtender" 
                                                          runat="server" Enabled="True" FilterType="Numbers" 
                                                          TargetControlID="txt_branch_Pincode">
                                                      </asp:FilteredTextBoxExtender>
                                                  </td>
                                    </tr>
                              
                                
                                          
                                  
                                
                                          
                                              <tr>
                                                  <td class="lbltd" style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="Label3" runat="server" CssClass="Label" Text="Branch Code:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:TextBox ID="txt_Branch_Code" runat="server" CssClass="textbox" 
                                                          TabIndex="4" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label11" runat="server" CssClass="Label" Text="Tel.No:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Branch_phono" runat="server" CssClass="textbox" 
                                                          TabIndex="11" Width="200px"></asp:TextBox>
                                                      <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                                                          Enabled="True" FilterType="Numbers" TargetControlID="txt_Branch_phono">
                                                      </asp:FilteredTextBoxExtender>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="Label4" runat="server" CssClass="Label" Text="Address:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:TextBox ID="txt_Branch_address" runat="server" CssClass="textbox" 
                                                          TabIndex="5" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label12" runat="server" CssClass="Label" Text="Fax:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Branch_fax" runat="server" CssClass="textbox" 
                                                          TabIndex="12" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="Label9" runat="server" CssClass="Label" Text="Country:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:DropDownList ID="ddl_Branch_country" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" 
                                                          onselectedindexchanged="ddl_Branch_country_SelectedIndexChanged" TabIndex="6" 
                                                          ViewStateMode="Enabled" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label13" runat="server" CssClass="Label" Text="Email:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Branch_email" runat="server" CssClass="textbox" 
                                                          TabIndex="13" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="Label18" runat="server" CssClass="Label" Text="State:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:DropDownList ID="ddl_Branch_state" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" 
                                                          onselectedindexchanged="ddl_Branch_state_SelectedIndexChanged" TabIndex="7" 
                                                          ViewStateMode="Enabled" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label14" runat="server" CssClass="Label" Text="Website:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Branch_website" runat="server" CssClass="textbox" 
                                                          TabIndex="14" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="Label8" runat="server" CssClass="Label" Text="District:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:DropDownList ID="ddl_Branch_district" runat="server" CssClass="DropDown" 
                                                          TabIndex="8" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label32" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="Set As Default:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:CheckBox ID="ChkDefault" runat="server" TabIndex="15" />
                                                  </td>
                                              </tr>
                              
                                
                                          
                                  
                                
                                          
                                              <tr>
                                                  <td class="lbltd" style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="Label29" runat="server" CssClass="Label" Text="Record Added By"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="lbl_RecordAddedBy0" runat="server" 
                                                          CssClass="Label" TabIndex="16"></asp:Label>
                                                  </td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="Label30" runat="server" CssClass="Label" Text="Record Added On"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:Label  Font-Size="14px" ID="lbl_RecordAddedOn0" runat="server" 
                                                          CssClass="Label" TabIndex="17"></asp:Label>
                                                  </td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                              
                                
                                          
                                  
                                
                                          
                                          </table>

                                          </div>
                                          
                                          </td>
                                       
                                    </tr> 
                                    
                                  
                               
                    
                           
                                    <tr>
                                        <td align="center" colspan="2" style="height: 22px">
                                            <asp:Label  Font-Size="14px" ID="lbl_id" runat="server" Text="Label" Visible="False"></asp:Label>
                                        </td>
                                        
                                    </tr>
                           
                                     
                                     <tr>
                                         <td align="center" colspan="2">
                                             
                                             <br />
                                                        
                                         </td>
                                     </tr>
                           
                                    <tr>
                                         <td align="center" colspan="2" style="width: 100%">
                                             <asp:Button ID="btn_Save" runat="server" 
                                                 CssClass="WebButton" onclick="btn_Save_Click" 
                                                 Text="Create Branch" TabIndex="18" />
                                             &nbsp;<asp:Button ID="btn_Cancel" runat="server" BackColor="#EC5E5E" ForeColor="White"
                                                 CssClass="WebButton" onclick="btn_Cancel_Click" 
                                                 Text="Clear" Width="57px" TabIndex="19" />
                                         </td>
                                     </tr>
                           
                                    <tr>
                                        <td align="right" colspan="2">
                                            <a href="#" class="back-to-top"><div class="imgbacktotop"></div></a>
                                            </td>
                                        
                                    </tr>
                           
                                    <tr>
                                        <td align="center" colspan="2">
                                        
                                            &nbsp;</td>
                                        
                                    </tr>
                           
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        
                                    </tr>
                                </table>
               
               </div>
                    <div id="DivView" runat="server" style="height:100%;" class="DivContentBody">
           
                   <table style="width: 100%; height:500px;">
                       <tr>
                           <td valign="top" class="tblhead" align="right">
                            
                               <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" 
                                                                
                      CssClass="WebButton"    Text="Add Branch" TabIndex="1" 
                                                                 /> 
                              
                             </td>
                       </tr>
                       <tr>
                           <td align="center">
                                   <asp:GridView ID="gv_Branch" runat="server" AutoGenerateColumns="False" 
                                       CssClass="name" DataKeyNames="Branch_ID" 
                                       onrowdeleting="gv_Branch_RowDeleting" Width="70%"
                                       onselectedindexchanged="gv_Branch_SelectedIndexChanged" ForeColor="#333333" 
                                       GridLines="None" CellPadding="4">
                                       
                                       <Columns>
                                           <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="No">
                                               <HeaderTemplate>
                                                   <asp:Label  Font-Size="14px" ID="lblColemp1" runat="server" Text="No" />
                                               </HeaderTemplate>
                                               <ItemTemplate>
                                                   <%#Container.DataItemIndex+1 %>
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px"   />
                                               <ItemStyle CssClass="grid-item"   Height="20px" HorizontalAlign="Center" Width="30px" />
                                           </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="head-label"   Visible="false" HeaderText="No">
                                               <HeaderTemplate>
                                                   <asp:Label  Font-Size="14px" ID="lbl_Branch_Id" runat="server" Text="No" />
                                               </HeaderTemplate>
                                               <ItemTemplate>
                                                 <asp:Label ID="lbl_Branch_id" runat="server"  Visible="false" Text='<%#Eval("Branch_ID") %>'></asp:Label>
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px"   />
                                               <ItemStyle CssClass="grid-item"   Height="20px" HorizontalAlign="Center" Width="30px" />
                                           </asp:TemplateField>
                                         
                                           <asp:BoundField DataField="Branch_Name" HeaderText="Branch Name" >
                                           <HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px"    />
                                           <ItemStyle CssClass="grid-item"   Height="20px" HorizontalAlign="Center" Width="30px" />
                                           </asp:BoundField>
                                           <asp:BoundField DataField="Company_Name" HeaderText="Company" >
                                           <HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px"   />
                                           <ItemStyle CssClass="grid-item"   Height="20px" HorizontalAlign="Center" Width="30px" />
                                           </asp:BoundField>
                                           <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                                               <ItemTemplate>
                                                   <asp:ImageButton ID="btnview" runat="server" CommandName="Select" 
                                                       ImageUrl="~/images/Gridview/View.png" />
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px" />
                                               <ItemStyle CssClass="grid-item"   Height="20px" HorizontalAlign="Center" Width="30px" />
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                                               <ItemTemplate>
                                                   <asp:ImageButton ID="btnDelete" runat="server" CommandName="Delete" 
                                                       ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                       OnClientClick="javascript:return confirm('Are you sure to proceed?');" />
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px" />
                                               <ItemStyle CssClass="grid-item"   Height="20px" HorizontalAlign="Center" Width="30px" />
                                           </asp:TemplateField>
                                       </Columns>
                                      <EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <HeaderStyle CssClass="head_style"  Height="40px"    />
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
                           <td valign="top">
                               &nbsp;</td>
                       </tr>
                       <tr>
                           <td align="right">
                                <a href="#" class="back-to-top"><div class="imgbacktotop"></div></a></td>
                       </tr>
                   </table>
               
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


