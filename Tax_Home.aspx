<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tax_Home.aspx.cs" Inherits="Tax_Home" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TaxPlorer</title>

<meta name="keywords" content="drnds" />
<meta name="description" content="drnds" />

<meta name="copyright" content="&copy; 2004-2013" />


<!-- HOme Design-->
<link rel="Stylesheet" type="text/css" href="src/css/bootstrap.min.css" />
<link rel="Stylesheet" type="text/css" href="src/css/style.css" />
    <link href="src/css/bootstrap.css" rel="stylesheet" type="text/css" />

    <!--New Score Board Css-->
 <link href="New_Dashcss/style.css" rel="stylesheet" type="text/css" />


 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

	
 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


	<!-- custom fonts -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>

	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <!-- Ending New Score Board Css-->

 <script src="src/js/jquery.min.js" type="text/javascript"></script>
    <script src="src/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="src/js/scripts.js" type="text/javascript"></script>

    <link href="src/css/style%20(2).css" rel="stylesheet" type="text/css" />
    <link href="src/css/responsive.css" rel="stylesheet" type="text/css" />

    <link href="Styles/tabcontent.css" rel="stylesheet" type="text/css" />
   
<link href="Styles/ControlsStyle.css" rel="Stylesheet" type="text/css" />
<link href="Styles/popmodal.css" rel="Stylesheet" type="text/css" />
 <link href="AdminStyle/WebHRStyleSheet.css" rel="stylesheet" type="text/css" />
<link href="AdminStyle/stylesheet.css" type="text/css" rel="stylesheet" />
<link href="AdminStyle/WebHRSprites.css" type="text/css" rel="stylesheet" />
<link href="AdminStyle/WebHRButtons.css" type="text/css" rel="stylesheet" />
<link href="AdminStyle/style.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyle/Fonts.css" rel="stylesheet" type="text/css" />
     <link href="AdminStyle/Calcender.css" rel="stylesheet" type="text/css" />

        <link href="AdminStyle/JqueryCalender.css" rel="stylesheet" type="text/css" />
           <script src="AdminJs/jquery-1.3.2.min.js" type="text/javascript"></script>
           <script src="AdminJs/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
    <script src="AdminJs/script_color.js" type="text/javascript"></script>
    <script src="AdminJs/search_script.js" type="text/javascript"></script>
<link rel="stylesheet" href="AdminStyle/jQueryUI.css" />
<link media="screen" rel="stylesheet" href="AdminStyle/jQueryColorbox.css" />
<link type="text/css" rel="stylesheet" href="AdminStyle/cssWebHR.css" />

   <link href="AdminStyle/ScrollBar.css" rel="stylesheet" type="text/css" />
 <script src="AdminJs/jQuery.js" type="text/javascript"></script>
    <link href="AdminStyle/DashboardStyle.css" rel="stylesheet" type="text/css" />
<script type="text/jscript" src="AdminJs/jQueryUI.js"></script>
<script language="JavaScript" type="text/javascript" src="AdminJs/jsWebHR.js"></script>
<script type="text/jscript" src="AdminJs/jsHRMS.js"></script>
	<script src="AdminJs/Backtotop.js" type="text/jscript"></script>

 <script type="text/jscript">
     jQuery(document).ready(function () {
         var offset = 220;
         var duration = 500;
         jQuery(window).scroll(function () {
             if (jQuery(this).scrollTop() > offset) {
                 jQuery('.back-to-top').fadeIn(duration);
             } else {
                 jQuery('.back-to-top').fadeOut(duration);
             }
         });

         jQuery('.back-to-top').click(function (event) {
             event.preventDefault();
             jQuery('html, body').animate({ scrollTop: 0 }, duration);
             return false;
         })
     });
		</script>
        	


        <script type="text/javascript" language="javascript">
            function DisableBackButton() {
                window.history.forward()
            }
            DisableBackButton();
            window.onload = DisableBackButton;
            window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
            window.onunload = function () { void (0) }
          </script>
         <script type="text/javascript">
             function PostToNewWindow() {
                 originalTarget = document.forms[0].target;
                 document.forms[0].target = '_blank';
                 window.setTimeout("document.forms[0].target=originalTarget;", 300);
                 return true;
             }
</script>	
       <script language="javascript" type="text/javascript">
        function show()
        {
              document.write("<head id="Head1" runat='server'></head>");
        }


      
        
</script>
</head>
<body style="background: url(http://images.webhr.co/Background.png);" >

<script type="text/javascript">
    $(document).ready(function () { $("[data-slidepanel]").slidepanel({ orientation: "right", mode: "push" }); });
</script>


   <style type="text/css">

		.column { width: 33.3%; float: left; padding-bottom: 100px; }
		.portlet { margin: 0 1em 1em 0; }
		.portlet-header {  font-family:'ProximaNova-Light',Arial; font-size:20px; font-weight:normal; margin: 0.3em; padding-bottom: 4px; padding-left: 0.2em; }
		.portlet-header .ui-icon { display:none; float: right; }
		.portlet-content { padding: 0.4em; }
		.ui-sortable-placeholder { border: 1px dotted black; visibility: visible !important; height: 50px !important; }
		.ui-sortable-placeholder * { visibility: hidden; }
		</style>
		<script type="text/javascript">
		    var cols = jQuery.parseJSON('{"prtColumn1":["prt1","prt2","prt3"],"prtColumn2":["prt4","prt5","prt6","prt7"],"prtColumn3":["prt8"]}');
		    $(function () {
		        $(".column").sortable({
		            connectWith: ".column",
		            //change: function(event, ui) { },
		            //update: function () {  }
		            create: function () { var colid = this.id; var col = cols[colid]; $.each(col, function (index, value) { $("#" + value).appendTo($("#" + colid)); }); },
		            update: function () {
		                $.get("../home/pages.php?page=Dashboard_Portlets", { col: this.id, sort: $(this).sortable("toArray").toString() });
		            }
		        });

		        $(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ")
		        //.find(".portlet-header")
		        //.addClass("ui-widget-header") 
		        //.prepend('<span class="ui-icon ui-icon-minus"></span>')
		        //.end()
				.find(".portlet-content");

		        //$(".portlet-header .ui-icon").click(function() {
		        //	$(this).toggleClass("ui-icon-minus").toggleClass("ui-icon-plus");
		        //	$(this).parents(".portlet:first").find(".portlet-content").toggle();
		        //});

		    });
		</script>
		
		<script>
		    var aEmployeeInfo = Array();
		    $(function () {
		        aEmployeeInfo["Inbox_NewMessages"] = 0;
		        aEmployeeInfo["Notifications"] = 0;

		        if (aEmployeeInfo["Inbox_NewMessages"] > 0) {
		            $("#divInboxBubble").show();
		            $("#divInboxBubble").html(aEmployeeInfo["Inbox_NewMessages"]);
		        }

		        if (aEmployeeInfo["Notifications"] > 0) {
		            $("#divNotificationsBubble").show();
		            $("#divNotificationsBubble").html(aEmployeeInfo["Notifications"]);
		        }

		        //setTimeout(function(){ alert(0); }, 20000);
		    });
		</script>
        <style type="text/css">
 div#menu li { background: url() 98% 4px no-repeat; }
 .WebHRMenu 
 {
     width:100%;
      height:41px;   
            background: #008853;
  background-image: -webkit-linear-gradient(top, #008853, #007749);
  background-image: -moz-linear-gradient(top, #008853, #007749);
  background-image: -ms-linear-gradient(top, #008853, #007749);
  background-image: -o-linear-gradient(top, #008853, #007749);
  background-image: linear-gradient(to bottom, #008853, #007749);
  
}
 .WebHRSearch { font-family:Trebuchet MS, Arial; font-size:11px; color:#ffffff; padding-left:5px; width:100px; margin-top:8px; height:19px; border:0px; background:url(../images/Template/Blue/search_left.png); outline:none; }
</style>
  <form id="form1"  data-ajax="false" runat="server">
  <div>
  <div>
<div class="WebHRMenu">

 <div style="width:95%;margin: 0px auto;">
  <div style="float:left; width:600px;">
   
   <div id="menu">
    <ul class="menu">
     <li class="current">
     <a>
     <asp:LinkButton ID="lnk_Home" runat="server" CssClass="linkLabel"  onclick="lnk_Home_Click"><span >Home
         </span></asp:LinkButton>
     </a>
     </li>

     <li id="limasters" runat="server"><a class="linkLabel" href="#" ><span>Masters</span></a>
	
        <ul style="width:450px; height:140px; background:url(AdminImage/menulist_1.jpg);">
           
      <li>
      <div style="margin-top:5px; clear:both;"></div>
          
	    <div class="iemployeetrainings" 
              style="float:left; margin-left:10px; width: 10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Create_Company.aspx">Company</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Create_Branch.aspx">Branch</a></div>
    	<div style="margin-top:34px; clear:both;"></div>
	    <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Create_Client.aspx">Client Name</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Create_Order_Type.aspx">Order Type</a></div>
    	<div style="margin-top:64px; clear:both;"></div>
      <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Create_SubProcess.aspx">Sub Process</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Create_Order_Status.aspx">Order Status</a></div>
         <div style="margin-top:94px; clear:both;"></div>
         <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Tax_AssesmentLink.aspx">Tax Assesment</a></div>
   <div style="margin-top:124px; clear:both;"></div>
      </li>
	  </ul>
     </li>
     <li id="li_users" runat="server" ><a class="linkLabel" href="Admin/User_Create.aspx"><span>Users</span></a>
	  <ul style="width:450px; height:75px; background:url(AdminImage/menulist_1.jpg);">
        
      <li>
		

	    <div style="margin-top:5px; clear:both;"></div>
	    <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/User_Create.aspx">Create Users</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/ActiveInactiveusers.aspx">Deactive Users</a></div>
    	<div style="margin-top:34px; clear:both;"></div>
      <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Create_UserRole.aspx">Create User Role</a></div>
	       <div style="margin-top:64px; clear:both;"></div>
      </li>
	  </ul>
	 </li>
	    <li id="liTax_Masters" runat="server" ><a class="linkLabel" href="#"><span>Tax Masters</span></a>
	  <ul style="width:450px; height:55px; background:url(AdminImage/menulist_1.jpg);">
      <li>
		

	    <div style="margin-top:5px; clear:both;"></div>
	    <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Import_County_Database_Information.aspx">Import County Database</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="Admin/Tax_Info.aspx">Tax Master</a></div>
    	<div style="margin-top:34px; clear:both;"></div>
    
      </li>
	  </ul>
	 </li>
     <li id="liReports" runat="server" class="parent"><a class="linkLabel" href="Admin/User_Production_Report.aspx"><span>Reports</span></a>
	  <ul style="width:270px; height:85px; background:url(AdminImage/menulist_1.jpg);">
      <li>

		<div style="margin-top:5px; clear:both;"></div>

           <div class="ireports-hr" style="float:left; margin-left:10px;"></div><div style="width:200px; float:left;"><a class="hrefLabel" href="Reports/Client_Prod_Report.aspx">Client Production Reports</a></div>
              <div style="margin-top:5px; clear:both;"></div>
		<div class="ireports-hr" style="float:left; margin-left:10px;"></div><div style="width:200px; float:left;"><a class="hrefLabel" href="Reports/Tax_Violation_Report.aspx">Client Tax and Violation Reports</a></div>

      </li>
      
	  </ul>
	 </li>

    
    </ul>
   </div>
  </div>

  <div style="float:right;">
   <div id="menu2">
    <ul class="menu2">
	 
	   <li class="last parent" style="padding-top:6px;"><span><asp:Label ID="Label1" runat="server" Text="Last Login:" CssClass="menuLabel" Font-Size="Small" ForeColor="White"></asp:Label></span></li>
       <li class="last parent" style="padding-top:6px;"><span><asp:Label ID="lastlogin" Font-Size="Small" runat="server" CssClass="menuLabel"  ForeColor="White"></asp:Label></span></li>
       <li class="last parent"><asp:Image ID="Img_User" Width="40px" Height="40px" CssClass="User-img" runat="server" /></li>
     <li class="last parent"><a href="#"><span><asp:Label ID="lblusername" CssClass="menuLabel" runat="server"></asp:Label></span></a>
     <ul style="width:250px; height:100px; background:url(AdminImage/menulist_1.jpg);">
         
      <li>
         
	  <table border="0" style="padding-left:0px;" cellspacing="0" cellpadding="4" width="100%">
	   <tr><td><a style="padding-left:0px;" class="hrefLabel" href="Admin/User_Profile.aspx">My Profile</a></td></tr>
	   <tr><td>
          <span> <a style="padding-left:0px;" class="hrefLabel"  href="Admin/Change_Password.aspx">Settings</a></span></td></tr>
             <tr><td>
          <span> <a style="padding-left:0px;" class="hrefLabel"  href="Login.aspx">Log Out</a></span></td></tr>
	  
	  </table>
      </li>
 
	  </ul>
	 </li>
      </ul>
    </div>
    
    
   </div></div>

 </div>
</div>
 
 <div><br /></div>

 <div class="container">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager>
	<div class="row">
		<div class="col-md-12" >
        <asp:UpdatePanel ID="update" runat="server" UpdateMode="Always"><Triggers><asp:PostBackTrigger  ControlID="btn_Export"/></Triggers><ContentTemplate>
       

            <div class="tabbable" id="tabs-303912" >
				<ul class="nav nav-pills" >
					<li id="list_itemque"  runat="server"   >
                    
						<a id="li_queue" runat="server" onclick="queue()" href="#panel_505369"  
                        data-toggle="tab">Order Queue</a>
					</li>
					<li id="list_itemdash" runat="server" >
                    
						<a id="li_dash" runat="server" onclick="score()" href="#panel_235561"
                         data-toggle="tab">Score Board</a>
					</li>
                    <li id="li_Dashboard_12" runat="server" >
                    
						<a id="li_Dashboard" runat="server" onclick="dash()" href="#panel_45454"
                         data-toggle="tab">Dash Board</a>
					</li>
				</ul>
				<div  class="tab-content"  style="width:100%">
                
					    <div class="tab-pane active" id="panel_505369" >
                    <div class="container_12">
                    <div id="divque"  runat="server"  class="grid_12">
                    <asp:UpdatePanel ID="uprbtn" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <table id="table_one" runat="server" style="width:100%">
                                                                                                                    <tr align="right">
                        <td  colspan="2">
                            <asp:Image ID="Image1" runat="server" CssClass="WebHRButtons_Blue" 
                                            Height="15px" Width="20px" />
                                  <asp:Label ID="Label16" runat="server" CssClass="Label" 
                                                                    Text="Tax Certificate"></asp:Label>  
                                                                      <asp:Image ID="Image2" runat="server" CssClass="orange" 
                                            Height="15px" Width="20px" />
                                            
                                             <asp:Label ID="Label18" runat="server" CssClass="Label" 
                                                                    Text=" Code Violation"></asp:Label> 
                                                                           <asp:Image ID="Image3" runat="server" CssClass="green" 
                                            Height="15px" Width="20px" />
                                            
                                             <asp:Label ID="Label11" runat="server" CssClass="Label" 
                                                                    Text=" HOA Payoff"></asp:Label> 
                                                                           <asp:Image ID="Image4" runat="server" CssClass="red" 
                                            Height="15px" Width="20px" />
                                            
                                             <asp:Label ID="Label20" runat="server" CssClass="Label" 
                                                                    Text=" Mortgage Payoff"></asp:Label> 
                        </td>
                     </tr>

     
                                                                                            <tr>
         <td align="right">
        <asp:RadioButton ID="rdo_CurrentOrder" runat="server" Text="Currnet Orders" 
            CssClass="radio"  oncheckedchanged="rdo_CurrentOrder_CheckedChanged" 
            Font-Bold="False" Font-Names="Segoe UI" Font-Size="13px" Width="150px" 
            AutoPostBack="True" Checked="True" TabIndex="1" 
             />&nbsp;&nbsp;
     </td>
         <td align="left">
     <asp:RadioButton ID="rdo_CompletedOrders"  runat="server" Text="Completed Orders" 
            CssClass="radio"  Font-Bold="False" Font-Names="Segoe UI" Font-Size="13px" Width="150px" 
                   oncheckedchanged="rdo_CompletedOrders_CheckedChanged" 
             AutoPostBack="True" TabIndex="2" 
             />
     
    </td>
    </tr>
                  
                            <tr>
                                                 <td colspan="2"><asp:Button ID="btn_refresh" runat="server" CssClass="WebButton" 
                                                            onclick="btn_refresh_Click" Text="Refresh" TabIndex="3" />
                         </td>
                            </tr>
                        </table>
                    </ContentTemplate></asp:UpdatePanel>
               
    
				    <table id="DivView" runat="server" style="width: 100%" >
    
                                                            <tr>
                                                                <td style="width:75px;">
                                                                    <asp:Label ID="lbl_Search_By" runat="server" CssClass="Label" style="font-size:14px" Text="Search"></asp:Label>
                                                                </td>
                                                                <td style="width:150px;">
                                                                    <asp:DropDownList ID="ddl_Search" runat="server"  TabIndex="3" 
                                                                        CssClass="textbox" Visible="False"  >
                                                                        <asp:ListItem>Order Number</asp:ListItem>
                                                                        <asp:ListItem Value="Recived Date">Recived Date</asp:ListItem>
                                                                        <asp:ListItem>Client</asp:ListItem>
                                                                        <asp:ListItem>Sub Client</asp:ListItem>
                                                                        <asp:ListItem>Task</asp:ListItem>
                                                                        <asp:ListItem>Status</asp:ListItem>
                                                                        <asp:ListItem>UserName</asp:ListItem>
                                                                        <asp:ListItem>Order Type</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:TextBox ID="txt_Search_By" runat="server" AutoPostBack="true" Columns="1" 
                                                                        CssClass="searchText" Height="30px" ontextchanged="txt_Search_By_TextChanged" 
                                                                        placeholder="Search here..." TabIndex="4"></asp:TextBox>
                                                                </td>
                                                                <td id="search_m" runat="server" style=" width:350px;">
                                                                  
                                                            <%--     <span>Enter the Name :</span><input type="text" id="txtSearch" />--%>
                                                                </td>
                                                                <%--<td align="left">
                                                                  <asp:Button ID="btn_Order_Search" runat="server" CssClass="WebButton" 
                                                                        onclick="btn_Order_Search_Click" TabIndex="21" Text="Submit" Width="70px" />
                                                                </td>--%>
                                                              
                                         
                                                                <td align="right">
                                                                <asp:Button ID="btn_Order_Import" runat="server" CssClass="GridButton" style="text-align:center"
                                                                         Text="Order Import" Width="107px" 
                                                TabIndex="5" onclick="btn_Order_Import_Click"  />
                                                                    <asp:Button ID="btn_Add_New" runat="server" CssClass="GridButton" 
                                                                        onclick="btn_Add_New_Click" style="text-align:center" TabIndex="5" 
                                                                        Text="Add New Order" Width="107px" />
                                                                <asp:Button ID="btn_Export" runat="server" CssClass="GridButton" style="text-align:center"
                                                                         Text="Order Export" Width="107px" TabIndex="6" 
                                                                        onclick="btn_Export_Click1"  />
                                                                </td>
                                                            </tr>

<tr><td colspan="7">  <br /></td></tr>
            <tr>
            <td colspan="7">
          
            <asp:GridView ID="grd_Orders" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" 
                    CellPadding="4" CssClass="name" GridLines="None" 
                                                    ShowHeaderWhenEmpty="True" Width="100%" AllowPaging="True" 
                                                    onpageindexchanging="grd_Orders_PageIndexChanging" 
                                                    onrowcommand="grd_Orders_RowCommand" 
                    PageSize="50" onrowdatabound="grd_Orders_RowDataBound">
                                                    
                                                    <Columns>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_id" runat="server" 
                                                                    Text='<%#Eval("Order_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle" Height="50px"   HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"  HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                     
                                                      
                                                              <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Order Number">
                                                            <ItemTemplate>
                                                              <asp:Button ID="btn_ClientOrder_Number" runat="server" TabIndex="23" CommandName="EditDetails" Width="150px" Height="28px" CssClass="GridButton" Text='<%# Eval("Client_Order_Number") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px"  VerticalAlign="Middle"/>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Customer" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomer" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Sub Process" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubProcess" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Sub_ProcessName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px"  
                                                                VerticalAlign="Middle"/>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Fields" Visible="False" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Borrower_Addres" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Barrower_Address") %>'></asp:Label>
                                                                       <asp:Label ID="lbl_Borrower_Name" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Borrower_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" VerticalAlign="Middle" Width="150px"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px"  
                                                                VerticalAlign="Middle"/>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Recived Date" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDate" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" Width="150px" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px" />
                                                        </asp:TemplateField>

                                                         <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="State" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblState" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("State_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                           <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="County" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCounty" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("County_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                           <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Order Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Product_Type" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Product_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" Width="150px" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Source Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Location" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" Width="150px" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="150px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Task" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Order_task" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Task") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Status">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Order_Status" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                            </ItemTemplate>
                                                           <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                      <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="User Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUser_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("User_Name") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  
                                                                HorizontalAlign="Center" Width="200px"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="200px" />
                                                        </asp:TemplateField>
                                                       <asp:TemplateField HeaderStyle-CssClass="head-label" HeaderText="Action"> 
                                                            <ItemTemplate>
                                                                <asp:Button ID="btn_Delete" CssClass="GridButton" runat="server" TabIndex="24" BackColor="#EC5E5E" Text="Delete"   OnClientClick="javascript:return confirm('Are you sure to proceed?');" CommandName="DeleteRecord" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="50px"  HorizontalAlign="Center"   />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                      

                                                    </Columns>
                                                    <EmptyDataRowStyle BorderColor="#D9D9D9" BorderStyle="Solid" BorderWidth="1px" BackColor="#f9f9f9" ForeColor="#333333" ></EmptyDataRowStyle>
                                       <FooterStyle BackColor="#cccccc"  ForeColor="White" Font-Bold="True"/>
                                       <HeaderStyle BackColor="#ccc" />
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
            <td colspan="6">
            <br />
            </td>
            </tr>
            </table>
                 
                    
                     <table id="DivCreate"  runat="server" align="center" style="width:90%;" >
                          <tr>
                                        <td  style="width:100%;" align="center">
                                       <h2 class="AdminHeader">
                                               <asp:Label ID="lblhead" runat="server" CssClass="AdminHeader"></asp:Label></h2>
                                         
                                        </td>
                                        <td style=" width:30px;" align="right">
                                            <asp:Button ID="btn_Back" runat="server" CssClass="WebButton" 
                                                onclick="btn_Back_Click" Text="Back" TabIndex="23" />
                                        </td>
                                        
                                       
                                         
                                        
                                    </tr>
                                  
                                    <tr>
                                        <td align="left" colspan="2">
                                          <div id="view1">
                                          <table style="width:100%;" align="center">
                                           
                                    
                                              <tr>
                                                  <td width="150"  >
                                                      <asp:Label ID="Label14" runat="server" CssClass="Label" Text="Customer Name:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td width="250">
                                                      <asp:DropDownList ID="ddl_ClientName" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" 
                                                          onselectedindexchanged="ddl_ClientName_SelectedIndexChanged" TabIndex="1" 
                                                          Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td width="150"  >
                                                      <asp:Label ID="Label52" runat="server" CssClass="Label" 
                                                          Text="Borrower First Name:" Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td width="150">
                                                      <asp:TextBox ID="txt_BorrowerFirstname" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="11" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label19" runat="server" CssClass="Label" 
                                                          Text="Sub Process Name:" Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_SubProcess" runat="server" 
                                                          CssClass="DropDown" TabIndex="2" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label53" runat="server" CssClass="Label" 
                                                          Text="Borrower Last Name:" Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_BorrowerLastname" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="12" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                    
                                   
                                    
                              
                                
                                          
                                    <tr>
                                        <td  >
                                            <asp:Label ID="Label34" runat="server" CssClass="Label" Text="Order Type:" 
                                                Font-Size="14px"></asp:Label>
                                        </td>
                                       
                                        <td >
                                            <asp:DropDownList ID="ddl_Product_Type" runat="server" CssClass="DropDown" 
                                                onselectedindexchanged="ddl_ordertype_SelectedIndexChanged" TabIndex="3" 
                                                Width="210px">
                                            </asp:DropDownList>
                                        </td>
                                       
                                        <td  >
                                            <asp:Label ID="Label60" runat="server" CssClass="Label" Text="State:" 
                                                Font-Size="14px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_State" runat="server" AutoPostBack="True" 
                                                CssClass="DropDown" onselectedindexchanged="ddl_State_SelectedIndexChanged" 
                                                TabIndex="13" Width="210px">
                                            </asp:DropDownList>
                                        </td>
                                       
                                    </tr>
                              
                                
                                     
                                          
                                              <tr>
                                                  <td>
                                                      <asp:Label ID="Label465" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="Order Source Type:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_ordertype" runat="server" CssClass="DropDown" 
                                                          onselectedindexchanged="ddl_ordertype_SelectedIndexChanged" TabIndex="3" 
                                                          Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label61" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="County:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_County" runat="server" AutoPostBack="True" 
                                                          CssClass="DropDown" TabIndex="14" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label36" runat="server" CssClass="Label" 
                                                          Text="Order Number:" Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_OrderNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" Columns="1" 
                                                          Width="200px" TabIndex="4" AutoPostBack="True" 
                                                          ontextchanged="txt_OrderNumber_TextChanged"></asp:TextBox>
                                                              <asp:Image ID="User_Chk_Img" runat="server" 
                                                Height="25px" Width="25px" ImageAlign="Middle" /> 
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label62" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="City :"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_City" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="15" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label37" runat="server" CssClass="Label" Text="Loan Number:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_LoanNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="5" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label63" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="Zip:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_ZipCode" runat="server" CssClass="textbox" TabIndex="16" 
                                                          Width="200px"></asp:TextBox>
                                                      <cc1:FilteredTextBoxExtender ID="txt_ZipCode_FilteredTextBoxExtender" 
                                                          runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                          TargetControlID="txt_ZipCode" ValidChars="">
                                                      </cc1:FilteredTextBoxExtender>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      <asp:Label ID="Label45" runat="server" CssClass="Label" Text="Phone Number:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_PhoneNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="6" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label59" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="Borrower Address:"></asp:Label>
                                                  </td>
                                                  <td >
                                                      <asp:TextBox ID="txt_BarrowerAddress" runat="server" CssClass="textbox" 
                                                         style="text-transform:uppercase;" TabIndex="17" Width="200px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      <asp:Label ID="Label46" runat="server" CssClass="Label" Text="Contract Number:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_ContractNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="7" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label31" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="Task"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_ordersTask" runat="server" CssClass="DropDown" 
                                                          TabIndex="18" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      <asp:Label ID="Label47" runat="server" CssClass="Label" Text="Batch Number:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_BatchNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="8" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label67" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="Status:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_orderstatus" runat="server" CssClass="DropDown" 
                                                          TabIndex="19" Width="210px">
                                                      </asp:DropDownList>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td  >
                                                      <asp:Label ID="Label66" runat="server" CssClass="Label" Text="Parcel Number:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_ParcelNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform: uppercase;" TabIndex="9" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label464" runat="server" CssClass="Label" Font-Size="14px" 
                                                          Text="Notes:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Notes" runat="server" CssClass="textbox" Height="80px" 
                                                          style="text-transform: uppercase;" TabIndex="20" Width="300px"></asp:TextBox>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      <asp:Label ID="Label65" runat="server" CssClass="Label" Text="Date:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Date" runat="server" CssClass="textbox" 
                                                          style="text-transform: uppercase;" TabIndex="10" Width="200px"></asp:TextBox>
                                                      <cc1:FilteredTextBoxExtender ID="txt_Date_FilteredTextBoxExtender" 
                                                          runat="server" Enabled="True" FilterType="Custom, Numbers" 
                                                          TargetControlID="txt_Date" ValidChars="_/">
                                                      </cc1:FilteredTextBoxExtender>
                                                      <cc1:CalendarExtender ID="txt_Date_CalendarExtender" runat="server" 
                                                          Enabled="True" Format="dd/MM/yyyy" TargetControlID="txt_Date">
                                                      </cc1:CalendarExtender>
                                                  </td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td align="top">
                                                      &nbsp;</td>
                                              </tr>
                                     
                                  
                                          
                                           <tr style="display:none;">
                                        <td align="left" colspan="2">

                                          <h4 class="adminheading">Additional Information</h4>
                                         </td>
                                       
                                    </tr> 
                                              <tr style="display:none;">
                                                  <td>
                                                      <asp:Label ID="Label5" runat="server" CssClass="Label" Text="Record Added By:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="lbl_Record_Addedby" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                              <tr style="display:none;">
                                                  <td >
                                                      <asp:Label ID="Label6" runat="server" CssClass="Label" Text="Record Added On:"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="lbl_Record_AddedDate" runat="server" CssClass="Label"></asp:Label>
                                                  </td>
                                              </tr>
                              
                                
                                     
                                          
                                          </table>

                                          </div>
                                          
                                          </td>
                                       
                                    </tr> 
                                    
                                  
                                     
                                   
                           
                                    <tr>
                                         <td align="center" colspan="2" valign="middle">
                                             <asp:Button ID="btn_Save" runat="server" 
                                                   CssClass="WebButton"    onclick="btn_Save_Click" 
                                                 Text="Add New Order" TabIndex="21" Width="120px" />
                                             &nbsp;<asp:Button ID="btn_Cancel" runat="server" BackColor="#EC5E5E" ForeColor="White"
                                                   CssClass="WebButton"    onclick="btn_Cancel_Click" 
                                                 Text="Clear" TabIndex="22" />
                                         </td>
                                     </tr>
                           
                                <tr>
                                    <td align="center" colspan="2" valign="middle">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 50%">
                                                     <h4 class="adminheading">Order Task Information</h4></td>
                                                <td style="width: 50%">
                                                      <h4 class="adminheading">Order Comment Information</h4></td>
                                            </tr>
                                            <tr>
                                                <td valign="top" style="width: 50%">
                                                    <asp:GridView ID="grd_Order_Task" runat="server" 
                                                        AutoGenerateColumns="False" CellPadding="4" CssClass="name" Height="30px" 
                                                        HorizontalAlign="Center"  PageSize="2" 
                                                        ShowHeaderWhenEmpty="True" Width="100%">
                                                        <Columns>
                                                             <asp:TemplateField HeaderStyle-CssClass="head-label" 
                                                                HeaderStyle-Font-Bold="true" HeaderText="Task" SortExpression="Comments">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl_Task" runat="server" 
                                                                        Text='<%#Eval("Order_Task") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="grid-item" Height="20px" VerticalAlign="Middle" 
                                                                    Width="30px" />
                                                            </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-CssClass="head-label" 
                                                                HeaderStyle-Font-Bold="true" HeaderText="Status" SortExpression="Comments">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl_Status" runat="server" 
                                                                        Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="grid-item" Height="20px" VerticalAlign="Middle" 
                                                                    Width="30px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-CssClass="head-label" 
                                                                HeaderStyle-Font-Bold="true" HeaderText="Date" SortExpression="Comments">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl_ProductionDate" runat="server" 
                                                                        Text='<%#Eval("Production_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="grid-item" Height="20px" VerticalAlign="Middle" 
                                                                    Width="30px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-CssClass="head-label" 
                                                                HeaderStyle-Font-Bold="true" HeaderText="Updated By" 
                                                                SortExpression="Loan_Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl_Agency_User_Name" runat="server" 
                                                                        Text='<%#Eval("User_Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="grid-item" Height="20px" VerticalAlign="Middle" 
                                                                    Width="30px" />
                                                            </asp:TemplateField>
                                                         
                                                         
                                                        </Columns>
                                                        <EmptyDataRowStyle BackColor="#f9f9f9" BorderColor="#D9D9D9" 
                                                            BorderStyle="Solid" BorderWidth="1px" ForeColor="#333333" />
                                                        <FooterStyle BackColor="#cccccc" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle CssClass="PagerStyle" HorizontalAlign="Center" />
                                                        <SelectedRowStyle CssClass="SelectedRowStyle" Font-Bold="True" 
                                                            ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                        <SortedAscendingHeaderStyle BackColor="#808080" />
                                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                        <SortedDescendingHeaderStyle BackColor="#383838" />
                                                    </asp:GridView>
                                                </td>
                                                <td valign="top" style="width: 50%">
                                                    <asp:GridView ID="grd_Order_Comments" runat="server" AutoGenerateColumns="False" 
                                                        CellPadding="4" CssClass="name" Height="30px" HorizontalAlign="Center" 
                                                          ShowHeaderWhenEmpty="True" 
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderStyle-CssClass="head-label" 
                                                                HeaderStyle-Font-Bold="true" HeaderText="Comments" SortExpression="Comments">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl_comments" runat="server" Text='<%#Eval("comment") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="grid-item" Height="20px" VerticalAlign="Middle" 
                                                                    Width="300px" />
                                                            </asp:TemplateField>
                                                          
                                                         
                                                            <asp:TemplateField HeaderStyle-CssClass="head-label" 
                                                                HeaderStyle-Font-Bold="true" HeaderText="Updated By" 
                                                                SortExpression="Loan_Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl_User_Name" runat="server" 
                                                                        Text='<%#Eval("User_Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="head_style" Height="30px" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="grid-item" Height="20px" HorizontalAlign="Left" VerticalAlign="Middle" 
                                                                    Width="30px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EmptyDataRowStyle BackColor="#f9f9f9" BorderColor="#D9D9D9" 
                                                            BorderStyle="Solid" BorderWidth="1px" ForeColor="#333333" />
                                                        <FooterStyle BackColor="#cccccc" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle CssClass="PagerStyle" HorizontalAlign="Center" />
                                                        <SelectedRowStyle CssClass="SelectedRowStyle" Font-Bold="True" 
                                                            ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                        <SortedAscendingHeaderStyle BackColor="#808080" />
                                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                        <SortedDescendingHeaderStyle BackColor="#383838" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                          </tr>
                           
                                <tr>
                                    <td align="center" colspan="2" valign="middle">
                                        <asp:GridView ID="Gv_Import" runat="server">
                                        </asp:GridView>
                                    </td>
                          </tr>
                           
                                </table>
               
               

                    </div>
                    </div>

                    
					</div>
                 
                    	<div   class="tab-pane" id="panel_235561" >
                  
                          
			                   
      	                        <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 20px 0px;">
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="container">

			                <!-- allocation -->
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <div class="col-md-12 col-sm-12 col-xs-12 three">
				            <h3 style="font-weight: normal;">Allocation</h3>

				            <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 40px 10px;">
					

					                 <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="orange" style="background: linear-gradient(60deg, #ffa726, #fb8c00);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-globe"></i>
                            </div>
                            <div class="card-content">
                                
                                   <asp:LinkButton ID="lnk_webcall_allocation" CssClass="category" Text="Web / Call Order" runat="server"  tabindex="12"
                                                onclick="lnk_webcall_allocation_Click">
                                                </asp:LinkButton>
                           
                                <h3 class="title">
                                     <asp:Label ID="lb_count"  runat="server"></asp:Label>
                                  
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

                                     <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="red" style="background: linear-gradient(60deg, #ff26ce, #ff26ce);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-fax"></i>
                            </div>
                            <div class="card-content">
                              

                                  <asp:LinkButton ID="LinkMailFaxAllocate" CssClass="category" runat="server" Text="Mail / Fax Order" TabIndex="14" onclick="LinkMailFaxAllocate_Click" >
                                                
                              
                                </asp:LinkButton>
                                <h3 class="title">
                                <asp:Label ID="lbl_count_mail_fax_Allocation" runat="server"></asp:Label>
                                  
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

                                     <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="red" style="background: linear-gradient(60deg, #ff2645, #ff2645);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-outdent"></i>
                            </div>
                            <div class="card-content">
                               
                                <asp:LinkButton ID="LinkQualityAllocate" TabIndex="17"    runat="server" 
                                            onclick="LinkQualityAllocate_Click" >
                                    <asp:Label ID="label9" runat="server" Text="Quality Check Order"
                                            CssClass="category"></asp:Label>
                                            </asp:LinkButton>
                                
                                <h3 class="title">
                                    <asp:Label ID="lbl_Qc_Allocated_Count" runat="server"></asp:Label>
                                   
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
				            </div>

			                <!-- Processing  -->
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <div class="col-md-12 col-sm-12 col-xs-12 three" id="">
				            <h3 style="font-weight: normal;">Processing</h3>

				            <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 40px 10px;">

					            <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="orange" style="background: linear-gradient(60deg, #005a20, #005a20);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-dribbble"></i>
                            </div>
                            <div class="card-content">
                                
                                <a href="Admin/Web_Call_Order_Research.aspx" tabindex="7">
                                    <asp:Label ID="label2" runat="server" Text="Web/Call Research"  CssClass="category"></asp:Label>
                                </a>

                                <h3 class="title">
                                    <asp:Label ID="lbl_web_cal_reaserch_count" runat="server"></asp:Label>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

                                <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="red" style="background: linear-gradient(60deg, #4d6ca5c4, #4d6ca5c4);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-list-ol"></i>
                            </div>
                            <div class="card-content">
                                
                                <a href="Admin/Mail_Fax_Order_Que.aspx" tabindex="9">
                                    <asp:Label ID="label3" runat="server" Text="Mail/Fax Order Search" CssClass="category"></asp:Label>
                                    </a>
                                <h3 class="title">
                                   <asp:Label ID="lbl_count_mail_Fax_Que_count" runat="server"></asp:Label>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

                                <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="red" style="background: linear-gradient(60deg, #2694ff, #2694ff);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-cogs"></i>
                            </div>
                            <div class="card-content">
                                
                                <a  href="Admin/QualityQue.aspx" tabindex="11">
                                    <asp:Label ID="label4" runat="server" Text="Quality Check Queue" CssClass="category"></asp:Label>
                                </a>
                                <h3 class="title">
                                    <asp:Label ID="lbl_Count_Qc_Que" runat="server"></asp:Label>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

                                <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="red" style="background: linear-gradient(60deg, #b1e671, #b1e671);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-share"></i>
                            </div>
                            <div class="card-content">
                                
                                <asp:LinkButton ID="LinkExport1" runat="server" TabIndex="19" 
                                            onclick="LinkExport1_Click">
                                    <asp:Label ID="label10" runat="server" Text="Order Export" CssClass="category"></asp:Label>
                                </asp:LinkButton>
                                <h3 class="title">
                                    <asp:Label ID="lbl_Order_Export_Count" runat="server"></asp:Label>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
				            </div>

			                <!-- Pending -->
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <div class="col-md-12 col-sm-12 col-xs-12 three">
				            <h3 style="font-weight: normal;">Pending</h3>

				            <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 40px 10px;">

					<div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="orange" style="background: linear-gradient(60deg, #26e8ff, #26e8ff);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-hourglass"></i>
                            </div>
                            <div class="card-content">
                              
                                <asp:LinkButton ID="lnk_Client_Hold_Allocatiion" runat="server" TabIndex="13" onclick="lnk_Client_Hold_Allocatiion_Click" 
                                          >
                                    <asp:Label ID="label12" runat="server" Text="Hold" CssClass="category"></asp:Label>
                                </asp:LinkButton>
                                <h3 class="title">
                                    <asp:Label ID="lbl_Client_Hold" runat="server"></asp:Label>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="red" style="background: linear-gradient(60deg, #8f7589, #8f7589);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-list-ul"></i>
                            </div>
                            <div class="card-content">
                               
                                <asp:LinkButton ID="lnk_Clarifica_Alloc" runat="server" TabIndex="15" onclick="lnk_Clarifica_Alloc_Click" 
                                            >
                                    <asp:Label ID="label15" runat="server" Text="Clarification" CssClass="category"></asp:Label>
                                            </asp:LinkButton>
                                <h3 class="title">
                                    <asp:Label ID="lbl_Clarification" runat="server"></asp:Label>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="red" style="background: linear-gradient(60deg, #ff0024, #ff0024);">
                                <!-- <i class="material-icons">content_copy</i> -->
                                <i class="fa fa-remove"></i>
                            </div>
                            <div class="card-content">
                              
                                <asp:LinkButton ID="lnk_Cancelled_Allocation" TabIndex="17"    runat="server" onclick="lnk_Cancelled_Allocation_Click" 
                                            >
                                    <asp:Label ID="label17" runat="server" Text="Cancelled" CssClass="category"></asp:Label>
                                </asp:LinkButton>
                                <h3 class="title">
                                    <asp:Label ID="lbl_Cancelled" runat="server"></asp:Label>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <!-- <i class="material-icons text-danger">warning</i> -->
                                    <!-- <a href="#">More ...</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
				

	    

                 <div class="tab-pane" id="panel_45454">
                                    
                                    <table>
                                     <tr><td style="width: 328px" >
                            <label class="Dash_label">Dashboard
                            </label>
                        </td></tr>
                        </table>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                             <div id="divdashboard" runat="server">
                        <table>
                            <tr>
                            <td style="width:300px" align="center">
                             <h4 class="adminheading">Line Chart</h4>
                            </td>
                            <td style="width:300px" align="center">
                             <h4 class="adminheading">Bar Chart</h4>
                            </td>
                            </tr>
                            <tr>

                               <td style="width:300px" id="adminmycompanydet" runat="server">
                      
                                 <asp:Literal ID="FCLiteral1" runat="server"></asp:Literal>

                                </td>
                                 <td style="width:300px" id="Td1" runat="server">
                                             <asp:Literal ID="Literal2" runat="server"></asp:Literal>

                                </td>
          
          
               
                             </tr>
                      
                            <tr>

                               <td style="width:300px" id="Td2" runat="server">
                                 <asp:Literal ID="Literal1" runat="server"></asp:Literal>

                              </td>
                                <td style="width:300px" id="Td3" runat="server">
                                             <asp:Literal ID="Literal3" runat="server"></asp:Literal>

                              </td>
          
          
               
                            </tr>
                         </table>
                   
                    
                               
				   </div>
         </div>
           

            
            </ContentTemplate></asp:UpdatePanel>
            </div>
            </div>
            </div>

  
   
     </div>
  </form>
 
<div id="divAccessDenied" title="Access Denied" style="display:none;" align="center"><br /><img src="../images/icons/iconCross3.png"><br /><br />Sorry, Access Denied...</span></div>
<div id="divMessageDialog" title="Message" style="display:none;" align="center"><br /></div>
<div id="divInbox_ComposeMessage" style="display:none; min-width: 350px; min-height:400px; position: fixed; bottom: 0px; right: 10px; border: 1px solid #b9b9b9; background-color: white;"></div> 
<br /><br />
<div class="WebHRBottom">
 <div class="WebHRMain" align="right">
  <div style="height:50px;"></div>
  

  <div align="center" class="WebHRBottomText">

 <br />
 &copy;&nbsp;2013 - 2018 - Developed by <a href="http://www.drnds.com" target="_blank">DRN Definite Solutions</a>
</div>
  </div>
 </div>




</body>

</html>


