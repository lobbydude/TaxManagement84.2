<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Admin_Change_Password" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Change Password</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td align="center">
               <div id="DivNewcreate" class="DivContentBody" runat="server" align="center" style="height:100%; width:80%;">
                <asp:UpdatePanel ID="upUser" runat="server" UpdateMode="Always">
                                                     
                                                       <ContentTemplate>
                 <table style="width:100%;"  >
                          
                                     
                                  
                                    <tr>
                                        <td align="right">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label2" runat="server" CssClass="Label" Text="Old Password:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_Old_password" runat="server" CssClass="textbox" 
                                                TextMode="Password" ontextchanged="txt_Old_password_TextChanged"></asp:TextBox>
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                                                Enabled="True" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers" 
                                                InvalidChars="" TargetControlID="txt_Old_password" ValidChars="$@%!^&amp;*">
                                            </asp:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label3" runat="server" CssClass="Label" Text="New Password:"></asp:Label>
                                        </td>
                                        <td>
                                        <asp:TextBox ID="txt_New_password" runat="server" CssClass="textbox" 
                                                TextMode="Password"></asp:TextBox>
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" 
                                                Enabled="True" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers" 
                                                InvalidChars="" TargetControlID="txt_New_password" ValidChars="$@%!^&amp;*">
                                            </asp:FilteredTextBoxExtender>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label4" runat="server" CssClass="Label" Text="Conform Password:"></asp:Label>
                                        </td>
                                        <td>
                                        <asp:TextBox ID="txt_Conform_password" runat="server" CssClass="textbox" 
                                                TextMode="Password"></asp:TextBox>
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" 
                                                Enabled="True" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers" 
                                                InvalidChars="" TargetControlID="txt_Conform_password" ValidChars="$@%!^&amp;*">
                                            </asp:FilteredTextBoxExtender>
                                            </td>
                                           </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                       
                                        <td colspan="4" align="center">
                                            <asp:Button ID="btn_New_Password" runat="server" CssClass="WebButton" 
                                                onclick="btn_New_Password_Click" Text="Add New Password" />
                                            <asp:Button ID="btn_Cancel" runat="server" CssClass="WebButton" 
                                                onclick="btn_Cancel_Click" Text="Clear" />
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                          </td>
                                        <td>
                                           </td>
                                    </tr>
                  </table>
                                        </ContentTemplate>
                   </asp:UpdatePanel>
                      </div>
              </tr>

            </table> 
</asp:Content>

