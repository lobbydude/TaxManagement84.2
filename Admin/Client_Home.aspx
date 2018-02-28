<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Client_Home.master" AutoEventWireup="true" CodeFile="Client_Home.aspx.cs" Inherits="Admin_Client_Home" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">

    <asp:UpdatePanel ID="uporder" runat="server" UpdateMode="Always"><ContentTemplate>
          <table style="width: 100%">
        <tr>
            <td>
                <div id="content">
                <span class="WebFont1">Client Name</span>
                  
               </div>
               
               </td>
        </tr>
      
         <tr>
            <td>
               <div id="Divcreate" runat="server"  align="center" style="height:100%; width:100%;" class="DivContentBody">
                  


                               
                 <table align="center" style="width:50%;" >
                          
                                 
                            
                           
                                 
                                   
                                    
                              
                                 
                                  
                              
                                 
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="Label4" runat="server" CssClass="Label" Text="Client Name:"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:DropDownList ID="ddl_Client_Name" runat="server" CssClass="DropDown" 
                                                  AutoPostBack="True" 
                                                  onselectedindexchanged="ddl_Client_Name_SelectedIndexChanged">
                                              </asp:DropDownList>
                                          </td>
                                    </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="Label5" runat="server" CssClass="Label" Text="Sub Process:"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:DropDownList ID="ddl_Client_SubProcess" runat="server" CssClass="DropDown">
                                              </asp:DropDownList>
                                          </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btn_Continue" runat="server" CssClass="WebButton" OnClientClick="btnreturn()"   
                                                OnClick="btn_Submit_Click" Text="Continue" />
                                        </td>
                                    </tr>
                                      <tr>
                                        <td style="width:50%; height:300px;">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
            
               </div>
                  
               </td>
        </tr>
    </table>
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>


