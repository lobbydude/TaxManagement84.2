﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true"  CodeFile="Gls_Orders_Tax_Entry.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="Gls_Gls_Orders_Tax_Entry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    
      <script language="javascript" type="text/javascript">
        function show()
        {
              document.write("<head id="Head1" runat='server'></head>");
        }
</script>
    <script type="text/javascript">
        function PostToNewWindow() {
            originalTarget = document.forms[0].target;
            document.forms[0].target = '_blank';
            window.setTimeout("document.forms[0].target=originalTarget;", 300);
            return true;
        }
</script>
<script type="text/javascript">
    window.scrollTo = function (x, y) {
        return true;
    }
</script>
<script type="text/jscript">
    $("#txt_Tax_Comments, #txt_Client_Name").on("keypress", function (e) {
        var keycode = (e.keyCode ? e.keyCode : e.which);
        if (keycode == '13') {
           
            }
            $("#btn_Update").click();
        }
    });
</script>
<script  type="text/javascript">
    function btnreturn() {
        return confirm('Are You Proceed?');
    }
   
    
</script>
 <script type="text/javascript">
     function SetTarget() {
         document.forms[0].target = "_blank";
     }
    </script>
<script language="javascript" type="text/javascript">

    function openNewWin(url) {
        var x = window.open(url, 'mynewwin', 'width=600,height=600,toolbar=1');

        x.focus();

    }

</script>
<script type="text/javascript" language="javascript">
    function controlEnter(obj, event) {
        var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        if (keyCode == 13) {
            document.getElementById(obj).focus();
            return false;
        }
        else {
            return true;
        }
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
    .style3
    {
        width: 100%;
    }
    </style>
 
          <table style="width:100%">
      
      
         <tr>
            <td>
               <div id="Divcreate" runat="server"  align="center" class="DivContentBody" style="height:100%; width:100%;">
                  

        
                               
                 <table align="center" 
                       style="border: medium dotted #008080; width:95%; height:300px;" >
                          
                                 
                            
                           
                                    <tr>
                                        <td align="left" colspan="2" style="border: thin dotted #006666; height:100%;" 
                                            valign="top">
                                               <ajax:TabContainer ID="TabContainer1" runat="server"  CssClass="MyTabStyle"
                                                ActiveTabIndex="5" Width="100%" Height="300px">
<ajax:TabPanel ID="tbpnluser" runat="server" >
<HeaderTemplate>Web Info</HeaderTemplate><ContentTemplate><asp:PlaceHolder ID="PlaceHolder1"     runat="server"></asp:PlaceHolder></ContentTemplate></ajax:TabPanel>
<ajax:TabPanel ID="tabitcomplent" runat="server" ><HeaderTemplate>IT Complaints</HeaderTemplate>
<ContentTemplate>
    <table style="width:90%; ">
<tr >
<td>
<asp:Label Width="100px" ID="Label30" runat="server" CssClass="Label" Text="Error Reason"></asp:Label>

</td>
<td>
                                                        <asp:TextBox ID="txt_Error" runat="server" CssClass="textbox" Width="200px" 
                                                              TextMode="MultiLine"></asp:TextBox>
</td>
</tr>
<tr >
   <td>
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:FileUpload ID="fileupload3" runat="server" CssClass="textbox" 
                            TabIndex="11" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_Error_Submit" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:Button ID="btn_Error_Submit" runat="server" CssClass="textbox" 
                    OnClick="btn_Error_Submit_Click" 
                    OnClientClick="return alert('Are You Sure ?');return true;" Text="Submit" 
                    Width="75px" />
            </td>
     
    </tr>
</table>
                                                            
                                                            </ContentTemplate></ajax:TabPanel>
<ajax:TabPanel ID="tbpnlusrdetails" runat="server" ><HeaderTemplate>Order KB</HeaderTemplate>
<ContentTemplate>
<table style=" width:100%; ">
<tr><td><table><tr><td><table 
                                                    style=" width:100%;"><tr><td style="width:100px;"><asp:Label ID="Label8" 
                                                        runat="server" CssClass="Label" Text="Document"></asp:Label></td><td 
                                                        style=" width:150px;"><asp:TextBox ID="txt_order_Kb_Document" runat="server" 
                                                            CssClass="textbox" style="text-transform:uppercase;" Width="150px"></asp:TextBox></td><td><asp:Label 
                                                            ID="Label9" runat="server" CssClass="Label" Text="Comments"></asp:Label></td><td><asp:TextBox 
                                                            ID="txt_order_Kb_Comment" runat="server" CssClass="textbox" 
                                                            style="text-transform:uppercase;" Width="500px"></asp:TextBox><cc1:TextBoxWatermarkExtender 
                                                            ID="TextBoxWatermarkExtender1" runat="server" Enabled="True" 
                                                            TargetControlID="txt_order_Kb_Comment" WatermarkCssClass="watermarked" 
                                                            WatermarkText="Type Comments Here"></cc1:TextBoxWatermarkExtender></td><td><asp:Label 
                                                            ID="Label27" runat="server" CssClass="Label" Text="Upload Document"></asp:Label></td><td><asp:UpdatePanel 
                                                            ID="UpdatePanel1" runat="server"><ContentTemplate><asp:FileUpload 
                                                                ID="fileupload1" runat="server" CssClass="textbox" TabIndex="11" /></ContentTemplate><triggers><asp:PostBackTrigger 
                                                            ControlID="img_btn_order_kb_add"></asp:PostBackTrigger></triggers></asp:UpdatePanel></td></tr></table></td><td 
                                                    align="right" style="border: thin dotted #008080"><asp:ImageButton 
                                                        ID="img_btn_order_kb_add" runat="server" AlternateText="Add" 
                                                        ImageUrl="~/images/Gridview/Add.png" OnClick="img_btn_order_kb_add_Click" 
                                                        Width="16px"></asp:ImageButton></td></tr></table></td></tr><tr><td><div 
                                                        style="width:95%; height:200px; overflow:scroll;"><asp:GridView 
                                                        ID="grd_order_kb" runat="server" AllowSorting="True" 
                                                        AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                                        DataKeyNames="Order_Kb_Id" Font-Size="Medium" ForeColor="#333333" 
                                                        GridLines="None" onrowdatabound="grd_order_kb_RowDataBound" 
                                                        OnRowDeleting="grd_order_kb_RowDeleting" 
                                                        OnSelectedIndexChanged="grd_order_kb_SelectedIndexChanged" 
                                                        ShowHeaderWhenEmpty="True" Width="100%"><AlternatingRowStyle BackColor="White"></AlternatingRowStyle><Columns><asp:TemplateField 
                                                                HeaderText="id" Visible="False"><ItemTemplate><asp:Label ID="lblOrder_Kb_Id" 
                                                                    runat="server" CssClass="Label" Text='<%#Eval("Order_Kb_Id") %>' 
                                                                    Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="SI NO" SortExpression="Order_Number"><ItemTemplate><asp:Label 
                                                                    ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center"></HeaderStyle><ItemStyle CssClass="Label" 
                                                                HorizontalAlign="Center" Width="30px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Documents" SortExpression="Document_Name"><ItemTemplate><asp:Label 
                                                                    ID="lblDocument_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Document_Name") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="File"><ItemTemplate><asp:ImageButton ID="imgbtndoc" ImageUrl="~/Admin/MsgImage/Download.png" runat="server" 
                                                                    CommandName="Select" Height="30px" 
                                                                    OnCommand="View_OrderDocuemnt" Visible="false" Width="30px" /><asp:Label 
                                                                    ID="lbl_Order_Kb_File_Type" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_kb_File_Type") %>' Visible="false"></asp:Label><asp:Label 
                                                                    ID="lbl_orderkb_doc_path" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Kb_Path") %>' Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                                ForeColor="White" HorizontalAlign="Center"></HeaderStyle><ItemStyle 
                                                                HorizontalAlign="Center" Width="30px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Comments" SortExpression="Comments"><ItemTemplate><asp:Label 
                                                                    ID="lblComments" runat="server" CssClass="Label" Text='<%#Eval("Comments") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Updated By" SortExpression="Loan_Number"><ItemTemplate><asp:Label 
                                                                    ID="lblUser_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("User_Name") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Updated When" SortExpression="Date"><ItemTemplate><asp:Label 
                                                                    ID="lblModified_Date" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Modified_Date") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField>
                                                                <asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                    ID="imgbtnExamDelete" runat="server" CommandName="Delete" Height="20px" 
                                                                    ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                                     OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                                                    Width="20px" /></ItemTemplate><ItemStyle HorizontalAlign="Center" 
                                                                VerticalAlign="Middle" Width="16px"></ItemStyle></asp:TemplateField>
                                                                
                                                                </Columns><EditRowStyle 
                                                            BackColor="#CCDDDD"></EditRowStyle><EmptyDataRowStyle Font-Names="Verdana" 
                                                            ForeColor="#FF5050"></EmptyDataRowStyle><FooterStyle BackColor="#1C5E55" 
                                                            Font-Bold="True" ForeColor="White"></FooterStyle><HeaderStyle 
                                                            BackColor="#1C5E55" Font-Bold="True" Font-Size="Large" ForeColor="White"></HeaderStyle><PagerStyle 
                                                            BackColor="#666666" ForeColor="White" HorizontalAlign="Center"></PagerStyle><RowStyle 
                                                            BackColor="#E3EAEB"></RowStyle><SelectedRowStyle BackColor="#C5D8D8" 
                                                            Font-Bold="True" ForeColor="#333333"></SelectedRowStyle><sortedascendingcellstyle 
                                                            backcolor="#F8FAFA"></sortedascendingcellstyle><sortedascendingheaderstyle 
                                                            backcolor="#246B61"></sortedascendingheaderstyle><sorteddescendingcellstyle 
                                                            backcolor="#D4DFE1"></sorteddescendingcellstyle><sorteddescendingheaderstyle 
                                                            backcolor="#15524A"></sorteddescendingheaderstyle></asp:GridView>
                                                            </div></td></tr></table></ContentTemplate></ajax:TabPanel>
<ajax:TabPanel ID="tbpnljobdetails" runat="server" ><HeaderTemplate>Agency KB</HeaderTemplate><ContentTemplate><table style=" width:100%;"><tr><td><table><tr><td 
                                                    style=" border: thin dotted #008080; width:100%;"><table 
                                                    style=" width:100%;"><tr><td><asp:Label ID="Label2" runat="server" CssClass="Label" 
                                                            Text="Comments:"></asp:Label></td><td><asp:TextBox ID="txt_Agency_Comment" 
                                                                runat="server" CssClass="textbox" Width="500px"></asp:TextBox><cc1:TextBoxWatermarkExtender 
                                                                ID="TextBoxWatermarkExtender2" runat="server" Enabled="True" 
                                                                TargetControlID="txt_Agency_Comment" WatermarkCssClass="watermarked" 
                                                                WatermarkText="Type Comment Here" /></td></tr></table></td><td 
                                                    align="right" style="border: thin dotted #008080"><asp:ImageButton 
                                                        ID="imgbtn_agency_Add" runat="server" AlternateText="Add" 
                                                        ImageUrl="~/images/Gridview/Add.png" onclick="imgbtn_agency_Add_Click" 
                                                        Width="16px" /></td></tr></table></td></tr><tr><td><div ID="div5" 
                                                        runat="server" style="overflow:scroll; width:1250px; height:200px;"><asp:GridView 
                                                        ID="grd_Agency" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                                                        CellPadding="4" CssClass="name" DataKeyNames="Order_Agency_Kb_Id" 
                                                        Font-Size="Medium" ForeColor="#333333" GridLines="None" 
                                                        onrowdeleting="grd_Agency_RowDeleting" 
                                                        onselectedindexchanged="grd_Agency_SelectedIndexChanged" 
                                                        ShowHeaderWhenEmpty="True" Width="100%"><AlternatingRowStyle BackColor="White"></AlternatingRowStyle><Columns><asp:TemplateField 
                                                                HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Agency_Order_Kb_Id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Agency_Kb_Id") %>' Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="SI NO" SortExpression="Order_Number"><ItemTemplate><asp:Label 
                                                                    ID="lblagnsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle CssClass="Label" 
                                                                HorizontalAlign="Center" Width="30px" /></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Comments" SortExpression="Comments"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Agency_Comments" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Comments") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Updated By" SortExpression="Loan_Number"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Agency_User_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("User_Name") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Updated When" SortExpression="Date"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Agency_Modified_Date" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Modified_Date") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                    ID="imgbtnExamEdit" runat="server" CommandName="Select" Height="20px" 
                                                                    ImageUrl="~/images/Gridview/View.png" Width="20px" /></ItemTemplate><ItemStyle 
                                                                HorizontalAlign="Center" Width="16px"></ItemStyle></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                    ID="imgbtnExamDelete" runat="server" CommandName="Delete" Height="20px" 
                                                                    ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                                    OnClientClick="javascript:return confirm('Are you sure to proceed?');"
                                                                    Width="20px" /></ItemTemplate><ItemStyle HorizontalAlign="Center" 
                                                                VerticalAlign="Middle" Width="16px" /></asp:TemplateField></Columns><EditRowStyle 
                                                            BackColor="#C6D9D9" /><EmptyDataRowStyle Font-Names="Verdana" 
                                                            ForeColor="#FF5050" /><FooterStyle BackColor="#1C5E55" Font-Bold="True" 
                                                            ForeColor="White" /><HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
                                                            Font-Size="Large" ForeColor="White" /><PagerStyle BackColor="#666666" 
                                                            ForeColor="White" HorizontalAlign="Center" /><RowStyle 
                                                            BackColor="#E3EAEB" /><SelectedRowStyle BackColor="#C5D8D8" 
                                                            Font-Bold="True" ForeColor="#333333" /><sortedascendingcellstyle 
                                                            backcolor="#F8FAFA"></sortedascendingcellstyle><sortedascendingheaderstyle 
                                                            backcolor="#246B61"></sortedascendingheaderstyle><sorteddescendingcellstyle 
                                                            backcolor="#D4DFE1"></sorteddescendingcellstyle><sorteddescendingheaderstyle 
                                                            backcolor="#15524A"></sorteddescendingheaderstyle></asp:GridView></div></td></tr></table></ContentTemplate></ajax:TabPanel>
<ajax:TabPanel ID="taboutputpreview" runat="server" ><HeaderTemplate>Out Put PReview</HeaderTemplate><ContentTemplate><table style="width:100%;"><tr><td align="center">
<div 
                                                    id="divreport" runat="server" 
                    style="overflow:scroll; height:300px; width:100%; margin-right: 0px;" align="center">
                    <CR:CrystalReportViewer ID="CrystalReportViewer1" Visible="false" runat="server" AutoDataBind="true" />
                <%--    <radPdf:PdfWebControl id="PdfWebControl1" runat="server" 
        height="300px" width="100%" DocumentKeyMaxAge="1.00:00:00" 
        ThrowMaxPagesException="True"/>--%></div></td></tr></table></ContentTemplate></ajax:TabPanel>
                     <ajax:TabPanel ID="TabPanel1" runat="server" ><HeaderTemplate>County Comments</HeaderTemplate><ContentTemplate><table style=" width:100%;"><tr><td><table><tr><td 
                                                    style=" border: thin dotted #008080; width:100%;"><table 
                                                    style=" width:100%;"><tr>
                                                    <td>
                                                    <asp:Label 
                                                              ID="Label35" runat="server" CssClass="Label" Text="Tax Type"></asp:Label>
                                                    </td>
                                                    <td>
                                                    <asp:DropDownList ID="ddl_TaxType_Commts" 
                                                              runat="server" CssClass="DropDown" TabIndex="1" Width="175px" 
                                                            onselectedindexchanged="ddl_TaxType_Commts_SelectedIndexChanged"></asp:DropDownList>
                                                    </td>
                                                    <td><asp:Label ID="Label26" runat="server" CssClass="Label" 
                                                            Text="Comments:"></asp:Label></td><td>
                                                        <asp:TextBox ID="Txt_taxtype_Comments" 
                                                                runat="server" CssClass="textbox" Width="700px" TextMode="MultiLine" ></asp:TextBox><cc1:TextBoxWatermarkExtender 
                                                                ID="TextBoxWatermarkExtender7" runat="server" Enabled="True" 
                                                                TargetControlID="Txt_taxtype_Comments" WatermarkCssClass="watermarked" 
                                                                WatermarkText="Type Comment Here" /></td></tr></table></td><td 
                                                    align="right" style="border: thin dotted #008080"><asp:ImageButton 
                                                        ID="ImageButton3" 
            runat="server" AlternateText="Add" 
                                                        
            ImageUrl="~/images/Gridview/Add.png" onclick="imgbtn_Taxtype_Note_Add_Click" 
                                                        Width="16px" 
            style="height: 15px" /></td></tr></table></td></tr><tr><td>
            <div ID="div2" 
                                                        runat="server" style="overflow:scroll; width:1250px; height:200px;"><asp:GridView 
                                                        ID="Grd_Tax_Type_Comments" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                                                        CellPadding="4" CssClass="name" DataKeyNames="Note_Id" 
                                                        Font-Size="Medium" ForeColor="#333333" GridLines="None" 
                                                        onrowdeleting="grd_Taxtype_Comments_RowDeleting" 
                                                        onselectedindexchanged="grd_Taxtype_Comments_SelectedIndexChanged" 
                                                        ShowHeaderWhenEmpty="True" Width="100%"><AlternatingRowStyle BackColor="White"></AlternatingRowStyle><Columns>
                                                        <asp:TemplateField HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                              ID="lblTax_Id" runat="server" CssClass="Label" Text='<%#Eval("Tax_Id") %>' 
                                                              Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="90px" /></asp:TemplateField>
                                                              <asp:TemplateField HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                              ID="lblNote_Id" runat="server" CssClass="Label" Text='<%#Eval("Note_Id") %>' 
                                                              Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="90px" /></asp:TemplateField>

                                                        <asp:TemplateField 
                                                                HeaderText="SI NO" SortExpression="Order_Number"><ItemTemplate><asp:Label 
                                                                    ID="lblagnsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle CssClass="Label" 
                                                                HorizontalAlign="Center" Width="30px" /></asp:TemplateField>
                                                                  <asp:TemplateField 
                                                                HeaderText="Tax Type" SortExpression="Loan_Number"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Tax_Type_User_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Tax_Type") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px"></ItemStyle></asp:TemplateField>

                                                                <asp:TemplateField 
                                                                HeaderText="Comments" SortExpression="Note"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Taxtype_Comments" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Note") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="700px"></ItemStyle></asp:TemplateField>

                                                                <asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                    ID="imgbtnCommentsEdit" runat="server" CommandName="Select" Height="20px" 
                                                                    ImageUrl="~/images/Gridview/View.png" Width="20px" /></ItemTemplate><ItemStyle 
                                                                HorizontalAlign="Center" Width="16px"></ItemStyle></asp:TemplateField>
                                                             
                                                                <asp:TemplateField HeaderText="Delete"><ItemTemplate><asp:ImageButton 
                                                                    ID="imgbtnCommentsDelete" runat="server" CommandName="Delete" Height="20px" 
                                                                    ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                                    OnClientClick="javascript:return confirm('Are you sure to proceed?');"
                                                                    Width="20px" /></ItemTemplate>
                                                                    <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" 
                                                                VerticalAlign="Middle" Width="16px" /></asp:TemplateField></Columns><EditRowStyle 
                                                            BackColor="#C6D9D9" /><EmptyDataRowStyle Font-Names="Verdana" 
                                                            ForeColor="#FF5050" /><FooterStyle BackColor="#1C5E55" Font-Bold="True" 
                                                            ForeColor="White" /><HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
                                                            Font-Size="Large" ForeColor="White" /><PagerStyle BackColor="#666666" 
                                                            ForeColor="White" HorizontalAlign="Center" /><RowStyle 
                                                            BackColor="#E3EAEB" /><SelectedRowStyle BackColor="#C5D8D8" 
                                                            Font-Bold="True" ForeColor="#333333" /><sortedascendingcellstyle 
                                                            backcolor="#F8FAFA"></sortedascendingcellstyle><sortedascendingheaderstyle 
                                                            backcolor="#246B61"></sortedascendingheaderstyle><sorteddescendingcellstyle 
                                                            backcolor="#D4DFE1"></sorteddescendingcellstyle><sorteddescendingheaderstyle 
                                                            backcolor="#15524A"></sorteddescendingheaderstyle></asp:GridView></div></td></tr></table></ContentTemplate></ajax:TabPanel>

<ajax:TabPanel ID="tabcounty" runat="server" ><HeaderTemplate>County DataBase</HeaderTemplate>
<ContentTemplate>
<table style="width:100%;">
<tr><td>
<cc1:TabContainer  ID="tabcountydatabase" runat="server" ActiveTabIndex="0" CssClass="MyTabStyle" 
                                                    Height="300px" Width="100%"><cc1:TabPanel ID="TabPanel5" runat="server" 
                                                    Height="200px" Width="100%"><HeaderTemplate>County Database</HeaderTemplate><ContentTemplate>
                                                    
                                                    <div 
                                                    ID="divConutyDatabase" runat="server" 
                                                    style="overflow:scroll; width:1250px; height:200px;"><asp:GridView 
                                                    ID="grd_Tax_County_Database" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                                    DataKeyNames="Conty_Database_Id" Font-Size="Medium" ForeColor="#333333" 
                                                    GridLines="None" onrowcancelingedit="grd_Tax_County_Database_RowCancelingEdit" 
                                                    onrowediting="grd_Tax_County_Database_RowEditing" 
                                                    onrowupdating="grd_Tax_County_Database_RowUpdating" ShowHeaderWhenEmpty="True" 
                                                    Width="100%"><Columns><asp:TemplateField><EditItemTemplate><asp:ImageButton 
                                                            ID="imgbtnUpdate" runat="server" CommandName="Update" Height="20px" 
                                                            ImageUrl="~/images/Gridview/Save.png" ToolTip="Update" Width="20px" /><asp:ImageButton 
                                                            ID="imgbtnCancel" runat="server" CommandName="Cancel" Height="20px" 
                                                            ImageUrl="~/images/Gridview/Cancel.png" 
                                                            OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                                            ToolTip="Cancel" Width="20px" />/&gt;</EditItemTemplate><ItemTemplate><asp:ImageButton 
                                                                ID="imgbtnEdit" runat="server" CommandName="Edit" Height="20px" 
                                                                ImageUrl="~/images/Gridview/edit.png" ToolTip="Edit" Width="20px" /></ItemTemplate><HeaderStyle 
                                                            HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                            Width="50px" /></asp:TemplateField><asp:TemplateField HeaderText="id" 
                                                            Visible="False"><ItemTemplate><asp:Label ID="lbl_Conty_Database_Id" 
                                                                runat="server" CssClass="Label" Text='<%#Eval("Conty_Database_Id") %>' 
                                                                Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                            HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                            Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="SI NO"><ItemTemplate><asp:Label 
                                                                ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                            ForeColor="White" HorizontalAlign="Center" /><ItemStyle CssClass="Label" 
                                                            HorizontalAlign="Center" Width="30px" /></asp:TemplateField><asp:TemplateField 
                                                            HeaderText="Tax Type" SortExpression="Tax_Type"><ItemTemplate><asp:Label 
                                                                ID="lbl_County_Tax_Type" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Tax_Type") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                            HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                            Width="100px" /></asp:TemplateField>

                                                            <asp:TemplateField 
                                                            HeaderText="Phone No" SortExpression="Ph_No"><EditItemTemplate><asp:TextBox 
                                                                ID="txt_County_Phno" runat="server" Text='<%#Eval("Ph_No") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label 
                                                                ID="lbl_Ph_No" runat="server" CssClass="Label" Text='<%#Eval("Ph_No") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                            HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                            Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                            HeaderText="Make Changes Payable To" SortExpression="Make_Changes_Payable_to"><EditItemTemplate><asp:TextBox 
                                                                ID="txt_Make_Changes_Payable_to" runat="server" 
                                                                Text='<%#Eval("Make_Changes_Payable_to") %>' TextMode="MultiLine" Width="300px"></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label 
                                                                ID="lbl_Make_Changes_Payable_to" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Make_Changes_Payable_to") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                            HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Left" 
                                                            Width="300px" /></asp:TemplateField><asp:TemplateField 
                                                            HeaderText="Payee Address" SortExpression="Make_Changes_Payable_to"><EditItemTemplate><asp:TextBox 
                                                                ID="txt_Payee_Address" runat="server" Text='<%#Eval("Payee_Address") %>' 
                                                                TextMode="MultiLine" Width="300px"></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label 
                                                                ID="lbl_Payee_Address" runat="server" CssClass="Label" 
                                                                Text='<%#Eval("Payee_Address") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                            HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Left" 
                                                            Width="300px" /></asp:TemplateField></Columns><EditRowStyle 
                                                        BackColor="#C5D8D8" /><EmptyDataRowStyle Font-Names="Verdana" 
                                                        ForeColor="#FF5050" /><FooterStyle BackColor="#1C5E55" Font-Bold="True" 
                                                        ForeColor="White" /><HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
                                                        Font-Size="Large" ForeColor="White" /><PagerStyle BackColor="#666666" 
                                                        ForeColor="White" HorizontalAlign="Center" /><RowStyle 
                                                        BackColor="#E3EAEB" /><SelectedRowStyle BackColor="#D3E2E2" 
                                                        Font-Bold="True" ForeColor="#333333" /><sortedascendingcellstyle 
                                                        backcolor="#F8FAFA" /><sortedascendingheaderstyle backcolor="#246B61" /><sorteddescendingcellstyle 
                                                        backcolor="#D4DFE1" /><sorteddescendingheaderstyle backcolor="#15524A" /></asp:GridView></div></ContentTemplate></cc1:TabPanel><cc1:TabPanel 
                                                    ID="TabPanel6" runat="server"><HeaderTemplate>Delequent Database</HeaderTemplate><ContentTemplate><table 
                                                    style="width:100%;"><tr><td><table class="style3"><tr><td><asp:Label 
                                                        ID="Label46" runat="server" CssClass="Label" Text="Tax Type:"></asp:Label></td><td><asp:DropDownList 
                                                            ID="ddl_Tax_Delquent_Tax_type" runat="server" CssClass="DropDown" TabIndex="1" 
                                                            Width="175px"></asp:DropDownList></td><td><asp:Label ID="Label49" 
                                                            runat="server" CssClass="Label" Text="Phone No:"></asp:Label></td><td><asp:TextBox 
                                                            ID="txt_delequent_phno" runat="server" CssClass="textbox" TabIndex="2" 
                                                            Width="120px"></asp:TextBox></td><td><asp:Label ID="Label48" runat="server" 
                                                            CssClass="Label" Text="Make Changes Payble To"></asp:Label></td><td><asp:TextBox 
                                                            ID="txt_Delequent_Make_Changes" runat="server" CssClass="textbox" Height="30px" 
                                                            TabIndex="3" TextMode="MultiLine" Width="220px"></asp:TextBox></td><td><asp:Label 
                                                            ID="Label50" runat="server" CssClass="Label" Text="Payee Address:"></asp:Label></td><td><asp:TextBox 
                                                            ID="txt_Delequent_Payee_addres" runat="server" CssClass="textbox" Height="30px" 
                                                            TabIndex="4" TextMode="MultiLine" Width="220px"></asp:TextBox></td><td><asp:ImageButton 
                                                            ID="imgbtn_Delequent_Tax_Add" runat="server" AlternateText="Add" Height="20px" 
                                                            ImageUrl="~/images/Gridview/Add.png" onclick="imgbtn_Delequent_Tax_Add_Click" 
                                                            TabIndex="5" Width="20px" /></td></tr></table></td></tr><tr><td><div 
                                                        ID="divdeliquent" runat="server" 
                                                        style="overflow:scroll; width:95%; height:200px;"><asp:GridView 
                                                        ID="Grid_Delequent_Data" runat="server" AllowSorting="True" 
                                                        AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                                        DataKeyNames="Delequent_Database_Id" Font-Size="Medium" ForeColor="#333333" 
                                                        GridLines="None" onrowdeleting="Grid_Delequent_Data_RowDeleting" 
                                                        onselectedindexchanged="Grid_Delequent_Data_SelectedIndexChanged" 
                                                        ShowHeaderWhenEmpty="True" Width="100%"><AlternatingRowStyle 
                                                            BackColor="White" /><Columns><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                ID="imgbntaxdel" runat="server" CommandName="Delete" Height="20px" 
                                                                ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                               OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                                                Width="20px" /></ItemTemplate><ItemStyle HorizontalAlign="Center" 
                                                                VerticalAlign="Middle" Width="16px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Delequent_Database_Id" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Delequent_Database_Id") %>' Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="SI NO"><ItemTemplate><asp:Label 
                                                                    ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                                ForeColor="White" HorizontalAlign="Center" /><ItemStyle CssClass="Label" 
                                                                HorizontalAlign="Center" Width="30px" /></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Tax Type" SortExpression="Tax_Type"><ItemTemplate><asp:LinkButton 
                                                                    ID="lbl_Deliquent_Tax_Type" runat="server" CommandName="Select" 
                                                                    CssClass="Label" Text='<%#Eval("Tax_Type") %>'></asp:LinkButton></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Phone No" SortExpression="Ph_No"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Deliquent_Ph_No" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Ph_No") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Make Changes Payable To" SortExpression="Make_Changes_Payable_to"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Deliquent_Make_Changes_Payable_to" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Make_Changes_Payable_to") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Left" 
                                                                Width="300px" /></asp:TemplateField><asp:TemplateField 
                                                                HeaderText="Payee Address"><ItemTemplate><asp:Label 
                                                                    ID="lbl_Deliquent_Payee_Address" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Payee_Address") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                ForeColor="White" HorizontalAlign="Center" /><ItemStyle 
                                                                HorizontalAlign="Left" Width="300px" /></asp:TemplateField></Columns><EditRowStyle 
                                                            BackColor="#C5D8D8" /><EmptyDataRowStyle Font-Names="Verdana" 
                                                            ForeColor="#FF5050" /><FooterStyle BackColor="#1C5E55" Font-Bold="True" 
                                                            ForeColor="White" /><HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
                                                            Font-Size="Large" ForeColor="White" /><PagerStyle BackColor="#666666" 
                                                            ForeColor="White" HorizontalAlign="Center" /><RowStyle 
                                                            BackColor="#E3EAEB" /><SelectedRowStyle BackColor="#D3E2E2" 
                                                            Font-Bold="True" ForeColor="#333333" /><sortedascendingcellstyle 
                                                            backcolor="#F8FAFA" /><sortedascendingheaderstyle backcolor="#246B61" /><sorteddescendingcellstyle 
                                                            backcolor="#D4DFE1" /><sorteddescendingheaderstyle backcolor="#15524A" /></asp:GridView></div></td></tr></table></ContentTemplate></cc1:TabPanel></cc1:TabContainer>
                                                            
                                                            </td></tr><tr><td 
                                                        align="center"></td></tr></table></div></ContentTemplate></ajax:TabPanel>


                                           








</ajax:TabContainer>
                                           
                                           </td>
                                    </tr>
                                    <tr>
                                        
                                        <td>
                                         <table style="width:100%;">
                          <tr>
                              <td style="border: thin solid #003366">
                                                        <asp:Button ID="btn_Preview" runat="server"  OnClientClick="SetTarget();"  CssClass="WebButton" 
                                                            onclick="btn_Preview_Click" Text="Preview" />
                                                        <asp:Button ID="btn_Complete" runat="server" CssClass="WebButton" 
                                                            onclick="btn_Complete_Click"   OnClientClick="javascript:return confirm('Are you sure to proceed?');" Text="Complete" />
                                                        <asp:Button ID="btn_Send" runat="server" CssClass="WebButton" Text="Send" />
                                                        <asp:Button ID="btn_PreviewMail" runat="server" CssClass="WebButton" 
                                                            Text="Preview -Mail" />
                                                        <asp:Button ID="btn_PreviewFax" runat="server" CssClass="WebButton" 
                                                            Text="Preview -Fax" />
                                                        <asp:Button ID="btn_PreviewEfax" runat="server" CssClass="WebButton" 
                                                            Text="Preview -eFax" />
                                                        <asp:Button ID="btn_Update" runat="server" Visible="false" CssClass="WebButton" 
                                                            onclick="btn_Update_Click" Text="Update Order Info" Width="100px" />
                                                          
                                                            <asp:TextBox ID="txt_Date" Visible="false" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;"   TabIndex="19" 
                                                          Enabled="False" Width="70px"></asp:TextBox>
                                                          <ajax:FilteredTextBoxExtender ID="filter_Date" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_Date" ValidChars="_/"></ajax:FilteredTextBoxExtender>
                                                          
                                                          <ajax:CalendarExtender ID="txt_Date_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Date"></ajax:CalendarExtender>
                                                        <asp:TextBox ID="txt_ETA_date" Visible="false" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;"   TabIndex="18" AutoPostBack="True" 
                                                            ontextchanged="txt_ETA_date_TextChanged" Width="70px"></asp:TextBox>
                                                          <ajax:FilteredTextBoxExtender ID="txt_ETA_date_FilteredTextBoxExtender" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_ETA_date" ValidChars="_/"></ajax:FilteredTextBoxExtender>

 <ajax:CalendarExtender ID="txt_ETA_date_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_ETA_date"></ajax:CalendarExtender>
                                                          </td>
                          </tr>
                          <tr>
                              <td>
                                         <table style="width:100%;">
                                      <tr>
                                          <td style="width:100%;">
                                                   <table  style="border: thin solid #003366; width:100%;">
                                                  <tr>
                                                      <td>
                                                        <asp:Label ID="Labelorderno" runat="server" CssClass="Label" Text="Order #"></asp:Label>
                                                                </td>
                                                      <td style="width:200px;">
                                                        <asp:TextBox ID="txt_Order_Number" runat="server" CssClass="textbox" 
                                                            TabIndex="1" Enabled="False" Width="150px"></asp:TextBox>
                                                                </td>
                                                      <td style="width:100px;">

                                                       <asp:Label ID="Label18" runat="server" CssClass="Label" Text="Address"></asp:Label>
                                                       
                                                        </td>
                                                        <td style="width:150px;">
                                                        
                                                        <asp:TextBox ID="txt_Barrower_Address" runat="server" AutoPostBack="True" 
                                                            CssClass="textbox" ontextchanged="txt_Barrower_Address_TextChanged" 
                                                            TabIndex="10" TextMode="MultiLine" Width="150px"></asp:TextBox>
                                                                                                           




                                                             </td>   

                                                      <td style="width:100px;">
                                                          
                                                            </td>                                               
                                                        <td style="width:150px;">

                                                        
                                                      
                                                                </td>
                                                      <td colspan="2" style="width:250px;" align="center" >
                                                          &nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                        <asp:Label ID="Label34" runat="server" CssClass="Label" Text="Parcel #"></asp:Label>
                                                                </td>
                                                      <td>
                                                        <asp:TextBox ID="txt_Parcel_Number" runat="server" CssClass="textbox" 
                                                            TabIndex="2" AutoPostBack="True" 
                                                            ontextchanged="txt_Parcel_Number_TextChanged" Width="150px"></asp:TextBox>
                                                                </td>
                                                      <td>
                                                        <asp:Label ID="Label38" runat="server" CssClass="Label" Text="City"></asp:Label>
                                                                </td>
                                                                <td>
                                                                <asp:TextBox ID="txt_Barrower_City" 
                                                                        runat="server" AutoPostBack="True" 
                                                            CssClass="textbox" 
    ontextchanged="txt_Barrower_City_TextChanged" TabIndex="11" 
                                                            Width="150px"></asp:TextBox>
                                                                </td>
                                                                <td>

                                                                

                                                                </td>
                                                               
                                                      <td >
                                                    
                                                        
                                                                                                            
                                                    
                                                                </td>
                                                      <td >
                                                     
                                                          &nbsp;</td>
                                                      <td >
                                                          <asp:TextBox ID="txt_Loan_Number" runat="server" AutoPostBack="True" 
                                                              CssClass="textbox" ontextchanged="txt_Barrower_Zip_TextChanged" TabIndex="14" 
                                                              Visible="False" Width="100px"></asp:TextBox>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                      <asp:Label ID="Label11" runat="server" CssClass="Label" 
                                                            Text="First Name"></asp:Label>
                                                       
                                                                </td>
                                                      <td>
                                                        
                                                         <asp:TextBox ID="txt_Barrower_Name" runat="server" AutoPostBack="True" 
                                                            CssClass="textbox"  TabIndex="9" 
                                                            ontextchanged="txt_Barrower_Last_Name_TextChanged" Width="150px"></asp:TextBox>

                                                                </td>
                                                      <td>
                                                        
                                                        
                                                         <asp:Label ID="Label17" runat="server" CssClass="Label" Text="County"></asp:Label>

                                                                </td>
                                                                <td>
                                                                <asp:DropDownList ID="ddl_Barrower_County" runat="server" CssClass="DropDown" 
                                                            Width="160px" TabIndex="12">
                                                        </asp:DropDownList>

                                                               

                                                                 
                                                         
                                                                  <td>
                                                      
                                                               
                                                              
                                                                  </td>
                                                                  <td>
                                                        
                                                           

                                                                  </td>
                                                             
                                                                </td>
                                                      <td >
                                                           &nbsp;</td>
                                                      <td >
                                                                                                            &nbsp;</td>
                                                  </tr>
                                               <tr>
                                               <td>

                                               <asp:Label ID="Label29" runat="server" CssClass="Label" 
                                                            Text="Last Name"></asp:Label>

                                               </td>
                                               <td>
                                               <asp:TextBox ID="txt_Barrower_Last_Name0" runat="server" AutoPostBack="True" 
                                                            CssClass="textbox"  TabIndex="9" 
                                                            ontextchanged="txt_Barrower_Last_Name_TextChanged" Width="150px"></asp:TextBox>
                                               
                                               </td>
                                               <td>
                                               <asp:Label ID="Label20" runat="server" CssClass="Label" Text="State  "></asp:Label>
                                               
                                               </td>
                                               <td>
                                               <asp:DropDownList ID="ddl_Barrower_State" runat="server" CssClass="DropDown" 
                                                            Width="160px" AutoPostBack="True" 
                                                            onselectedindexchanged="ddl_Barrower_State_SelectedIndexChanged" 
                                                            TabIndex="13">
                                                        </asp:DropDownList>
                                               
                                               </td>
                                               <td>
                                               <asp:Label ID="Label1" runat="server" CssClass="Label" Text="Zip"></asp:Label>
                                               
                                               </td>
                                               <td>
                                               <asp:TextBox ID="txt_Barrower_Zip" runat="server" CssClass="textbox" 
                                                            Width="150px" TabIndex="14" AutoPostBack="True" 
                                                            ontextchanged="txt_Barrower_Zip_TextChanged"></asp:TextBox>
                                               
                                               </td>
                                               </tr>
                                              </table>
                                          </td>
                                       
                                      </tr>
                                  </table>
                              </td>
                          </tr>
                      </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="border: thin dotted #008000; height:100px;">
                                            
                                              <ajax:TabContainer ID="TabContainer2" runat="server"  CssClass="MyTabStyle"
                                                ActiveTabIndex="0"  Width="100%" Height="300px">
<ajax:TabPanel ID="TabPanel3" runat="server" ><HeaderTemplate>Tax Details</HeaderTemplate>
<ContentTemplate>
<div style="width:1250px; height:300px; overflow:auto;">
<asp:UpdatePanel ID="uptax_entrygrid" runat="server">
<ContentTemplate>
<asp:GridView  ID="gvTaxDetails"  runat="server" AutoGenerateColumns="False" 
            ShowFooter="True" CellPadding="4"   
        PageSize="4" onrowcancelingedit="gvTaxDetails_RowCancelingEdit"  Width="100%"
        onrowcommand="gvTaxDetails_RowCommand" onrowdeleting="gvTaxDetails_RowDeleting" 
        onrowediting="gvTaxDetails_RowEditing" 
        onrowupdating="gvTaxDetails_RowUpdating" DataKeyNames="Tax_Id" 
        onrowdatabound="gvTaxDetails_RowDataBound" BackColor="White" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        onselectedindexchanged="gvTaxDetails_SelectedIndexChanged"><Columns><asp:TemplateField HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                              ID="lblTax_Id" runat="server" CssClass="Label" Text='<%#Eval("Tax_Id") %>' 
                                                              Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="90px" /></asp:TemplateField>

                                                              <asp:TemplateField HeaderText="Tax Type"><EditItemTemplate><asp:DropDownList ID="ddl_Tax_Type" Width="150px"   CssClass="GridDropDown" runat="server" ></asp:DropDownList></EditItemTemplate><FooterTemplate><asp:DropDownList ID="ddl_Tax_Type_Entry"  Width="90px"   CssClass="GridDropDown" runat="server" ></asp:DropDownList></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Type" Width="90px" CssClass="Label" runat="server" Text='<%#Eval("Tax_Type") %>'/></ItemTemplate>
                                                                  <HeaderStyle ForeColor="White" HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="90px" /></asp:TemplateField>
                                                              
                                                              <asp:TemplateField HeaderText="Municipality"><EditItemTemplate><asp:TextBox ID="txt_Munciplane_Name" Width="50px"   CssClass="Gridtextbox" runat="server" Text='<%#Eval("Munciplene_Name") %>'/></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Munciplane_Name_Entry" Width="50px"   CssClass="Gridtextbox" runat="server"/></FooterTemplate><ItemTemplate><asp:Label ID="lbl_txt_Munciplane_Name" Width="70px"  CssClass="Label" runat="server" Text='<%#Eval("Munciplene_Name") %>'/></ItemTemplate><HeaderStyle ForeColor="White" />
                                                                  <ItemStyle HorizontalAlign="Center" 
                                                              Width="40px" /></asp:TemplateField><asp:TemplateField HeaderText="Tax Year"><EditItemTemplate><asp:TextBox ID="txt_Tax_Year" Width="40px" runat="server"   CssClass="GridDropDown"></asp:TextBox></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Year_Entry" Width="40px"   CssClass="GridDropDown" runat="server" >
                                                              </asp:TextBox></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Year" Width="40px" CssClass="Label" runat="server" Text='<%#Eval("Tax_Year") %>'/></ItemTemplate><HeaderStyle ForeColor="White" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="70px" /></asp:TemplateField>

                                                              <asp:TemplateField HeaderText="Period"><EditItemTemplate><asp:DropDownList ID="ddl_Tax_Period" Width="90px"   CssClass="GridDropDown"   runat="server"></asp:DropDownList></EditItemTemplate><FooterTemplate><asp:DropDownList ID="ddl_Tax_Period_Entry" Width="90px"   CssClass="GridDropDown" runat="server" ></asp:DropDownList></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Period" Width="90px" CssClass="Label" runat="server" Text='<%#Eval("Tax_Period") %>'/></ItemTemplate>
                                                                  <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
        </asp:TemplateField>
                                                              
                                                              <asp:TemplateField HeaderText="Base Amt"><EditItemTemplate><asp:TextBox ID="txt_Tax_Amount" Width="50px"   CssClass="Gridtextbox" runat="server" Text='<%#Eval("Tax_Base_Amount") %>'/></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Amount_Amount_Entry" Width="50px"   CssClass="Gridtextbox" runat="server"/></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Amount" Width="50px"  CssClass="Label" runat="server" Text='<%#Eval("Tax_Base_Amount") %>'/></ItemTemplate><HeaderStyle ForeColor="White" />
                                                                  <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
                                                              
                                                              <asp:TemplateField HeaderText="Due Dt"><EditItemTemplate><asp:TextBox ID="txt_Tax_Due_Date" Width="60px"   CssClass="Gridtextbox" runat="server" Text='<%#Eval("Tax_Due_Date") %>'/><ajax:CalendarExtender ID="txt_Tax_Due_Date_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Tax_Due_Date"></ajax:CalendarExtender></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Due_Date_Entry" Width="60px"   CssClass="Gridtextbox" runat="server"/><ajax:CalendarExtender ID="txt_Tax_Due_Date_Entry_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Tax_Due_Date_Entry"></ajax:CalendarExtender></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Due_Date" Width="60px" CssClass="Label"  runat="server" Text='<%#Eval("Tax_Due_Date") %>'/></ItemTemplate><HeaderStyle ForeColor="White" /></asp:TemplateField>
                                                       
                                                       <asp:TemplateField HeaderText="Disc Y/s"><EditItemTemplate><asp:DropDownList ID="ddl_Discount" Width="40px" CssClass="GridDropDown" AutoPostBack="true"  OnSelectedIndexChanged="ddl_Tax_Discount_SelectedIndexChangedE"  runat="server"></asp:DropDownList></EditItemTemplate><FooterTemplate><asp:DropDownList ID="ddl_Discount_Entry" AutoPostBack="true"  OnSelectedIndexChanged="ddl_Tax_Status_Entry_SelectedIndexChangedF"  Width="45px" CssClass="GridDropDown" runat="server"></asp:DropDownList></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Discount" Width="40px"  CssClass="Label"  runat="server" Text='<%#Eval("Discount") %>'/></ItemTemplate>
                                                           <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
                                                           <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
                                                      
                                                      
                                                       <asp:TemplateField HeaderText="Disc Amt"><EditItemTemplate><asp:TextBox ID="txt_Tax_Discount_Amount" Width="50px" Enabled="false"  CssClass="Gridtextbox" runat="server" Text='<%#Eval("Discount_Amount") %>'/></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Discount_Amount_Amount_Entry" Width="50px"  Enabled="false" CssClass="Gridtextbox" runat="server"/></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Discount_Amount" Width="50px"  CssClass="Label" runat="server" Text='<%#Eval("Discount_Amount") %>'/></ItemTemplate><HeaderStyle ForeColor="White"  />
                                                           <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Disc Dt" ><EditItemTemplate><asp:TextBox ID="txt_Tax_Discount_Date" Width="60px"   CssClass="Gridtextbox" runat="server" Text='<%#Eval("Discount_Date") %>'/><ajax:CalendarExtender ID="txt_Tax_Discount_Date_CalendarExtender" runat="server" 
                                                       Enabled="False" Format="MM/dd/yyyy" TargetControlID="txt_Tax_Discount_Date"></ajax:CalendarExtender></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Entry_Discount_Date" Width="60px" Enabled="false"  CssClass="Gridtextbox" runat="server"/><ajax:CalendarExtender ID="txt_Tax_Entry_Discount_Date_CalendarExtender" runat="server" 
                                                       Enabled="true" Format="MM/dd/yyyy" TargetControlID="txt_Tax_Entry_Discount_Date"></ajax:CalendarExtender></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Discount_Date" Width="60px" CssClass="Label" runat="server" Text='<%#Eval("Discount_Date") %>'/></ItemTemplate>
                                                           <HeaderStyle ForeColor="White" HorizontalAlign="Center" /></asp:TemplateField>
                                                       
                                                              <asp:TemplateField HeaderText="Status"><EditItemTemplate><asp:DropDownList ID="ddl_Tax_Status"  AutoPostBack="true" CssClass="GridDropDown"  OnSelectedIndexChanged="ddl_Tax_Status_SelectedIndexChanged" Width="90px" runat="server" ></asp:DropDownList></EditItemTemplate><FooterTemplate><asp:DropDownList ID="ddl_Tax_Status_Entry" AutoPostBack="true"  OnSelectedIndexChanged="ddl_Tax_Status_Entry_SelectedIndexChanged"  Width="90px"   CssClass="GridDropDown" runat="server" ></asp:DropDownList></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Status" Width="90px" CssClass="Label" runat="server" Text='<%#Eval("Tax_Status") %>'/></ItemTemplate>
                                                                  <HeaderStyle ForeColor="White" HorizontalAlign="Center" /></asp:TemplateField>
                                                       
                                                       
                                                       <asp:TemplateField HeaderText="Paid Amt"><EditItemTemplate><asp:TextBox ID="txt_Tax_Paid_Amount" Width="50px"   CssClass="Gridtextbox" runat="server" Text='<%#Eval("Tax_Paid_Amount") %>'/></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Paid_Amount_Amount_Entry" Width="50px"   CssClass="Gridtextbox" runat="server"/></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Paid_Amount" Width="50px"  CssClass="Label" runat="server" Text='<%#Eval("Tax_Paid_Amount") %>'/></ItemTemplate>
                                                           <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
                                                           <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
                                                           
                                                           <asp:TemplateField HeaderText="Paid Dt"><EditItemTemplate><asp:TextBox ID="txt_Tax_Paid_Date" Width="60px"   CssClass="Gridtextbox" runat="server" Text='<%#Eval("Paid_Date") %>'/><ajax:CalendarExtender ID="txt_Tax_Paid_Date_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Tax_Paid_Date"></ajax:CalendarExtender></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Entry_Paid_Date" Width="60px"   CssClass="Gridtextbox" runat="server"/><ajax:CalendarExtender ID="txt_Tax_Entry_Paid_Date_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Tax_Entry_Paid_Date"></ajax:CalendarExtender></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Paid_Date" Width="60px" CssClass="Label" runat="server" Text='<%#Eval("Paid_Date") %>'/></ItemTemplate>
            <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
                                                               <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
            <asp:TemplateField HeaderText="Payoff Amt"><EditItemTemplate><asp:TextBox ID="txt_Tax_Payoff_Amount" Width="50px"   CssClass="Gridtextbox" runat="server" Text='<%#Eval("Tax_Payoff_Amount") %>'/></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Payoff_Amount_Amount_Entry" Width="50px"   CssClass="Gridtextbox" runat="server"/></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Payoff_Amount" Width="50px"  CssClass="Label" runat="server" Text='<%#Eval("Tax_Payoff_Amount") %>'/></ItemTemplate>
            <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="G.T Dt"><EditItemTemplate><asp:TextBox ID="txt_Tax_Good_Through_Date" Width="60px"   CssClass="Gridtextbox" runat="server" Text='<%#Eval("Good_Through_Date") %>'/><ajax:CalendarExtender ID="txt_Tax_Good_Through_Date_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Tax_Good_Through_Date"></ajax:CalendarExtender></EditItemTemplate><FooterTemplate><asp:TextBox ID="txt_Tax_Entry_Good_Through_Date"  Width="60px"   CssClass="Gridtextbox" runat="server"/><ajax:FilteredTextBoxExtender ID="txt_Tax_Entry_Good_Through_Date_filter_Date" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_Tax_Entry_Good_Through_Date" ValidChars="_/"></ajax:FilteredTextBoxExtender><ajax:CalendarExtender ID="txt_Tax_Entry_Good_Through_Date_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Tax_Entry_Good_Through_Date"></ajax:CalendarExtender></FooterTemplate><ItemTemplate><asp:Label ID="lbl_Tax_Good_Through_Date" Width="60px" CssClass="Label" runat="server" Text='<%#Eval("Good_Through_Date") %>'/></ItemTemplate>
                                                           <HeaderStyle ForeColor="White" HorizontalAlign="Center" /></asp:TemplateField>

                                                       <asp:TemplateField><EditItemTemplate><asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/images/Gridview/Save.png" ToolTip="Update" Height="20px" Width="20px" /><asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/images/Gridview/Cancel.png" ToolTip="Cancel" Height="20px" Width="20px" /></EditItemTemplate><FooterTemplate><asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/images/Gridview/Add.png" OnClientClick="javascript:return confirm('Are you sure to proceed?');" CommandName="AddNew" Width="20px" Height="20px" ToolTip="Add New" ValidationGroup="validaiton" /></FooterTemplate><ItemTemplate><asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="~/images/Gridview/edit.png"  ToolTip="Edit" Height="20px" Width="20px" /><asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server" ImageUrl="~/images/Gridview/Remove-icon.png"  OnClientClick="javascript:return confirm('Are you sure to proceed?');" ToolTip="Delete" Height="20px" Width="20px" /></ItemTemplate></asp:TemplateField>
                                                       </Columns>
    <FooterStyle ForeColor="#330099" BackColor="#FFFFCC" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="#FFFFCC" />
    
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
    <SortedAscendingCellStyle BackColor="#FEFCEB" />
    <SortedAscendingHeaderStyle BackColor="#AF0101" />
    <SortedDescendingCellStyle BackColor="#F6F0C0" />
    <SortedDescendingHeaderStyle BackColor="#7E0000" /></asp:GridView>
                                                       
                                                       </ContentTemplate>
                                                       </asp:UpdatePanel>
                                                       </div></ContentTemplate></ajax:TabPanel>
<ajax:TabPanel ID="TabPanel4" runat="server" ><HeaderTemplate>Assesed Values</HeaderTemplate><ContentTemplate><table style=" width:100%;"><tr><td><table><tr><td 
                                                      style=" border: thin dotted #008080; width:100%;"><asp:UpdatePanel 
                                                      ID="Upcost" runat="server"><ContentTemplate><table style=" width:100%;"><tr><td><asp:Label 
                                                              ID="lbl_Tax_Year" runat="server" CssClass="Label" Text="Tax Year"></asp:Label></td><td 
                                                              style="width:70px;"><asp:DropDownList ID="ddl_Assesed_Tax_Year" runat="server" 
                                                                  CssClass="DropDown" TabIndex="1" Width="100px"></asp:DropDownList></td><td 
                                                              style="width:70px;"><asp:Label ID="Label3" runat="server" CssClass="Label" 
                                                                  Text="Land"></asp:Label></td><td style=" width:75px;"><asp:TextBox 
                                                                  ID="txt_Land" runat="server" AutoPostBack="True" CssClass="textbox" 
                                                                  ontextchanged="txt_Land_TextChanged" style="text-transform:uppercase;" 
                                                                  TabIndex="2" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_Land_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_Land" ValidChars="."></cc1:FilteredTextBoxExtender></td><td 
                                                              style="width:75px;"><asp:Label ID="Label4" runat="server" CssClass="Label" 
                                                                  Text="Building"></asp:Label></td><td style="width:150px;"><asp:TextBox 
                                                                  ID="txt_Building" runat="server" AutoPostBack="True" CssClass="textbox" 
                                                                  ontextchanged="txt_Building_TextChanged" style="text-transform:uppercase;" 
                                                                  TabIndex="3" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_Building_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_Building" ValidChars="."></cc1:FilteredTextBoxExtender></td><td><asp:Label 
                                                                  ID="Label52" runat="server" CssClass="Label" Text="Excemption"></asp:Label></td><td><asp:TextBox 
                                                                  ID="txt_Excemption" runat="server" CssClass="textbox" 
                                                                  style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_Excemption_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_Excemption" ValidChars="."></cc1:FilteredTextBoxExtender></td><td><asp:Label 
                                                                  ID="Label25" runat="server" CssClass="Label" Text="Total"></asp:Label></td><td><asp:TextBox 
                                                                  ID="txt_total" runat="server" CssClass="textbox" Enabled="False" 
                                                                  style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_total_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_total" ValidChars="."></cc1:FilteredTextBoxExtender></td></tr></table></ContentTemplate></asp:UpdatePanel></td><td 
                                                      align="right" style="border: thin dotted #008080"><asp:ImageButton 
                                                          ID="imgbtn_Assesd_Add" runat="server" AlternateText="Add" 
                                                          ImageUrl="~/images/Gridview/Add.png" onclick="imgbtn_Assesd_Add_Click" 
                                                          TabIndex="5" Width="16px" /></td></tr></table></td></tr><tr><td><div 
                                                          ID="div1" runat="server" style="overflow:scroll; height:300px; width:1250px;"><asp:GridView 
                                                          ID="grd_Assesed" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                                                          CellPadding="4" CssClass="name" DataKeyNames="Tax_Assessed_Id" 
                                                          Font-Size="Medium" ForeColor="#333333" GridLines="None" 
                                                          onrowdeleting="grd_Assesed_RowDeleting" 
                                                          onselectedindexchanged="grd_Assesed_SelectedIndexChanged" 
                                                          ShowHeaderWhenEmpty="True" Width="100%"><AlternatingRowStyle 
                                                              BackColor="White" /><Columns><asp:TemplateField HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                                  ID="lblTax_Assessed_Id" runat="server" CssClass="Label" 
                                                                  Text='<%#Eval("Tax_Assessed_Id") %>' Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="SI NO" 
                                                                  SortExpression="Order_Number"><ItemTemplate><asp:Label ID="lblsi_Assesid" 
                                                                      runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center"></HeaderStyle><ItemStyle CssClass="Label" 
                                                                  HorizontalAlign="Center" Width="30px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="Tax Year" SortExpression="Tax_Year"><ItemTemplate><asp:Label 
                                                                      ID="lblTax_Year" runat="server" CssClass="Label" Text='<%#Eval("Tax_Year") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Land" 
                                                                  SortExpression="Land_Cost"><ItemTemplate><asp:Label ID="lblLand_Cost" 
                                                                      runat="server" CssClass="Label" Text='<%#Eval("Land_Cost") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="Building" SortExpression="Building_Cost"><ItemTemplate><asp:Label 
                                                                      ID="lblBuilding_Cost" runat="server" CssClass="Label" 
                                                                      Text='<%#Eval("Building_Cost") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="Excemption" SortExpression="Excemption"><ItemTemplate><asp:Label 
                                                                      ID="lblExcemption_Cost" runat="server" CssClass="Label" 
                                                                      Text='<%#Eval("Excemption") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Total" 
                                                                  SortExpression="Total"><ItemTemplate><asp:Label ID="lblTotal" runat="server" 
                                                                      CssClass="Label" Text='<%#Eval("Total") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px" /></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                      ID="imgbtnExamEdit" runat="server" CommandName="Select" Height="20px" 
                                                                      ImageUrl="~/images/Gridview/View.png" Width="20px" /></ItemTemplate><ItemStyle 
                                                                  HorizontalAlign="Center" Width="16px" /></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                      ID="imgbtnExamDelete" runat="server" CommandName="Delete" Height="20px" 
                                                                      ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                                      OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                                                      Width="20px" /></ItemTemplate><ItemStyle HorizontalAlign="Center" 
                                                                  VerticalAlign="Middle" Width="16px" /></asp:TemplateField></Columns><EditRowStyle 
                                                              BackColor="#B8CFCF" /><EmptyDataRowStyle Font-Names="Verdana" 
                                                              ForeColor="#FF5050" /><FooterStyle BackColor="#1C5E55" Font-Bold="True" 
                                                              ForeColor="White" /><HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
                                                              Font-Size="Large" ForeColor="White" /><PagerStyle BackColor="#666666" 
                                                              ForeColor="White" HorizontalAlign="Center" /><RowStyle 
                                                              BackColor="#E3EAEB" /><SelectedRowStyle BackColor="#CCDDDD" 
                                                              Font-Bold="True" ForeColor="#333333" /><sortedascendingcellstyle 
                                                              backcolor="#F8FAFA" /><sortedascendingheaderstyle backcolor="#246B61" /><sorteddescendingcellstyle 
                                                              backcolor="#D4DFE1" /><sorteddescendingheaderstyle backcolor="#15524A" /></asp:GridView></div></td></tr></table></ContentTemplate></ajax:TabPanel>

<ajax:TabPanel ID="TabPanel7" runat="server" ><HeaderTemplate>Tax Sales Details</HeaderTemplate><ContentTemplate><div id="div7" runat="server" style="overflow:scroll; height:300px; width:100%;"><table style=" width:100%;"><tr><td><table><tr><td 
        style=" border: thin dotted #008080; width:1100px;"><asp:UpdatePanel 
        ID="UpdatePanel5" runat="server"><ContentTemplate></ContentTemplate></asp:UpdatePanel></td><td 
        align="right" style="border: thin dotted #008080"><asp:ImageButton 
            ID="ImageButton2" runat="server" AlternateText="Add" 
            ImageUrl="~/images/Gridview/AddRec.png" onclick="ImageButton2_Click" 
            TabIndex="5" Width="25px" /></td></tr></table></td></tr><tr><td><asp:GridView ID="grd_Tax_Sold" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                DataKeyNames="Tax_Sale_Id" Font-Size="Medium" ForeColor="#333333" 
                GridLines="None" 
              
                ShowHeaderWhenEmpty="True" Width="100%" 
            onrowdeleting="grd_Tax_Sold_RowDeleting" 
            onselectedindexchanged="grd_Tax_Sold_SelectedIndexChanged"><Columns><asp:TemplateField HeaderText="id" Visible="False"><ItemTemplate><asp:Label ID="lblTax_Sale_Id" runat="server" CssClass="Label" 
                                Text='<%#Eval("Tax_Sale_Id") %>' Visible="false"></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="SI NO" SortExpression="Order_Number"><ItemTemplate><asp:Label ID="lblSiTax_Sale_Id" runat="server" 
                                Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle CssClass="Label" HorizontalAlign="Center" Width="30px" /></asp:TemplateField><asp:TemplateField HeaderText="Tax Year" SortExpression="Tax_Year"><ItemTemplate>
                                <asp:LinkButton ID="lblTax_Sold" OnClick="lnkTaxSalebtn_CLick"  runat="server" CssClass="Label" 
                                Text='<%#Eval("Taxes_Sold") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Tax Sale Date" SortExpression="Land_Cost"><ItemTemplate><asp:Label ID="lblSold_Date" runat="server" CssClass="Label" 
                                Text='<%#Eval("Tax_Sold_Date") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Redemption Amount" SortExpression="Total"><ItemTemplate><asp:Label ID="lblSold_TaxAmt" runat="server" CssClass="Label" 
                                Text='<%#Eval("Sold_Tax_Amount") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Good Thru Date" SortExpression="Total"><ItemTemplate><asp:Label ID="lblRedemption_Good_Thru_Date" runat="server" CssClass="Label" 
                                Text='<%#Eval("Redemption_Good_Through_Date") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Last Date to Redemption" SortExpression="Total"><ItemTemplate><asp:Label ID="lblLast_Redemption_Loss_Date" runat="server" CssClass="Label" 
                                Text='<%#Eval("Last_Redemption") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Next Critical Date" SortExpression="Building_Cost"><ItemTemplate><asp:Label ID="lbl_Next_Critical_Date" runat="server" CssClass="Label" 
                                Text='<%#Eval("Next_Critical_Date") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Next Critical Action" SortExpression="Total"><ItemTemplate><asp:Label ID="lblNext_Critical_Action" runat="server" CssClass="Label" 
                                Text='<%#Eval("Next_Critical_Action") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Comments" SortExpression="Total"><ItemTemplate><asp:Label ID="lblTax_Sale_Comments" runat="server" CssClass="Label" 
                                Text='<%#Eval("Comments") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton ID="imgbtnTaxSoldDelete" runat="server" CommandName="Delete" 
                                Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" 
                              OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                Width="20px" /></ItemTemplate><ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="16px" /></asp:TemplateField></Columns><EditRowStyle BackColor="#B8CFCF" /><EmptyDataRowStyle Font-Names="Verdana" ForeColor="#FF5050" /><FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" /><HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="Large" 
                    ForeColor="White" /><PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" /><RowStyle BackColor="#E3EAEB" /><SelectedRowStyle BackColor="#CCDDDD" Font-Bold="True" ForeColor="#333333" /><SortedAscendingCellStyle BackColor="#F8FAFA" /><SortedAscendingHeaderStyle BackColor="#246B61" /><SortedDescendingCellStyle BackColor="#D4DFE1" /><SortedDescendingHeaderStyle BackColor="#15524A" /></asp:GridView></td></tr></table></div></ContentTemplate></ajax:TabPanel>

<ajax:TabPanel ID="TabPanel8" Visible="False" runat="server" ><HeaderTemplate>Munciple Details</HeaderTemplate><ContentTemplate><div id="div9" runat="server" style="overflow:scroll; height:200px; width:100%;"><table style=" width:100%;"><tr><td><table><tr><td 
                                                      style=" border: thin dotted #008080; width:1100px;"><asp:UpdatePanel 
                                                      ID="UpdatePanel6" runat="server"><ContentTemplate><table style=" width:100%;"><tr><td><asp:Label 
                                                              ID="Label19" runat="server" CssClass="Label" Text="Tax Type"></asp:Label></td><td 
                                                              style="width:70px;"><asp:DropDownList ID="ddl_Munciplene_Tax_Type" 
                                                                  runat="server" CssClass="DropDown" TabIndex="1" Width="100px"></asp:DropDownList></td><td 
                                                              style="width:70px;"><asp:Label ID="Label22" runat="server" CssClass="Label" 
                                                                  Text="Tax Year"></asp:Label></td><td style=" width:75px;"><asp:DropDownList 
                                                                  ID="ddl_Munciplene_Tax_Year" runat="server" CssClass="DropDown" TabIndex="1" 
                                                                  Width="100px"></asp:DropDownList></td><td style="width:75px;"><asp:Label 
                                                                  ID="Label23" runat="server" CssClass="Label" Text="Tax Status"></asp:Label></td><td 
                                                              style="width:150px;"><asp:DropDownList ID="ddl_Munciplene_Tax_Status" 
                                                                  runat="server" CssClass="DropDown" TabIndex="1" Width="100px"></asp:DropDownList></td><td><asp:Label 
                                                                  ID="Label24" runat="server" CssClass="Label" Text="Amount"></asp:Label></td><td><asp:TextBox 
                                                                  ID="txt_Munciplene_Amount" runat="server" CssClass="textbox" 
                                                                  style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_Munciplene_Amount_FilteredTextBoxExtender" runat="server" 
                                                                  Enabled="True" FilterType="Custom, Numbers" 
                                                                  TargetControlID="txt_Munciplene_Amount" ValidChars="."></cc1:FilteredTextBoxExtender></td></tr></table></ContentTemplate></asp:UpdatePanel></td><td 
                                                      align="right" style="border: thin dotted #008080"><asp:ImageButton 
                                                          ID="imgbtn_Munciple_Add" runat="server" AlternateText="Add" 
                                                          ImageUrl="~/images/Gridview/Add.png" onclick="imgbtn_Munciple_Add_Click" 
                                                          TabIndex="5" Width="20px" /></td></tr></table></td></tr><tr><td><asp:GridView 
                                                          ID="Grid_Munciplene_Tax" runat="server" AllowSorting="True" 
                                                          AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                                          DataKeyNames="Munciplene_Id" Font-Size="Medium" ForeColor="#333333" 
                                                          GridLines="None" onrowdeleting="Grid_Munciplene_Tax_RowDeleting" 
                                                          onselectedindexchanged="Grid_Munciplene_Tax_SelectedIndexChanged" 
                                                          ShowHeaderWhenEmpty="True" Width="100%"><AlternatingRowStyle 
                                                          BackColor="White" /><Columns><asp:TemplateField HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                              ID="lblMunciplene_Id" runat="server" CssClass="Label" 
                                                              Text='<%#Eval("Munciplene_Id") %>' Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="SI NO" 
                                                              SortExpression="Order_Number"><ItemTemplate><asp:Label ID="lblSiMunciplene_Id" 
                                                                  runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle CssClass="Label" 
                                                              HorizontalAlign="Center" Width="30px" /></asp:TemplateField><asp:TemplateField 
                                                              HeaderText="Tax Type" SortExpression="Tax_Type"><ItemTemplate><asp:Label 
                                                                  ID="lblTax_Type" runat="server" CssClass="Label" Text='<%#Eval("Tax_Type") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                              HeaderText="Tax Year" SortExpression="Tax_Type"><ItemTemplate><asp:Label 
                                                                  ID="lblTax_Year" runat="server" CssClass="Label" Text='<%#Eval("Tax_Year") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                              HeaderText="Tax Status" SortExpression="Tax_Status"><ItemTemplate><asp:Label 
                                                                  ID="lblTax_Status" runat="server" CssClass="Label" 
                                                                  Text='<%#Eval("Tax_Status") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                              HeaderText="Tax Amount" SortExpression="Tax_Amount"><ItemTemplate><asp:Label 
                                                                  ID="lbl_Tax_Amount" runat="server" CssClass="Label" 
                                                                  Text='<%#Eval("Tax_Amount") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                  ID="imgbtnExamEdit" runat="server" CommandName="Select" Height="20px" 
                                                                  ImageUrl="~/images/Gridview/View.png" Width="20px" /></ItemTemplate><ItemStyle 
                                                              HorizontalAlign="Center" Width="16px" /></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                  ID="imgbtnTaxSoldDelete" runat="server" CommandName="Delete" Height="20px" 
                                                                  ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                                  OnClientClick="javascript:return confirm('Are you sure to proceed?');"
                                                                  Width="20px" /></ItemTemplate><ItemStyle HorizontalAlign="Center" 
                                                              VerticalAlign="Middle" Width="16px" /></asp:TemplateField></Columns><EditRowStyle 
                                                          BackColor="#B8CFCF" /><EmptyDataRowStyle Font-Names="Verdana" 
                                                          ForeColor="#FF5050" /><FooterStyle BackColor="#1C5E55" Font-Bold="True" 
                                                          ForeColor="White" /><HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
                                                          Font-Size="Large" ForeColor="White" /><PagerStyle BackColor="#666666" 
                                                          ForeColor="White" HorizontalAlign="Center" /><RowStyle 
                                                          BackColor="#E3EAEB" /><SelectedRowStyle BackColor="#CCDDDD" 
                                                          Font-Bold="True" ForeColor="#333333" /><sortedascendingcellstyle 
                                                          backcolor="#F8FAFA" /><sortedascendingheaderstyle backcolor="#246B61" /><sorteddescendingcellstyle 
                                                          backcolor="#D4DFE1" /><sorteddescendingheaderstyle backcolor="#15524A" /></asp:GridView></td></tr></table></div></ContentTemplate></ajax:TabPanel>
 <ajax:TabPanel ID="TabPanel9" Visible="true" runat="server" ><HeaderTemplate>Bankrupty Details</HeaderTemplate><ContentTemplate><div id="div6" runat="server" style="overflow:scroll; height:200px; width:100%;"><table style=" width:100%;"><tr><td><table><tr><td 
                                                      style=" border: thin dotted #008080; width:100%;"><asp:UpdatePanel 
                                                      ID="UpdatePanel2" runat="server"><ContentTemplate><table style=" width:100%;"><tr><td><asp:Label 
                                                              ID="Label12" runat="server" CssClass="Label" Text="Bankrupty"></asp:Label></td><td 
                                                              style="width:70px;"><asp:DropDownList ID="ddl_Bankruptcy_Yes_No" runat="server" 
                                                                  AutoPostBack="True" CssClass="DropDown" 
                                                                  onselectedindexchanged="ddl_Bankruptcy_Yes_No_SelectedIndexChanged" 
                                                                  TabIndex="1" Width="100px"><asp:ListItem Value="YES">YES</asp:ListItem><asp:ListItem 
                                                                      Value="NO">NO</asp:ListItem></asp:DropDownList></td><td 
                                                              style="width:70px;"><asp:Label ID="Label14" runat="server" CssClass="Label" 
                                                                  Text="Chapter # "></asp:Label></td><td style=" width:75px;"><asp:TextBox 
                                                                  ID="txt_Bankruptcy_ChapterNo" runat="server" CssClass="textbox" TabIndex="9"></asp:TextBox></td><td 
                                                              style="width:75px;"><asp:Label ID="Label16" runat="server" CssClass="Label" 
                                                                  Text="Case# "></asp:Label></td><td style="width:150px;"><asp:TextBox 
                                                                  ID="txt_Bankruptcy_Case_No" runat="server" CssClass="textbox" TabIndex="9"></asp:TextBox></td><td><asp:Label 
                                                                  ID="Label21" runat="server" CssClass="Label" Text="BK Date"></asp:Label></td><td><asp:TextBox 
                                                                  ID="txt_Bankruptcy_Date" runat="server" CssClass="textbox" 
                                                                  style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_Bankruptcy_Date_filter_Date" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_Bankruptcy_Date" 
                                                                  ValidChars="_/"></cc1:FilteredTextBoxExtender><cc1:CalendarExtender 
                                                                  ID="txt_Bankruptcy_Date_CalendarExtender" runat="server" Enabled="True" 
                                                                  Format="MM/dd/yyyy" TargetControlID="txt_Bankruptcy_Date"></cc1:CalendarExtender></td><td><asp:Label 
                                                                  ID="Label28" runat="server" CssClass="Label" Text="Comments"></asp:Label></td><td><asp:TextBox 
                                                                  ID="txt_Bankcrupt_Comments" runat="server" CssClass="textbox" TabIndex="9" 
                                                                  TextMode="MultiLine" Width="200px"></asp:TextBox><cc1:TextBoxWatermarkExtender 
                                                                  ID="TextBoxWatermarkExtender5" runat="server" Enabled="True" 
                                                                  TargetControlID="txt_Bankcrupt_Comments" WatermarkCssClass="watermarked" 
                                                                  WatermarkText="Type Comment Here" /></td></tr></table></ContentTemplate></asp:UpdatePanel></td><td 
                                                      align="right" style="border: thin dotted #008080"><asp:ImageButton 
                                                          ID="Imgbtn_Brancrupty" runat="server" AlternateText="Add" 
                                                          ImageUrl="~/images/Gridview/Add.png" onclick="Imgbtn_Brancrupty_Click" 
                                                          TabIndex="5" Width="20px" /></td></tr></table></td></tr><tr><td><asp:GridView 
                                                          ID="grid_Banckrupty" runat="server" AllowSorting="True" 
                                                          AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                                          DataKeyNames="Bankruptcy_Id" Font-Size="Medium" ForeColor="#333333" 
                                                          GridLines="None" onrowdeleting="grid_Banckrupty_RowDeleting" 
                                                          onselectedindexchanged="grid_Banckrupty_SelectedIndexChanged" 
                                                          ShowHeaderWhenEmpty="True" Width="100%"><AlternatingRowStyle 
                                                          BackColor="White" /><Columns><asp:TemplateField HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                              ID="lblBankruptcy_Id" runat="server" CssClass="Label" 
                                                              Text='<%#Eval("Bankruptcy_Id") %>' Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="SI NO" 
                                                              SortExpression="Order_Number"><ItemTemplate><asp:Label ID="lblSiMunciplene_Id" 
                                                                  runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle CssClass="Label" 
                                                              HorizontalAlign="Center" Width="30px" /></asp:TemplateField><asp:TemplateField 
                                                              HeaderText="Bankcrupty"><ItemTemplate><asp:Label ID="lblBankcrupty_Type" 
                                                                  runat="server" CssClass="Label" Text='<%#Eval("Bankcrupty") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              ForeColor="White" HorizontalAlign="Center" /><ItemStyle 
                                                              HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                              HeaderText="Chapter No" SortExpression="Tax_Type"><ItemTemplate><asp:Label 
                                                                  ID="lblChapter_No" runat="server" CssClass="Label" 
                                                                  Text='<%#Eval("Chapter_No") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField HeaderText="Case_No"><ItemTemplate><asp:Label 
                                                                  ID="lbl_Case_No" runat="server" CssClass="Label" Text='<%#Eval("Case_No") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              ForeColor="White" HorizontalAlign="Center" /><ItemStyle 
                                                              HorizontalAlign="Center" Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                              HeaderText="Bk Date" SortExpression="Bk_Date"><ItemTemplate><asp:Label 
                                                                  ID="lbl_Bk_Date" runat="server" CssClass="Label" Text='<%#Eval("Bk_Date") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField 
                                                              HeaderText="Comments" SortExpression="Comments"><ItemTemplate><asp:Label 
                                                                  ID="lbl_bankcruptComments" runat="server" CssClass="Label" 
                                                                  Text='<%#Eval("Comments") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center" 
                                                              Width="100px" /></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                  ID="imgbtnBankCruptEdit" runat="server" CommandName="Select" Height="20px" 
                                                                  ImageUrl="~/images/Gridview/View.png" Width="20px" /></ItemTemplate><ItemStyle 
                                                              HorizontalAlign="Center" Width="16px" /></asp:TemplateField><asp:TemplateField><ItemTemplate><asp:ImageButton 
                                                                  ID="imgbtnBankCruptDelete" runat="server" CommandName="Delete" Height="20px" 
                                                                  ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                                  OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                                                  Width="20px" /></ItemTemplate><ItemStyle HorizontalAlign="Center" 
                                                              VerticalAlign="Middle" Width="16px" /></asp:TemplateField></Columns><EditRowStyle 
                                                          BackColor="#B8CFCF" /><EmptyDataRowStyle Font-Names="Verdana" 
                                                          ForeColor="#FF5050" /><FooterStyle BackColor="#1C5E55" Font-Bold="True" 
                                                          ForeColor="White" /><HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
                                                          Font-Size="Large" ForeColor="White" /><PagerStyle BackColor="#666666" 
                                                          ForeColor="White" HorizontalAlign="Center" /><RowStyle 
                                                          BackColor="#E3EAEB" /><SelectedRowStyle BackColor="#CCDDDD" 
                                                          Font-Bold="True" ForeColor="#333333" /><sortedascendingcellstyle 
                                                          backcolor="#F8FAFA" /><sortedascendingheaderstyle backcolor="#246B61" /><sorteddescendingcellstyle 
                                                          backcolor="#D4DFE1" /><sorteddescendingheaderstyle backcolor="#15524A" /></asp:GridView></td></tr></table></div></ContentTemplate></ajax:TabPanel>

<ajax:TabPanel ID="TabPanel10" runat="server" ><HeaderTemplate>Source Upload</HeaderTemplate>
<ContentTemplate>
<div style="width:1250px; height:300px; overflow:auto;">
<table style=" width:100%; "><tr><td><table><tr><td><table 
                                                      style=" width:100%;"><tr><td style="width:100px;"><asp:Label ID="Label31" 
                                                          runat="server" CssClass="Label" Text="Tax Type"></asp:Label></td><td 
                                                          style=" width:150px;"><asp:DropDownList ID="ddl_Source_upload_Taxtype" 
                                                              runat="server" CssClass="DropDown" TabIndex="1" Width="175px"></asp:DropDownList></td><td><asp:Label 
                                                              ID="Label32" runat="server" CssClass="Label" Text="Source Details"></asp:Label></td><td><asp:TextBox 
                                                              ID="txt_Source_upload_Details" runat="server" CssClass="textbox" 
                                                              style="text-transform:uppercase;" Width="500px"></asp:TextBox><cc1:TextBoxWatermarkExtender 
                                                              ID="TextBoxWatermarkExtender6" runat="server" Enabled="True" 
                                                              TargetControlID="txt_Source_upload_Details" WatermarkCssClass="watermarked" 
                                                              WatermarkText="Type Details Here"></cc1:TextBoxWatermarkExtender></td><td><asp:Label 
                                                              ID="Label33" runat="server" CssClass="Label" Text="Upload Document"></asp:Label></td><td><asp:UpdatePanel 
                                                              ID="UpdatePanel7" runat="server"><ContentTemplate><asp:FileUpload 
                                                                  ID="fileupload2" runat="server" CssClass="textbox" TabIndex="11" /></ContentTemplate><triggers><asp:PostBackTrigger 
                                                              ControlID="ImageButton1"></asp:PostBackTrigger></triggers></asp:UpdatePanel></td></tr></table></td><td 
                                                      align="right" style="border: thin dotted #008080"><asp:ImageButton 
                                                          ID="ImageButton1" runat="server" AlternateText="Add" 
                                                          ImageUrl="~/images/Gridview/Add.png" 
                                                          OnClick="img_btn_order_source_tax_upload_add_Click" Width="16px"></asp:ImageButton></td></tr></table></td></tr><tr><td><div 
                                                          style="width:95%; height:200px; overflow:scroll;"><asp:GridView 
                                                          ID="Tax_Type_Source_upload" runat="server" AllowSorting="True" 
                                                          AutoGenerateColumns="False" CellPadding="4" CssClass="name" 
                                                          DataKeyNames="Tax_Type_Source_upload_id" Font-Size="Medium" ForeColor="#333333" 
                                                          GridLines="None" OnRowDataBound="Tax_Type_Source_upload_RowDataBound" 
                                                          OnRowDeleting="Tax_Type_Source_upload_RowDeleting" 
                                                          OnSelectedIndexChanged="Tax_Type_Source_upload_SelectedIndexChanged" 
                                                          ShowHeaderWhenEmpty="True" Width="100%"><AlternatingRowStyle BackColor="White"></AlternatingRowStyle><Columns><asp:TemplateField 
                                                                  HeaderText="id" Visible="False"><ItemTemplate><asp:Label 
                                                                      ID="lblTax_Type_Source_upload_Id" runat="server" CssClass="Label" 
                                                                      Text='<%#Eval("Tax_Type_Source_upload_id") %>' Visible="false"></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="SI NO" SortExpression="Order_Number"><ItemTemplate><asp:Label 
                                                                      ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center"></HeaderStyle><ItemStyle CssClass="Label" 
                                                                  HorizontalAlign="Center" Width="30px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="Source Details" SortExpression="Source_Details"><ItemTemplate><asp:Label 
                                                                      ID="lblSource_Details" runat="server" CssClass="Label" 
                                                                      Text='<%#Eval("Source_Details") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="Tax Type" SortExpression="Tax_Type"><ItemTemplate><asp:Label 
                                                                      ID="lblDocument_Name" runat="server" CssClass="Label" 
                                                                      Text='<%#Eval("Tax_Type") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px"></ItemStyle></asp:TemplateField>
                                                                  <asp:TemplateField Visible="False"
                                                                  HeaderText="Tax Type path" 
                    SortExpression="Tax_Type_Source_upload_Path"><ItemTemplate><asp:Label 
                                                                      ID="lblDocument_Path" runat="server" CssClass="Label" 
                                                                      Text='<%#Eval("Tax_Type_Source_upload_Path") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="Updated By" SortExpression="Loan_Number"><ItemTemplate><asp:Label 
                                                                      ID="lblUser_Name" runat="server" CssClass="Label" 
                                                                      Text='<%#Eval("User_Name") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField 
                                                                  HeaderText="Updated When" SortExpression="Date"><ItemTemplate><asp:Label 
                                                                      ID="lblModified_Date" runat="server" CssClass="Label" 
                                                                      Text='<%#Eval("Date_of_Upload") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                                  HorizontalAlign="Center"></HeaderStyle><ItemStyle HorizontalAlign="Center" 
                                                                  Width="100px"></ItemStyle></asp:TemplateField><asp:TemplateField   HeaderText="Delete"><ItemTemplate><asp:ImageButton 
                                                                      ID="imgbtnExamDelete" runat="server" CommandName="Delete" Height="20px" 
                                                                      ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                                      OnClientClick="javascript:return confirm('Are you sure to proceed?');" /></ItemTemplate>
                    <HeaderStyle ForeColor="White" />
                    <ItemStyle 
                                                                  HorizontalAlign="Center" VerticalAlign="Middle" Width="16px"></ItemStyle></asp:TemplateField>
                                                                   <asp:TemplateField HeaderText="Download">
                                                                   <HeaderStyle 
                                                                  HorizontalAlign="Center" ForeColor="White"></HeaderStyle>
    <ItemTemplate >

    <asp:CheckBox ID="chkSelect"  Height="20px"  Width="10%" runat="server" />
    </ItemTemplate>
    <ItemStyle 
       HorizontalAlign="Center" VerticalAlign="Middle" Width="16px"></ItemStyle>
    </asp:TemplateField>
                                                                  </Columns><EditRowStyle 
                                                              BackColor="#CCDDDD"></EditRowStyle><EmptyDataRowStyle Font-Names="Verdana" 
                                                              ForeColor="#FF5050"></EmptyDataRowStyle><FooterStyle BackColor="#1C5E55" 
                                                              Font-Bold="True" ForeColor="White"></FooterStyle><HeaderStyle 
                                                              BackColor="#1C5E55" Font-Bold="True" Font-Size="Large" ForeColor="White"></HeaderStyle><PagerStyle 
                                                              BackColor="#666666" ForeColor="White" HorizontalAlign="Center"></PagerStyle><RowStyle 
                                                              BackColor="#E3EAEB"></RowStyle><SelectedRowStyle BackColor="#C5D8D8" 
                                                              Font-Bold="True" ForeColor="#333333"></SelectedRowStyle><sortedascendingcellstyle 
                                                              backcolor="#F8FAFA"></sortedascendingcellstyle><sortedascendingheaderstyle 
                                                              backcolor="#246B61"></sortedascendingheaderstyle><sorteddescendingcellstyle 
                                                              backcolor="#D4DFE1"></sorteddescendingcellstyle><sorteddescendingheaderstyle 
                                                              backcolor="#15524A"></sorteddescendingheaderstyle></asp:GridView>
                                                              <table>
                                                              <tr>
                                                              <td align="right">
                                                              
                                                              <asp:ImageButton ID="btnDownload" ImageUrl="~/Admin/MsgImage/Download.png" Height="50px" Width="50px" Text="Download Selected Files" runat="server" onclick="btnDownload_Click" />
                                                              </td>
                                                              </tr>
                                                              </table>
                                                              </div></td></tr>
                                                              <tr>
                                                              <td>
                                                               
                                                              
                                                              </td>
                                                              </tr>
                                                              </table></div></ContentTemplate></ajax:TabPanel>


                                                          </ajax:TabContainer>
                                            </td>
                                    </tr>
                          
                          
                                   
                          
                                </table>










                                 <div id="divcomments" runat="server" style=" overflow:scroll;  height:100px;">

                                                           <table style="width:95%" >
                                                               <tr>
                                                                   <td >
                                                                       <asp:TextBox ID="txt_Order_Comments" runat="server" CssClass="textbox" 
                                                                          TabIndex="16" AutoPostBack="True" 
                                                                           ontextchanged="txt_Order_Comments_TextChanged" Width="500px"></asp:TextBox>
                                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server"
                                                                   TargetControlID="txt_Order_Comments"
                                                                   WatermarkText="Type Comment Here"
                                                                   
                    WatermarkCssClass="watermarked" Enabled="True" />

                                                                   </td>
                                                               </tr>
                                                               <tr>
                                                                   <td>
                                                                          <asp:GridView ID="Grid_Comments" runat="server" AutoGenerateColumns="False" 
                style="width:100%;"  PageSize="5" 
                DataKeyNames="Comment_Id" GridLines="None" ShowHeader="False" CellSpacing="4" 
                                                                BackColor="White">
                <Columns>
                   
                          <asp:TemplateField Visible="false" ><ItemTemplate><asp:Label 
                                                                  ID="lblComment_Id" runat="server" Visible="false" CssClass="Label" 
                                                                  Text='<%#Eval("Comment_Id") %>'></asp:Label></ItemTemplate><HeaderStyle 
                                                              HorizontalAlign="Center" /><ItemStyle HorizontalAlign="Center"  /></asp:TemplateField>
                                <asp:TemplateField>
                                  <ItemTemplate>
                                 
                                 <table>
                                 <tr>
                                 <td style="width:500px;" align="left" valign="top">  <asp:Label  ID="lblComment" runat="server" CssClass="Label"  Text='<%#Eval("Comment") %>'></asp:Label></td>
                                    <td align="right">by:<asp:Label ID="lbl_Coomentuser" runat="server" ForeColor="Red" Text='<%# Eval("User_Name") %>' > </asp:Label></td>
                                 </tr>
                               
                                 </table>
                          </ItemTemplate>
                                 </asp:TemplateField>     

                                
              
        
         
                </Columns>
            </asp:GridView>
                                                                      </td>
                                                               </tr>
                                                           </table>

                                                       </div>
                                                        <div id="div4" runat="server" style=" overflow:scroll;   height:100px;">

                                                           <table style="width:95%;">
                                                               <tr>
                                                                   <td>
                                                                       <asp:TextBox ID="txt_Order_Notes" runat="server" Width="500px" CssClass="textbox" 
                                                                            TabIndex="17" AutoPostBack="True" 
                                                                           ontextchanged="txt_Order_Notes_TextChanged"></asp:TextBox>
                                                                            <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server"
                                                                   TargetControlID="txt_Order_Notes"
                                                                   WatermarkText="Type Notes Here"
                    WatermarkCssClass="watermarked" Enabled="True" />      
                                                                   </td>
                                                               </tr>
                                                               <tr>
                                                                   <td>
                                                                          0</td>
                                                               </tr>
                                                           </table>

                                                       </div>
                                   <a href="#" class="back-to-top"><div class="imgbacktotop"></div></a>
                   <%-- </ContentTemplate>
    
    
    </asp:UpdatePanel>--%>
               </div>
                  
               </td>
        </tr>
    </table>
   
  
   

                  
              <asp:LinkButton ID="LinkBtn_Tax_Sales" runat="server"></asp:LinkButton>
              <cc1:ModalPopupExtender ID="ModalPopupExtend_Tax_Sales" BackgroundCssClass="ModalPopupBG"
            runat="server" CancelControlID="btn_Tax_Sale_cancel"  TargetControlID="LinkBtn_Tax_Sales"
            PopupControlID="DivTax_Sales" Drag="true">
        </cc1:ModalPopupExtender>
     
             <div id="DivTax_Sales" align="center"  class="popupConfirmation">
           
           <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
            
                      
              <ContentTemplate>
            
               
           
                <div class="DivContentBody" style="width:90%;">
                   
                    <table align="center" style="width:100%;">
                           <tr class="tableHeader">
                                                       <td>
                                                         
                                                         
                                                           <asp:Label ID="Label_Tax_Sale" CssClass="Lblheader" Text="Tax Sales Information" runat="server" ></asp:Label>
                                                         
                                                         
                                                           </td>
                                                       <td align="right">
                                                           <asp:Button ID="btn_Tax_Sale_cancel" runat="server" 
                                                               CssClass="WebHRButton red" Text="X" onclick="btn_Tax_Sale_cancel_Click" 
                                                           />
                                                       </td>
                                                   </tr>
                        <tr>
                            <td colspan="2">
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                   <div id="div8"   runat="server">
                             
                                 <table align="center" style="width:100%;">
                                     <tr>
                                         <td style="width:200px;" align="left">
                                             <asp:Label ID="Label7" runat="server" CssClass="Label" Text="Taxes Sold"></asp:Label>
                                         </td>
                                         <td align="left">
                                             <asp:DropDownList ID="ddl_Tax_Sold" runat="server" CssClass="DropDown" 
                                                 TabIndex="1" Width="175px">
                                               
                                             </asp:DropDownList>
                                         </td>
                                         <td align="left">
                                             <asp:Label ID="Label47" runat="server" CssClass="Label" 
                                                 Text="Last Date to Redemption "></asp:Label>
                                         </td>
                                         <td align="left">
                                            
                                               <asp:TextBox ID="txt_Last_Redemption_Date" runat="server" CssClass="textbox" 
                                                        style="text-transform:uppercase;" TabIndex="9" Width="150px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="txt_Last_Redemption_Date_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                        TargetControlID="txt_Last_Redemption_Date" ValidChars="_/">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <cc1:CalendarExtender ID="txt_Last_Redemption_Date_CalendarExtender" 
                                                        runat="server" Enabled="True" Format="MM/dd/yyyy" 
                                                        TargetControlID="txt_Last_Redemption_Date">
                                                    </cc1:CalendarExtender>       
                                     
                                                    
                                         </td>
                                     </tr>
                                      <tr>
                                         <td align="left">
                                             <asp:Label ID="Label13" runat="server" CssClass="Label" Text="Tax Sale Date"></asp:Label>
                                         </td>
                                         <td align="left">
                                             <asp:TextBox ID="txt_Sold_Date" runat="server" CssClass="textbox" 
                                                      style="text-transform:uppercase;" TabIndex="9" Width="150px"></asp:TextBox>
                                                  <cc1:FilteredTextBoxExtender ID="txt_Sold_Date_FilteredTextBoxExtender" 
                                                      runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                      TargetControlID="txt_Sold_Date" ValidChars="_/">
                                                  </cc1:FilteredTextBoxExtender>
                                                  <cc1:CalendarExtender ID="txt_Sold_Date_CalendarExtender" runat="server" 
                                                      Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Sold_Date">
                                                  </cc1:CalendarExtender>
                                          </td>
                                          <td align="left">
                                              <asp:Label ID="Label5" runat="server" CssClass="Label" 
                                                  Text="Next Critical Action"></asp:Label>
                                          </td>
                                          <td align="left">
                                              
                                              <asp:TextBox ID="txt_Next_Critical_Action" runat="server" CssClass="textbox" 
                                                  style="text-transform:uppercase;" TabIndex="6" Width="300px"></asp:TextBox>    
                                                  
                                          </td>
                                     </tr>
                                      <tr>
                                         <td align="left">
                                             <asp:Label ID="Label15" runat="server" CssClass="Label" 
                                                 Text="Redemption Amount"></asp:Label>
                                         </td>
                                         <td align="left"> <asp:TextBox ID="txt_sold_Tax_AMount" runat="server" CssClass="textbox" 
                                                  style="text-transform:uppercase;" TabIndex="7" Width="150px"></asp:TextBox>
                                                    <ajax:FilteredTextBoxExtender ID="txt_sold_Tax_AMount_FilteredTextBoxExtender" 
                                                       runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                       TargetControlID="txt_sold_Tax_AMount" ValidChars="."></ajax:FilteredTextBoxExtender>
                                     
                                          </td>
                                          <td align="left">
                                              <asp:Label ID="Label6" runat="server" CssClass="Label" 
                                                  Text="Next Critical Date"></asp:Label>
                                          </td>
                                          <td align="left">
                                             
                                              <asp:TextBox ID="txt_Next_Critical_date" runat="server" CssClass="textbox" 
                                                      style="text-transform:uppercase;" TabIndex="9" Width="150px"></asp:TextBox>
                                                  <cc1:FilteredTextBoxExtender ID="txt_Next_Critical_date_FilteredTextBoxExtender" 
                                                      runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                      TargetControlID="txt_Next_Critical_date" ValidChars="_/">
                                                  </cc1:FilteredTextBoxExtender>
                                                  <cc1:CalendarExtender ID="txt_Next_Critical_date_CalendarExtender" runat="server" 
                                                      Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Next_Critical_date">
                                                  </cc1:CalendarExtender>
                                          </td>
                                          </tr>
                                          <tr>
                                              <td align="left">
                                                  <asp:Label ID="Label_Redemption_Good" runat="server" CssClass="Label" Text="Good Thru Date"></asp:Label>
                                              </td>
                                              <td align="left">
                                                         <asp:TextBox ID="txt_Redemption_Good_Through_Date" runat="server" 
                                                 CssClass="textbox" style="text-transform:uppercase;" TabIndex="8" Width="150px" 
                                                             AutoPostBack="True" 
                                                             ontextchanged="txt_Redemption_Good_Through_Date_TextChanged"></asp:TextBox>
                                             <cc1:FilteredTextBoxExtender ID="txt_Redemption_Good_Through_Date_FilteredTextBoxExtender" 
                                                 runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                 TargetControlID="txt_Redemption_Good_Through_Date" ValidChars="_/">
                                             </cc1:FilteredTextBoxExtender>
                                             <cc1:CalendarExtender ID="txt_Redemption_Good_Through_Date_CalendarExtender" 
                                                 runat="server" Enabled="True" Format="MM/dd/yyyy" 
                                                 TargetControlID="txt_Redemption_Good_Through_Date">
                                             </cc1:CalendarExtender></td>
                                              <td align="left">
                                                  <asp:Label ID="Label10" runat="server" CssClass="Label" Text="Comments"></asp:Label>
                                              </td>
                                              <td align="left">
                                                  
                                                  <asp:TextBox ID="txt_Tax_Sale_Comments" runat="server" CssClass="textbox" 
                                                      Height="35px" style="text-transform:uppercase;" TabIndex="6" 
                                                      TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                  
                                              </td>
                                          </tr>
                                          <tr>
                                              <td align="center" colspan="4">
                                                         <asp:Button ID="btn_Add_Tax_Sale" runat="server" CssClass="WebButton" 
                                    Text="Add Tax Sale" TabIndex="12" onclick="btn_Add_Tax_Sale_Click" />
                                                 </td>
                                     </tr>
                                          </table>
                                          </div>
                                          </td>
                                     </tr>
                                  
                                 </table>
                             
                             </div>
                         
                        <tr>
                            <td colspan="2" align="center">
                                  
                            
                        
                                  
                            
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                    <input id="Button4" value="Cancel"  style="display:none;" class="button_submitall" type="button" />
                                
                            </td>
                        </tr>
                    
               
                </ContentTemplate>
                
                </asp:UpdatePanel>
              
                <div class="popup_Buttons" align="center">
                    <input id="Button5" style="display:none;" value="Done"  type="button" />
                </div>
                  </div>
           

                  <div>
    <asp:UpdateProgress id="updateProgress" runat="server">
    <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #DBDBDB; opacity: 0.7;">
            <asp:Image ID="imgUpdateProgress" runat="server" 
               ImageUrl="~/img/Loading.gif"   AlternateText="Loading ..." 
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



