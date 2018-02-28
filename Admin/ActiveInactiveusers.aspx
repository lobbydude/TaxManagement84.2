<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master"  AutoEventWireup="true" CodeFile="ActiveInactiveusers.aspx.cs" Inherits="Users_ActiveInactiveusers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
     <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">User Active/Inactive</span>
                  
               </div>
               
               </td>
        </tr>
       <tr>
            <td>
                  <div id="Divcreate" runat="server" style="height:100%;" class="DivContentBody">
               
                 <table style="width:100%;" >
                        <tr>
                            <td style="width: 165px;">
                            </td>
                            <td style="width: 280px;">
                            </td>
                            <td align="left" valign="bottom">
                                &nbsp;
                            </td>
                            <td style="width: 135px;">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                        <table  style="width:400px;">
                            <tr >
                                <td  align="center" style="width: 210px">
                                    <asp:Label ID="Label2" runat="server" CssClass="Label"  Font-Size="14px"   
                                        Text="Search Users By Status:"></asp:Label>
                                </td>
                                <td  align="center">
                                    <asp:DropDownList ID="ddl_activeInactive" runat="server" AutoPostBack="True" 
                                        CssClass="DropDown" 
                                        onselectedindexchanged="ddl_activeInactive_SelectedIndexChanged" 
                                        TabIndex="1" Width="210px">
                                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                                        <asp:ListItem Selected="True" Value="1">ACTIVE</asp:ListItem>
                                        <asp:ListItem Value="2">INACTIVE</asp:ListItem>
                                        <asp:ListItem Value="3">ALL</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                             
                            </tr>
                        </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                        <asp:GridView ID="grd_Userdetails" runat="server" 
                            AutoGenerateColumns="False" DataKeyNames="User_id" style="width:80%;" 
                            AllowPaging="True" onpageindexchanging="grd_Userdetails_PageIndexChanging" 
                            onrowdatabound="grd_Userdetails_RowDataBound" PageSize="20" ForeColor="#333333" 
                                       GridLines="None" CellPadding="4" 
                                  >
                                       
                            <Columns>
                                 <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="No">
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblColemp1" runat="server" Text="No" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                <%#Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                                <ItemStyle CssClass="grid-item"   Height="20px" Width="30px" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                       <asp:TemplateField HeaderStyle-CssClass="head-label"   Visible="false" HeaderText="No">
                                                
                                                <ItemTemplate>
                 <asp:Label ID="lbluserid" Visible="false" Text='<%#Eval("User_id")%>' runat="server" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
                                                <ItemStyle CssClass="grid-item"   Height="20px" Width="30px" HorizontalAlign="Center" />
                                            </asp:TemplateField>        
                                <asp:BoundField DataField="Employee_Id"  Visible="false" HeaderStyle-HorizontalAlign="Center" 
                                     ItemStyle-HorizontalAlign="Center" HeaderText="ID" >
<HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" ></HeaderStyle>

<ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="30px"></ItemStyle>
                                 </asp:BoundField>
                                <asp:BoundField DataField="Employee_Name" HeaderStyle-HorizontalAlign="Center" 
                                     ItemStyle-HorizontalAlign="Center" HeaderText="Name" >
<HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" ></HeaderStyle>

<ItemStyle CssClass="grid-item"   HorizontalAlign="Left" Width="200px"></ItemStyle>
                                 </asp:BoundField>
                                 <asp:BoundField DataField="Role_Name" HeaderText="Role" >
                                 <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                 <ItemStyle CssClass="grid-item"   Width="150px" HorizontalAlign="Center" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="User_Name" HeaderText="User Name" >
                                 <HeaderStyle CssClass="head_style"  Height="30px"  HorizontalAlign="Center"  />
                                 <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="150px" />
                                 </asp:BoundField>
                             <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Act/Inact">
                                <ItemTemplate>
    <asp:CheckBox ID="CheckBox1"  runat="server"  Checked='<%# Eval("Status") %>' AutoPostBack="true"  OnCheckedChanged="CheckBox1_CheckedChanged"   OnClientClick="javascript:return confirm('Are you sure to proceed?');" />
 </ItemTemplate>

                                 <HeaderStyle CssClass="head_style"  Height="30px" HorizontalAlign="Center"   />
                                 <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="50px" />
</asp:TemplateField>

                            </Columns>
                                       
                                      <EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <FooterStyle BackColor="#cccccc"  ForeColor="White" Font-Bold="True"/>
                                       <HeaderStyle HorizontalAlign="Center" Height="40px" />
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
                            <td style="width: 165px;">
                                &nbsp;
                            </td>
                            <td style="width: 280px;">
                                &nbsp;
                            </td>
                            <td align="left" valign="bottom">
                                &nbsp;
                            </td>
                            <td style="width: 135px;">
                                &nbsp;
                            </td>
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


