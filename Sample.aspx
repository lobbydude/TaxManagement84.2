<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sample.aspx.cs" Inherits="Sample" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html >

<html>
<head>

<title>TaxPlorer</title>

<meta name="keywords" content="drnds" />
<meta name="description" content="drnds" />
<meta name="author" content="VergeSystems - info@vergesystems.com" />
<meta name="copyright" content="&copy; 2004-2013" />


<!-- HOme Design-->
<link rel="Stylesheet" type="text/css" href="src/css/bootstrap.min.css" />
<link rel="Stylesheet" type="text/css" href="src/css/style.css" />
    <link href="src/css/bootstrap.css" rel="stylesheet" type="text/css" />


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
    <%-- <asp:LinkButton ID="lnk_Home" runat="server" CssClass="linkLabel"  onclick="lnk_Home_Click"><span >Home
         </span></asp:LinkButton>--%>
     </a>
     </li>

     <li id="limasters" runat="server"><a class="linkLabel" href="#" ><span>Masters</span></a>
	
        <ul style="width:450px; height:140px; background:url(../AdminImage/menulist_1.jpg);">
      <li>
      <div style="margin-top:5px; clear:both;"></div>
	    <div class="iemployeetrainings" 
              style="float:left; margin-left:10px; width: 10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Create_Company.aspx">Company</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Create_Branch.aspx">Branch</a></div>
    	<div style="margin-top:34px; clear:both;"></div>
	    <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Create_Client.aspx">Client Name</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Create_Order_Type.aspx">Order Type</a></div>
    	<div style="margin-top:64px; clear:both;"></div>
      <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Create_SubProcess.aspx">Sub Process</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Create_Order_Status.aspx">Order Status</a></div>
         <div style="margin-top:94px; clear:both;"></div>
         <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Tax_AssesmentLink.aspx">Tax Assesment</a></div>
   <div style="margin-top:124px; clear:both;"></div>
      </li>
	  </ul>
     </li>
     <li id="li_users" runat="server" ><a class="linkLabel" href="../Admin/User_Create.aspx"><span>Users</span></a>
	  <ul style="width:450px; height:75px; background:url(../AdminImage/menulist_1.jpg);">
        
      <li>
		

	    <div style="margin-top:5px; clear:both;"></div>
	    <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/User_Create.aspx">Create Users</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/ActiveInactiveusers.aspx">Deactive Users</a></div>
    	<div style="margin-top:34px; clear:both;"></div>
      <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Create_UserRole.aspx">Create User Role</a></div>
	       <div style="margin-top:64px; clear:both;"></div>
      </li>
	  </ul>
	 </li>
	    <li id="liTax_Masters" runat="server" ><a class="linkLabel" href="#"><span>Tax Masters</span></a>
	  <ul style="width:450px; height:55px; background:url(../AdminImage/menulist_1.jpg);">
      <li>
		

	    <div style="margin-top:5px; clear:both;"></div>
	    <div class="iemployeetrainings" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Import_County_Database_Information.aspx">Import County Database</a></div>
	    <div class="itrainingevents" style="float:left; margin-left:10px;"></div><div style="width:180px; float:left;"><a class="hrefLabel" href="../Admin/Tax_Info.aspx">Tax Master</a></div>
    	<div style="margin-top:34px; clear:both;"></div>
    
      </li>
	  </ul>
	 </li>
     <li id="liReports" runat="server" class="parent"><a class="linkLabel" href="../Admin/User_Production_Report.aspx"><span>Reports</span></a>
	  <ul style="width:270px; height:85px; background:url(../AdminImage/menulist_1.jpg);">
      <li>

		<div style="margin-top:5px; clear:both;"></div>

           <div class="ireports-hr" style="float:left; margin-left:10px;"></div><div style="width:200px; float:left;"><a class="hrefLabel" href="../Reports/Client_Prod_Report.aspx">Client Production Reports</a></div>
              <div style="margin-top:5px; clear:both;"></div>
		<div class="ireports-hr" style="float:left; margin-left:10px;"></div><div style="width:200px; float:left;"><a class="hrefLabel" href="../Reports/Tax_Violation_Report.aspx">Client Tax and Violation Reports</a></div>

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
     <ul style="width:250px; height:100px; background:url(../AdminImage/menulist_1.jpg);">
         
      <li>
         
	  <table border="0" style="padding-left:0px;" cellspacing="0" cellpadding="4" width="100%">
	   <tr><td><a style="padding-left:0px;" class="hrefLabel" href="../Admin/User_Profile.aspx">My Profile</a></td></tr>
	   <tr><td>
          <span> <a style="padding-left:0px;" class="hrefLabel"  href="../Admin/Change_Password.aspx">Settings</a></span></td></tr>
             <tr><td>
          <span> <a style="padding-left:0px;" class="hrefLabel"  href="../Login.aspx">Log Out</a></span></td></tr>
	  
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
