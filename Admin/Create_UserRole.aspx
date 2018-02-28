<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Create_UserRole.aspx.cs" Inherits="Admin_Create_UserRole" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
     <asp:UpdatePanel ID="upnews" runat="server" UpdateMode="Always"><ContentTemplate>
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">User Role</span>
                  
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
                                                OnClick="News_Click" Text="Back" TabIndex="8" />
                                         </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="center" colspan="2">
                                          <h2 class="AdminHeader">
                                          <asp:Label ID="lblhead" runat="server" 
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
                                         
                                         </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:80%;" align="center">
                                           
                                    
                                     <tr>
                                        <td class="lbltd" style="padding-left: 300px; width: 286px;">
                                            <asp:Label ID="Label1" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   Text="Role No:"></asp:Label>
                                         </td>
                                        <td >
                                            <asp:TextBox ID="txt_Role_ID" style="text-transform:uppercase;" runat="server" Enabled="false"
                                                CssClass="textbox" TabIndex="2" Width="200px"></asp:TextBox>
                                         </td>
                                        
                                    </tr>
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td class="lbltd" style="padding-left: 300px; width: 286px;">
                                            <asp:Label ID="Label4" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   Text="Role Name:"></asp:Label>
                                        </td>
                                       
                                        <td >
                                            <asp:TextBox ID="txt_Role" runat="server" CssClass="textbox" TabIndex="3" 
                                                Width="200px"></asp:TextBox>
                                        </td>
                                       
                                    </tr>
                              
                                
                                          
                                  
                                
                                          
                                              <tr>
                                                  <td class="lbltd" style="padding-left: 300px; width: 286px;">
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                    
                                   
                                          
                                              <tr>
                                                  <td class="lbltd" style="padding-left: 300px; width: 286px;">
                                                      <asp:Label ID="Label6" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   Text="Record Added By"></asp:Label>
                                                  </td>
                                                  <td style="height: 50px">
                                                      <asp:Label ID="lbl_RecordAddedBy" runat="server" CssClass="Label"  
                                                          Font-Size="14px" TabIndex="4"  ></asp:Label>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="padding-left: 300px; width: 286px;">
                                                      <asp:Label ID="Label7" runat="server" CssClass="Label"  Font-Size="14px" Width="200px"   Text="Record Added On"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="lbl_RecordAddedOn" runat="server" CssClass="Label"  
                                                          Font-Size="14px" TabIndex="5"  ></asp:Label>
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
                                                 Text="Add Role" TabIndex="6" />
                                             &nbsp;<asp:Button ID="btn_Cancel" runat="server" 
                                                 CssClass="WebButton"  BackColor="#EC5E5E" ForeColor="White" onclick="btn_Cancel_Click" 
                                                 Text="Clear" Width="57px" TabIndex="7" />
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
                                                                
                      CssClass="WebButton"    Text="Add New Role" TabIndex="1" 
                                                                 /> 
                              
                             </td>
                       </tr>
                       <tr><td><br /></td></tr>
                       <tr>
                           <td valign="top">
                                   <asp:GridView ID="grd_UserRole" runat="server" AutoGenerateColumns="False" 
                                    CssClass="name" DataKeyNames="Role_Id" style="width:100%;"
                                   onrowdeleting="grd_UserRole_RowDeleting" 
                            onselectedindexchanged="grd_UserRole_SelectedIndexChanged" 
                            onrowdatabound="grd_UserRole_RowDataBound" Width="400px" CellPadding="4" 
                                       ForeColor="#333333" GridLines="None">
                                       
                                       <Columns>
                                           <asp:TemplateField HeaderText="S.No">
                                               <HeaderTemplate>
                                                   <asp:Label ID="lblColemp1" runat="server" Text="S. No" />
                                               </HeaderTemplate>
                                               <ItemTemplate> 
                                                   <%#Container.DataItemIndex+1 %>
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                               <ItemStyle CssClass="grid-item"  HorizontalAlign="Center"  Width="30px" />
                                           </asp:TemplateField>
                                           <asp:BoundField DataField="Role_Id" HeaderStyle-HorizontalAlign="Center" 
                                               HeaderText="ID" ItemStyle-HorizontalAlign="Center" Visible="False">
                                          <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center"  />
                                          <ItemStyle CssClass="grid-item"   HorizontalAlign="Center"  Width="30px" />
                                           </asp:BoundField>
                                           <asp:BoundField DataField="Role_Name" HeaderStyle-HorizontalAlign="Center" 
                                               HeaderText="Role Name" ItemStyle-HorizontalAlign="Center">
                                          <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center"  />
                                          <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="350px"/>
                                           </asp:BoundField>
                                           <asp:TemplateField HeaderText="View">
                                               <ItemTemplate>
                                                   <asp:ImageButton ID="imgbtnExamEdit" runat="server" CommandName="Select" 
                                                         ImageUrl="~/images/Gridview/View.png"  />
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"   />
                                             <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Delete">
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


