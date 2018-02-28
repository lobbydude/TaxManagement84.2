<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="src_Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Bootstrap 3, from LayoutIt!</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

	<!--link rel="stylesheet/less" href="less/bootstrap.less" type="text/css" /-->
	<!--link rel="stylesheet/less" href="less/responsive.less" type="text/css" /-->
	<!--script src="js/less-1.3.3.min.js"></script-->
	<!--append ‘#!watch’ to the browser URL, then refresh the page. -->
	
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" />

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="img/favicon.png" />
  
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
    <script type="text/javascript">
        function section() {
            
        }
    </script>
</head>

<body>
<form id="form1" runat="server">
    <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="update" runat="server" UpdateMode="Always"><ContentTemplate>
    <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="tabbable" id="tabs-303912">
				<ul class="nav nav-tabs">
					<li  class="active">
						<a href="#panel-505369"  data-toggle="tab">Section 1</a>
					</li>
					<li >
						<a href="#panel-235561" data-toggle="tab">Section 2</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-505369">
						<p>
							<table id="Order_Kb" runat="server" style="width:98%;height:80px;vertical-align: top;" align="center">
<tr >
<td colspan="4" valign="top">

<div class="div_toprow" >
Order Kb Details
<span class="div_topplus" >
<asp:ImageButton ID="btn_AddOrder" runat="server" 
        ImageUrl="" Width="16px" Height="16px" />
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
        ShowHeaderWhenEmpty="True" Font-Bold="False" Font-Names="Segoe UI" 
        Font-Size="16px" >
                                      
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
<tr id="tr_OrderKb" runat="server" >
<td valign="top" style="width: 160px" ><asp:Label ID="Label8" runat="server" CssClass="Label" Text="Document"></asp:Label></td>
<td style="width: 243px" ><asp:Label ID="Label9" runat="server" CssClass="Label" Text="Comments"></asp:Label></td>
<td style="width: 328px"><asp:Label ID="Label27" runat="server" CssClass="Label" Text="Upload Document"></asp:Label></td>
<td rowspan="2" width="600px">
<asp:Button ID="img_btn_order_kb_add" runat="server" CssClass="WebButton" 
                    Text="Save" 
                    Width="75px" TabIndex="4" />

<asp:Button ID="img_btn_order_kb_Cancel" runat="server" CssClass="WebButton" 
                    Text="Cancel" 
                    Width="75px" TabIndex="5" />

</td>
</tr>

<tr id="tr_OrderKb1" runat="server" >
<td valign="top" style="width: 160px">
<asp:TextBox ID="txt_order_Kb_Document" runat="server" CssClass="textbox" 
        style="text-transform:uppercase;" Width="150px" TabIndex="1"></asp:TextBox>
</td>
<td valign="top" style="width: 243px">
    <asp:TextBox ID="txt_order_Kb_Comment" runat="server" CssClass="textbox" 
        placeholder="Type Comments here"  Width="647px" Height="25px" TabIndex="2"></asp:TextBox>
    </td>
<td valign="top" style="width: 328px"><asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:FileUpload ID="fileupload1" runat="server" CssClass="textbox" 
            TabIndex="3" />
    </ContentTemplate>
    <triggers>
<asp:PostBackTrigger ControlID="img_btn_order_kb_add"></asp:PostBackTrigger></triggers></asp:UpdatePanel>
</td>

</tr>

</table>
						</p>
					</div>
					<div class="tab-pane active" id="panel-235561">
						<p>
							hai how r u<br>
						</p>
					</div>
				</div>
			</div>
			<div class="progress">
                            <div class="progress-bar" role="progressbar" style="margin:0 auto;width: 30%;">60% Complete</div>
                        </div>
		</div>
	</div>
</div>
</ContentTemplate></asp:UpdatePanel>
    </form>
</body>
</html>
