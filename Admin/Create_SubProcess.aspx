<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Create_SubProcess.aspx.cs" Inherits="Admin_Create_SubProcess" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always"><ContentTemplate>
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Sub Process</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server" style="height:100%;" class="DivContentBody">
               
               <table style="width:100%">
               <tr>
                                        <td  align="right" colspan="2">
                                            <asp:Button ID="News" runat="server"   CssClass="WebButton"    
                                                OnClick="News_Click" Text="Back" />
                                         </td>
                                       
                                    </tr> 
               </table>

                 <table style="width:60%;" align="center" >
                          
                                     
                                    
                                    <tr>
                                        <td align="center" colspan="2">
                                          <h2 class="AdminHeader" align="center">
                                          <asp:Label ID="lblhead" runat="server" 
                                                  CssClass="AdminHeader" ></asp:Label>
                                            </h2></td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="left" colspan="2" style="margin:0 auto">

                                          <h4 class="AdminHeader">Client Details</h4>
                                         </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="center" colspan="2">
                                        
                                          <table style="width:100%;">
                                           
                                    
                                     <tr>
                                        <td class="lbltd" style="width: 222px;padding-left:150px;">
                                            <asp:Label ID="Label7" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   Text="Client Name:"></asp:Label>
                                         </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_ClientName" runat="server" AutoPostBack="True" 
                                                CssClass="DropDown" 
                                                onselectedindexchanged="ddl_ClientName_SelectedIndexChanged" Width="210px" 
                                                TabIndex="3">
                                            </asp:DropDownList>
                                         </td>
                                        
                                    </tr>
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td class="lbltd" style="width: 222px;padding-left:150px;">
                                            <asp:Label ID="Label8" runat="server" CssClass="Label"  Font-Size="14px"   Text="Client Number:"></asp:Label>
                                        </td>
                                       
                                        <td >
                                            <asp:TextBox ID="txt_ClientNumber" runat="server" CssClass="textbox" 
                                                Enabled="False" style="text-transform:uppercase;" TabIndex="4" 
                                                Width="200px"></asp:TextBox>
                                        </td>
                                       
                                    </tr>
                              
                                
                                     
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                      <asp:Label ID="Label9" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   
                                                          Text="Sub Process Number:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_SubProcessNumber" runat="server" CssClass="textbox" 
                                                          Enabled="False" style="text-transform:uppercase;" TabIndex="5" 
                                                          Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                      <asp:Label ID="Label10" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   
                                                          Text="Sub Process Name:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_SubProcessName" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="6" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                      <asp:Label ID="Label11" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   
                                                          Text="Email Address:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_SubProcess_Email" runat="server" CssClass="textbox" 
                                                          TabIndex="7" Width="200px" 
                                                         ></asp:TextBox>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                           <tr>
                                        <td align="left" colspan="2">

                                          <h4 class="AdminHeader">Additional Information</h4>
                                         </td>
                                       
                                    </tr> 
                                              <tr>
                                                  <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                      <asp:Label ID="Label5" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   Text="Record Added By:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="lbl_Record_Addedby" runat="server" CssClass="Label"  
                                                          Font-Size="14px" TabIndex="8"  ></asp:Label>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 222px;padding-left:150px;">
                                                      <asp:Label ID="Label6" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   Text="Record Added On:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="lbl_Record_AddedDate" runat="server" CssClass="Label"  
                                                          Font-Size="14px" TabIndex="9"  ></asp:Label>
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
                                             <asp:Button ID="btn_Save" runat="server" 
                                                 CssClass="WebButton" onclick="btn_Save_Click" 
                                                 Text="Add New Sub Process" TabIndex="10" />
                                             &nbsp;<asp:Button ID="btn_Cancel" runat="server" 
                                                 CssClass="WebButton" onclick="btn_Cancel_Click" 
                                                 Text="Clear" Width="58px" BackColor="#EC5E5E" ForeColor="White" 
                                                 TabIndex="11" />
                                         </td>
                                     </tr>
                           <tr>
                           <td><br /></td></tr>
                             
                                </table>
               
               </div>
                    <div id="DivView" runat="server" style="height:100%;" class="DivContentBody">
           
                   <table style="width: 100%; height:500px;">
                       
                         <tr>
                                                  <td class="lbltd" align="right" colspan="2">
                                                      <asp:Button ID="btn_Submit" runat="server" 
                                                            CssClass="WebButton"    OnClick="btn_Submit_Click" 
                                                          Text="Add New Sub Process" TabIndex="1" />
                                                  </td>
                                              </tr>
                       <tr >
                           <td class="lbltd" align="center">
                               <asp:Label ID="Label1" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   
                                   Text="Client Name: "></asp:Label>
                               &nbsp; &nbsp; &nbsp; &nbsp;
                               <asp:DropDownList ID="ddl_ClientWiseSearch" runat="server" AutoPostBack="True" 
                                   CssClass="DropDown" 
                                   onselectedindexchanged="ddl_ClientWiseSearch_SelectedIndexChanged" 
                                   Width="210px" TabIndex="2">
                               </asp:DropDownList>
                           </td>
                           
                       </tr>
                         <tr>
                             <td align="center"  colspan="2">
                                 <asp:GridView ID="grd_SubProcess" runat="server" AllowPaging="True" 
                                     AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                     DataKeyNames="Subprocess_Id" 
                                     onpageindexchanging="grd_SubProcess_PageIndexChanging" 
                                     onrowdatabound="grd_SubProcess_RowDataBound" onrowdeleting="grd_SubProcess_RowDeleting" 
                                     onselectedindexchanged="grd_SubProcess_SelectedIndexChanged" PageSize="20" 
                                     Width="95%" 
                                       GridLines="None">
                                       
                                     <Columns>
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   Visible="false">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblSubprocessid" runat="server" Text='<%#Eval("Subprocess_Id")%>'></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                             <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
                                         </asp:TemplateField>
                                         <asp:BoundField DataField="Subprocess_Number" HeaderStyle-HorizontalAlign="Center" 
                                             HeaderText="Sub Process Number" ItemStyle-HorizontalAlign="Center">
                                         <HeaderStyle CssClass="head_style"  Height="30px"  Width="150px"  HorizontalAlign="Center"  />
                                         <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="Client_Number" HeaderText="Client Number">
                                         <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                         <ItemStyle CssClass="grid-item"   Width="100px" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="Client_Name" HeaderText="Client Name">
                                         <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center"  />
                                         <ItemStyle CssClass="grid-item"   Width="200px" />
                                         </asp:BoundField>
                                          <asp:BoundField DataField="Sub_ProcessName" HeaderText="Sub Process Name">
                                         <HeaderStyle CssClass="head_style"  Height="30px" HorizontalAlign="Center"    />
                                         <ItemStyle CssClass="grid-item"   Width="200px" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="Email" HeaderText="Email" >
                                        <ItemStyle CssClass="grid-item"   Width="30px" />
                                         <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center"  />
                                         </asp:BoundField>
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                                             <ItemTemplate>
                                                 <asp:ImageButton ID="imgbtnExamEdit" runat="server" CommandName="Select" 
                                                      ImageUrl="~/images/Gridview/View.png"  />
                                             </ItemTemplate>
                                             <HeaderStyle CssClass="head_style"  Height="30px" HorizontalAlign="Center"     />
                                             <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px" />
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                                             <ItemTemplate>
                                                 <asp:ImageButton ID="imgbtnExamDelete" runat="server" CommandName="Delete" 
                                                     ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                      OnClientClick="javascript:return confirm('Are you sure to proceed?');"
                                                     />
                                             </ItemTemplate>
                                             <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"   />
                                             <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                         </asp:TemplateField>
                                     </Columns>
                                       <EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <FooterStyle BackColor="#cccccc"  ForeColor="White" Font-Bold="True"/>
                                        <HeaderStyle CssClass="head_style"  Height="40px"    />
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


