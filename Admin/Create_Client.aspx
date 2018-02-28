<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Create_Client.aspx.cs" Inherits="Admin_Create_Client" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%--<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>--%>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Clients</span>
                  
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
                                                OnClick="News_Click" Text="Back" TabIndex="22" />
                                         </td>
                                       
                                    </tr> 
                                    </table>
                 <table style="width:80%;" align="center" >
                          
                                     
                                    
                                    <tr>
                                        <td align="center" colspan="2">
                                          <h2 class="AdminHeader">
                                          <asp:Label ID="lblhead" runat="server" 
                                                  CssClass="AdminHeader" ></asp:Label>
                                            </h2></td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="left" colspan="2">

                                          <h4 class="AdminHeader">Client Details</h4>
                                         </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:100%;">
                                           
                                    
                                     <tr>
                                        <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                            <asp:Label  Font-Size="14px" ID="Label2" runat="server" CssClass="Label" Text="Company Name:"></asp:Label>
                                         </td>
                                        <td style="width: 182px">
                                            <asp:DropDownList ID="ddl_Company" runat="server" AutoPostBack="True" 
                                                CssClass="DropDown" TabIndex="2" Width="210px">
                                            </asp:DropDownList>
                                         </td>
                                        <td align="center" rowspan="5" valign="middle"><asp:Image ID="Client_image" 
                                                runat="server" CssClass="profile-img" Height="120px" Width="100px" ></asp:Image>
                                                        
                                                    </td>
                                    </tr>
                                    
                                   
                                    
                              
                                
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                                      <asp:Label  Font-Size="14px" ID="Label28" runat="server" CssClass="Label" Text="Branch Name:"></asp:Label>
                                                  </td>
                                                  <td style="width: 182px">
                                                      <asp:DropDownList ID="ddl_branchname" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" TabIndex="3" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                                      <asp:Label  Font-Size="14px" ID="Label1" runat="server" CssClass="Label" Text="Client Number:"></asp:Label>
                                                  </td>
                                                  <td style="width: 182px">
                                                      <asp:TextBox ID="txt_ClientNumber" runat="server" CssClass="textbox" 
                                                          Enabled="False" style="text-transform:uppercase;" TabIndex="4" 
                                                          Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                            <asp:Label  Font-Size="14px" ID="Label4" runat="server" CssClass="Label" Text="Client Name:"></asp:Label>
                                        </td>
                                       
                                        <td style="width: 182px" >
                                            <asp:TextBox ID="txt_ClientName" style="text-transform:uppercase;" 
                                                runat="server" CssClass="textbox" TabIndex="5" Width="200px"></asp:TextBox>
                                        </td>
                                       
                                    </tr>
                              <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label30" runat="server" CssClass="Label" Text="Address:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:TextBox ID="txt_Client_address" runat="server" CssClass="textbox" TabIndex="6"
                                       TextMode="MultiLine" Width="200px"></asp:TextBox>
                              </td>
                              </tr>
                                <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label9" runat="server" CssClass="Label" Text="Country:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:DropDownList ID="Ddl_Client_Country" runat="server" AutoPostBack="True" 
                                      CssClass="DropDown" TabIndex="7"
                                      onselectedindexchanged="ddl_Branch_country_SelectedIndexChanged" 
                                      ViewStateMode="Enabled" Width="210px">
                                  </asp:DropDownList>
                              </td>
                              </tr>
                              <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label18" runat="server" CssClass="Label" Text="State:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:DropDownList ID="Ddl_Client_State" runat="server" AutoPostBack="True" 
                                      CssClass="DropDown" TabIndex="8"
                                      onselectedindexchanged="ddl_Branch_state_SelectedIndexChanged" 
                                      ViewStateMode="Enabled" Width="210px">
                                  </asp:DropDownList>
                              </td>
                              </tr>
                              <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label8" runat="server" CssClass="Label" Text="District:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:DropDownList ID="ddl_Client_district" runat="server" CssClass="DropDown" 
                                      TabIndex="9" Width="210px">
                                  </asp:DropDownList>
                              </td>
                              </tr>
                              <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label10" runat="server" CssClass="Label" Text="City:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:TextBox ID="txt_Client_city" runat="server" CssClass="textbox" 
                                      TabIndex="10" Width="200px"></asp:TextBox>
                              </td>
                              </tr>
                              <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label17" runat="server" CssClass="Label" Text="Pin Code:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:TextBox ID="txt_Client_Pincode" runat="server" CssClass="textbox" 
                                      TabIndex="11" Width="200px"></asp:TextBox>
                                  <asp:FilteredTextBoxExtender ID="txt_Client_Pincode_FilteredTextBoxExtender" 
                                      runat="server" Enabled="True" FilterType="Numbers" 
                                      TargetControlID="txt_Client_Pincode">
                                  </asp:FilteredTextBoxExtender>
                              </td>
                              </tr>
                              <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label11" runat="server" CssClass="Label" Text="Tel.No:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:TextBox ID="txt_Client_phono" runat="server" CssClass="textbox" 
                                      TabIndex="12" Width="200px"></asp:TextBox>
                                  <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                                      Enabled="True" FilterType="Numbers" TargetControlID="txt_Client_phono">
                                  </asp:FilteredTextBoxExtender>
                              </td>
                              </tr>
                               <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label12" runat="server" CssClass="Label" Text="Fax:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:TextBox ID="txt_Client_fax" runat="server" CssClass="textbox" TabIndex="13" 
                                      Width="200px"></asp:TextBox>
                              </td>
                              </tr>
                               <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label13" runat="server" CssClass="Label" Text="Email:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:TextBox ID="txt_Client_email" runat="server" CssClass="textbox" 
                                      TabIndex="14" Width="200px"></asp:TextBox>
                              </td>
                              </tr>
                               <tr>
                              <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                  <asp:Label  Font-Size="14px" ID="Label14" runat="server" CssClass="Label" Text="Website:"></asp:Label>
                              </td>
                              <td style="width: 182px">
                                  <asp:TextBox ID="txt_Client_website" runat="server" CssClass="textbox" 
                                      TabIndex="15" Width="200px"></asp:TextBox>
                              </td>
                              </tr>

                                     
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                                      <asp:Label  Font-Size="14px" ID="Label29" runat="server" CssClass="Label" Text="Client Image:"></asp:Label>
                                                  </td>
                                                  <td style="width: 182px"><asp:UpdatePanel ID="upbtn" runat="server"><ContentTemplate>
                                                      <asp:FileUpload ID="fileup_User_Photo" runat="server" CssClass="textbox" 
                                                          TabIndex="16" />
                                                           </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="btn_upload" ></asp:PostBackTrigger>
                                                        </Triggers>
                                                        </asp:UpdatePanel>
                                                      <asp:Button ID="btn_upload" runat="server" 
                                                            CssClass="WebButton"    onclick="btn_upload_Click" 
                                                          TabIndex="17" Text="Upload" />
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                           <tr>
                                        <td align="left" colspan="2">

                                          <h4 class="AdminHeader">Additional Information</h4>
                                         </td>
                                       
                                    </tr> 
                                              <tr>
                                                  <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                                      <asp:Label  Font-Size="14px" ID="Label5" runat="server" CssClass="Label" Text="Record Added By:"></asp:Label>
                                                  </td>
                                                  <td style="width: 182px">
                                                      <asp:Label  Font-Size="14px" ID="lbl_Record_Addedby" runat="server" 
                                                          CssClass="Label" TabIndex="18"></asp:Label>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 229px; padding-left: 100px;">
                                                      <asp:Label  Font-Size="14px" ID="Label6" runat="server" CssClass="Label" Text="Record Added On:"></asp:Label>
                                                  </td>
                                                  <td style="width: 182px">
                                                      <asp:Label  Font-Size="14px" ID="lbl_Record_AddedDate" runat="server" 
                                                          CssClass="Label" TabIndex="19"></asp:Label>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                          </table>

                                          </div>
                                          
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
                                             <asp:Button ID="btn_Save" runat="server" 
                                                 CssClass="WebButton" onclick="btn_Save_Click" 
                                                 Text="Add New Client" TabIndex="20" />
                                             &nbsp;<asp:Button ID="btn_Cancel" runat="server" BackColor="#EC5E5E" ForeColor="White"
                                                 CssClass="WebButton" onclick="btn_Cancel_Click" 
                                                 Text="Clear" Width="60px" TabIndex="21" />
                                         </td>
                                     </tr>
                           
                             
                                </table>
               
               </div>
                    <div id="DivView" runat="server" style="height:100%;" class="DivContentBody">
           <table style="width: 100%;">
                       <tr>
                           <td valign="top" class="tblhead" align="right">
                            
                               <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" 
                                                                
                      CssClass="WebButton"    Text="Add New Client" TabIndex="1" 
                                                                 /> 
                              
                             </td>
                       </tr>
                       </table>
                   <table style="width: 100%; height:500px;">
                       
                       <tr>
                           <td valign="top" align="center">
                                   <asp:GridView ID="grd_Client" runat="server" 
                            AutoGenerateColumns="False" DataKeyNames="Client_Id" Width="80%" 
                            AllowPaging="True" PageSize="20" 
                                       CellPadding="4" CssClass="name"
                                       onselectedindexchanged="grd_Client_SelectedIndexChanged" 
                                       onpageindexchanging="grd_Client_PageIndexChanging" 
                                       onrowdatabound="grd_Client_RowDataBound" 
                                       onrowdeleting="grd_Client_RowDeleting" ForeColor="#333333" 
                                       GridLines="None">
                                       
                            <Columns>
                               
                                      <asp:TemplateField HeaderStyle-CssClass="head-label"   Visible="false">
                                    <ItemTemplate>
                                                <asp:Label  Font-Size="14px" ID="lblclintid" runat="server" Text='<%#Eval("Client_Id")%>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"   ForeColor="White" />
<ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
</asp:TemplateField>
                               
                                      <asp:BoundField DataField="Branch_Name" HeaderText="Branch Name"  >
                               
                                      <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"   />
                                      <ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="100px"></ItemStyle>
                                      </asp:BoundField>
                               
                                <asp:BoundField DataField="Client_Number" HeaderStyle-HorizontalAlign="Center" 
                                     ItemStyle-HorizontalAlign="Center" HeaderText="Client Number" >


                                      <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                <ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="100px"></ItemStyle>
                                 </asp:BoundField>
                                 <asp:BoundField DataField="Client_Name" HeaderText="Client Name" >
                                      <HeaderStyle CssClass="head_style"  Height="30px"    />
                                 <ItemStyle CssClass="grid-item"   Width="200px"  />
                                 </asp:BoundField>
                                  <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Photo">
                                  <ItemTemplate>
                          <asp:Image ID="Client_Image" runat="server" CssClass="profile-img" width="50px" Height="50px" ImageUrl='<%# "ClientHandler.ashx?Client_Id="+ Eval("Client_Id") %>' />
                          </ItemTemplate>
                                      <HeaderStyle CssClass="head_style"  Height="30px"    />
                                     <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="50px" />
                                 </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                                    <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnExamEdit" runat="server" ImageUrl="~/images/Gridview/View.png"
                                                    CommandName="Select"  />
                                            
</ItemTemplate>

                                    <HeaderStyle CssClass="head_style"  Height="30px"    />

<ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
    <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnExamDelete" runat="server" ImageUrl="~/images/Gridview/Remove-icon.png"
                                                    CommandName="Delete" 
                                                    OnClientClick="javascript:return confirm('Are you sure to proceed?');" />
                                            
</ItemTemplate>
    <HeaderStyle CssClass="head_style"  Height="30px"    />
<ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" VerticalAlign="Middle" />

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
 
</asp:Content>


