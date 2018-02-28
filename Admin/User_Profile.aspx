<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="User_Profile.aspx.cs" Inherits="Admin_User_Profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
       <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Users Profile</span>
                  
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
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:100%;">
                                           
                                    
                                     <tr>
                                        <td class="lbltd" 
                                             style="width:300px; background-image: url('../AdminImage/Menu6.jpeg'); height:90px;" rowspan="2" >
                                            <asp:Image ID="emp_image" runat="server" CssClass="profile-img" Height="120px" 
                                                Width="120px" />
                                         </td>
                                         <td class="lbltd">
                                             <asp:Label ID="Label2" runat="server" CssClass="Label" Text="Company Name:"></asp:Label>
                                         </td>
                                        <td align="left" >
                                            <asp:Label ID="lbl_Company_Name" runat="server" CssClass="Label"></asp:Label>
                                         </td>
                                        <td align="center" rowspan="4" valign="middle">&nbsp;</td>
                                    </tr>
                                    
                                   
                                    
                              
                                
                                          
                                              <tr>
                                                  <td class="lbltd">
                                                      <asp:Label ID="lbl2" runat="server" CssClass="Label" Text="Branch Name:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                      <asp:Label ID="Labelbranch_name" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>
                                            
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td class="lbltd" align="center" style="background-image: url('../AdminImage/menulist.jpg')" 
                                            >
                                            <asp:Label ID="lbl_2" runat="server" CssClass="Label" Font-Bold="True">Name:</asp:Label>
                                            <asp:Label ID="lbl_User_Profile_Name" runat="server" CssClass="Label" 
                                                Font-Bold="True"></asp:Label>
                                        </td>
                                       
                                        <td class="lbltd" style="height:50px;">
                                            <asp:Label ID="Label4" runat="server" CssClass="Label" Text="User  Name:"></asp:Label>
                                        </td>
                                       
                                        <td align="left">
                                       
                                            <asp:Label ID="lbl_user_Name" runat="server" CssClass="Label"></asp:Label>
                                      
                                      </td>
                                      
                                    </tr>
                                        
                                  
                                
                                          
                                              <tr id="trpassword" runat="server">
                                                  <td class="lbltd"  
                                                      align="center" style="background-image: url('../AdminImage/menulist.jpg')">
                                                      <asp:Label ID="lbl_1" runat="server" CssClass="Label" Font-Bold="True">Role:</asp:Label>
                                                      <asp:Label ID="lbl_User_Role" runat="server" CssClass="Label" Font-Bold="True"></asp:Label>
                                                  </td>
                                                  <td class="lbltd" style="height:50px;" >
                                                      <asp:Label ID="Label6" runat="server" CssClass="Label" Text="Mobileno:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                 
                                                      <asp:Label ID="lbl_user_Mobile" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>
                                              <tr id="trconpassword" runat="server">
                                                  <td class="lbltd" style="background-image: url('../AdminImage/menulist.jpg')" >
                                                      &nbsp;</td>
                                                  <td class="lbltd" style="height:50px;">
                                                      <asp:Label ID="Label7" runat="server" CssClass="Label" Text="Email:"></asp:Label>
                                                  </td>
                                                  <td align="left">
                                                 
                                                      <asp:Label ID="lbl_user_Email" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>
                                            
                                           
                                   
                                          
                                          </table>

                                          </div>
                                          
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
                </ContentTemplate></asp:UpdatePanel>
               </div>
            
               </td>
        </tr>
    </table>
</asp:Content>


