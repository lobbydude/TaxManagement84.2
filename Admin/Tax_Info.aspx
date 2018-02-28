<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Tax_Info.aspx.cs" Inherits="Admin_Tax_Info" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
         <script language="javascript" type="text/javascript">
        function show()
        {
              document.write("<head id="Head1" runat='server'></head>");
        }
</script>
   <script  type="text/javascript">
       function btnreturn() {
           return confirm('Are you sure to proceed?');
       }
   
    
</script>
<style type="text/css">
        .MyTabStyle .ajax__tab_header
        {
            font-family: "Helvetica Neue" , Arial, Sans-Serif;
            font-size: 14px;
            font-weight:bold;
            display: block;
        
             background: url('../Tabxp/tab-line.gif') repeat-x bottom;
cursor:pointer;

        }
        .MyTabStyle .ajax__tab_header .ajax__tab_outer
        {
            border-color: #222;
             color: #FFFFFF;
            padding-left: 10px;
            margin-right: 3px;
            border:solid 1px #d7d7d7;
        }
        .MyTabStyle .ajax__tab_header .ajax__tab_inner
        {
            border-color: #666;
           color: #FFFFFF;
            padding: 3px 10px 2px 0px;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_outer
        {
            background-color:#FFBFBF;
        }
        .MyTabStyle .ajax__tab_hover .ajax__tab_inner
        {
            color: #fff;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_outer
        {
           background-color: #FFBFBF;
              color: #000000;
        }
        .MyTabStyle .ajax__tab_active .ajax__tab_inner
        {
            color: #000;
            border-color: #333;
        }
        .MyTabStyle .ajax__tab_body
        {
            font-family: verdana,tahoma,helvetica;
            font-size: 10pt;
            background-color: #fff;
            border-top-width: 0;
            border: solid 1px #d7d7d7;
            border-top-color: #ffffff;
        }
    </style>
     <asp:UpdatePanel ID="upUser" runat="server" UpdateMode="Always"><ContentTemplate>
      <table style="width: 100%">
        <tr>
            <td>
               <div id="content">
                <span class="WebFont1">Tax Info</span>
                  
               </div>
               
               </td>
        </tr>
          <tr>
            <td>
            <table style="width: 100%">
              <tr >
                 
                                        <td align="left" style="height:20px"
                                            valign="top">
                                             <asp:Button ID="tab_Taxtype" runat="server" Text="Tax Type"  
                                                CssClass="TabButton" onclick="tab_Taxtype_Click" TabIndex="1"   />
                                             <asp:Button ID="tab_TaxPeriod" runat="server" Text="Tax Period"  
                                                CssClass="TabButton" onclick="tab_TaxPeriod_Click" TabIndex="2"   />
                                             <asp:Button ID="tab_TaxStatus" runat="server" Text="Tax Status"  
                                                CssClass="TabButton" onclick="tab_TaxStatus_Click" TabIndex="3"   />
                                            </td>
                  </tr>
                  </table>
               <div id="DivNewcreate" runat="server" style="height:100%;" class="DivContentBody">
             
             <table align="center" style=" width:98%; " >
                 
                  <tr>
                  <td>

                  <asp:UpdatePanel ID="updatepanel" runat="server" >
                  <ContentTemplate>
                  <table id="Tax_Type" runat="server" 
        style="width:98%; " valign="top" visible="false" 
        align="center">

        <tr >
<td colspan="4" valign="top"  >

<div class="div_toprow"  >
    Tax Type Info
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddTaxInfo" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" onclick="btn_AddTaxInfo_Click" 
        />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="4"  valign="top" align="center">
<div style="background-color:#fff;margin-top:-6px;width:100%">

    <asp:GridView ID="grd_Tax_Type1" runat="server" AutoGenerateColumns="False" 
                                                            CellPadding="4" CssClass="name" DataKeyNames="Tax_Type_Id" 
                                                            GridLines="None" 
                                                            OnRowDeleting="grd_Tax_Type_details_RowDeleting" 
                                                            OnSelectedIndexChanged="grd_Tax_Type_details_SelectedIndexChanged" 
                                                            style="width:100%;">
                                                            <Columns>
                                                            <asp:BoundField HeaderStyle-CssClass="head-label"       DataField="Tax_Type" HeaderText="Tax Type">
                                                            <HeaderStyle CssClass="head_style"  Height="30px"    HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="400px" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                                                            <ItemTemplate>
                                                            <asp:ImageButton ID="imgbtnExamEdit" runat="server" CommandName="Select" 
                                                                            Height="15px" ImageUrl="~/images/Gridview/View.png" Width="15px" />
                                                             </ItemTemplate>
                                                             <HeaderStyle CssClass="head_style"  Height="30px"   />
                                                             <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="10px" />
                                                             </asp:TemplateField>
                                                             <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                                                             <ItemTemplate>
                                                             <asp:ImageButton ID="imgbtnExamDelete" runat="server" CommandName="Delete" 
                                                                            Height="15px" ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                                            OnClientClick="javascript:return confirm('Are you sure to proceed?');"
                                                                            Width="12px" />
                                                             </ItemTemplate>
                                                             <HeaderStyle CssClass="head_style"  Height="30px"   />
                                                             <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="10px" />
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
</div>
</td>
</tr>
  <tr id="tr_Tax" runat="server" visible="false"><td colspan="4"><asp:Label ID="lbl_Type_Id" runat="server" Visible="False"></asp:Label></td></tr>
<tr id="tr_Tax1" runat="server" visible="false" >
<td  style="width: 627px"  >
<asp:Label ID="Label2" runat="server" CssClass="Label" 
        Text="Tax Type:"></asp:Label>
</td>
<td style="width: 300px"    >
                                                       
    <asp:Label ID="Label14" runat="server" CssClass="Label" Text="Record Added By"></asp:Label>
</td>
<td style="width: 300px"    >
                                                       
<asp:Label ID="Label7" runat="server" CssClass="Label" 
        Text="Record Added On"></asp:Label>
</td>
<td rowspan="2" width="625px" valign="middle" align="left">
    <asp:Button ID="btn_TaxTypeAdd" runat="server" CssClass="WebButton" 
                    OnClick="btn_TaxTypeAdd_Click" 
                    OnClientClick="return alert('Are You Sure ?');return true;" Text="Submit" 
                    Width="175px" />&nbsp;
    <asp:Button ID="btn_Cancel_Complaint" runat="server" CssClass="WebButton" 
                    OnClick="btn_Cancel_Complaint_Click" 
                  Text="Cancel" 
                    Width="75px" BackColor="#EC5E5E" ForeColor="White" />
</td>                 
                       
</tr>
<tr id="tr_Tax2" runat="server" visible="false" >
   <td valign="top" style="width: 627px" >
<asp:TextBox ID="txt_Tax_Type" runat="server" CssClass="textbox" style="text-transform:uppercase;" 
          ></asp:TextBox>
                
            </td>
            <td valign="middle" style="width: 300px">
                        <asp:Label ID="lbl_RecordAddedBy" runat="server" CssClass="Label"></asp:Label>
                            
                  
                
            </td>
            <td valign="middle" style="width: 300px">
                        <asp:Label ID="lbl_RecordAddedOn" runat="server" CssClass="Label"></asp:Label>
                            
                    
                
            </td>

     
    </tr>
              
    
   
</table>
                  </ContentTemplate> </asp:UpdatePanel>
                  
                  <asp:UpdatePanel ID="updatepanel1" runat="server" >
                  <ContentTemplate>
                  <table id="Tax_Period" runat="server" 
        style="width:98%; " valign="top" visible="false" 
        align="center">

        <tr >
<td colspan="4" valign="top">

<div class="div_toprow" >
    Tax Period Info
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddTaxPeriod" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddTaxPeriod_Click" />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="4"  valign="top">
<div style="background-color:#fff;margin-top:-6px;">

    
    <asp:GridView ID="Grd_Tax_Periode" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" CssClass="name" DataKeyNames="Tax_Period_Id" 
        GridLines="None" 
        OnRowDeleting="Grd_Tax_Periode_details_RowDeleting" 
        OnSelectedIndexChanged="Grd_Tax_Periode_details_SelectedIndexChanged" 
        style="width:100%;">
        <Columns>
            <asp:BoundField HeaderStyle-CssClass="head-label"     DataField="Tax_Period" HeaderText="Tax Period">
            <HeaderStyle CssClass="head_style"  Height="30px" HorizontalAlign="Center" />
            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="400px" />
            </asp:BoundField>
            <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                <ItemTemplate>
                    <asp:ImageButton ID="imgbtnExamEdit0" runat="server" CommandName="Select" 
                        Height="15px" ImageUrl="~/images/Gridview/View.png" Width="15px" />
                </ItemTemplate>
                <HeaderStyle CssClass="head_style"  Height="30px"   />
                <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="10px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                <ItemTemplate>
                    <asp:ImageButton ID="imgbtnExamDelete0" runat="server" CommandName="Delete" 
                        Height="15px" ImageUrl="~/images/Gridview/Remove-icon.png" 
                        OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                        Width="12px" />
                </ItemTemplate>
                <HeaderStyle CssClass="head_style"  Height="30px" />
                <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="10px" />
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

    
</div>
</td>
</tr>

<tr id="tr_TaxPeriod" runat="server">
<td colspan="4"><asp:Label ID="lbl_Periode_id" runat="server" Visible="false"></asp:Label></td></tr>
<tr id="tr_TaxPeriod1" runat="server" visible="false" >
<td  style="width: 627px"  >
<asp:Label ID="Label3" runat="server" CssClass="Label" 
        Text="Tax Periode:"></asp:Label>
</td>
<td style="width: 300px"    >
                                                       
<asp:Label ID="Label5" runat="server" CssClass="Label" 
        Text="Record Added By"></asp:Label>
</td>
<td style="width: 300px"    >
                                                       
<asp:Label ID="Label11" runat="server" CssClass="Label" 
        Text="Record Added On"></asp:Label>
</td>

<td rowspan="2" width="625px" valign="middle" align="left">
    <asp:Button ID="btn_TaxPeriodAdd" runat="server" CssClass="WebButton" 
                    OnClick="btn_TaxPeriodAdd_Click" 
                    OnClientClick="return alert('Are You Sure ?');return true;" Text="Submit" 
                    Width="175px" />&nbsp;
    <asp:Button ID="btn_Cancel_Complaint0" runat="server" CssClass="WebButton" 
                    OnClick="btn_Cancel_Complaint_Click" 
                  Text="Cancel" 
                    Width="75px" BackColor="#EC5E5E" ForeColor="White" />
</td>                 
                       
</tr>
<tr id="tr_TaxPeriod2" runat="server" visible="false" >
   <td valign="top" style="width: 627px" >
<asp:TextBox ID="txt_Tax_Periode" runat="server" CssClass="textbox" style="text-transform:uppercase;" 
          ></asp:TextBox>
                
            </td>
            <td valign="middle" style="width: 300px">
                        <asp:Label ID="lbl_Record_Add_by" runat="server" CssClass="Label"></asp:Label>
                            
                
            </td>

     <td valign="middle" style="width: 300px">
                        <asp:Label ID="lbl_Record_Add_on" runat="server" CssClass="Label"></asp:Label>
                
                
            </td>
    </tr>
    
   
</table>
</ContentTemplate></asp:UpdatePanel>
<asp:UpdatePanel ID="updatepanel2" runat="server" >
                  <ContentTemplate>
                  <table id="Tax_Status" runat="server" 
        style="width:98%; " valign="top" visible="false" 
        align="center">

        <tr >
<td colspan="4" valign="top">

<div class="div_toprow" >
    Tax Status Info
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddTaxStatus" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddTaxStatus_Click" />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="4"  valign="top">
<div style="background-color:#fff;margin-top:-6px;">

    
    <asp:GridView ID="grd_Tax_Status" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" CssClass="name" DataKeyNames="Tax_Status_Id" 
        ForeColor="#333333" GridLines="None" 
        OnRowDeleting="grd_Tax_Status_details_RowDeleting" 
        OnSelectedIndexChanged="grd_Tax_Status_details_SelectedIndexChanged" 
        style="width:100%;">
        <Columns>
            <asp:BoundField HeaderStyle-CssClass="head-label"       DataField="Tax_Status" HeaderText="Tax Status">
            <HeaderStyle CssClass="head_style"  Height="30px"   HorizontalAlign="Center" />
            <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="400px" />
            </asp:BoundField>
            <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="View">
                <ItemTemplate>
                    <asp:ImageButton ID="imgbtnExamEdit1" runat="server" CommandName="Select" 
                        Height="15px" ImageUrl="~/images/Gridview/View.png" Width="15px" />
                </ItemTemplate>
                <HeaderStyle CssClass="head_style"  Height="30px"    />
                <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" VerticalAlign="Middle" Width="10px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-CssClass="head-label"   HeaderText="Delete">
                <ItemTemplate>
                    <asp:ImageButton ID="imgbtnExamDelete1" runat="server" CommandName="Delete" 
                        Height="15px" ImageUrl="~/images/Gridview/Remove-icon.png" 
                        OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                        Width="12px" />
                </ItemTemplate>
                <HeaderStyle CssClass="head_style"  Height="30px"    />
                <ItemStyle CssClass="grid-item"   HorizontalAlign="Center" Width="10px" />
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

    
</div>
</td>
</tr>
<tr id="tr_TaxStatus" runat="server" >
<td colspan="4">
    <asp:Label ID="lbl_Status_Id" runat="server" Visible="False"></asp:Label>
    </td></tr>
<tr id="tr_TaxStatus1" runat="server" visible="false" >
<td  style="width: 627px"  >
<asp:Label ID="Label4" runat="server" CssClass="Label" 
        Text="Tax Status:"></asp:Label>
</td>
<td style="width: 300px"    >
                                                       
<asp:Label ID="Label8" runat="server" CssClass="Label" 
        Text="Record Added By"></asp:Label>
</td>
<td style="width: 300px"    >
                                                       
<asp:Label ID="Label15" runat="server" CssClass="Label" 
        Text="Record Added On"></asp:Label>
</td>
<td rowspan="2" width="625px" valign="middle" align="left">
    <asp:Button ID="btn_TaxStatusAdd" runat="server" CssClass="WebButton" 
                    OnClick="btn_TaxStatusAdd_Click" 
                    OnClientClick="return alert('Are You Sure ?');return true;" Text="Submit" 
                    Width="175px" />&nbsp;
    <asp:Button ID="btn_Cancel_Complaint1" runat="server" CssClass="WebButton" 
                    OnClick="btn_Cancel_Complaint_Click" 
                  Text="Cancel" 
                    Width="75px" BackColor="#EC5E5E" ForeColor="White" />
</td>                 
                       
</tr>
<tr id="tr_TaxStatus2" runat="server" visible="false" >
   <td valign="top" style="width: 627px" >
<asp:TextBox ID="txt_Tax_Status" runat="server" CssClass="textbox" style="text-transform:uppercase;" 
          ></asp:TextBox>
                
            </td>
            <td valign="middle" style="width: 300px">
                        <asp:Label ID="lblRecordAddby" runat="server" CssClass="Label"></asp:Label>
                            
                    
            </td>
            <td valign="middle" style="width: 300px">
                        <asp:Label ID="lblRecordAddon" runat="server" CssClass="Label"></asp:Label>
                            
                
            </td>
     
    </tr>
    
   
</table>
</ContentTemplate></asp:UpdatePanel>
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
        </ContentTemplate>
        </asp:UpdatePanel>
        
</asp:Content>


