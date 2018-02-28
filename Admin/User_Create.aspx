<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="User_Create.aspx.cs" Inherits="Admin_User_Create"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
   
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Users</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="DivNewcreate" runat="server" style="height:100%;" class="DivContentBody">
           <%--     <asp:UpdatePanel ID="upUser" runat="server" UpdateMode="Always"> <Triggers>
                                                           <asp:PostBackTrigger ControlID="btn_upload" ></asp:PostBackTrigger>
                                                        </Triggers><ContentTemplate>--%>
            <table style="width:100%;" >
                                                       <tr>
                                        <td align="center" colspan="2">
                                          <h2 class="AdminHeader">
                                          <asp:Label ID="lblhead" runat="server" 
                                                  CssClass="AdminHeader" ></asp:Label>
                                            </h2></td>
                                       
                                    </tr>
                                    </table>
                 <table style="width:100%;" >
                                    <tr>
                                        <td align="right" colspan="2">
                                            
                                                                     
                               <asp:Button ID="btn_Back" runat="server"
                                                                
                      CssClass="WebButton"    Text="Back" onclick="btn_Back_Click" TabIndex="16" 
                                                                 /> 
                              
                             
                                         </td>
                                       
                                    </tr> 
                                    
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:100%;">
                                           
                                    
                                     <tr>
                                        <td class="lbltd" style="width: 268px">
                                            <asp:Label ID="Label2" runat="server" CssClass="Label"  Font-Size="14px"   Text="Company Name:"></asp:Label>
                                         </td>
                                        <td align="left" >
                                            <asp:DropDownList ID="ddl_Company" runat="server" AutoPostBack="True" 
                                                CssClass="DropDown" TabIndex="2" Width="210px">
                                            </asp:DropDownList>
                                         </td>
                                        <td align="center" rowspan="4" valign="middle"><asp:Image ID="emp_image" runat="server" CssClass="profile-img" Height="120px" Width="120px" ></asp:Image>
                                                        
                                                    </td>
                                    </tr>
                                    
                                   
                                    
                              
                                
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label28" runat="server" CssClass="Label"  Font-Size="14px"   Text="Branch Name:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                      <asp:DropDownList ID="ddl_branchname" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" TabIndex="3" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label1" runat="server" CssClass="Label"  Font-Size="14px"   Text="Employee  Name:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                      <asp:TextBox ID="txt_employeeName" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="4" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td class="lbltd" style="width: 268px">
                                            <asp:Label ID="Label4" runat="server" CssClass="Label"  Font-Size="14px"   Text="User  Name:"></asp:Label>
                                        </td>
                                       
                                        <td align="left">
                                       
                                                        
                                           
                                            <table style="width: 30%;margin-left:-3px;">
                                                <tr>
                                                    <td>
                                                   <asp:TextBox ID="txt_username1" runat="server" AutoPostBack="True" style="vertical-align:middle"
                                                            CssClass="textbox" ontextchanged="txt_username1_TextChanged" TabIndex="5" 
                                                            Width="200px"></asp:TextBox>     
                                                    </td>
                                                    <td>
                                                       <asp:Image ID="User_Chk_Img" runat="server" 
                                                Height="25px" Width="25px" ImageAlign="Middle" />  
                                                    </td>
                                                </tr>
                                            </table>
                                      
                                      </td>
                                      
                                    </tr>
                                        
                                  
                                
                                          
                                              <tr id="trpassword" runat="server">
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label3" runat="server" CssClass="Label"  Font-Size="14px"   Text="Password:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                 
                                                      <asp:TextBox ID="txt_password1" runat="server" CssClass="textbox" 
                                                          TextMode="Password" TabIndex="6" Width="200px"></asp:TextBox>
                                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                            runat="server" Enabled="True" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers" ValidChars="$@%!^&*"   InvalidChars="" TargetControlID="txt_password1">
                        </asp:FilteredTextBoxExtender>
                                                         
                                                  </td>
                                              </tr>
                                              <tr id="trconpassword" runat="server">
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label5" runat="server" CssClass="Label"  Font-Size="14px"   Text="Confirm Password:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                 
                                                      <asp:TextBox ID="txt_confirmpassword" runat="server" CssClass="textbox" 
                                                          TextMode="Password" TabIndex="7" Width="200px"></asp:TextBox>
                                                               <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                            runat="server" Enabled="True" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers" ValidChars="$@%!^&*"   InvalidChars="" TargetControlID="txt_confirmpassword">
                        </asp:FilteredTextBoxExtender>
                                                        
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label6" runat="server" CssClass="Label"  Font-Size="14px"   Text="Mobileno:"></asp:Label>
                                                  </td>
                                                  <td align="left" >
                                                      <asp:TextBox ID="txt_mobileno" runat="server" CssClass="textbox" TabIndex="8" 
                                                          Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label7" runat="server" CssClass="Label"  Font-Size="14px"   Text="Email:"></asp:Label>
                                                  </td>
                                                  <td align="left" >
                                                      <asp:TextBox ID="txt_email" runat="server" CssClass="textbox" TabIndex="9" 
                                                          Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label8" runat="server" CssClass="Label"  Font-Size="14px"   Text="Role:"></asp:Label>
                                                  </td>
                                                  <td align="left" >
                                                      <asp:DropDownList ID="ddl_role" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" onselectedindexchanged="ddl_role_SelectedIndexChanged" 
                                                          TabIndex="10" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                              </tr>
                                    
                                   
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label29" runat="server" CssClass="Label"  Font-Size="14px"   Text="User Image:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always"><Triggers><asp:PostBackTrigger ControlID="btn_upload" /></Triggers> <ContentTemplate>
                                                      <asp:FileUpload ID="fileup_User_Photo" runat="server" CssClass="textbox" 
                                                          TabIndex="11" />
                                                               
                                                     
                                                     
                                              
                                                      <asp:Button ID="btn_upload" runat="server" CssClass="WebButton"
                                                          onclick="btn_upload_Click" TabIndex="12" Text="Upload" />
                                                          </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                         
                                                  </td>
                                                  
                                              </tr>
                                    
                                   
                                          
                                              <tr>
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label30" runat="server" CssClass="Label"  Font-Size="14px"   Text="Record Added By:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                      <asp:Label ID="lbl_Record_Addedby" runat="server" CssClass="Label"  
                                                          Font-Size="14px" TabIndex="13"  ></asp:Label>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="lbltd" style="width: 268px">
                                                      <asp:Label ID="Label31" runat="server" CssClass="Label"  Font-Size="14px"   Text="Record Added On:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                      <asp:Label ID="lbl_Record_AddedDate" runat="server" CssClass="Label"  
                                                          Font-Size="14px" TabIndex="13"  ></asp:Label>
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
                                             <asp:GridView ID="grd_Master" runat="server" 
                                                 AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                                 DataKeyNames="master_Id" GridLines="None"
                                                 onpageindexchanging="grd_Master_PageIndexChanging" 
                                                 onrowdatabound="grd_Master_RowDataBound" Width="500px" ForeColor="#333333">
                                                 
                                                 <Columns>
                                                     <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="No">
                                                         <ItemTemplate>
                                                             <asp:Label ID="lblmasterid" runat="server" Text='<%#Eval("master_Id")%>'></asp:Label>
                                                         </ItemTemplate>
                                                         <HeaderStyle CssClass="head_style"  Height="30px"    />
                                                         <ItemStyle CssClass="grid-item"   Width="30px" />
                                                     </asp:TemplateField>
                                                     <asp:BoundField  HeaderStyle-CssClass="head-label"   DataField="Master_name" HeaderText="Masters" 
                                                         ItemStyle-Width="200px">
                                                     <HeaderStyle CssClass="head_style"  Height="30px"   />
                                                     <ItemStyle CssClass="grid-item"   Width="200px" />
                                                     </asp:BoundField>
                                                     <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Read">
                                                         <ItemTemplate>
                                                             <asp:CheckBox ID="chk_mstread" runat="server" AutoPostBack="true" />
                                                         </ItemTemplate>
                                                         <FooterStyle ForeColor="White" />
                                                         <HeaderStyle CssClass="head_style"  Height="30px"   />
                                                         <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                     </asp:TemplateField>
                                                     <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Write">
                                                         <ItemTemplate>
                                                             <asp:CheckBox ID="chk_mstwrite" runat="server" AutoPostBack="true" />
                                                         </ItemTemplate>
                                                         <HeaderStyle CssClass="head_style"  Height="30px"  />
                                                         <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                     </asp:TemplateField>
                                                     <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                                                         <ItemTemplate>
                                                             <asp:CheckBox ID="chk_mstdelete" runat="server" AutoPostBack="true" />
                                                         </ItemTemplate>
                                                         <HeaderStyle CssClass="head_style"  Height="30px"    />
                                                         <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                     </asp:TemplateField>
                                                     <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="All">
                                                         <ItemTemplate>
                                                             <asp:CheckBox ID="chk_mstfull" runat="server" AutoPostBack="true" 
                                                                 OnCheckedChanged="chk_mstfull_Checkchanged" />
                                                         </ItemTemplate>
                                                         <HeaderStyle CssClass="head_style"  Height="30px"    />
                                                         <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
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
                                             <br />
                                                        <asp:GridView ID="grd_UpdateMaster" runat="server" 
                            AutoGenerateColumns="False" CssClass="name" DataKeyNames="master_Id"  
                            onpageindexchanging="grd_UpdateMaster_PageIndexChanging" 
                            onrowdatabound="grd_UpdateMaster_RowDataBound" Width="500px" CellPadding="4" 
                                                GridLines="None" ForeColor="#333333">
                                                            
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblupmasterid" runat="server" Text='<%#Eval("Master_Id")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="head_style"  Height="30px"    />
                                    <ItemStyle CssClass="grid-item"   Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField  HeaderStyle-CssClass="head-label"   DataField="Master_name" HeaderText="Masters" 
                                    ItemStyle-Width="200px" >
                                <HeaderStyle CssClass="head_style"  Height="30px"   />
                                <ItemStyle CssClass="grid-item"   Width="200px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Read">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_upmstread" Checked='<%# Eval("Read_Info") %>' runat="server" AutoPostBack="true" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="head_style"  Height="30px"    />
                                    <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Write">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_upmstwrite" Checked='<%# Eval("Write_Info") %>'  runat="server" AutoPostBack="true" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="head_style"  Height="30px"    />
                                    <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_upmstdelete"  Checked='<%# Eval("Delete_Info") %>' runat="server" AutoPostBack="true" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="head_style"  Height="30px"   />
                                    <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="All">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_upmstfull"  Checked='<%# Eval("Full_Access") %>' runat="server" AutoPostBack="true" 
                                            OnCheckedChanged="chk_upmstfull_Checkchanged" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="head_style"  Height="30px"   />
                                    <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
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
                                         <td align="center" colspan="2">
                                             <asp:Button ID="btn_Save" runat="server" 
                                                   CssClass="WebButton"    onclick="btn_Save_Click" 
                                                 Text="Add New User" TabIndex="14" />
                                             &nbsp;<asp:Button ID="btn_Cancel" runat="server" 
                                                   CssClass="WebButton"    onclick="btn_Cancel_Click" 
                                                 Text="Clear" BackColor="#EC5E5E" ForeColor="White" TabIndex="15" />
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
             <%--   </ContentTemplate></asp:UpdatePanel>--%>
               </div>
                    <div id="DivNewsView" runat="server" style="height:100%;" class="DivContentBody">
           
                   <table style="width: 100%; height:500px;">
                       <tr>
                           <td valign="top" class="tblhead" align="right" style="height: 30px">
                            
                               <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" 
                                                                
                      CssClass="WebButton"    Text="Add New User" TabIndex="1" 
                                                                 /> 
                              
                             </td>
                       </tr>
                       <tr><td><br /></td></tr>
                       <tr>
                           <td valign="top">
                                   <asp:GridView ID="grd_Userdetails" CssClass="name" runat="server" 
                            AutoGenerateColumns="False" DataKeyNames="User_id" style="width:100%;" 
                            AllowPaging="True" onpageindexchanging="grd_Userdetails_PageIndexChanging" 
                            onrowdatabound="grd_Userdetails_RowDataBound" PageSize="20" 
                                    onselectedindexchanged="grd_Userdetails_SelectedIndexChanged" 
                                       CellPadding="4" ForeColor="#333333" GridLines="None">
                                       
                            <Columns>
                                <asp:BoundField  HeaderStyle-CssClass="head-label" Visible="false"  DataField="User_Id"  HeaderStyle-HorizontalAlign="Center" 
                                     ItemStyle-HorizontalAlign="Center" HeaderText="ID" >
<HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" ></HeaderStyle>

<ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px"></ItemStyle>
                                 </asp:BoundField>
                                    <asp:TemplateField HeaderStyle-CssClass="head-label"   Visible="false" HeaderText="No">
                                               <HeaderTemplate>
                                                   <asp:Label  Font-Size="14px" ID="lbl_User_Id" runat="server" Text="No" />
                                               </HeaderTemplate>
                                               <ItemTemplate>
                                                 <asp:Label ID="lbl_User_Id" runat="server"  Visible="false" Text='<%#Eval("User_Id") %>'></asp:Label>
                                               </ItemTemplate>
                                               <HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px"   />
                                               <ItemStyle CssClass="grid-item"   Height="20px" HorizontalAlign="Center" Width="30px" />
                                           </asp:TemplateField>
                                         
                               
                                <asp:BoundField  HeaderStyle-CssClass="head-label"   DataField="Branch_Name" HeaderText="Branch" >
                               
                                <HeaderStyle CssClass="head_style"  HorizontalAlign="Center" Height="30px"    />
                                <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="300px"></ItemStyle>
                                </asp:BoundField>
                               
                                <asp:BoundField  HeaderStyle-CssClass="head-label"   DataField="Employee_Name" HeaderStyle-HorizontalAlign="Center" 
                                     ItemStyle-HorizontalAlign="Center" HeaderText="Name" >
<HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center"  ></HeaderStyle>

<ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="100px" ></ItemStyle>
                                 </asp:BoundField>
                                 <asp:BoundField  HeaderStyle-CssClass="head-label"   DataField="Role_Name" HeaderText="Role" >
                                 <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"    />
                                 <ItemStyle CssClass="grid-item"   Width="150px" HorizontalAlign="Center" />
                                 </asp:BoundField>
                                 <asp:BoundField  HeaderStyle-CssClass="head-label"   DataField="User_Name" HeaderText="User Name" >
                                 <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                 <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="150px" />
                                 </asp:BoundField>
                                 <asp:BoundField  HeaderStyle-CssClass="head-label"   DataField="Mobileno" HeaderText="Mobile" >
                                 <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" VerticalAlign="Middle" 
                                     />
                                 <ItemStyle CssClass="grid-item"   Width="100px" />
                                 </asp:BoundField>
                                 <asp:BoundField  HeaderStyle-CssClass="head-label"   DataField="Email"  HeaderText="EMAIL" >
                                 <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                 <ItemStyle CssClass="grid-item"   Width="30px" />
                                </asp:BoundField>
                                 <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Photo">
                                  <ItemTemplate>
                          <asp:Image ID="User_Image" runat="server" width="50px" CssClass="profile-img" Height="50px" ImageUrl='<%# "UserHandler.ashx?User_id="+ Eval("User_id") %>' />
                          </ItemTemplate>
                                     <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                     <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="50px" />
                                 </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                                    <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnExamEdit" runat="server" ImageUrl="~/images/Gridview/View.png"
                                                    Width="15px" Height="15px" CommandName="Select"  />
                                            
</ItemTemplate>

                                    <HeaderStyle CssClass="head_style"  Height="30px" HorizontalAlign="Center"    />

<ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="100px" />
</asp:TemplateField>

                            </Columns>
                                       <EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <FooterStyle BackColor="#cccccc"  ForeColor="White" Font-Bold="True"/>
                                       <PagerStyle CssClass="PagerStyle" HorizontalAlign="Center" />
                                       <HeaderStyle HorizontalAlign="Center" Height="40px" />
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


