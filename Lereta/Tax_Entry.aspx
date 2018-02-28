<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Tax_Entry.aspx.cs" Inherits="Gls_Tax_Entry" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../AdminStyle/Calcender.css" rel="stylesheet" type="text/css" />
    <script src="../AdminJs/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
    <link href="../AdminStyle/JqueryCalender.css" rel="stylesheet" type="text/css" />
    <script src="../AdminJs/jquery-1.3.2.min.js" type="text/javascript"></script>
    <SCRIPT type="text/javascript">
        $(function () {
            $("#ddl_ProductionDt").datepicker();
        });
	
	</SCRIPT>
<script language="javascript" type="text/javascript">
        function show()
        {
              document.write("<head id="Head1" runat='server'></head>");
        }
</script>
<script type="text/javascript">
    window.scrollTo = function (x, y) {
        return true;
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

    <script language="javascript" type="text/javascript">
        function ShowEditModal(ExpanseID) {
            var frame = $get('IframeEdit');
            frame.src = "EditExpanse.aspx?UIMODE=EDIT&EID=" + ExpanseID;
            $find('EditModalPopup').show();
        }
        function EditCancelScript() {
            var frame = $get('IframeEdit');
            frame.src = "DemoLoading.aspx";
        }
        function EditOkayScript() {
            RefreshDataGrid();
            EditCancelScript();
        }
        function RefreshDataGrid() {
            $get('btnSearch').click();
        }
        function NewExpanseOkay() {
            $get('btnSearch').click();
        }
</script>

    <%--<asp:LinkButton ID="lbl_Deliquent_Tax_Type" runat="server" CommandName="Select" Text='<%#Eval("Tax_Type") %>'></asp:LinkButton>--%>

<div id="Divcreate" runat="server"  align="center" class="DivContentBody" style="height:100%; width:100%;">
<table style="width:100%">
      
      
         <tr  >
            <td>
               
                             
                 <table align="center" style=" width:98%; " >
                   <tr >
                 
                                        <td align="left" style="height:20px"
                                            valign="top">
                                            <asp:Button ID="tbpnluser" runat="server" Text="Web Info"  
                                                CssClass="TabButton" onclick="tbpnluser_Click"  />
                                    <asp:Button ID="tabitcomplent" runat="server" Text="IT Complaints" 
                                                CssClass="TabButton" onclick="tabitcomplent_Click" />

                                    <asp:Button ID="tbpnlusrdetails" runat="server" Text="Order KB" CssClass="TabButton" 
                                                onclick="tbpnlusrdetails_Click" />

                                      <asp:Button ID="tbpnljobdetails" runat="server" Text="Agency KB" 
                                                CssClass="TabButton" onclick="tbpnljobdetails_Click" />

                                    <asp:Button ID="taboutputpreview" runat="server" Text="Out Put Preview" 
                                                CssClass="TabButton" onclick="taboutputpreview_Click" />
                                   
                                    <asp:Button ID="tabcountycmt" runat="server" Text="County Comments" 
                                                CssClass="TabButton" onclick="tabcountycmt_Click" />

                                    <asp:Button ID="tabcounty" runat="server" Text="County DataBase" 
                                                CssClass="TabButton" onclick="tabcounty_Click" />

                                      </td>
                                      
                            </tr>       
                                    



<tr id="td_row" style="height:100px"  runat="server">
<td  style="border: thin solid #008080;"  >

<table style="width:98%;height:100px;" id="Web_info" runat="server" visible="true" ></table>
<table id="IT_comp" runat="server" 
        style="width:98%; " valign="top" visible="false" 
        align="center">

        <tr >
<td colspan="4" valign="top">

<div class="div_toprow" >
IT Complaint Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddITInfo" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddITInfo_Click" />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="4"  valign="top">
<div style="background-color:#fff;margin-top:-6px;">

   <asp:GridView ID="Grid_Order_IT_Error" runat="server" 
       AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True"   CssClass="name" CellPadding="4" Height="30px" PageSize="4" Width="100%"
        ShowHeaderWhenEmpty="True" Font-Bold="False" Font-Names="Segoe UI" 
        Font-Size="16px" onrowcommand="Grid_Order_IT_Error_RowCommand" >
                                      
                            <Columns>
                            
                            <asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
  <ItemTemplate>
    <asp:Label ID="lblITOrder_Kb_Id" runat="server" CssClass="Label" Text='<%#Eval("IT_Error_Id") %>' Visible="false"></asp:Label>
    </ItemTemplate>
     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid-item"   Height="20px" Width="30px" /> 
</asp:TemplateField>

<asp:TemplateField  HeaderText="S.No" SortExpression="Order_Number"  HeaderStyle-CssClass="head-label"><ItemTemplate>
<asp:Label     ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate>
  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="head_style"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"    CssClass="grid-item" Height="20px" Width="30px" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="Complaint Name" SortExpression="Document_Name" HeaderStyle-Font-Bold="true"  
                                    HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblErrorDocument_Name" runat="server"  Text='<%#Eval("Error_Name") %>'></asp:Label>
</ItemTemplate>
  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
  <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"  Height="20px" Width="30px"  CssClass="grid-item" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="File" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtndoc" ImageUrl="~/Admin/MsgImage/Download.png" runat="server"   CommandName="ViewDocument" Height="30px"   Width="30px" />

<asp:Label    ID="lbl_ITorderkb_doc_path" runat="server" CssClass="Label" Text='<%#Eval("Error_Path") %>' Visible="false"></asp:Label>
</ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"  Height="20px" Width="30px"  CssClass="grid-item" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="Username" SortExpression="Comments" HeaderStyle-Font-Bold="true"  
                                    HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label    ID="lblitusername" runat="server"  Text='<%#Eval("User_Name") %>'></asp:Label>
</ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  CssClass="grid-item"  VerticalAlign="Middle"    Height="20px" Width="30px" /> 
</asp:TemplateField>
<asp:TemplateField  HeaderText="Date" SortExpression="Loan_Number" HeaderStyle-Font-Bold="true"  
                                    HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label     ID="lblUser_date" runat="server" Text='<%#Eval("Inserted_date") %>'></asp:Label>
</ItemTemplate>
 <HeaderStyle CssClass="head_style"  HorizontalAlign="Center" VerticalAlign="Middle"    Height="30px"  />
<ItemStyle CssClass="grid-item" VerticalAlign="Middle" HorizontalAlign="Center"    Height="20px" Width="30px"  />
</asp:TemplateField>
<asp:TemplateField HeaderText="Delete" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtnExamDelete" runat="server" CommandName="DeleteRecord" Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
Width="20px" />
</ItemTemplate>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"    Height="20px" Width="30px" CssClass="grid-item"  />
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
<tr id="tr_ITcomp" runat="server" visible="false" >
<td  style="width: 627px"  >
<asp:Label Width="100px" ID="Label30" runat="server" CssClass="Label" 
        Text="IT Complaints:"></asp:Label>
</td>
<td style="width: 300px"    >
                                                       
<asp:Label Width="100px" ID="Label53" runat="server" CssClass="Label" 
        Text="Upload File"></asp:Label>
</td>
<td rowspan="2" width="625px" valign="middle" align="left">
    <asp:Button ID="btn_Error_Submit" runat="server" CssClass="Windowbutton" 
                    OnClick="btn_Error_Submit_Click" 
                    OnClientClick="return alert('Are You Sure ?');return true;" Text="Submit" 
                    Width="75px" />&nbsp;
    <asp:Button ID="btn_Cancel_Complaint" runat="server" CssClass="Windowbutton" 
                    OnClick="btn_Cancel_Complaint_Click" 
                  Text="Cancel" 
                    Width="75px" />
</td>                 
                       
</tr>
<tr id="tr_ITcomp1" runat="server" visible="false" >
   <td valign="top" style="width: 627px" >
<asp:TextBox ID="txt_Error" runat="server" CssClass="textbox" 
           Height="25px" Width="588px" 
          ></asp:TextBox>
                
            </td>
            <td valign="middle" style="width: 300px"><asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:FileUpload ID="fileupload3" runat="server" CssClass="textbox" 
                            TabIndex="11" />
                            </ContentTemplate>
                            <Triggers>
                        <asp:PostBackTrigger ControlID="btn_Error_Submit" />
                    
                    </Triggers>
                    </asp:UpdatePanel>
                
            </td>

     
    </tr>
    
   
</table>

<table id="Order_Kb" runat="server" style="width:98%;height:80px;vertical-align: top;" visible="false" align="center">
<tr >
<td colspan="4" valign="top">

<div class="div_toprow" >
Order Kb Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddOrder" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddOrder_Click" />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="4"  valign="top">
<div style="background-color:#fff;margin-top:-6px;">

   <asp:GridView ID="grd_order_kb" runat="server" 
       AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True"   CssClass="name" CellPadding="4" Height="30px" PageSize="2" Width="100%" 
        onrowdatabound="grd_order_kb_RowDataBound"
        ShowHeaderWhenEmpty="True" Font-Bold="False" Font-Names="Segoe UI" 
        Font-Size="16px" onrowcommand="grd_order_kb_RowCommand" >
                                      
                            <Columns>
                            
                            <asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
  <ItemTemplate>
    <asp:Label ID="lblOrder_Kb_Id" runat="server" CssClass="Label" Text='<%#Eval("Order_Kb_Id") %>' Visible="false"></asp:Label>
    </ItemTemplate>
     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid-item"   Height="20px" Width="30px" /> 
</asp:TemplateField>

<asp:TemplateField  HeaderText="S.No" SortExpression="Order_Number"  HeaderStyle-CssClass="head-label"><ItemTemplate>
<asp:Label     ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label></ItemTemplate>
  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="head_style"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"    CssClass="grid-item" Height="20px" Width="30px" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="Documents" SortExpression="Document_Name" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblDocument_Name" runat="server"  Text='<%#Eval("Document_Name") %>'></asp:Label>
</ItemTemplate>
  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
  <ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"  Height="20px" Width="30px"  CssClass="grid-item" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="File" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtndoc" ImageUrl="~/Admin/MsgImage/Download.png" runat="server"   CommandName="ViewDocument" Height="30px"  Visible="false" Width="30px" />
<asp:Label       ID="lbl_Order_Kb_File_Type" runat="server" CssClass="Label"  Text='<%#Eval("Order_kb_File_Type") %>' Visible="false"></asp:Label>
<asp:Label    ID="lbl_orderkb_doc_path" runat="server" CssClass="Label" Text='<%#Eval("Order_Kb_Path") %>' Visible="false"></asp:Label>
</ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"  Height="20px" Width="30px"  CssClass="grid-item" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="Comments" SortExpression="Comments" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label    ID="lblComments" runat="server"  Text='<%#Eval("Comments") %>'></asp:Label>
</ItemTemplate>
 <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  CssClass="grid-item"  VerticalAlign="Middle"    Height="20px" Width="30px" /> 
</asp:TemplateField>
<asp:TemplateField  HeaderText="Updated By" SortExpression="Loan_Number" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label     ID="lblUser_Name" runat="server" Text='<%#Eval("User_Name") %>'></asp:Label>
</ItemTemplate>
 <HeaderStyle CssClass="head_style"  HorizontalAlign="Center" VerticalAlign="Middle"    Height="30px"  />
<ItemStyle CssClass="grid-item" VerticalAlign="Middle" HorizontalAlign="Center"    Height="20px" Width="30px"  />
</asp:TemplateField>
<asp:TemplateField HeaderText="Updated When" SortExpression="Date" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblModified_Date" runat="server" Text='<%#Eval("Modified_Date") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  CssClass="grid-item"  VerticalAlign="Middle"    Height="20px" Width="30px" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="View" HeaderStyle-CssClass="head-label" HeaderStyle-Font-Bold="true" >
<ItemTemplate>
<asp:ImageButton  ID="imgbtnEdit" runat="server" CommandName="EditRecord" Height="20px" ImageUrl="~/images/Gridview/View.png" Width="20px" /></ItemTemplate>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"   Height="30px" Font-Bold="True"  />
<ItemStyle  CssClass="grid-item"  VerticalAlign="Middle" HorizontalAlign="Center" Width="16px">
</ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="Delete" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtnExamDelete" runat="server" CommandName="DeleteRecord" Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
Width="20px" />
</ItemTemplate>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="head_style"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" HorizontalAlign="Center"    Height="20px" Width="30px" CssClass="grid-item"  />
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






<tr><td style="width: 160px"><br /></td></tr>
<tr id="tr_OrderKb" runat="server" visible="false" >
<td valign="top" style="width: 160px" ><asp:Label ID="Label8" runat="server" CssClass="Label" Text="Document"></asp:Label></td>
<td style="width: 243px" ><asp:Label ID="Label9" runat="server" CssClass="Label" Text="Comments"></asp:Label></td>
<td style="width: 328px"><asp:Label ID="Label27" runat="server" CssClass="Label" Text="Upload Document"></asp:Label></td>
<td rowspan="2" width="600px">
<asp:Button ID="img_btn_order_kb_add" runat="server" CssClass="Windowbutton" 
                    OnClick="img_btn_order_kb_add_Click" 
                    Text="Add" 
                    Width="75px" />

<asp:Button ID="img_btn_order_kb_Cancel" runat="server" CssClass="Windowbutton" 
                    OnClick="img_btn_order_kb_Cancel_Click" 
                    Text="Cancel" 
                    Width="75px" />

</td>
</tr>


<tr id="tr_OrderKb1" runat="server" visible="false">
<td valign="top" style="width: 160px">
<asp:TextBox ID="txt_order_Kb_Document" runat="server" CssClass="textbox" style="text-transform:uppercase;" Width="150px"></asp:TextBox>
</td>
<td valign="top" style="width: 243px">
    <asp:TextBox ID="txt_order_Kb_Comment" runat="server" CssClass="textbox" 
        placeholder="Type Comments here"  Width="647px" Height="25px"></asp:TextBox>
    </td>
<td valign="top" style="width: 328px"><asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:FileUpload ID="fileupload1" runat="server" CssClass="textbox" 
            TabIndex="11" />
    </ContentTemplate>
    <triggers>
<asp:PostBackTrigger ControlID="img_btn_order_kb_add"></asp:PostBackTrigger></triggers></asp:UpdatePanel>
</td>

</tr>



</table>

<table id="Agency_Kb" runat="server" style="width:98%;height:80px;vertical-align: top;" visible="false" align="center">

<tr>
<td colspan="4" valign="top">
<div class="div_toprow">
Agency Kb Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddAgency" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddAgency_Click" />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="4" valign="top">
<div style="background-color:#fff;margin-top:-6px;">
<asp:GridView ID="grd_Agency" runat="server" AutoGenerateColumns="False"   
          HorizontalAlign="Center" 
   AllowPaging="True"   CssClass="name" CellPadding="4" Height="30px" PageSize="2" Width="100%" 
        ShowHeaderWhenEmpty="True"  onrowcommand="grd_Agency_RowCommand" >
                                      
                        <Columns>

<asp:TemplateField HeaderText="id" Visible="False"  HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label"><ItemTemplate>
<asp:Label ID="lbl_Agency_Order_Kb_Id" runat="server"  Text='<%#Eval("Order_Agency_Kb_Id") %>' Visible="false"></asp:Label>
</ItemTemplate>

<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" CssClass="grid-item"  Height="20px" Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="S.No" SortExpression="Order_Number"  HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblagnsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  CssClass="grid-item"      VerticalAlign="Middle"    Height="20px" Width="30px" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="Comments" SortExpression="Comments" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Agency_Comments" runat="server"  Text='<%#Eval("Comments") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" CssClass="grid-item"   Height="20px" Width="30px" />
</asp:TemplateField>
<asp:TemplateField  HeaderText="Updated By" SortExpression="Loan_Number"  HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Agency_User_Name" runat="server"  Text='<%#Eval("User_Name") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" CssClass="grid-item"   Height="20px" Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Updated When" SortExpression="Date" HeaderStyle-Font-Bold="true"   HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Agency_Modified_Date" runat="server"  Text='<%#Eval("Modified_Date") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  VerticalAlign="Middle" CssClass="grid-item"   Height="20px" Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="View" HeaderStyle-CssClass="head-label" HeaderStyle-Font-Bold="true" >
<ItemTemplate>
<asp:ImageButton  ID="imgbtnExamEdit" runat="server" CommandName="EditRecord" Height="20px" ImageUrl="~/images/Gridview/View.png" Width="20px" />
</ItemTemplate>

<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  CssClass="grid-item"      VerticalAlign="Middle"    Height="20px" Width="16px" /> 

</asp:TemplateField>
<asp:TemplateField HeaderText="Delete"  HeaderStyle-CssClass="head-label" HeaderStyle-Font-Bold="true" >
<ItemTemplate>
<asp:ImageButton   ID="imgbtnExamDelete" runat="server" CommandName="DeleteRecord" 
Height="20px"  ImageUrl="~/images/Gridview/Remove-icon.png" OnClientClick="javascript:return confirm('Are you sure to proceed?');" Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  CssClass="grid-item"      VerticalAlign="Middle"    Height="20px" Width="16px" /> 
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
</td></tr>



<tr><td><br /></td></tr>

<tr id="tr_Agency" runat="server" visible="false">
<td width="100px" align="left"><asp:Label ID="Label2" runat="server" CssClass="Label"  Text="Comments:" /></td>
<td width="300px" align="left" ><asp:TextBox ID="txt_Agency_Comment" runat="server" CssClass="textbox" Width="500px"></asp:TextBox>
</td>
<td width="500px">
<asp:Button ID="imgbtn_agency_Add" runat="server" CssClass="Windowbutton" 
                    OnClick="imgbtn_agency_Add_Click" 
                    Text="Add" 
                    Width="75px" />

    <%--<asp:LinkButton ID="lbl_Deliquent_Tax_Type" runat="server" CommandName="Select" Text='<%#Eval("Tax_Type") %>'></asp:LinkButton>--%>
<asp:Button ID="imgbtn_agency_Cancel" runat="server" CssClass="Windowbutton" 
                    OnClick="imgbtn_agency_Cancel_Click" 
                    Text="Cancel" 
                    Width="75px" />

    </td>
</tr>

</table>



<table id="Out_Put_Preview" runat="server" style="width:100%;" visible="false">
<tr><td align="center">

    </td>
    </tr>
    </table>
    

<table id="County_Comm" runat="server" style="width:98%;height:80px;vertical-align: top;" visible="false" align="center">
<tr>
<td colspan="3" valign="top">
<div class="div_toprow" >
County Comment Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddCountyCmt" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddCountyCmt_Click" />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="3" valign="top">
<div style="background-color:#fff;margin-top:-6px;">
<asp:GridView ID="Grd_Tax_Type_Comments" runat="server" 
        AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True"  CellPadding="4"  CssClass="name" 
         BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px"
       Height="30px" PageSize="2" Width="100%" 
        ShowHeaderWhenEmpty="True" onrowdeleting="Grd_Tax_Type_Comments_RowDeleting" 
        onselectedindexchanged="Grd_Tax_Type_Comments_SelectedIndexChanged" 
        DataKeyNames="Note_Id" >
    <Columns>
<asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblTax_Id" runat="server" CssClass="Label" Text='<%#Eval("Tax_Id") %>' Visible="false"></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  CssClass="grid-item"      VerticalAlign="Middle"    Height="20px" Width="30px" /> 
</asp:TemplateField>
<asp:TemplateField HeaderText="id" Visible="False"  HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label  ID="lblNote_Id" runat="server"  Text='<%#Eval("Note_Id") %>'   Visible="false"></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  CssClass="grid-item"      VerticalAlign="Middle"    Height="20px" Width="30px" /> 
</asp:TemplateField>

<asp:TemplateField HeaderText="S.No" SortExpression="Order_Number" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblagnsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  VerticalAlign="Middle" Height="30px" Font-Bold="True"  />
<ItemStyle  HorizontalAlign="Center"  VerticalAlign="Middle" CssClass="grid-item" Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Tax Type" SortExpression="Loan_Number" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Tax_Type_User_Name" runat="server" Text='<%#Eval("Tax_Type") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  VerticalAlign="Middle"  Height="30px" Font-Bold="True"  />
<ItemStyle  HorizontalAlign="Center"  VerticalAlign="Middle" CssClass="grid-item" Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Comments" SortExpression="Note" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Taxtype_Comments" runat="server"  Text='<%#Eval("Note") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  VerticalAlign="Middle" Height="30px" Font-Bold="True"  />
<ItemStyle  HorizontalAlign="Center"  VerticalAlign="Middle" CssClass="grid-item" Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderStyle-CssClass="head-label" HeaderText="View">
<ItemTemplate>
<asp:ImageButton ID="imgbtnCommentsEdit" runat="server" CommandName="Select" Height="20px" ImageUrl="~/images/Gridview/View.png" Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  VerticalAlign="Middle" Height="30px" Font-Bold="True"  />
<ItemStyle  HorizontalAlign="Center"  VerticalAlign="Middle" CssClass="grid-item" Width="30px" />
</asp:TemplateField>
                                                             
<asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtnCommentsDelete" runat="server" CommandName="Delete" Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" OnClientClick="javascript:return confirm('Are you sure to proceed?');" Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" VerticalAlign="Middle" Width="16px" />
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
</td></tr>


<tr><td style="width: 176px"><br /></td></tr>
<tr id="tr_CountyData" runat="server" visible="false">
<td style="width: 176px" ><asp:Label ID="Label35" runat="server" CssClass="Label" Text="Tax Type"></asp:Label></td>
<td  style="width: 443px" ><asp:Label ID="Label26" runat="server" CssClass="Label"  Text="Comments:"></asp:Label></td>
<td rowspan="2" valign="middle" width="500">
<asp:Button ID="ImageButton3" runat="server" CssClass="Windowbutton" 
                    OnClick="imgbtn_Taxtype_Note_Add_Click" 
                    Text="Add" 
                    Width="75px" />


    <%--<asp:LinkButton ID="lbl_Deliquent_Tax_Type" runat="server" CommandName="Select" Text='<%#Eval("Tax_Type") %>'></asp:LinkButton>--%>
<asp:Button ID="btn_County_Database_cacnel" runat="server" CssClass="Windowbutton" 
                    OnClick="btn_County_Database_cacnel_Click" 
                    Text="Cancel" 
                    Width="75px" />


</td>

</tr>
<tr id="tr_CountyData1" runat="server" visible="false">
<td style="width: 176px"><asp:DropDownList ID="ddl_TaxType_Commts" runat="server" CssClass="DropDown" TabIndex="1" Width="175px" onselectedindexchanged="ddl_TaxType_Commts_SelectedIndexChanged"></asp:DropDownList></td>
<td style="width: 443px">
    <asp:TextBox ID="Txt_taxtype_Comments" runat="server" 
        CssClass="textbox" Height="20px" Width="496px" ></asp:TextBox></td>

</tr>

</table>



</td>
</tr>
  
<tr id="tr_county" runat="server" visible="false" valign="top" >
<td >

<table id="County_Db" runat="server" visible="false"  style="height:20px" 
        align="left">
<tr valign="top">
<td><asp:Button ID="btn_CountyDB" runat="server" Text="County Database" 
        CssClass="TabButton" onclick="btn_CountyDB_Click"  />
    <asp:Button ID="btn_DelequentDb" runat="server" Text="Delequent Database" 
        CssClass="TabButton" onclick="btn_DelequentDb_Click"  />
</td>

</tr>

</table>

</td>
</tr>




<tr id="tr_countydb" runat="server" visible="false" valign="top" >
<td style="border:thin solid #008080">
<table id="btn_lnkCountyDb" runat="server" style="height:100px" width="100%" visible="false" >
<tr ><td colspan="6" valign="top">
<div class="div_toprow" >
County Database Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddCountyDb" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddCountyDb_Click" Visible="False" />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="6" valign="top">
 <div style="background-color:#fff;margin-top:-6px;">
<asp:GridView ID="grd_Tax_County_Database" runat="server" 
        AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True" ForeColor="Black"  CellPadding="4"  CssClass="name" 
        BackColor="White" BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px"
       Height="30px" PageSize="4" Width="100%" 
        ShowHeaderWhenEmpty="True" 
         onrowcommand="grd_Tax_County_Database_RowCommand1">

<Columns>
<asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Conty_Database_Id" runat="server" Text='<%#Eval("Conty_Database_Id") %>' Visible="false"></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center"  Height="30px" Font-Bold="True"   />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="S.No" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
</ItemTemplate>
<HeaderStyle   CssClass="head_style" HorizontalAlign="Center"  Height="30px" Font-Bold="True" />
<ItemStyle  HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid-item"  Width="30px"/>
</asp:TemplateField>
<asp:TemplateField HeaderText="Tax Type" SortExpression="Tax_Type" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_County_Tax_Type" runat="server"  Text='<%#Eval("Tax_Type") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
</asp:TemplateField>

<asp:TemplateField HeaderText="Phone No" SortExpression="Ph_No" HeaderStyle-CssClass="head-label">

<ItemTemplate>
<asp:Label ID="lbl_Ph_No" runat="server"  Text='<%#Eval("Ph_No") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Make Changes Payable To" SortExpression="Make_Changes_Payable_to" HeaderStyle-CssClass="head-label">

<ItemTemplate>
<asp:Label ID="lbl_Make_Changes_Payable_to" runat="server"  Text='<%#Eval("Make_Changes_Payable_to") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center"  Height="30px"  Font-Bold="True" />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="300px" /></asp:TemplateField>
<asp:TemplateField HeaderText="Payee Address" SortExpression="Make_Changes_Payable_to" HeaderStyle-CssClass="head-label">

<ItemTemplate>
<asp:Label  ID="lbl_Payee_Address" runat="server"   Text='<%#Eval("Payee_Address") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center"  Height="30px" Font-Bold="True"   />
<ItemStyle  HorizontalAlign="Center" CssClass="grid-item" Width="300px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="head-label">

<ItemTemplate>
<asp:ImageButton  ID="imgbtnEdit" runat="server" CommandName="EditRecord" Height="20px" ImageUrl="~/images/Gridview/edit.png" ToolTip="Edit" Width="20px" /></ItemTemplate>
<HeaderStyle  CssClass="head_style"  HorizontalAlign="Center"  Height="30px" Font-Bold="True"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item"   Width="50px" />
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

<tr id="tr_CountyDbInfo" runat="server" visible="false">
<td style="width: 188px">
<asp:Label ID="Label5" runat="server" CssClass="Label" Text="Tax Type:"></asp:Label>
</td>
<td style="width: 199px">
<asp:Label ID="Label6" runat="server" CssClass="Label" Text="Phone No:"></asp:Label>
</td>
<td style="width: 495px">
<asp:Label ID="Label7" runat="server" CssClass="Label" Text="Make Changes Payble To"></asp:Label>
</td>
<td style="width: 441px">
<asp:Label ID="Label10" runat="server" CssClass="Label" Text="Payee Address:"></asp:Label>
</td>
<td rowspan="2" width="100">
<asp:Button ID="btn_AddCountyTax" runat="server" CssClass="Windowbutton" 
                    OnClick="btn_AddCountyTax_Click" 
                    Text="Update" 
                    Width="75px" />
    <%--<asp:LinkButton ID="lbl_Deliquent_Tax_Type" runat="server" CommandName="Select" Text='<%#Eval("Tax_Type") %>'></asp:LinkButton>--%>
</td>
</tr>
<tr id="tr_CountyDbInfo1" runat="server" visible="false">
<td style="width: 188px" valign="top">
<asp:DropDownList ID="ddl_CountyTaxtype" runat="server" CssClass="DropDown" 
        TabIndex="1" Width="184px"></asp:DropDownList>
</td>
<td style="width: 199px" valign="top">
<asp:TextBox ID="txt_CountyPhno" runat="server" CssClass="textbox" TabIndex="2" 
        Width="197px"></asp:TextBox>
</td>
<td style="width: 495px" valign="top">
<asp:TextBox ID="txt_CountyPayto" runat="server" 
        CssClass="textMultiline" TabIndex="3" 
        Width="328px"></asp:TextBox>
</td>
<td style="width: 651px" valign="top">
<asp:TextBox ID="txt_CountyTaxPayeeadd" runat="server" 
        CssClass="textMultiline" TabIndex="4" 
        Width="451px"></asp:TextBox>
</td>
</tr>
</table>



<table id="btnlnkDelequentDb" style="height:100px" width="100%" runat="server" visible="false" >
<tr>
<td colspan="5" valign="top">
<div class="div_toprow" >
Delequent Database Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddDelequent" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddDelequent_Click" />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="5" valign="top">
<div style="background-color:#fff;margin-top:-6px;">
<asp:GridView ID="Grid_Delequent_Data" runat="server" AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True" ForeColor="Black"  CellPadding="4"  CssClass="name" 
        BackColor="White" BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px"
       Height="30px" PageSize="2" Width="100%" 
        ShowHeaderWhenEmpty="True" 
      
        onrowdeleting="Grid_Delequent_Data_RowDeleting" 
        onselectedindexchanged="Grid_Delequent_Data_SelectedIndexChanged">

<Columns>

<asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Delequent_Database_Id" runat="server" CssClass="Label" Text='<%#Eval("Delequent_Database_Id") %>' Visible="false"></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center" Height="30px" Font-Bold="True"   />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="S.No" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Tax Type" SortExpression="Tax_Type" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<%--<asp:LinkButton ID="lbl_Deliquent_Tax_Type" runat="server" CommandName="Select" Text='<%#Eval("Tax_Type") %>'></asp:LinkButton>--%>
<asp:Label ID="lbl_Deliquent_Tax_Type" runat="server" Text='<%#Eval("Tax_Type") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Phone No" SortExpression="Ph_No" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Deliquent_Ph_No" runat="server"  Text='<%#Eval("Ph_No") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center"  Height="30px" Font-Bold="True"   />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Make Changes Payable To" SortExpression="Make_Changes_Payable_to" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Deliquent_Make_Changes_Payable_to" runat="server"  Text='<%#Eval("Make_Changes_Payable_to") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center" Height="30px" Font-Bold="True"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="300px" />
</asp:TemplateField>
<asp:TemplateField  HeaderText="Payee Address" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label  ID="lbl_Deliquent_Payee_Address" runat="server"  Text='<%#Eval("Payee_Address") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle  CssClass="head_style"  HorizontalAlign="Center"  Height="30px" Font-Bold="True"   />
<ItemStyle  HorizontalAlign="Center" CssClass="grid-item"  Width="300px" />
</asp:TemplateField>
<asp:TemplateField HeaderStyle-CssClass="head-label" HeaderText="Delete">
<ItemTemplate>
<asp:ImageButton ID="imgbntaxdel" runat="server" CommandName="Delete" Height="20px" 
                                                                ImageUrl="~/images/Gridview/Remove-icon.png" 
                                                               OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                                                Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="16px"></ItemStyle>
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
</td></tr>


<tr><td style="width: 188px"><br /></td></tr>
<tr id="tr_DelequentDb" runat="server" visible="false">
<td style="width: 188px">
<asp:Label ID="Label46" runat="server" CssClass="Label" Text="Tax Type:"></asp:Label>
</td>
<td style="width: 199px">
<asp:Label ID="Label49" runat="server" CssClass="Label" Text="Phone No:"></asp:Label>
</td>
<td style="width: 495px">
<asp:Label ID="Label48" runat="server" CssClass="Label" Text="Make Changes Payble To"></asp:Label>
</td>
<td style="width: 400px">
<asp:Label ID="Label50" runat="server" CssClass="Label" Text="Payee Address:"></asp:Label>
</td>
<td rowspan="2" width="100">
<asp:Button ID="imgbtn_Delequent_Tax_Add" runat="server" CssClass="Windowbutton" 
                    OnClick="imgbtn_Delequent_Tax_Add_Click" 
                    Text="Add" 
                    Width="75px" />
                    <asp:Button ID="imgbtn_Delequent_Tax_Cancel" runat="server" CssClass="Windowbutton" 
                    OnClick="imgbtn_Delequent_Tax_Cancel_Click" 
                    Text="Cancel" 
                    Width="75px" />
    <%--<EditItemTemplate>
        <asp:DropDownList ID="ddl_Tax_Type" Width="150px"   CssClass="GridDropDown" runat="server" ></asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
        <asp:DropDownList ID="ddl_Tax_Type_Entry"  Width="90px"   CssClass="GridDropDown" runat="server" ></asp:DropDownList>
        </FooterTemplate>--%>
</td>
</tr>
<tr id="tr_DelequentDb1" runat="server" visible="false">
<td style="width: 188px" valign="top">
<asp:DropDownList ID="ddl_Tax_Delquent_Tax_type" runat="server" CssClass="DropDown" 
        TabIndex="1" Width="184px" 
        onselectedindexchanged="ddl_Tax_Delquent_Tax_type_SelectedIndexChanged"></asp:DropDownList>
</td>
<td style="width: 199px" valign="top">
<asp:TextBox ID="txt_delequent_phno" runat="server" CssClass="textbox" TabIndex="2" 
        Width="197px"></asp:TextBox>
</td>
<td style="width: 495px" valign="top">
<asp:TextBox ID="txt_Delequent_Make_Changes" runat="server" 
        CssClass="textMultiline" TabIndex="3" 
        Width="328px"></asp:TextBox>
</td>
<td style="width: 400px" valign="top">
<asp:TextBox ID="txt_Delequent_Payee_addres" runat="server" 
        CssClass="textMultiline" TabIndex="4" 
        Width="400px"></asp:TextBox>
</td>
</tr>




</table>
</td>
</tr>






</table>

</td>
</tr>


<tr >
         <td>
          <table align="center" style="width:98%; " >
          <tr>
          <td>
<asp:Button ID="btn_Preview" runat="server"  OnClientClick="SetTarget();"  CssClass="TabButton" 
                                                            onclick="btn_Preview_Click" Text="Preview" />
<asp:Button ID="btn_Complete" runat="server" CssClass="TabButton" onclick="btn_Complete_Click"   OnClientClick="javascript:return confirm('Are you sure to proceed?');" Text="Complete" />
<asp:Button ID="btn_Send" runat="server" CssClass="TabButton" Text="Send" onclick="btn_Send_Click" />
<asp:Button ID="btn_PreviewMail" runat="server" CssClass="TabButton" Text="Preview -Mail" onclick="btn_PreviewMail_Click" />
<asp:Button ID="btn_PreviewFax" runat="server" CssClass="TabButton" Text="Preview -Fax" onclick="btn_PreviewFax_Click" />
<asp:Button ID="btn_PreviewEfax" runat="server" CssClass="TabButton" Text="Preview -eFax" onclick="btn_PreviewEfax_Click" />
<asp:Button ID="btn_Update" runat="server" Visible="false" CssClass="TabButton" onclick="btn_Update_Click" Text="Update Order Info" Width="100px" />
<asp:TextBox ID="txt_Date" Visible="false" runat="server" CssClass="textbox" style="text-transform:uppercase;"   TabIndex="19" Enabled="False" Width="70px"></asp:TextBox>
<ajax:filteredtextboxextender ID="filter_Date" runat="server" Enabled="True" FilterType="Custom, Numbers" TargetControlID="txt_Date" ValidChars="_/"></ajax:filteredtextboxextender>

<ajax:calendarextender ID="txt_Date_CalendarExtender" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Date"></ajax:calendarextender>
<asp:TextBox ID="txt_ETA_date" Visible="false" runat="server" CssClass="textbox" style="text-transform:uppercase;"   TabIndex="18" AutoPostBack="True" ontextchanged="txt_ETA_date_TextChanged" Width="70px"></asp:TextBox>
<ajax:filteredtextboxextender ID="txt_ETA_date_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Custom, Numbers" TargetControlID="txt_ETA_date" ValidChars="_/"></ajax:filteredtextboxextender>
 <ajax:calendarextender ID="txt_ETA_date_CalendarExtender" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_ETA_date">
</ajax:calendarextender>

</td>
          </tr>
          </table>
         </td>
         


</tr>

<tr >
<td >
<table align="center"  style="border: thin solid #003366; width:98%;">
                                                  <tr>
                                                      <td style="width: 200px">
                                                        <asp:Label ID="Labelorderno" runat="server" CssClass="Label" Text="Order #"></asp:Label>
                                                                </td>
                                                      <td style="width:162px;">
                                                        <asp:TextBox ID="txt_Order_Number" runat="server" CssClass="textbox" 
                                                            TabIndex="1" Width="150px"></asp:TextBox>
                                                                </td>
                                                      <td style="width:85px;">

                                                        <asp:Label ID="Label34" runat="server" CssClass="Label" Text="Parcel #"></asp:Label>
                                                       
                                                        </td>
                                                        <td style="width:150px;">
                                                        
                                                        <asp:TextBox ID="txt_Parcel_Number" runat="server" CssClass="textbox" 
                                                            TabIndex="2" 
                                                            ontextchanged="txt_Parcel_Number_TextChanged" Width="150px"></asp:TextBox>
                                                                                                           




                                                             </td>   

                                                      <td style="width:85px;">
                                                          
                                                      <asp:Label ID="Label11" runat="server" CssClass="Label" 
                                                            Text="First Name"></asp:Label>
                                                       
                                                            </td>                                               
                                                        <td style="width:150px;" valign="middle">

                                                        
                                                      
                                                         <asp:TextBox ID="txt_Barrower_Name" runat="server" 
                                                            CssClass="textbox"  TabIndex="9" 
                                                            ontextchanged="txt_Barrower_Last_Name_TextChanged" Width="150px"></asp:TextBox>





                                                                </td>
                                                      <td align="left" style="width: 91px" >

                                               <asp:Label ID="Label29" runat="server" CssClass="Label" 
                                                            Text="Last Name"></asp:Label>

                                                                </td>
<td style="width: 183px">
                                                        
                                               <asp:TextBox ID="txt_Barrower_Last_Name0" runat="server" 
                                                            CssClass="textbox"  TabIndex="9" 
                                                            ontextchanged="txt_Barrower_Last_Name_TextChanged" Width="150px"></asp:TextBox>
                                               
</td>
<td>

                                                                

                                               <asp:Label ID="Label20" runat="server" CssClass="Label" Text="State  "></asp:Label>
                                               
                                                                

</td>
<td>

                                                        
                                                                                                            
                                                    
                                               <asp:DropDownList ID="ddl_Barrower_State" runat="server" CssClass="DropDown" 
                                                            Width="160px" 
                                                            onselectedindexchanged="ddl_Barrower_State_SelectedIndexChanged" 
                                                            TabIndex="13">
                                                        </asp:DropDownList>
                                               
                                                        
                                                                                                            
                                                    
</td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 200px">

                                                                

                                                         <asp:Label ID="Label17" runat="server" CssClass="Label" Text="County"></asp:Label>

                                                                

                                                                </td>
                                                      <td style="width: 162px">
                                                        
                                                        
                                                                                                            
                                                    
                                                      <asp:DropDownList ID="ddl_Barrower_County" runat="server" CssClass="DropDown" 
                                                            Width="160px" TabIndex="12">
                                                        </asp:DropDownList>
                                               
                                                        
                                                                                                            
                                                    
                                                                </td>
                                                      <td style="width: 85px">

                                                                

                                                        <asp:Label ID="Label38" runat="server" CssClass="Label" Text="City"></asp:Label>
                                               
                                                                

                                                      </td>
                                                                <td>
                                                    
                                                        
                                                                                                            
                                                    
<asp:TextBox ID="txt_Barrower_City" runat="server" CssClass="textbox" ontextchanged="txt_Barrower_City_TextChanged" TabIndex="11" Width="150px"></asp:TextBox>
                                               
                                                        
                                                                                                            
                                                    
                                                                </td>
                                                                <td style="width: 85px">

                                                                

                                               <asp:Label ID="Label1" runat="server" CssClass="Label" Text="Zip"></asp:Label>
                                               
                                                                

                                                                </td>
                                                               
                                                      <td >
                                                    
                                                        
                                                                                                            
                                                    
                                               <asp:TextBox ID="txt_Barrower_Zip" runat="server" CssClass="textbox" 
                                                            Width="150px" TabIndex="14" 
                                                            ontextchanged="txt_Barrower_Zip_TextChanged"></asp:TextBox>
                                               
                                                        
                                                                                                            
                                                    
                                                                </td>
                                                      <td style="width: 91px" >
                                                     
                                                        
                                                       <asp:Label ID="Label18" runat="server" CssClass="Label" Text="Address"></asp:Label>
                                                       
                                                      </td>
                                                     <td colspan="3">
                                                        
                                                        
                                                      
                                                        <asp:TextBox ID="txt_Barrower_Address" runat="server" 
                                                            CssClass="textbox" ontextchanged="txt_Barrower_Address_TextChanged" 
                                                            TabIndex="10" Width="384px"></asp:TextBox>
                                                                                                           




                                                     </td>
                                                    
                                                  </tr>
                                                  <tr>
                                                  <td style="width: 200px">

                                                                

                                                         <asp:Label ID="Label97" runat="server" CssClass="Label" 
                                                          Text="Producion Date"></asp:Label>

                                                                

                                                  </td>
                                                  <td>
                                               
                                               

                                                        <asp:TextBox ID="txt_Production_Date" runat="server" CssClass="textbox" TabIndex="12"  Width="150px"></asp:TextBox>
<cc1:FilteredTextBoxExtender ID="ddl_ProductionDt_FilteredTextBoxExtender" runat="server" 
                                                              Enabled="True" FilterType="Custom, Numbers" TargetControlID="txt_Production_Date" 
                                                              ValidChars="_/">
                                                          </cc1:FilteredTextBoxExtender>
                                

<cc1:CalendarExtender ID="ddl_ProductionDt_CalendarExtender" runat="server" 
                                                              CssClass="sample" Enabled="True" Format="dd/MM/yyyy" 
                                                              TargetControlID="txt_Production_Date">
                                                          </cc1:CalendarExtender>



                       
                                                  
                                                                                                            
                                                    
                                                  </td>
                                                  <td>
                                                  
                                                                

                                                         <asp:Label ID="Label98" runat="server" CssClass="Label" Text="Status"></asp:Label>

                                                                

                                                  </td>
                                                  <td>

                                                        
                                                                                                            
                                                    
                                                      <asp:DropDownList ID="ddl_Status" runat="server" CssClass="DropDown" 
                                                            Width="160px" TabIndex="12">
                                                        </asp:DropDownList>
                                               
                                                        
                                                                                                            
                                                    
                                                  </td>
                                                  <td>

                                                        
                                                       <asp:Label ID="Label99" runat="server" CssClass="Label" Text="Comments"></asp:Label>
                                                       
                                                  </td>
                                                  <td colspan="6">

                                                        
                                                      
                                                        <asp:TextBox ID="txt_GlsComments" runat="server" 
                                                            CssClass="textbox" ontextchanged="txt_Barrower_Address_TextChanged" 
                                                            TabIndex="10" Width="630px"></asp:TextBox>
                                                                                                           




                                                  </td>
                                                  </tr>
                                                
                                              </table>
</td>
</tr>


<tr >
<td >
<table align="center"  style=" width:98%;">
<tr><td>
<asp:Button ID="Tab_TaxDetails" runat="server" Text="Tax Details" 
        CssClass="TabButton" onclick="Tab_TaxDetails_Click" />
<asp:Button ID="Tab_AssedVal" runat="server" Text="Assesed Values" 
        CssClass="TabButton" onclick="Tab_AssedVal_Click" />
<asp:Button ID="Tab_SalDetail" runat="server" Text="Tax Sales Details" 
        CssClass="TabButton" onclick="Tab_SalDetail_Click" />
    <%--<EditItemTemplate>
        <asp:DropDownList ID="ddl_Tax_Type" Width="150px"   CssClass="GridDropDown" runat="server" ></asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
        <asp:DropDownList ID="ddl_Tax_Type_Entry"  Width="90px"   CssClass="GridDropDown" runat="server" ></asp:DropDownList>
        </FooterTemplate>--%>
<asp:Button ID="Tab_BankruptyDet" runat="server" Text="Bankrupty Details" 
        CssClass="TabButton" onclick="Tab_BankruptyDet_Click" />
<asp:Button ID="Tab_SourceUpload" runat="server" Text="Source Upload" 
        CssClass="TabButton" onclick="Tab_SourceUpload_Click" />
<asp:Button ID="Tab_ErrorInfo" runat="server" Text="Error Detail" 
        CssClass="TabButton" onclick="Tab_ErrorInfo_Click" />
</td></tr>
</table>
</td>
</tr>



<tr>
<td >


<table id="Tax_Detail" runat="server"  style="width:98%; height:20px;"  
        visible="true" align="center" >
        <tr valign="top">
<td>
<asp:Button ID="TabPanelcurrent" runat="server" Text="Current Year" 
        CssClass="TabButton" onclick="TabPanelcurrent_Click" />
<asp:Button ID="TabAnnual" runat="server" Text="Annual Tax" 
        CssClass="TabButton" onclick="TabAnnual_Click" />
<asp:Button ID="TaxNotes" runat="server" Text="Comments" 
        CssClass="TabButton" onclick="TaxNotes_Click" />
        </td>
        </tr>
</table>



<table id="Assed_Val" runat="server"  style="width:98%;height:100px;border:thin solid #008080"  
        visible="false" align="center" >
<tr><td colspan="10" valign="top">
<div class="div_toprow" >
Assesed Value Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddAssessed" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" onclick="btn_AddAssessed_Click" 
        />
        </span>
        </div>
        </td>
        </tr>
<tr>
<td colspan="10" valign="top">
<div style="background-color:#fff;margin-top:-6px;">
   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
<ContentTemplate> 
    <asp:GridView ID="grd_Assesed" runat="server" DataKeyNames="Tax_Assessed_Id" 
                                                          onrowdeleting="grd_Assesed_RowDeleting" 
                                                          onselectedindexchanged="grd_Assesed_SelectedIndexChanged" 
                                                          
        AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True" ForeColor="Black"  CellPadding="4"  CssClass="name" Font-Bold="false"
        BackColor="White" BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px"
       Height="30px" PageSize="2" Width="100%" 
        ShowHeaderWhenEmpty="True" Font-Names="Segoe UI" 
        Font-Size="16px">
        <Columns>
        <asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-CssClass="head-label">
        <ItemTemplate>
        <asp:Label  ID="lblTax_Assessed_Id" runat="server" CssClass="Label" Text='<%#Eval("Tax_Assessed_Id") %>' Visible="false"></asp:Label></ItemTemplate>
        <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
        <ItemStyle HorizontalAlign="Center"  Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="S.No" SortExpression="Order_Number" HeaderStyle-CssClass="head-label">
        <ItemTemplate>
        <asp:Label ID="lblsi_Assesid" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
        </ItemTemplate>
        <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
        <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="30px">
        </ItemStyle>
        </asp:TemplateField>
<asp:TemplateField  HeaderText="Tax Year" SortExpression="Tax_Year" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label    ID="lblTax_Year" runat="server"  Text='<%#Eval("Tax_Year") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Land"   SortExpression="Land_Cost" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblLand_Cost"  runat="server"  Text='<%#Eval("Land_Cost") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="100px" />
</asp:TemplateField>
<asp:TemplateField   HeaderText="Building" SortExpression="Building_Cost" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label  ID="lblBuilding_Cost" runat="server" Text='<%#Eval("Building_Cost") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="100px" />
</asp:TemplateField>
<asp:TemplateField   HeaderText="Excemption" SortExpression="Excemption" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblExcemption_Cost" runat="server"  Text='<%#Eval("Excemption") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  HorizontalAlign="Center" CssClass="grid-item" Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Total" SortExpression="Total" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblTotal" runat="server"  Text='<%#Eval("Total") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle  CssClass="head_style" HorizontalAlign="Center" Height="30px" Font-Bold="True" />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderStyle-CssClass="head-label" HeaderText="View">
<ItemTemplate>
<asp:ImageButton ID="imgbtnExamEdit" runat="server" CommandName="Select" Height="20px" ImageUrl="~/images/Gridview/View.png" Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid-item"  Width="16px" />
</asp:TemplateField>
<asp:TemplateField HeaderStyle-CssClass="head-label" HeaderText="Delete">
<ItemTemplate>
<asp:ImageButton ID="imgbtnExamDelete" runat="server" CommandName="Delete" Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                                                      Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid-item"  Width="16px" />
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
</ContentTemplate>
</asp:UpdatePanel>
</div>
</td>
</tr>


<tr id="tr_AssedVal" runat="server" visible="false">
<td style="width: 79px" ><asp:Label  ID="lbl_Tax_Year" runat="server" CssClass="Label" Text="Tax Year"></asp:Label></asp:Label></td>
<td style="width: 175px"><asp:DropDownList ID="ddl_Assesed_Tax_Year" runat="server" 
                                                                  
        CssClass="DropDown" TabIndex="1" Width="160px"></asp:DropDownList></td>
<td style="width: 64px"><asp:Label ID="Label3" runat="server" CssClass="Label" 
                                                                  Text="Land"></asp:Label></td>
<td style="width: 171px"><asp:TextBox 
                                                                  ID="txt_Land" runat="server" AutoPostBack="True" CssClass="textbox" 
                                                                  ontextchanged="txt_Land_TextChanged" style="text-transform:uppercase;" 
                                                                  TabIndex="2" Width="150px"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender 
                                                                  ID="txt_Land_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_Land" ValidChars="."></cc1:FilteredTextBoxExtender>
</td>
<td style="width: 72px"><asp:Label ID="Label4" runat="server" CssClass="Label" 
                                                                  Text="Building"></asp:Label></td>
<td><asp:TextBox 
                                                                  ID="txt_Building" runat="server" AutoPostBack="True" CssClass="textbox" 
                                                                  ontextchanged="txt_Building_TextChanged" style="text-transform:uppercase;" 
                                                                  TabIndex="3" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_Building_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_Building" ValidChars="."></cc1:FilteredTextBoxExtender>
</td>
<td>
<asp:Label 
                                                                  ID="Label52" runat="server" CssClass="Label" Text="Excemption"></asp:Label>
</td>
<td>
<asp:TextBox ID="txt_Excemption" runat="server" CssClass="textbox" 
                                                                  style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_Excemption_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_Excemption" ValidChars="."></cc1:FilteredTextBoxExtender>
</td>
<td>
<asp:Label 
                                                                  ID="Label25" runat="server" CssClass="Label" Text="Total"></asp:Label>
</td>
<td>
<asp:TextBox 
                                                                  ID="txt_total" runat="server" CssClass="textbox" Enabled="False" 
                                                                  style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox><cc1:FilteredTextBoxExtender 
                                                                  ID="txt_total_FilteredTextBoxExtender" runat="server" Enabled="True" 
                                                                  FilterType="Custom, Numbers" TargetControlID="txt_total" ValidChars="."></cc1:FilteredTextBoxExtender>
</td>

</tr>
<tr id="tr_AssedVal1" runat="server" visible="false">
<td align="right" colspan="9">
    &nbsp;</td>
<td align="center" style="width: 210px" >
<asp:Button ID="btn_Assesd_Add" runat="server" CssClass="Windowbutton" 
                    OnClick="btn_Assesd_Add_Click" 
                    Text="Save" 
                    Width="75px" />
    &nbsp;
<asp:Button ID="btn_ClearAssed" runat="server" CssClass="Windowbutton" 
                    OnClick="btn_ClearAssed_Click" 
                    Text="Cancel" 
                    Width="75px" />
    </td>

</tr>
    
</table>



<table id="Tax_SalDet" runat="server"  style="width:98%;height:100px;border:thin solid #008080"  
        visible="false" align="center" >
<tr><td colspan="8" valign="top">
<div class="div_toprow" >
Tax Sales Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddTaxSal" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" onclick="btn_AddTaxSal_Click" 
        />
        </span>
</div>
</td>
</tr>
<tr>
<td colspan="8" valign="top">
<div style="background-color:#fff;margin-top:-6px;">    
            
        <asp:GridView ID="grd_Tax_Sold" runat="server"
                DataKeyNames="Tax_Sale_Id" 
                AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True" ForeColor="Black"  CellPadding="4"  CssClass="name" 
        BackColor="White" BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px"
       Height="30px" PageSize="2" Width="100%" 
        ShowHeaderWhenEmpty="True" 
            onrowcommand="grd_Tax_Sold_RowCommand">
            
            <Columns>
            <asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-CssClass="head-label">
            <ItemTemplate><asp:Label ID="lblTax_Sale_Id" runat="server" CssClass="Label" 
                                Text='<%#Eval("Tax_Sale_Id") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
        <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
        <ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="100px" />
        </asp:TemplateField>
          <asp:TemplateField HeaderText="S.No" SortExpression="Order_Number" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:Label ID="lblSiTax_Sale_Id" runat="server"  Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle  HorizontalAlign="Center"  CssClass="grid-item"  Width="30px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Tax Year" SortExpression="Tax_Year" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          
          <asp:Label ID="lblTax_Sold" runat="server" Text='<%#Eval("Taxes_Sold") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" /></asp:TemplateField>
          <asp:TemplateField HeaderText="Tax Sale Date" SortExpression="Land_Cost" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:Label ID="lblSold_Date" runat="server"  Text='<%#Eval("Tax_Sold_Date") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Redemption Amount" SortExpression="Total" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:Label ID="lblSold_TaxAmt" runat="server"  Text='<%#Eval("Sold_Tax_Amount") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Good Thru Date" SortExpression="Total" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:Label ID="lblRedemption_Good_Thru_Date" runat="server"   Text='<%#Eval("Redemption_Good_Through_Date") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Last Date to Redemption" SortExpression="Total" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:Label ID="lblLast_Redemption_Loss_Date" runat="server"   Text='<%#Eval("Last_Redemption") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Next Critical Date" SortExpression="Building_Cost" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:Label ID="lbl_Next_Critical_Date" runat="server"  Text='<%#Eval("Next_Critical_Date") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Next Critical Action" SortExpression="Total" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:Label ID="lblNext_Critical_Action" runat="server"  Text='<%#Eval("Next_Critical_Action") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="Comments" SortExpression="Total" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:Label ID="lblTax_Sale_Comments" runat="server"  Text='<%#Eval("Comments") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
          <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
          </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:ImageButton ID="imgbtnTaxSoldEdit" runat="server" CommandName="EditRecord" 
                                Height="20px" ImageUrl="~/images/Gridview/View.png"
                              
                                Width="20px" />
       </ItemTemplate>
       <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
       <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  VerticalAlign="Middle" Width="16px" />
       </asp:TemplateField>
          <asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="head-label">
          <ItemTemplate>
          <asp:ImageButton ID="imgbtnTaxSoldDelete" runat="server" CommandName="DeleteRecord" 
                                Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" 
                              OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                Width="20px" />
       </ItemTemplate>
       <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
       <ItemStyle HorizontalAlign="Center" CssClass="grid-item"  VerticalAlign="Middle" Width="16px" />
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
</td></tr>    

                
<tr id="tr_SalDetail" runat="server" visible="false">
<td ><asp:Label ID="Label44" runat="server" CssClass="Label" Text="Taxes Sold" /></td>
<td><asp:DropDownList ID="ddl_Tax_Sold" CssClass="DropDown" runat="server" 
        Width="160px">
    </asp:DropDownList></td>
<td><asp:Label ID="Label45" runat="server" CssClass="Label" Text="Tax Sale Date" /></td>
<td> <asp:TextBox ID="txt_Sold_Date" runat="server" CssClass="textbox" 
                                                      style="text-transform:uppercase;" TabIndex="9" Width="150px"></asp:TextBox>
                                                  <cc1:FilteredTextBoxExtender ID="txt_Sold_Date_FilteredTextBoxExtender" 
                                                      runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                      TargetControlID="txt_Sold_Date" ValidChars="_/">
                                                  </cc1:FilteredTextBoxExtender>
                                                  <cc1:CalendarExtender ID="txt_Sold_Date_CalendarExtender" runat="server" 
                                                      Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Sold_Date">
                                                  </cc1:CalendarExtender></td>
<td><asp:Label ID="Label47" runat="server" CssClass="Label" Text="Redemption Amount" /></td>
<td><asp:TextBox ID="txt_sold_Tax_AMount" runat="server" CssClass="textbox" 
        style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox></td>
<td><asp:Label ID="Label51" runat="server" CssClass="Label" Text="Good Thru Date" /></td>
<td> <asp:TextBox ID="txt_Redemption_Good_Through_Date" runat="server" 
                                                 CssClass="textbox" style="text-transform:uppercase;" TabIndex="8" Width="150px" 
                                                             AutoPostBack="True" 
                                                             ontextchanged="txt_Redemption_Good_Through_Date_TextChanged"></asp:TextBox>
                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                                                 runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                 TargetControlID="txt_Redemption_Good_Through_Date" ValidChars="_/">
                                             </cc1:FilteredTextBoxExtender>
                                             <cc1:CalendarExtender ID="CalendarExtender2" 
                                                 runat="server" Enabled="True" Format="MM/dd/yyyy" 
                                                 TargetControlID="txt_Redemption_Good_Through_Date">
                                             </cc1:CalendarExtender></td>
</tr>

<tr id="tr_SalDetail1" runat="server" visible="false">
<td><asp:Label ID="Label55" runat="server" CssClass="Label" Text="Last Date to Redemption" /></td>
<td>   <asp:TextBox ID="txt_Last_Redemption_Date" runat="server" CssClass="textbox" 
                                                        style="text-transform:uppercase;" TabIndex="9" Width="150px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="txt_Last_Redemption_Date_FilteredTextBoxExtender" 
                                                        runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                        TargetControlID="txt_Last_Redemption_Date" ValidChars="_/">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <cc1:CalendarExtender ID="txt_Last_Redemption_Date_CalendarExtender" 
                                                        runat="server" Enabled="True" Format="MM/dd/yyyy" 
                                                        TargetControlID="txt_Last_Redemption_Date">
                                                    </cc1:CalendarExtender>      </td>
<td><asp:Label ID="Label56" runat="server" CssClass="Label" Text="Next Critical Action" /></td>
<td><asp:TextBox ID="txt_Next_Critical_Action" runat="server" CssClass="textbox" 
        style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox></td>
<td><asp:Label ID="Label57" runat="server" CssClass="Label" Text="Next Critical Date" /></td>
<td>   <asp:TextBox ID="txt_Next_Critical_date" runat="server" CssClass="textbox" 
                                                      style="text-transform:uppercase;" TabIndex="9" Width="150px"></asp:TextBox>
                                                  <cc1:FilteredTextBoxExtender ID="txt_Next_Critical_date_FilteredTextBoxExtender" 
                                                      runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                      TargetControlID="txt_Next_Critical_date" ValidChars="_/">
                                                  </cc1:FilteredTextBoxExtender>
                                                  <cc1:CalendarExtender ID="txt_Next_Critical_date_CalendarExtender" runat="server" 
                                                      Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Next_Critical_date">
                                                  </cc1:CalendarExtender></td>
<td><asp:Label ID="Label58" runat="server" CssClass="Label" Text="Comments" /></td>
<td><asp:TextBox ID="txt_Tax_Sale_Comments" runat="server" CssClass="textbox" 
        style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox></td>
</tr>

<tr id="tr_SalDetail2" runat="server" visible="false">
<td align="right" colspan="7">
    &nbsp;</td>
<td align="center" style="width: 210px" >
<asp:Button ID="btn_Add_Tax_Sale" runat="server" CssClass="Windowbutton" 
                    
                    Text="Save" 
                    Width="75px" onclick="btn_AddSalInfo_Click" />
    &nbsp;
<asp:Button ID="btn_ClearSalInfo" runat="server" CssClass="Windowbutton" 
                    
                    Text="Cancel" 
                    Width="75px" onclick="btn_ClearSalInfo_Click" />
    </td>


</tr>
</table>
    


<table id="Bankrupty_Det22" runat="server"  style="width:98%;height:100px;border:thin solid #008080"  
        visible="false" align="center" >
<tr>
<td valign="top" colspan="10">
<div class="div_toprow" >
Tax Bankrupty Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddTaxBankrupty" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" onclick="btn_AddTaxBankrupty_Click" 
        />
        </span>
        </div>
        </td>
        </tr>
<tr>
<td colspan="10" valign="top">
<div style="background-color:#fff;margin-top:-6px;">  
<asp:GridView ID="grid_Banckrupty" runat="server" 
        AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True" ForeColor="Black"  CellPadding="4"  CssClass="name" 
        BackColor="White" BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px"
       Height="30px" PageSize="4" Width="100%" 
        ShowHeaderWhenEmpty="True" 
                                                          onrowdeleting="grid_Banckrupty_RowDeleting" 
                                                          
        onselectedindexchanged="grid_Banckrupty_SelectedIndexChanged" >
                                                          
<Columns>
<asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblBankruptcy_Id" runat="server" Text='<%#Eval("Bankruptcy_Id") %>' Visible="false"></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" Width="100px"  CssClass="grid-item"/>
</asp:TemplateField>
<asp:TemplateField HeaderText="S.No" SortExpression="Order_Number" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblSiMunciplene_Id" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="30px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Bankcrupty" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblBankcrupty_Type" runat="server" Text='<%#Eval("Bankcrupty") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Chapter No" SortExpression="Tax_Type" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblChapter_No" runat="server" Text='<%#Eval("Chapter_No") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Case_No" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Case_No" runat="server"  Text='<%#Eval("Case_No") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Bk Date" SortExpression="Bk_Date" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_Bk_Date" runat="server" Text='<%#Eval("Bk_Date") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" Width="100px" CssClass="grid-item" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Comments" SortExpression="Comments" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lbl_bankcruptComments" runat="server" Text='<%#Eval("Comments") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" Width="100px" CssClass="grid-item" />
</asp:TemplateField>
<asp:TemplateField  HeaderText="View" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtnBankCruptEdit" runat="server" CommandName="Select" Height="20px" ImageUrl="~/images/Gridview/View.png" Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center" VerticalAlign="Middle"   Height="30px" Width="16px" Font-Bold="True"  />
<ItemStyle HorizontalAlign="Center" Width="100px" CssClass="grid-item" />
</asp:TemplateField>
<asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtnBankCruptDelete" runat="server" CommandName="Delete" Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                                                  Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center" VerticalAlign="Middle"   Height="30px" Width="16px"   />
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid-item" Width="16px" />
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


    
       <tr id="tr_Bankrupty" runat="server" visible="false">
       <td style="width: 114px"> 
       
       <asp:Label ID="Label12" runat="server" CssClass="Label" Text="Bankrupty"></asp:Label>
       </td>
       <td style="width:122px;">
       <asp:DropDownList ID="ddl_Bankruptcy_Yes_No" runat="server" 
                                                                  AutoPostBack="True" CssClass="DropDown" 
                                                                  onselectedindexchanged="ddl_Bankruptcy_Yes_No_SelectedIndexChanged" 
                                                                  TabIndex="1" Width="100px"><asp:ListItem Value="YES">YES</asp:ListItem><asp:ListItem 
                                                                      Value="NO">NO</asp:ListItem></asp:DropDownList>
       </td>
       <td style="width:109px;">
       <asp:Label ID="Label14" runat="server" CssClass="Label" Text="Chapter # "></asp:Label>
       </td>
       <td style=" width:37px;">
       <asp:TextBox ID="txt_Bankruptcy_ChapterNo" runat="server" CssClass="textbox" TabIndex="9"></asp:TextBox>
       </td>
       <td style="width:75px;">
       <asp:Label ID="Label16" runat="server" CssClass="Label" Text="Case# "></asp:Label>
       </td>
       <td style="width:138px;">
       <asp:TextBox ID="txt_Bankruptcy_Case_No" runat="server" CssClass="textbox" TabIndex="9"></asp:TextBox>
       </td>
       <td><asp:Label ID="Label21" runat="server" CssClass="Label" Text="BK Date"></asp:Label>
       </td>
       <td><asp:TextBox ID="txt_Bankruptcy_Date" runat="server" CssClass="textbox" style="text-transform:uppercase;" TabIndex="4" Width="150px"></asp:TextBox>
           <cc1:FilteredTextBoxExtender ID="txt_Bankruptcy_Date_filter_Date" runat="server" Enabled="True" FilterType="Custom, Numbers" TargetControlID="txt_Bankruptcy_Date" 
                                                                  ValidChars="_/"></cc1:FilteredTextBoxExtender>
          <cc1:CalendarExtender ID="txt_Bankruptcy_Date_CalendarExtender" runat="server" Enabled="True" Format="MM/dd/yyyy" TargetControlID="txt_Bankruptcy_Date"></cc1:CalendarExtender>
       </td>
       <td>
       <asp:Label ID="Label28" runat="server" CssClass="Label" Text="Comments"></asp:Label>
       </td>
       <td>
       <asp:TextBox ID="txt_Bankcrupt_Comments" runat="server" CssClass="textbox" TabIndex="9" TextMode="MultiLine" Width="200px"></asp:TextBox>
       <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" runat="server" Enabled="True" TargetControlID="txt_Bankcrupt_Comments" WatermarkCssClass="watermarked" 
                                                                  WatermarkText="Type Comment Here" />
        </td>
       
        </tr>

         <tr id="tr_Bankrupty1" runat="server" visible="false">
     <td align="right" colspan="9">
         &nbsp;</td>
<td align="center" style="width: 210px" >
<asp:Button ID="btn_Brancrupty" runat="server" CssClass="Windowbutton" 
                   
                    Text="Save" 
                    Width="75px" onclick="btn_BrancruptyAdd_Click" />
    &nbsp;
<asp:Button ID="btn_ClearBankrupty" runat="server" CssClass="Windowbutton" 
                 
                    Text="Cancel" 
                    Width="75px" onclick="btn_ClearBankrupty_Click" />
    </td>
     </tr>
   
</table>

<table id="Source_Upload" runat="server"  style="width:98%;height:100px;border:thin solid #008080"  
        visible="false" align="center" >

<tr><td colspan="7">
<div class="div_toprow" >
Source Upload Details
<span class="div_topplus" >
<asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" onclick="btn_AddTaxBankrupty_Click" 
        />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="7">
<div style="background-color:#fff;margin-top:-6px;">  
<asp:GridView ID="Tax_Type_Source_upload" runat="server"  DataKeyNames="Tax_Type_Source_upload_id" 
ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True" ForeColor="Black"  CellPadding="4"  CssClass="name" 
        BackColor="White" BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px"
       Height="30px" PageSize="4" Width="100%" 
        Font-Names="Segoe UI" Font-Bold="false"
        Font-Size="16px"
OnRowDataBound="Tax_Type_Source_upload_RowDataBound" 
        OnRowDeleting="Tax_Type_Source_upload_RowDeleting" 
        OnSelectedIndexChanged="Tax_Type_Source_upload_SelectedIndexChanged" >
<Columns>
<asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblTax_Type_Source_upload_Id" runat="server"  Text='<%#Eval("Tax_Type_Source_upload_id") %>' Visible="false"></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px"  />
<ItemStyle HorizontalAlign="Center" CssClass="grid-item"  Width="100px"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="S.No" SortExpression="Order_Number" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblsi" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center"  Height="30px"  />
<ItemStyle  HorizontalAlign="Center" CssClass="grid-item" Width="30px">
</ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="Source Details" SortExpression="Source_Details" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblSource_Details" runat="server" Text='<%#Eval("Source_Details") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center" Height="30px" Font-Bold="True"></HeaderStyle>
<ItemStyle HorizontalAlign="Center" CssClass="grid-item" Width="100px"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="Tax Type" SortExpression="Tax_Type" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblDocument_Name" runat="server"  Text='<%#Eval("Tax_Type") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle  CssClass="head_style" HorizontalAlign="Center" Height="30px" Font-Bold="True"></HeaderStyle>
<ItemStyle HorizontalAlign="Center"  CssClass="grid-item" Width="100px"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField Visible="False" HeaderText="Tax Type path" SortExpression="Tax_Type_Source_upload_Path" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblDocument_Path" runat="server" Text='<%#Eval("Tax_Type_Source_upload_Path") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center" Height="30px" Font-Bold="True"></HeaderStyle>
<ItemStyle HorizontalAlign="Center" Width="100px"  CssClass="grid-item"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="Updated By" SortExpression="Loan_Number" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblUser_Name" runat="server" Text='<%#Eval("User_Name") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center" Height="30px" Font-Bold="True"></HeaderStyle>
<ItemStyle HorizontalAlign="Center" Width="100px"  CssClass="grid-item"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="Updated When" SortExpression="Date" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:Label ID="lblModified_Date" runat="server"  Text='<%#Eval("Date_of_Upload") %>'></asp:Label>
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center" Height="30px" Font-Bold="True"></HeaderStyle>
<ItemStyle HorizontalAlign="Center" Width="100px"  CssClass="grid-item"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField   HeaderText="Delete" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtnExamDelete" runat="server" CommandName="Delete" Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" OnClientClick="javascript:return confirm('Are you sure to proceed?');" />
</ItemTemplate>
<HeaderStyle CssClass="head_style"  HorizontalAlign="Center" Height="30px" Font-Bold="True"></HeaderStyle>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="grid-item" Width="16px"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="Download" HeaderStyle-CssClass="head-label">

    <ItemTemplate >
    <asp:CheckBox ID="chkSelect"  Height="20px"  Width="10%" runat="server" />
    </ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center" Height="30px" ></HeaderStyle>
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid-item"  Width="16px"></ItemStyle>
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

<tr><td align="right" colspan="6">  
    
</td></tr>

<tr>
<td style="width:75px;"><asp:Label ID="Label31" runat="server" CssClass="Label" Text="Tax Type"></asp:Label>
</td>
<td    style=" width:189px;">
<asp:DropDownList ID="ddl_Source_upload_Taxtype"   runat="server" CssClass="DropDown" TabIndex="1" Width="175px"></asp:DropDownList>
</td>
<td style="width: 110px">
<asp:Label   ID="Label32" runat="server" CssClass="Label" Text="Source Details"></asp:Label>
</td>
<td style="width: 480px">
<asp:TextBox   ID="txt_Source_upload_Details" runat="server" CssClass="textbox"   placeholder="Type Source upload details.."
         Width="454px"></asp:TextBox>

</td>
<td style="width: 136px">
<asp:Label   ID="Label33" runat="server" CssClass="Label" Text="Upload Document"></asp:Label>
</td>
<td>
<asp:UpdatePanel  ID="UpdatePanel7" runat="server"><ContentTemplate>
<asp:FileUpload    ID="fileupload2" runat="server" CssClass="textbox" TabIndex="11" />
</ContentTemplate><%--<triggers>
<asp:PostBackTrigger  ControlID="ImageButton1"></asp:PostBackTrigger></triggers>--%></asp:UpdatePanel>
</td>

</tr>
     <tr>
     <td align="right" colspan="5">
         &nbsp;</td>
<td align="center" style="width: 210px" >
<asp:Button ID="btn_AddSrcUpload" runat="server" CssClass="Windowbutton" 
                   
                    Text="Save" 
                    Width="75px" onclick="btn_AddSrcUpload_Click" />
    &nbsp;
<asp:Button ID="btn_ClearSrcUpload" runat="server" CssClass="Windowbutton" 
                 
                    Text="Cancel" 
                    Width="75px" onclick="btn_ClearSrcUpload_Click" />
    </td>
     </tr>


</table>


<table id="Error_Detail" runat="server"  style="width:98%;height:100px;border:thin solid #008080"  
        visible="false" align="center" >

<tr><td colspan="7">
<div class="div_toprow" >
Error Info Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddErrorInfo" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" 
        onclick="btn_AddErrorInfo_Click"  />
</span>
</div>
</td>
</tr>
<tr>
<td colspan="7">
<div style="background-color:#fff;margin-top:-6px;">  
<asp:GridView ID="grd_Error_Details" runat="server" AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True"   CssClass="name" CellPadding="4" Height="30px" PageSize="4" Width="100%" 

                ShowHeaderWhenEmpty="True" 
                onrowcommand="grd_Error_Details_RowCommand" 
                onrowdeleting="grd_Error_Details_RowDeleting">
                
                <Columns>
                    <asp:TemplateField HeaderText="S.No" SortExpression="Order_Number" HeaderStyle-CssClass="head-label">
                        <ItemTemplate>
                            <asp:Label ID="lblErrorsino" runat="server" 
                                Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                        <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Error_Id" Visible="False" HeaderStyle-CssClass="head-label"
                        SortExpression="State">
                        <ItemTemplate>
                            <asp:Label ID="lblError_Id" runat="server" Visible="false"
                                Text='<%#Eval("Error_Id") %>'></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                        <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="ErrorCat_Id" Visible="False" HeaderStyle-CssClass="head-label"
                        SortExpression="State">
                        <ItemTemplate>
                            <asp:Label ID="lblErorr_Category_Id" runat="server" Visible="false" 
                                Text='<%#Eval("Erorr_Category_Id") %>'></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                        <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Error Category" SortExpression="State" HeaderStyle-CssClass="head-label">
                        <ItemTemplate>
                            <asp:Label ID="lblError_Category_Name" runat="server" 
                                Text='<%#Eval("Error_Category_Name") %>'></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                        <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Error Description" SortExpression="Tax_Period" HeaderStyle-CssClass="head-label">
                        <ItemTemplate>
                        <asp:Label ID="lblError_Description" runat="server" CommandName="ErrorDetails" Text='<%#Eval("Error_Description") %>'>
                        </asp:Label>
                        
                        </ItemTemplate>
                        <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                        <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="View" HeaderStyle-CssClass="head-label">
<ItemTemplate>
<asp:ImageButton ID="imgbtnerrorEdit" runat="server" CommandName="EditRecord" Height="20px" ImageUrl="~/images/Gridview/View.png" Width="20px" />
</ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center" VerticalAlign="Middle"   Height="30px" Width="16px" Font-Bold="True"  />
<ItemStyle HorizontalAlign="Center" Width="100px" CssClass="grid-item" />
</asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="head-label" HeaderText="Delete">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnErrorDelete" runat="server" CommandName="Delete" 
                                Height="20px" ImageUrl="~/images/Gridview/Remove-icon.png" 
                                OnClientClick="javascript:return confirm('Are you sure to proceed?');" 
                                Width="20px" />
                        </ItemTemplate>
                         <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                        <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="16px" />
                        
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

<tr><td align="right" colspan="6">  
    
</td></tr>

<tr id="tr_ErrorDet" runat="server" visible="false">
<td><asp:Label ID="Label59" runat="server" CssClass="Label" Text="Error Category:"></asp:Label></td>
<td><asp:DropDownList ID="ddl_Error_Category" runat="server" CssClass="DropDown" 
            TabIndex="12" Width="160px">
        </asp:DropDownList></td>
<td><asp:Label ID="Label60" runat="server" CssClass="Label" 
        Text="Error Description:"></asp:Label></td>
<td><asp:TextBox ID="txt_Error_Description" runat="server" 
        CssClass="textbox" TabIndex="14" 
        Width="300px"></asp:TextBox></td>

</tr>

  <tr id="tr_ErrorDet1" runat="server" visible="false">
     <td align="right" colspan="5">
         &nbsp;</td>
<td align="center" style="width: 210px" >
<asp:Button ID="Imgbtn_Error" runat="server" CssClass="Windowbutton" 
                   
                    Text="Save" 
                    Width="75px" onclick="Imgbtn_Error_Click" />
    &nbsp;
<asp:Button ID="Button2" runat="server" CssClass="Windowbutton" 
                 
                    Text="Cancel" 
                    Width="75px" onclick="btn_ClearSrcUpload_Click" />
    </td>
     </tr>


</table>
</td>
</tr>


<tr  id="tr_Taxdet" runat="server" visible="false" valign="top" >
<td style="border:thin solid #008080">
<table id="Tab_CurrentYear" runat="server"  style="width:98%;height:100px;"  
        visible="true" align="center" >
<tr valign="top" >
<td colspan="8" >

<div class="div_toprow" >
Current Year
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddTaxDet" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" onclick="btn_AddTaxDet_Click" 
        />
        </span>
</div>
</td>
</tr>
<tr>
<td colspan="8" >
<div style="background-color:#fff;margin-top:-6px;">

<asp:UpdatePanel ID="uptax_entrygrid" runat="server">
<ContentTemplate>
<asp:GridView  ID="gvTaxDetails"  runat="server" AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True" ForeColor="Black"  CellPadding="4"  CssClass="name" 
        BackColor="White" BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px"
       Height="30px" PageSize="6" Width="100%" Font-Bold="false"
        ShowHeaderWhenEmpty="True" Font-Names="Segoe UI" 
        Font-Size="16px"  
        onrowcommand="gvTaxDetails_RowCommand" 
        DataKeyNames="Tax_Id">
        <Columns>
        <asp:TemplateField HeaderText="id" Visible="False" HeaderStyle-CssClass="head-label">
        <ItemTemplate>
        <asp:Label ID="lblTax_Id" runat="server"  Text='<%#Eval("Tax_Id") %>' Visible="false"></asp:Label>
        </ItemTemplate>
        <HeaderStyle CssClass="head_style"   HorizontalAlign="Center"  Height="30px" Font-Bold="True"   />
        <ItemStyle  CssClass="grid-item"   HorizontalAlign="Center"   Width="90px" />
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Tax Type" HeaderStyle-CssClass="head-label">
        
        <ItemTemplate>
        <asp:Label ID="lbl_Tax_Type" Width="90px" runat="server" Text='<%#Eval("Tax_Type") %>'/>
        </ItemTemplate>
       <HeaderStyle CssClass="head_style"   HorizontalAlign="Center" Height="30px" Font-Bold="True"   />
       <ItemStyle  CssClass="grid-item"   HorizontalAlign="Center"   Width="90px" />
       </asp:TemplateField>
                                                              
        
        <asp:TemplateField HeaderText="Tax Year" HeaderStyle-CssClass="head-label">
        
        <ItemTemplate>
        <asp:Label ID="lbl_Tax_Year" Width="40px"  runat="server" Text='<%#Eval("Tax_Year") %>'/></ItemTemplate>
        <HeaderStyle CssClass="head_style"   HorizontalAlign="Center"  Height="30px" Font-Bold="True" />
        <ItemStyle  CssClass="grid-item"   HorizontalAlign="Center"  Width="70px" />
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Period" HeaderStyle-CssClass="head-label">
        
         <ItemTemplate>
         <asp:Label ID="lbl_Tax_Period" Width="90px"  runat="server" Text='<%#Eval("Tax_Period") %>'/>
         </ItemTemplate>
         <HeaderStyle CssClass="head_style"   HorizontalAlign="Center"  Height="30px" Font-Bold="True"  />
<ItemStyle  CssClass="grid-item"    HorizontalAlign="Center"  Width="30px" />

        </asp:TemplateField>
        <asp:TemplateField HeaderText="Base Amt" HeaderStyle-CssClass="head-label">
        
        <ItemTemplate>
        <asp:Label ID="lbl_Tax_Amount" Width="50px"   runat="server" Text='<%#Eval("Tax_Base_Amount") %>'/>
        </ItemTemplate>
        <HeaderStyle CssClass="head_style"   HorizontalAlign="Center"  Height="30px" Font-Bold="True"  />
<ItemStyle  CssClass="grid-item"    HorizontalAlign="Center"  Width="130px" />

        </asp:TemplateField>
                                                              
        <asp:TemplateField HeaderText="Due Dt" HeaderStyle-CssClass="head-label">
        
        <ItemTemplate>
        <asp:Label ID="lbl_Tax_Due_Date" Width="60px"   runat="server" Text='<%#Eval("Tax_Due_Date") %>'/>
        </ItemTemplate>
        <HeaderStyle CssClass="head_style"   HorizontalAlign="Center"  Height="30px" Font-Bold="True"  />
<ItemStyle  CssClass="grid-item"    HorizontalAlign="Center"  Width="100px" />

        </asp:TemplateField>
                                                       
                                                       
                                                      
                                                      
                                                     
                                                       
    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="head-label">
    
    <ItemTemplate>
    <asp:Label ID="lbl_Tax_Status" Width="90px"  runat="server" Text='<%#Eval("Tax_Status") %>'/>
    </ItemTemplate>
    
    <HeaderStyle CssClass="head_style"   HorizontalAlign="Center"  Height="30px" Font-Bold="True"  />
<ItemStyle  CssClass="grid-item"    HorizontalAlign="Center"  Width="30px" />

    </asp:TemplateField>
                                                       
                                                       
    <asp:TemplateField HeaderText="Paid Amt" HeaderStyle-CssClass="head-label">
    
    <ItemTemplate>
    <asp:Label ID="lbl_Tax_Paid_Amount" Width="50px"  runat="server" Text='<%#Eval("Tax_Paid_Amount") %>'/>
    </ItemTemplate>
    <HeaderStyle Height="30px" Font-Bold="True"   HorizontalAlign="Center" />
    <ItemStyle  CssClass="grid-item"   HorizontalAlign="Center"  Width="130px" />
    </asp:TemplateField>
                                                           
    <asp:TemplateField HeaderText="Paid Dt" HeaderStyle-CssClass="head-label" >
    
    <ItemTemplate>
    <asp:Label ID="lbl_Tax_Paid_Date" Width="60px"  runat="server" Text='<%#Eval("Paid_Date") %>'/>
    </ItemTemplate>
    <HeaderStyle CssClass="head_style"   HorizontalAlign="Center"  Height="30px" Font-Bold="True"   />
    <ItemStyle  CssClass="grid-item"    HorizontalAlign="Center"  Width="130px" />
    </asp:TemplateField >

    <asp:TemplateField HeaderText="View" HeaderStyle-CssClass="head-label" >
   
<ItemTemplate>
<asp:ImageButton ID="imgbtnUpdate" runat="server" CommandName="Update" Height="20px" 
                                                            ImageUrl="~/images/Gridview/Save.png" ToolTip="Update" Width="20px" />
</ItemTemplate>
<HeaderStyle  HorizontalAlign="Center"  Height="30px" Font-Bold="True"  />
<ItemStyle  CssClass="grid-item"   HorizontalAlign="Center"    Width="50px" />
    </asp:TemplateField>
            
                                                       

    <asp:TemplateField HeaderStyle-CssClass="head-label" HeaderText="Delete">
    
    <ItemTemplate>
  
    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server" ImageUrl="~/images/Gridview/Remove-icon.png"  OnClientClick="javascript:return confirm('Are you sure to proceed?');" ToolTip="Delete" Height="20px" Width="20px" />
    </ItemTemplate>
        <HeaderStyle CssClass="head_style"   HorizontalAlign="Center"  Height="30px" Font-Bold="True"  />
<ItemStyle  CssClass="grid-item"    HorizontalAlign="Center"  Width="30px" />

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
</ContentTemplate>
</asp:UpdatePanel>
</div>
</td>
</tr>



<tr><td colspan="8"><br/></td></tr>
<tr id="tr_TaxDataRow" runat="server" visible="false">
<td style="width: 189px"><asp:Label ID="Label83" runat="server"  CssClass="Label" Text="Tax Type"></asp:Label></td>
<td style="width: 163px">
    <asp:DropDownList ID="ddl_Tax_Type_Entry" runat="server" CssClass="textbox" 
        Width="150px"></asp:DropDownList></td>
<td style="width: 212px"><asp:Label ID="Label85" runat="server"  CssClass="Label" 
        Text="Tax Year"></asp:Label></td>
<td style="width: 166px">
    <asp:TextBox ID="txt_Tax_Year" runat="server" 
        CssClass="textbox" Width="140px" /></td>
<td style="width: 172px"><asp:Label ID="Label841" runat="server"  CssClass="Label" 
        Text="Year Type"></asp:Label></td>
<td style="width: 169px">
   <asp:DropDownList ID="ddl_Tax_Year_Type" 
                                                                          
       CssClass="textbox" 
        Width="150px"   runat="server"></asp:DropDownList></td>
<td style="width: 171px"><asp:Label ID="Label86" runat="server"  CssClass="Label" Text="Period"></asp:Label></td>
<td style="width: 210px">
    <asp:DropDownList ID="ddl_Tax_Period_Entry" runat="server" CssClass="textbox" 
        Width="150px"></asp:DropDownList></td>
</tr>
<tr id="tr_TaxDataRow1" runat="server" visible="false">
<td style="width: 189px"><asp:Label ID="Label87" runat="server"  CssClass="Label" Text="Base Amount" /></td>
<td style="width: 163px"><asp:TextBox ID="txt_Tax_Amount_Entry" runat="server" 
        CssClass="textbox" Width="140px" /></td>
<td style="width: 212px"><asp:Label ID="Label88" runat="server"  CssClass="Label" Text="Due Date" /></td>
<td style="width: 166px"><asp:TextBox ID="txt_Tax_Due_Date_Entry" runat="server" 
        CssClass="textbox"  TabIndex="6" 
        style="text-transform:uppercase;" Width="140px" 
                                                              
        meta:resourcekey="txt_DueDateResource1"></asp:TextBox>
                                                               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" 
                                                              Enabled="True" 
        FilterType="Custom, Numbers" TargetControlID="txt_Tax_Due_Date_Entry" 
                                                              ValidChars="_/">
                                                          </cc1:FilteredTextBoxExtender>
                                                          <cc1:CalendarExtender ID="CalendarExtender9" runat="server" 
                                                              CssClass="black" 
        Enabled="True" Format="MM/dd/yyyy" 
                                                              
        TargetControlID="txt_Tax_Due_Date_Entry">
                                                          </cc1:CalendarExtender></td>
<td style="width: 172px"><asp:Label ID="Label89" runat="server"  CssClass="Label" Text="Disc Y/N" /></td>
<td style="width: 169px">
    <asp:DropDownList ID="ddl_Discount_Entry" runat="server" CssClass="textbox" 
        Width="150px"></asp:DropDownList></td>
<td style="width: 171px"><asp:Label ID="Label90" runat="server"  CssClass="Label" Text="Disc Amount" /></td>
<td style="width: 210px"><asp:TextBox ID="txt_Tax_Discount_Amount_Amount_Entry" 
        runat="server" CssClass="textbox" Width="140px" /></td>
</tr>
<tr id="tr_TaxDataRow2" runat="server" visible="false">
    
<td style="width: 189px"><asp:Label ID="Label91" runat="server"  CssClass="Label" Text="Disc Date" /></td>
<td style="width: 163px"><asp:TextBox ID="txt_Tax_Entry_Discount_Date" 
        runat="server" CssClass="textbox" 
        Width="140px" />
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                                                              Enabled="True" 
        FilterType="Custom, Numbers" TargetControlID="txt_Tax_Entry_Discount_Date" 
                                                              ValidChars="_/">
                                                          </cc1:FilteredTextBoxExtender>
                                                          <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                                            
        Enabled="True" Format="MM/dd/yyyy" 
                                                              
        TargetControlID="txt_Tax_Entry_Discount_Date">
                                                          </cc1:CalendarExtender>
        </td>
<td style="width: 212px"><asp:Label ID="Label92" runat="server"  CssClass="Label" Text="Status" /></td>
<td style="width: 166px">
    <asp:DropDownList ID="ddl_Tax_Status_Entry" runat="server" CssClass="textbox" 
        Width="150px" /></td>
<td style="width: 172px"><asp:Label ID="Label93" runat="server"  CssClass="Label" Text="Paid Amount" /></td>
<td style="width: 169px"><asp:TextBox ID="txt_Tax_Paid_Amount_Amount_Entry" 
        runat="server" CssClass="textbox" Width="140px" /></td>
<td style="width: 171px"><asp:Label ID="Label94" runat="server"  CssClass="Label" Text="Paid Date" /></td>
<td style="width: 210px"><asp:TextBox ID="txt_Tax_Entry_Paid_Date" runat="server" 
        CssClass="textbox"  TabIndex="6" 
        style="text-transform:uppercase;" Width="140px" 
                                                              
        meta:resourcekey="txt_PaidDateResource1"></asp:TextBox>
                                                               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" 
                                                              Enabled="True" 
        FilterType="Custom, Numbers" TargetControlID="txt_Tax_Entry_Paid_Date" 
                                                              ValidChars="_/">
                                                          </cc1:FilteredTextBoxExtender>
                                                          <cc1:CalendarExtender ID="CalendarExtender10" runat="server" 
                                                              CssClass="black" 
        Enabled="True" Format="MM/dd/yyyy" 
                                                              
        TargetControlID="txt_Tax_Entry_Paid_Date">
                                                          </cc1:CalendarExtender></td>

</tr>

<tr id="tr_TaxDataRow3" runat="server" visible="false">
<td style="width: 189px"><asp:Label ID="Label42" runat="server"  CssClass="Label" 
        Text="Payoff Amount1" /></td>
<td style="width: 163px"><asp:TextBox ID="txt_PayoffAmt1" runat="server" CssClass="textbox" 
        Width="140px" /></td>
<td style="width: 212px"><asp:Label ID="Label43" runat="server"  CssClass="Label" Text="G.T Date1" /></td>
<td style="width: 166px"><asp:TextBox ID="txt_GTDt1" runat="server" CssClass="textbox"  TabIndex="6" 
        style="text-transform:uppercase;" Width="140px" 
                                                              
        meta:resourcekey="txt_GTDtResource1"></asp:TextBox>
                                                               <cc1:FilteredTextBoxExtender ID="txt_GTDt1FilterBox" runat="server" 
                                                              Enabled="True" FilterType="Custom, Numbers" TargetControlID="txt_GTDt1" 
                                                              ValidChars="_/">
                                                          </cc1:FilteredTextBoxExtender>
                                                          <cc1:CalendarExtender ID="txt_GTDt1Calendar" runat="server" 
                                                              CssClass="black" Enabled="True" Format="MM/dd/yyyy" 
                                                              TargetControlID="txt_GTDt1">
                                                          </cc1:CalendarExtender></td>

                                                          <td>
                                                          <asp:Label ID="Label536" runat="server"  CssClass="Label" 
        Text="Payoff Amount2" />
                                                          </td>
                                                          <td>
                                                          <asp:TextBox ID="txt_PayoffAmt2" runat="server" CssClass="textbox" 
        Width="140px" />
                                                          </td>
                                                          <td>
                                                          <asp:Label ID="Labelhj" runat="server"  CssClass="Label" 
        Text="G.T Date2" />
                                                          </td>
                                                          <td>
                                                         <asp:TextBox ID="txt_GTDt2" runat="server" CssClass="textbox"  TabIndex="6" 
        style="text-transform:uppercase;" Width="140px" 
                                                              
        meta:resourcekey="txt_GTDtResource2"></asp:TextBox>
                                                               <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" 
                                                              Enabled="True" FilterType="Custom, Numbers" TargetControlID="txt_GTDt2" 
                                                              ValidChars="_/">
                                                          </cc1:FilteredTextBoxExtender>
                                                          <cc1:CalendarExtender ID="CalendarExtender3" runat="server" 
                                                              CssClass="black" Enabled="True" Format="MM/dd/yyyy" 
                                                              TargetControlID="txt_GTDt2"></cc1:CalendarExtender>
                                                          </td>
</tr>
<tr id="tr_TaxDataRow4" runat="server" visible="false">
<td align="right" colspan="7">
    &nbsp;</td>
<td align="center" style="width: 210px" >
<asp:Button ID="btn_TaxSubmit" runat="server" CssClass="Windowbutton" 
                    OnClick="btn_TaxSubmit_Click" 
                    Text="Save" 
                    Width="75px" />
    &nbsp;
<asp:Button ID="imgbtn_Delequent_Tax_Add1" runat="server" CssClass="Windowbutton" 
                    OnClick="imgbtn_Delequent_Tax_Add_Click" 
                    Text="Cancel" 
                    Width="75px" />
    </td>
</tr>
</table>


<table id="Tab_AnnualTax" runat="server"  style="width:98%;height:100px;"  
        visible="true" align="center" >
<tr valign="top" >
<td colspan="8" >

<div class="div_toprow" >
Annual Tax
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddAnnual" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" onclick="btn_AddAnnual_Click" 
        />
        </span>
</div>
</td>
</tr>
<tr><td colspan="8"><br/></td></tr>
<tr>
<td colspan="8" >
<div style="background-color:#fff;margin-top:-6px;">
<asp:GridView ID="Grd_Annual_Tax" runat="server" AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True"   CssClass="name" CellPadding="4" Height="30px" PageSize="4" Width="100%" 
                                                                   DataKeyNames="Order_Id"  
                                                                     
        ShowHeaderWhenEmpty="True" >
                                                                    
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.No" SortExpression="Order_Number" HeaderStyle-CssClass="head-label">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblsi1" runat="server" Text="<%# Container.DataItemIndex + 1 %>"> </asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                                                                            <ItemStyle  CssClass="grid-item"  HorizontalAlign="Center" Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Tax Type" SortExpression="Tax_Type" HeaderStyle-CssClass="head-label">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblTax_Type1" runat="server" 
                                                                                    Text='<%#Eval("Tax_Type") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                                                                            <ItemStyle  CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Tax Period" SortExpression="Tax_Period" HeaderStyle-CssClass="head-label">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblTax_Period0" runat="server" 
                                                                                    Text='<%#Eval("Tax_Period") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                                                                            <ItemStyle CssClass="grid-item"  HorizontalAlign="Center" Width="100px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Paid Amount" SortExpression="Loan_Number" HeaderStyle-CssClass="head-label">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblTaxTotal_Paid_Amount" runat="server"
                                                                                    Text='<%#Eval("Tax_Paid_Amount") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
                                                                            <ItemStyle  CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
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

<tr id="tr_Annual" runat="server" visible="false">
                                                            <td style="width: 60px">
                                                                <asp:Label ID="Label537" runat="server" CssClass="Label" Text="Tax Year"></asp:Label>
                                                            </td>
                                                            <td style="width: 139px">
                                                                <asp:TextBox ID="txt_Annual_Tax_Year" runat="server" 
                                                                    CssClass="textbox" TabIndex="14" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 135px">
                                                                <asp:Label ID="Label439" runat="server" CssClass="Label" Text="Tax Base Amount"></asp:Label>
                                                            </td>
                                                            <td style="width: 160px">
                                                                <asp:TextBox ID="txt_Annual_BaseAmount" runat="server" 
                                                                    CssClass="textbox" TabIndex="14" 
                                                                    Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 150px">
                                                                <asp:Label ID="Label840" runat="server" CssClass="Label" 
                                                                    Text="Total Paid Amount"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_Annual_Tot_PaidAmount" runat="server" 
                                                                    CssClass="textbox" TabIndex="14" 
                                                                    Width="100px"></asp:TextBox>
                                                            </td>
                                                        </tr>
  <tr id="tr_Annual1" runat="server" visible="false">
                                                    <td align="right" colspan="6">
                                                         <asp:Button ID="btn_SubmitAnnual" runat="server"   CssClass="Windowbutton" 
                                                             Text="Submit" onclick="btn_SubmitAnnual_Click" Visible="False" /></td>
                                                    </tr>
</table>



<table id="Tab_Comment" runat="server"  style="width:98%;height:100px;"  
        visible="true" align="center" >
<tr valign="top" >
<td colspan="8" >

<div class="div_toprow" >
Comment
<span class="div_topplus" >
<asp:ImageButton ID="btn_Comment" runat="server" 
        ImageUrl="~/images/Gridview/plus-32.png" Width="16px" Height="16px" onclick="btn_Comment_Click" 
        />
        </span>
</div>
</td>
</tr>
<tr><td colspan="8"><br/></td></tr>
<tr>
<td colspan="8" >
<div style="background-color:#fff;margin-top:-6px;">

<asp:UpdatePanel ID="UpdatePanel4" runat="server">
<ContentTemplate>
<asp:GridView ID="Grid_Comments" runat="server" AutoGenerateColumns="False"   HorizontalAlign="Center" 
   AllowPaging="True"   CssClass="name" CellPadding="4" Height="30px" PageSize="3" Width="100%" 
                DataKeyNames="Comment_Id" >
                <Columns>
                   
                          <asp:TemplateField Visible="false" ><ItemTemplate><asp:Label 
                                                                  ID="lblComment_Id" runat="server" Visible="false" CssClass="Label" 
                                                                  Text='<%#Eval("Comment_Id") %>'></asp:Label></ItemTemplate>
<HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
<ItemStyle CssClass="grid-item"  HorizontalAlign="Center"  />
</asp:TemplateField>
                                <asp:TemplateField HeaderText="Comments" HeaderStyle-CssClass="head-label">
                                  <ItemTemplate>
                                 
                                 <table>
                                 <tr>
                                 <td style="width:500px;" align="left" valign="top">  
                                 <asp:Label  ID="lblComment" CssClass="grid-item" runat="server" Text='<%#Eval("Comment") %>'></asp:Label></td>
                                    <td align="right">by:<asp:Label ID="lbl_Coomentuser" runat="server" ForeColor="Red" Text='<%# Eval("User_Name") %>' > </asp:Label></td>
                                 </tr>
                               
                                 </table>
                          </ItemTemplate>
                          <HeaderStyle CssClass="head_style" HorizontalAlign="Center"  Height="30px" />
<ItemStyle CssClass="grid-item"  HorizontalAlign="Center"  />
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
</ContentTemplate>
</asp:UpdatePanel>
</div>
</td>
</tr>


<tr id="tr_cmt" runat="server" visible="false">
<td style="width: 84px">
                                                 <asp:Label ID="lbl_CurrentYear" runat="server" CssClass="Label" 
                                                                                    Text="Current Year"></asp:Label>
                                                </td>
                                                    <td style="width: 40px">

                                                        <asp:TextBox ID="txt_CurrentYear_Comments" style="text-transform:uppercase;"  runat="server" 
                                                            CssClass="textbox" 
                                                            TabIndex="16"  Width="700px" Height="40px" TextMode="MultiLine"></asp:TextBox>

                                                       </td>
</tr>
<tr id="tr_cmt1" runat="server" visible="false">

                                                        <td>
                                                            <asp:Label ID="lbl_CurrentYear0" runat="server" CssClass="Label" 
                                                                Text="Annual Tax"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Annual_Comments" style="text-transform:uppercase;" runat="server" 
                                                                CssClass="textbox" 
                                                                TabIndex="16" Width="700px" Height="40px" TextMode="MultiLine"></asp:TextBox>
                                                        </td>
</tr>
<tr id="tr_cmt2" runat="server" visible="false">
                                                        <td>
                                                            <asp:Label ID="lbl_CurrentYear1" runat="server" CssClass="Label" 
                                                                Text="Prior Year"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txt_PriorYear_Comments" style="text-transform:uppercase;" runat="server" 
                                                                CssClass="textbox" 
                                                                TabIndex="16"  Width="700px" Height="40px" TextMode="MultiLine"></asp:TextBox>
                                                        </td>
</tr>
                                                        
<tr id="tr_cmt3" runat="server" visible="false">
                                                    <td align="right" colspan="6">
                                                         <asp:Button ID="btn_Submit_Comments" runat="server"   CssClass="Windowbutton" 
                                                             Text="Submit Comments" onclick="btn_Submit_Comments_Click" /></td>
</tr>
                                  


</table>
</td>
</tr>

</table>
</div>

<asp:LinkButton ID="LinkBtn_Tax_Sales" runat="server"></asp:LinkButton>
              <cc1:ModalPopupExtender ID="ModalPopupExtend_Preview" BackgroundCssClass="ModalPopupBG"
            runat="server" CancelControlID="btn_Tax_Sale_cancel"  TargetControlID="LinkBtn_Tax_Sales"
            PopupControlID="DivTax_Sales" Drag="true">
        </cc1:ModalPopupExtender>
     
             <div id="DivTax_Sales" align="center"  class="popupConfirmation">
           
           <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
            
                      
              <ContentTemplate>
            
               
           
                <div class="DivContentBody" style="width:1000px;height:550px">
                   
        		<div id="signup-header" style="width:950px;height:30px">
				<h3>Output Preview	</h3>
                </div>
                <div id="Div1" style="width:50px;height:30px;margin-top:-30px;float:right">
                    <asp:ImageButton ID="btn_AddPreview" runat="server" ImageUrl="~/images/close.png" Width="16px" Height="16px" />
				</div>
                    
                <div id="body_sign">
                </div>
		
                             
              </div>
                
                         
                        
                    
               
                </ContentTemplate>
                
                </asp:UpdatePanel>
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

