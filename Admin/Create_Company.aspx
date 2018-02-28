<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Create_Company.aspx.cs" Inherits="Admin_Create_Order_Type" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%--<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>--%>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Company </span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server" style="height:100%;" class="DivContentBody">
                <table style="width:100%;" align="center">
                <tr>
                                        <td  align="right" colspan="4">
                                            <asp:Button ID="btn_Back" runat="server"   CssClass="WebButton"    
                                                OnClick="btn_Back_Click" Text="Back" TabIndex="22" />
                                         </td>
                                       
                                    </tr> 
                                    </table>
                      <table style="width:75%;" align="center">
                                           
                                     
                                     <tr>
                                        <td class="lbltd" style="height: 31px" align="left">
                                            &nbsp;</td>
                                        <td style="height: 31px" >
                                            &nbsp;</td>
                                      <td>
                                                  &nbsp;</td>
                                                
                                    </tr>
                                    
                                   
                                    
                              
                                
                                          
                                     <tr>
                                         <td align="left" class="lbltd" style="height: 31px; width: 200px;">
                                             <asp:Label  Font-Size="14px" ID="Label2" runat="server" CssClass="Label" Text="Company Name:"></asp:Label>
                                         </td>
                                         <td style="height: 31px">
                                             <asp:TextBox ID="txt_companyname" runat="server" CssClass="textbox" 
                                                 TabIndex="2" Width="200px"></asp:TextBox>
                                         </td>
                                         <td>
                                             <asp:Label  Font-Size="14px" ID="Label10" runat="server" CssClass="Label" Text="City:"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:TextBox ID="txt_company_city" runat="server" CssClass="textbox" 
                                                 TabIndex="11" Width="200px"></asp:TextBox>
                                         </td>
                                     </tr>
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td class="lbltd" style="height: 31px" align="left">
                                            <asp:Label  Font-Size="14px" ID="Label16" runat="server" CssClass="Label" Text="Company slogan:"></asp:Label>
                                        </td>
                                       
                                        <td style="height: 31px" >
                                            <asp:TextBox ID="txt_company_slogan" runat="server" CssClass="textbox" 
                                                TabIndex="3" Width="200px"></asp:TextBox>
                                        </td>
                                       <td>
                                                  <asp:Label  Font-Size="14px" ID="Label17" runat="server" CssClass="Label" Text="Pin Code:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_company_Pincode" runat="server" CssClass="textbox" 
                                                          TabIndex="12" Width="200px"></asp:TextBox>
                                                      <asp:FilteredTextBoxExtender ID="txt_company_Pincode_FilteredTextBoxExtender" 
                                                          runat="server" Enabled="True" FilterType="Numbers" 
                                                          TargetControlID="txt_company_Pincode">
                                                      </asp:FilteredTextBoxExtender>
                                                  </td>
                                    </tr>
                              
                                
                                          
                                  
                                
                                          
                                              <tr>
                                                  <td class="lbltd" style="height: 31px" align="left">
                                                      <asp:Label  Font-Size="14px" ID="Label3" runat="server" CssClass="Label" 
                                                          Text="Company Registration No:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:TextBox ID="txt_company_registrationno" runat="server" CssClass="textbox" 
                                                          TabIndex="4" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label11" runat="server" CssClass="Label" Text="Tel.No:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_company_phono" runat="server" CssClass="textbox" 
                                                          TabIndex="13" Width="200px"></asp:TextBox>
                                                      <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                                                          Enabled="True" FilterType="Numbers" TargetControlID="txt_company_phono">
                                                      </asp:FilteredTextBoxExtender>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="height: 31px" align="left">
                                                      <asp:Label  Font-Size="14px" ID="Label4" runat="server" CssClass="Label" Text="Address:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:TextBox ID="txt_company_address" runat="server" CssClass="textbox" 
                                                          TabIndex="5" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label12" runat="server" CssClass="Label" Text="Fax:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_company_fax" runat="server" CssClass="textbox" 
                                                          TabIndex="14" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="height: 31px" align="left">
                                                      <asp:Label  Font-Size="14px" ID="Label9" runat="server" CssClass="Label" Text="Country:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:DropDownList ID="ddl_company_country" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" 
                                                          onselectedindexchanged="ddl_company_country_SelectedIndexChanged1" TabIndex="6" 
                                                          ViewStateMode="Enabled" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label13" runat="server" CssClass="Label" Text="Email:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_company_email" runat="server" CssClass="textbox" 
                                                          TabIndex="15" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="height: 31px" align="left">
                                                      <asp:Label  Font-Size="14px" ID="Label18" runat="server" CssClass="Label" Text="State:"></asp:Label>
                                                  </td>
                                                  <td style="height: 31px">
                                                      <asp:DropDownList ID="ddl_company_state" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" 
                                                          onselectedindexchanged="ddl_company_state_SelectedIndexChanged" TabIndex="7" 
                                                          ViewStateMode="Enabled" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label14" runat="server" CssClass="Label" Text="Website:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_company_website" runat="server" CssClass="textbox" 
                                                          TabIndex="16" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td align="left" >
                                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                      <asp:Label  Font-Size="14px" ID="Label8" runat="server" CssClass="Label" Text="District:"></asp:Label>
                                                  </td>
                                                  <td >
                                                      <asp:DropDownList ID="ddl_company_district" runat="server" CssClass="DropDown" 
                                                          TabIndex="8" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="Label27" runat="server" CssClass="Label" Text="Set As Default:"></asp:Label>
                                                  </td>
                                                  <td>
                                      
                                                      <asp:CheckBox ID="ChkDefault" runat="server" TabIndex="17" />
                                      
                                                  </td>
                                              </tr>
                              
                                
                                          
                                  
                                
                                          
                                             
                                    
                                   
                                          
                                          </table>

                                
                                    <table style="width:75%;" align="center">
     <tr>
                                                  <td class="lbltd" align="left" style="width: 200px">
                                                      <asp:Label  Font-Size="14px" ID="Label15" runat="server" CssClass="Label" Text="Company Logo:"></asp:Label>
                                                  </td>
                                                  <td style="height: 50px">
                                                       <asp:UpdatePanel ID="upbtn" runat="server">
                                                          <ContentTemplate>
                                                              <asp:FileUpload ID="fileup_comapny_logo" runat="server" CssClass="textbox" 
                                                                  TabIndex="9" />
                                                          </ContentTemplate>
                                                          <Triggers>
                                                              <asp:PostBackTrigger ControlID="btn_upload" />
                                                          </Triggers>
                                                      </asp:UpdatePanel>
                                                      <asp:Button ID="btn_upload" runat="server" CssClass="WebButton" 
                                                          onclick="btn_upload_Click" TabIndex="10" Text="Upload" /></td>
                                                
                                              </tr>
     <tr>
                                                  <td class="lbltd" align="left" style="width: 200px">
                                                      <asp:Label  Font-Size="14px" ID="Label6" runat="server" CssClass="Label" Text="Record Added By"></asp:Label>
                                                  </td>
                                                  <td style="height: 50px">
                                                      <asp:Label  Font-Size="14px" ID="lbl_RecordAddedBy" runat="server" 
                                                          CssClass="Label" TabIndex="18"></asp:Label>
                                                  </td>
                                                
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" align="left" style="width: 200px">
                                                      <asp:Label  Font-Size="14px" ID="Label7" runat="server" CssClass="Label" Text="Record Added On"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label  Font-Size="14px" ID="lbl_RecordAddedOn" runat="server" 
                                                          CssClass="Label" TabIndex="19"></asp:Label>
                                                  </td>
                                              
                                              </tr>
                                               <table style="width:80%;" align="center">
                                              <tr>

                                                  <td class="lbltd" align="right" style="width: 549px">
                                             <asp:Button ID="btn_Save" runat="server" 
                                                 CssClass="WebButton" onclick="btn_Save_Click" 
                                                 Text="Create Company" TabIndex="20" />
                                                  </td>
                                                  <td align="right" style="width: 50px">
                                                      <asp:Button ID="btn_Cancel" runat="server" 
                                                 CssClass="WebButton" onclick="btn_Cancel_Click" 
                                                 Text="Clear" Width="57px" Height="34px" BackColor="#EC5E5E" ForeColor="White" 
                                                          TabIndex="21" />
                            </td>
                            <td>
                                &nbsp;</td>
                                                
                                              </tr>
                                              <tr>
                                              <td><br /></td></tr>
                                               </table>
                                          
    </table>
               
               </div>
                    <div id="DivView" runat="server" style="height:100%;" class="DivContentBody">
           <table style="width:100%">
               <tr>
                                                  <td class="lbltd" align="center" colspan="2">
                                                      <asp:Label  Font-Size="14px" ID="lbl_company_id" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                                
                                              </tr>
           <tr>
                           <td valign="top" class="tblhead" align="right">
                            
                               <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" 
                                                                
                      CssClass="WebButton"    Text="Add Company" TabIndex="1" 
                                                                 /> 
                              
                             </td>
                       </tr>
           </table>
                   <table style="width: 90%; height:500px;" align="center">
                       
                       <tr>
                           <td align="center">
                                   <asp:GridView ID="gv_Company" runat="server" AutoGenerateColumns="False" 
                                       DataKeyNames="Company_Id" CssClass="name"
                                       onrowdeleting="gv_Company_RowDeleting" 
                                       onselectedindexchanged="gv_Company_SelectedIndexChanged"  
                                       GridLines="None" CellPadding="4">
                                       
                                       <Columns>
                                           <asp:TemplateField HeaderStyle-CssClass="head-label" Visible="false"   HeaderText="Com_ID" >
                                           <HeaderTemplate>
                                                   <asp:Label  Font-Size="14px" ID="lbl_Branch_Id" runat="server" Text="No" />
                                               </HeaderTemplate>
                                               <ItemTemplate>
                                                 <asp:Label ID="lbl_Company_Id" runat="server"  Visible="false" Text='<%#Eval("Company_Id") %>'></asp:Label>
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px"   />
                                               <ItemStyle CssClass="grid-item"   Height="20px" HorizontalAlign="Center" Width="30px" />
                                           <HeaderStyle CssClass="head_style"  Height="30px"   />
                                           <ItemStyle CssClass="grid-item"    />
                                           </asp:TemplateField>
                                           <asp:BoundField HeaderStyle-CssClass="head-label"   DataField="Company_Name" HeaderText="Company Name" 
                                               ItemStyle-Width="200px">
                                           <HeaderStyle CssClass="head_style"  Height="30px"    />
                                           <ItemStyle CssClass="grid-item"   Width="200px" />
                                           </asp:BoundField>
                                           <asp:BoundField HeaderStyle-CssClass="head-label"   DataField="Comp_RegistrationNo" HeaderText="Reg No" 
                                               ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                                               ItemStyle-Width="100px">
                                           <HeaderStyle CssClass="head_style"  Height="30px"    />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                           </asp:BoundField>
                                           <asp:BoundField HeaderStyle-CssClass="head-label"   DataField="Comp_Address" HeaderText="Address" 
                                               ItemStyle-HorizontalAlign="Left" ItemStyle-Width="200px">
                                           <HeaderStyle CssClass="head_style"  Height="30px"    />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="200px" />
                                           </asp:BoundField>
                                           <asp:BoundField HeaderStyle-CssClass="head-label"   DataField="Comp_Phone" HeaderText="Phone" 
                                               ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                           <HeaderStyle CssClass="head_style"  Height="30px"    />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                           </asp:BoundField>
                                           <asp:BoundField HeaderStyle-CssClass="head-label"   DataField="Comp_Email" HeaderText="Email" 
                                               ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" 
                                               ItemStyle-Width="100px">
                                           <HeaderStyle CssClass="head_style"  Height="30px"    />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                           </asp:BoundField>
                                           <asp:BoundField HeaderStyle-CssClass="head-label"   ApplyFormatInEditMode="True" DataField="Comp_Web" 
                                               HeaderText="Web" ItemStyle-HorizontalAlign="Center" 
                                               ItemStyle-VerticalAlign="Middle" ItemStyle-Width="100px">
                                           <HeaderStyle CssClass="head_style"  Height="30px"    />
                                           <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                           </asp:BoundField>
                                           <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                                               <ItemTemplate>
                                                   <asp:ImageButton ID="btnview" runat="server" CommandName="Select" 
                                                       ImageUrl="~/images/Gridview/View.png" />
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style"  Height="30px"   />
                                               <ItemStyle CssClass="grid-item" />
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                                               <ItemTemplate>
                                                   <asp:ImageButton ID="btnDelete" runat="server" CommandName="Delete" 
                                                       ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                        OnClientClick="javascript:return confirm('Are you sure to proceed?');" />
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style"  Height="30px"    />
                                               <ItemStyle CssClass="grid-item" />
                                           </asp:TemplateField>
                                       </Columns>
                                       <EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <FooterStyle BackColor="#cccccc"  ForeColor="White" Font-Bold="True"/>
                                           <HeaderStyle CssClass="head_style"  Height="40px"    />
                                       <PagerStyle CssClass="PagerStyle" HorizontalAlign="Center" />
                                       <SelectedRowStyle CssClass="SelectedRowStyle" ForeColor="#CCFFFF" BorderStyle="Solid" BorderColor="#f0f01" BorderWidth="1px" />
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
        <tr>
        <td>
        <br /></td></tr>
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


