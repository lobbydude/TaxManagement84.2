<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="AdminHome" %>
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



  <div class="container">
	<div class="row">
		<div class="col-md-12" >
        <asp:UpdatePanel ID="update" runat="server" UpdateMode="Always"><ContentTemplate>
       

<div class="tabbable" id="tabs-303912" >
				<ul class="nav nav-pills" >
					
					<li id="list_itemdash" runat="server" >
                    
						<a id="li_dash" runat="server" onclick="dash()" href="#panel_235561"
                         data-toggle="tab">Dashboard</a>
					</li>
				</ul>
				<div  class="tab-content"  style="width:100%">
                    	<div   class="tab-pane active" id="panel_235561" >
                    <div id="divdash" runat="server" > 
				
						
        <table  style="width: 100%">
        
        <tr><td style="width: 328px" ><br /></td></tr>
        
             <tr>
             <td style="width: 328px" >
             <asp:UpdatePanel ID="upre" runat="server" UpdateMode="Always"><ContentTemplate>
             <asp:Button ID="btn_refresh" runat="server" CssClass="WebButton" 
                                                            onclick="btn_refresh_Click" Text="Refresh" TabIndex="3" />
                                                            </ContentTemplate></asp:UpdatePanel>
                                                            </td></tr>
        <tr>
        <td style="width: 328px;" >
            <label class="Dash_label">Processing
            </label>
        </td>
        </tr>
        </table>
         <table style="width: 100%">
        <tr><td style="width: 328px"><br /><br /></td></tr>
        <tr >
        <td align="center" style="width:100%" >
        <table align="center" style="width:100%" >
        <tr>
        
        <td style="width: 150px" >
        <table align="center" style="width:45%">
                                    <tr>
                                        <td  align="right" style="width:64px;height:64px">
                                                  <a href="Web_Call_Order_Research.aspx" tabindex="6">
                                <div class="img_WebCallResearch" >
                                </div>
                                </a>
                                </td>
                                <td valign="top" align="left">
                                        <div align="center"  id="div_Web_Work" runat="server" class="bubble">
                                        <asp:Label ID="lbl_web_cal_reaserch_count" CssClass="Label" runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                           </td>
                                        
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                    <a href="Web_Call_Order_Research.aspx" tabindex="7">
                                    <asp:Label ID="label2" runat="server" Text="Web/Call Research"  CssClass="Label" 
                                            Width="145px" Font-Size="13px"></asp:Label>
                                    </a>
                                    </td></tr>
                                </table>
        
        </td>
        <td style="width: 151px">
        <table align="center" style="width:45%">
                                    <tr>
                                        <td  align="right" style="width:64px;height:64px">
                                                 <a href="Mail_Fax_Order_Que.aspx" tabindex="8">
                                <div class="img_MailFaxQue">
                                </div>
                                </a></td>
                                     <td valign="top" align="left">
                                        <div align="center" id="div_mail_work" runat="server"  class="bubble">
                                        <asp:Label ID="lbl_count_mail_Fax_Que_count" CssClass="Label" runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                            </td>   
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                    <a href="Mail_Fax_Order_Que.aspx" tabindex="9">
                                    <asp:Label ID="label3" runat="server" Text="Mail/Fax Order Search" CssClass="Label" 
                                            Width="145px" Font-Size="13px"></asp:Label>
                                    </a>
                                    </td></tr>
                                </table>
        
        </td>

        <td style="width: 150px">
        <table align="center" style="width:45%">
                                    <tr>
                                        <td align="right"  style="width:64px;height:64px">
                                                 <a  href="QualityQue.aspx" tabindex="10">
                                <div class="img_QcQue"></div>
                                </a>     </td>
                                        <td valign="top" align="left">
                                        <div align="center" id="div_Count_Qc_Que" runat="server"  class="bubble">
                                        <asp:Label ID="lbl_Count_Qc_Que"  CssClass="Label"  runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                    <a  href="QualityQue.aspx" tabindex="11">
                                    <asp:Label ID="label4" runat="server" Text="Quality Check Queue" CssClass="Label" 
                                            Width="145px" Font-Size="13px"></asp:Label>
                                    </a>
                                    </td></tr>
                                </table>
        
        </td>

        <td style="width: 150px">
        <table align="center" style="width:45%">
                                    <tr>
                                        <td align="right" style="width:64px;height:64px">
                                        <asp:LinkButton ID="LinkExport" runat="server" TabIndex="18" onclick="LinkExport_Click" 
                                              >
                                             
                                <div id="DiExport" runat="server" class="img_Export">
                                </div>
                                </asp:LinkButton></td>
                                        <td align="left" valign="top">
                                            <div id="div_Order_Export_Count" runat="server" align="center" class="bubble">
                                                <asp:Label ID="lbl_Order_Export_Count" runat="server" CssClass="Label" 
                                                    Font-Bold="True" ForeColor="White"></asp:Label>
                                            </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                       <asp:LinkButton ID="LinkExport1" runat="server" TabIndex="19" 
                                            onclick="LinkExport1_Click">
                                    <asp:Label ID="label10" runat="server" Text="Order Export" CssClass="Label" 
                                            Width="145px" Font-Size="13px"></asp:Label>
                                            </asp:LinkButton> 
                                    </td></tr>
                                </table>
        
        
        </td>

        <td style="width: 150px">
        <table align="center" style="width:45%">
                        <tr>
                        <td  align="center"  style="width:64px;height:64px">
                        <asp:LinkButton ID="LinkBtn_Order_search" runat="server" 
                                onclick="LinkBtn_Order_search_Click" TabIndex="4" >
                         <div id="divorder_search" runat="server" class="img_Report" >
                                </div>
                        </asp:LinkButton>
                        </td>
                        
                        </tr>
                        <tr>
                        <td align="center" >
                        <asp:LinkButton ID="LinkButton1" runat="server" TabIndex="5"
                                onclick="LinkBtn_Order_search_Click" style="text-decoration:none" >
                        <asp:Label ID="label1" runat="server" Text="Search Orders" CssClass="Label" Width="100"></asp:Label>
                        </asp:LinkButton>
                        </td>
                        </tr>
                                 
                            </table>
        
        </td>
        </tr>
        </table>
        </td>
        </tr>
       </table>
        <table style="width: 100%">

         <tr><td style="width: 328px" >
            <label class="Dash_label">Allocation
            </label>
        </td></tr>
         <tr><td style="width: 328px"><br /><br /></td></tr>
       </table>
        <table style="width: 100%">
       <tr >
        <td align="center" style="width:70%" >
        <table align="center" style="width:100%" >
        <tr>
        
        <td style="width: 150px" >
         <table align="center" style="width:30%">
                                    <tr>
                                        <td align="right" style="width:64px;height:64px">
                                             
                                <asp:LinkButton ID="lnk_webcall_allocation" runat="server" tabindex="12"
                                                onclick="lnk_webcall_allocation_Click">
                                <div id="divwebalocate" runat="server" class="img_WebCallAllocate">
                                </div>
                                
                                </asp:LinkButton>
                                </td>
                                        <td valign="top" align="left">
                                        <div align="center" id="div_web"  runat="server"  class="bubble">
                                        <asp:Label ID="lb_count" CssClass="Label"  runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                   <asp:LinkButton ID="lnk_webcall_allocation1" runat="server" TabIndex="13" 
                                            onclick="lnk_webcall_allocation1_Click">
                                    <asp:Label ID="label7" runat="server" Text="Web/Call Order" Font-Size="13px" CssClass="Label" Width="145"></asp:Label>
                                    </asp:LinkButton> 
                                    </td></tr>
                                </table>
        
        </td>
        <td style="width: 150px">
        
        <table align="center" style="width:30%">
                                    <tr>
                                        <td  align="right" style="width:64px;height:64px">
                                         <asp:LinkButton ID="LinkMailFaxAllocate" runat="server" TabIndex="14" onclick="LinkMailFaxAllocate_Click" >
                                                
                                <div id="divMailalocate" runat="server" class="img_MailFaxAllocate">
                                </div>
                                </asp:LinkButton></td>
                                        <td valign="top" align="left">
                                        <div align="center" id="div_mail" runat="server"  class="bubble">
                                        <asp:Label ID="lbl_count_mail_fax_Allocation"  CssClass="Label" runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                           </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                    <asp:LinkButton ID="LinkMailFaxAllocate1" runat="server" TabIndex="15" 
                                            onclick="LinkMailFaxAllocate1_Click">
                                    <asp:Label ID="label8" runat="server" Text="Mail/Fax Order" Font-Size="13px"
                                            CssClass="Label" Width="145px"></asp:Label>
                                            </asp:LinkButton>
                                    </td></tr>
                                </table>
        </td>

       
     <td style="width: 150px">
     <table align="center" style="width:30%">
                                    <tr>
                                        <td  align="right" style="width:64px;height:64px">
                                         <asp:LinkButton ID="LinkQualityAllocate" TabIndex="16"    runat="server" onclick="LinkQualityAllocate_Click" 
                                                >
                                                
                                                 
                                 <div id="divQCalocate" runat="server" class="img_QualityAllocate">
                                 </div>
                                 </asp:LinkButton>
                                 </td>
                                        <td valign="top" align="left">
                                        <div align="center"  id="div_Qc_Allocated_Count" runat="server"  class="bubble">
                                        <asp:Label ID="lbl_Qc_Allocated_Count"  CssClass="Label" runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                     <asp:LinkButton ID="LinkQualityAllocate1" TabIndex="17"    runat="server" 
                                            onclick="LinkQualityAllocate1_Click" >
                                    <asp:Label ID="label9" runat="server" Text="Quality Check Order" Font-Size="13px" 
                                            CssClass="Label" Width="145px"></asp:Label>
                                            </asp:LinkButton>
                                    </td></tr>
                                </table>
     
     </td>

     <td style="width:150px"></td>
     <td style="width:150px"></td>
        </tr>
        </table>
        </td>
        </tr>
        </table>

         <table style="width: 100%">
         <tr><td style="width: 328px" >
            <label class="Dash_label">Pending
            </label>
              </td>
              </tr>
              </table>
              <table style="width: 100%">
 <tr><td style="width: 328px"><br /><br /></td></tr>


  <tr >
        <td align="center" style="width:70%" >
        <table style="width: 100%" >
        <tr>
        
        <td style="width: 150px" >
         <table align="center" style="width:45%">
                                    <tr>
                                        <td align="right" style="width:64px;height:64px">
                                             
                                <asp:LinkButton ID="lnk_Client_Hold" runat="server" tabindex="12"
                                                onclick="lnk_webcall_allocation_Click">
                                <div id="div1" runat="server" class="img_pendHold">
                                </div>
                                
                                </asp:LinkButton>
                                </td>
                                        <td valign="top" align="left">
                                        <div align="center" id="div_Client_Hold"  runat="server"  class="bubble">
                                        <asp:Label ID="lbl_Client_Hold" CssClass="Label"  runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                   <asp:LinkButton ID="lnk_Client_Hold_Allocatiion" runat="server" TabIndex="13" onclick="lnk_Client_Hold_Allocatiion_Click" 
                                          >
                                    <asp:Label ID="label12" runat="server" Text="Hold" Font-Size="13px" CssClass="Label" Width="145"></asp:Label>
                                    </asp:LinkButton> 
                                    </td></tr>
                                </table>
        
        </td>
        <td style="width: 150px">
        
        <table align="center" style="width:45%">
                                    <tr>
                                        <td  align="right" style="width:64px;height:64px">
                                         <asp:LinkButton ID="lnk_Clarification_Allocation" runat="server" TabIndex="14" 
                                                onclick="lnk_Clarification_Allocation_Click"  >
                                                
                                <div id="div3" runat="server" class="img_pendClarification">
                                </div>
                                </asp:LinkButton></td>
                                        <td valign="top" align="left">
                                        <div align="center" id="div_clarification" runat="server"  class="bubble">
                                        <asp:Label ID="lbl_Clarification"  CssClass="Label" runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                           </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                    <asp:LinkButton ID="lnk_Clarifica_Alloc" runat="server" TabIndex="15" onclick="lnk_Clarifica_Alloc_Click" 
                                            >
                                    <asp:Label ID="label15" runat="server" Text="Clarification" Font-Size="13px"
                                            CssClass="Label" Width="145px"></asp:Label>
                                            </asp:LinkButton>
                                    </td></tr>
                                </table>
        </td>

        <td style="width:150px">
        
        <table align="center" style="width:45%">
                                    <tr>
                                        <td  align="right"  style="width:64px;height:64px">
                                         <asp:LinkButton ID="lnk_Cancelled" TabIndex="16"    runat="server" onclick="lnk_Cancelled_Click"  
                                                >
                                                
                                                 
                                 <div id="div5" runat="server" class="img_pendCancel">
                                 </div>
                                 </asp:LinkButton>
                                 </td>
                                        <td valign="top" align="left">
                                        <div align="center"  id="divcancelled" runat="server"  class="bubble">
                                        <asp:Label ID="lbl_Cancelled"  CssClass="Label" runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                     <asp:LinkButton ID="lnk_Cancelled_Allocation" TabIndex="17"    runat="server" onclick="lnk_Cancelled_Allocation_Click" 
                                            >
                                    <asp:Label ID="label17" runat="server" Text="Cancelled" Font-Size="13px" 
                                            CssClass="Label" Width="145px"></asp:Label>
                                            </asp:LinkButton>
                                    </td></tr>
                                </table>
        </td>

          <td style="width:150px"></td>
     <td style="width:150px"></td>
        </tr>
        </table>
        </td>
        </tr>



        </table>
        
             <table><tr><td><br /></td></tr></table>         
                                
   <table style="width: 100%">
                                                            <tr>
                                                             <td  align="center" >
                                                                 &nbsp;</td>    
                     <td valign="top" align="center">
                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
      


    
    
					</div>
                    </div>
				</div>
			</div>

            
            </ContentTemplate></asp:UpdatePanel>
            </div>
            </div>
            </div>

</asp:Content>

