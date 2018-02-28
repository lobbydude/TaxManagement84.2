<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OKMessageBox.ascx.cs"
    Inherits="UserControls_OKMessageBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<link href="AdminStyle/WebHRStyleSheet (2).css" rel="stylesheet" type="text/css" />
<link href="Styles/Message_Popup.css" rel="stylesheet" type="text/css" />
<link href="AdminStyle/WebHRButtons.css" rel="stylesheet" type="text/css" />
<link href="Styles/ControlsStyle.css" rel="stylesheet" type="text/css" />
<link href="Styles/theme-min.css" rel="stylesheet" type="text/css" />
<link href="AdminStyle/modelmesgbox.css" rel="stylesheet" type="text/css" />
<ajax:modalpopupextender ID="mpext" runat="server" BackgroundCssClass="modalBackground"
    TargetControlID="pnlPopup" PopupControlID="pnlPopup">
</ajax:modalpopupextender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup"  
    DefaultButton="btnOk" Width="380px" Height="182px">
    <div style="border:1px solid #000000">
        <div id="top_handle" runat="server" class="topHandle" style="width:100%;height:22px;background:#000;text-align:center;vertical-align:middle">
                &nbsp; <asp:Label ID="lblCaption" runat="server" CssClass="Label" style="color:#fff;vertical-align:middle" Text="Alert Message" ></asp:Label>
            </div>
        <div id="pop_body" runat="server" class="panel_body" style="height:130px">
        <div><br /><br /></div>
       
            <span style="width:60px;text-align:center;margin-left:15px" valign="middle" >
                <asp:Image ID="imgInfo" runat="server" ImageUrl="img/Info.png" ImageAlign="AbsMiddle" />
            </span>
            <span  style="text-align:center;width:100%" >
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblMessage"  style="text-align:center;width:100%" CssClass="Label" ForeColor="White" runat="server"></asp:Label>
               &nbsp;&nbsp; <asp:Label ID="lbl_ticketno"  style="text-align:center;width:100%" CssClass="Label" ForeColor="White" runat="server"></asp:Label>
            </span>
            <br />
            <span valign="bottom" style="width:100%">
            <br />
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnOk" runat="server" CssClass="WebButton2" Text="Close" style="float:right;margin-right:15px" 
                    OnClick="btnOk_Click" Width="60px" />
                   
                <%--<asp:Button ID="btnOk1" runat="server" CssClass="btn btn-default" Text="Cancel" 
                    OnClick="btnOk1_Click" Visible="true" Width="70px" />--%>
            </span>
        </div>
    </div>
</asp:Panel>

<script type="text/javascript">
        function fnClickOK(sender, e)
        {
            __doPostBack(sender,e);
        }
</script>

