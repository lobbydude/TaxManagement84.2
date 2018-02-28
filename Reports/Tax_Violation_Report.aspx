<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Tax_Violation_Report.aspx.cs" Inherits="Tax_Violation_Report" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">
        function show()
        {
              document.write("<head id="Head1" runat='server'></head>");
        }

        
</script>
  
    <div id="DivNewcreate" class="DivContentBody" runat="server" align="center" style="height:100%; width:100%;">
        <%--   </ContentTemplate></asp:UpdatePanel>--%>
    <table style="width: 100%">

        <tr>
            <td>
                      <div id="Div1">
                <span class="WebFont1">Tax Report</span>
                  
               </div></td>
        </tr>
        <tr>
            <td  align="center" style="height: 23px">
            <asp:UpdatePanel ID="upreport" runat="server" UpdateMode="Always"><ContentTemplate>
                <table>
                    <tr align="center">
                    <td>
                      <asp:RadioButton ID="rbtn_Tax" runat="server" AutoPostBack="True" 
                                               CssClass="radio" Font-Bold="False" Font-Names="Segoe UI" 
                                               Font-Size="13px" 
                                               TabIndex="1" Text="Tax Certificate" Width="150px" 
                            oncheckedchanged="rbtn_Tax_CheckedChanged" />
                         
                    </td>
                    <td>
                      <asp:RadioButton ID="rbtn_Code" runat="server" AutoPostBack="True" 
                                               CssClass="radio" Font-Bold="False" Font-Names="Segoe UI" 
                                               Font-Size="13px" 
                                               TabIndex="1" Text="Code Violation" Width="150px" 
                            oncheckedchanged="rbtn_Code_CheckedChanged" />
                    </td>
                        <td align="center">
          
                                         
                                           <asp:RadioButton ID="rbtn_Hoa" runat="server" AutoPostBack="True" 
                                               CssClass="radio" Font-Bold="False" Font-Names="Segoe UI" 
                                               Font-Size="13px" 
                                               TabIndex="1" Text="HOA Payoff" Width="150px" 
                                               oncheckedchanged="rbtn_Hoa_CheckedChanged" />
                           
                        </td>
                      <td>
                        <asp:RadioButton ID="rbtn_Mortgage" runat="server" AutoPostBack="True" 
                                               CssClass="radio" Font-Bold="False" Font-Names="Segoe UI" 
                                               Font-Size="13px" 
                                               TabIndex="1" Text="Mortgage Payoff" Width="150px" 
                              oncheckedchanged="rbtn_Mortgage_CheckedChanged" />
                      </td>
                    </tr>
                    <tr>
                    <td>
                        
                    </td>
                    <td>
                    </td>
                    <td>
                        
                    </td>
                    <td></td>
                    </tr>
                    <tr align="center">
                        <td align="left">
                            <asp:Label ID="Label4" runat="server" CssClass="Label" Text="From Date"></asp:Label>
                        </td>
                       
                        <td>
                             <asp:TextBox ID="txt_From_Date" runat="server" CssClass="textbox" TabIndex="1" 
                                Width="150px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="txt_From_Date_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                TargetControlID="txt_From_Date" ValidChars="_/">
                            </cc1:FilteredTextBoxExtender>
                            <cc1:CalendarExtender ID="txt_From_Date_CalendarExtender" runat="server" 
                                CssClass="sample" Enabled="True" Format="dd/MM/yyyy" 
                                TargetControlID="txt_From_Date">
                            </cc1:CalendarExtender></td>
                        <td align="left">
                            <asp:Label ID="Label5" runat="server" CssClass="Label" Text="To Date"></asp:Label>
                        </td>
                        <td>
                           <asp:TextBox ID="txt_Todate" runat="server" CssClass="textbox" TabIndex="1" 
                                Width="150px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="txt_Todate_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                TargetControlID="txt_Todate" ValidChars="_/">
                            </cc1:FilteredTextBoxExtender>
                            <cc1:CalendarExtender ID="txt_Todate_CalendarExtender" runat="server" 
                                CssClass="sample" Enabled="True" Format="dd/MM/yyyy" 
                                TargetControlID="txt_Todate">
                            </cc1:CalendarExtender></td>
                    </tr>
              
                    <tr>
                        <td align="center" colspan="4">
                            &nbsp;</td>
                      
                    </tr>
                </table>
                </ContentTemplate></asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td align="center">
<asp:Button ID="btn_Submit" runat="server" CssClass="WebButton"  Text="Export" 
        onclick="btn_Submit_Click" TabIndex="4" Width="61px" />

<asp:Button ID="btn_Clear" runat="server" CssClass="WebButton"  Text="Clear" 
        onclick="btn_Submit_Click" TabIndex="4" />
<asp:Button ID="btn_Export" runat="server" CssClass="WebButton"  Text="Export" 
        TabIndex="5" onclick="btn_Export_Click" Visible="False" />
                                     
                                         </td>
        </tr>
        <tr>
            <td>
            <div id="Div_Tax" style="overflow:auto; width:800px;height:500px">
                       
                                                </div>
                                                
                                                
                                                </td>
                                                <td>
                                                 
                                                </td>
        </tr>
        <tr>
        <td>
            
        </td>
        </tr>
    </table>
 <%--   </ContentTemplate></asp:UpdatePanel>--%>
    </div>
</asp:Content>

