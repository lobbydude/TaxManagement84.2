<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Copy of Admin.aspx.cs" Inherits="AdminHome" %>
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
<script type="text/javascript">

//    function dash() {

//            document.getElementById("<%=li_dash.ClientID %>").className = "li_active";
//            var myElement = document.getElementById('<%=li_dash.ClientID %>');
//            myElement.style.background = "rgb(51, 204, 255)";
//            myElement.style.color = "rgb(48, 48, 48)";

//            var myElement1 = document.getElementById('<%=li_queue.ClientID %>');
//            myElement1.style.background = "#6ECFDD";
//            myElement1.style.color = "rgb(48, 48, 48)";

//        }
//        function queue() {
//            document.getElementById("<%=li_queue.ClientID %>").className = "li_active";
//            var myElement = document.getElementById('<%=li_queue.ClientID %>');
//            myElement.style.background = "rgb(51, 204, 255)";
//            myElement.style.color = "rgb(48, 48, 48)";

//            var myElement1 = document.getElementById('<%=li_dash.ClientID %>');
//            myElement1.style.background = "#6ECFDD";
//            myElement1.style.color = "rgb(48, 48, 48)";
//        }
       
</script>


  <div class="container">
	<div class="row">
		<div class="col-md-12" >
        <asp:UpdatePanel ID="update" runat="server" UpdateMode="Always"><ContentTemplate>
       

<div class="tabbable" id="tabs-303912" >
				<ul class="nav nav-pills" >
					<li class="active"  >
                    
						<a id="li_queue" runat="server" onclick="queue()" href="#panel-505369" class="li_active" 
                        data-toggle="tab">Order Queue</a>
					</li>
					<li >
                    
						<a id="li_dash" runat="server" onclick="dash()" href="#panel-235561"
                         class="li_active" data-toggle="tab">Dashboard</a>
					</li>
				</ul>
				<div class="tab-content" style="width:100%">
                
					<div class="tab-pane active" id="panel-505369">


                    <table style="width:100%">
    <tr><td colspan="4"><br /></td></tr>
    <tr  ><td align="center" style="width:100%">
        <asp:RadioButton ID="rdo_CurrentOrder" runat="server" Text="Currnet Orders" 
            CssClass="radio_btn"  oncheckedchanged="rdo_CurrentOrder_CheckedChanged" 
            
             />
     &nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="rdo_CompletedOrders" runat="server"  CssClass="radio_btn" 
            Text="Completed Orders" Font-Names="Ebrima" 
            oncheckedchanged="rdo_CompletedOrders_CheckedChanged" />
    </td>
    </tr>
    <tr><td colspan="4"><br /></td></tr>
    </table>
                    <div id="DivView" runat="server"  align="center" style="height:100%; width:100%;" >
    
    
						<table style="width: 98%" align="center">
    
                                                            <tr>
                                                                <td style="width:75px;">
                                                                    <asp:Label ID="lbl_Search_By" runat="server" CssClass="Label" style="font-size:14px" Text="Search By"></asp:Label>
                                                                </td>
                                                                <td style="width:150px;">
                                                                    <asp:DropDownList ID="ddl_Search" runat="server"  TabIndex="20" 
                                                                        CssClass="DropDown"  >
                                                                        <asp:ListItem>Order Number</asp:ListItem>
                                                                        <asp:ListItem Value="Recived Date">Recived Date</asp:ListItem>
                                                                        <asp:ListItem>Client</asp:ListItem>
                                                                        <asp:ListItem>Sub Client</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style=" width:350px;">
                                                                
                                                                    <asp:TextBox ID="txt_Search_By"  TabIndex="21"  runat="server" Columns="1" placeholder="Search here..."
                                                                        CssClass="searchText"  ontextchanged="txt_Search_By_TextChanged"  
                                                                       ></asp:TextBox>
                                                                
                                                                </td>
                                                                
                                                              
                                         
                                                                <td align="right">
                                                                <asp:Button ID="btn_Add_New" runat="server" CssClass="GridButton" style="text-align:center"
                                                                         Text="Add New Order" Width="107px" 
                                                  onclick="btn_Add_New_Click"  />
                                                                <asp:Button ID="btn_Export" runat="server" CssClass="GridButton" style="text-align:center"
                                                                         Text="Order Export" Width="107px"  />
                                                                </td>
                                                            </tr>

<tr><td colspan="7"><br /></td></tr>
            <tr>
            <td colspan="7">
            
            <asp:GridView ID="grd_Orders" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" CssClass="name" GridLines="None" 
                                                    ShowHeaderWhenEmpty="True" Width="100%" AllowPaging="True" 
                                                    onpageindexchanging="grd_Orders_PageIndexChanging" 
                                                    onrowcommand="grd_Orders_RowCommand" PageSize="50">
                                                    
                                                    <Columns>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_id" runat="server" 
                                                                    Text='<%#Eval("Order_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle" Height="30px"   HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item"  HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                     
                                                      
                                                              <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Order Number">
                                                            <ItemTemplate>
                                                              <asp:Button ID="btn_ClientOrder_Number" runat="server" TabIndex="23" CommandName="EditDetails" Width="150px" Height="28px" CssClass="GridButton" Text='<%# Eval("Client_Order_Number") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Customer" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomer" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Client_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Sub Process" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubProcess" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("Sub_ProcessName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Recived Date" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDate" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>

                                                         <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="State" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblState" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("State_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                           <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="County" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCounty" runat="server" 
                                                                    CssClass="Label" Text='<%#Eval("County_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Order Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOrder_Location" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Type") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Task" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Order_task" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Task") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="Status">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_Order_Status" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("Order_Status") %>'></asp:Label>
                                                            </ItemTemplate>
                                                           <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center" />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                      <asp:TemplateField  HeaderStyle-CssClass="head-label" HeaderText="User Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUser_Name" runat="server" CssClass="Label" 
                                                                    Text='<%#Eval("User_Name") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"  />
                                                            <ItemStyle CssClass="grid-item" HorizontalAlign="Center" Width="100px" />
                                                        </asp:TemplateField>
                                                       <asp:TemplateField HeaderStyle-CssClass="head-label"> 
                                                            <ItemTemplate>
                                                                <asp:Button ID="btn_Delete" CssClass="GridButton" runat="server" TabIndex="24" BackColor="#EC5E5E" Text="Delete"   OnClientClick="javascript:return confirm('Are you sure to proceed?');" CommandName="DeleteRecord" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="admin_headstyle"  Height="30px"  HorizontalAlign="Center"   />
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
                    </div>
                    <div id="DivCreate"  runat="server" style="height:100%; width:100%;" >
           
                     <table align="center" style="width:90%;" >
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
                                            <asp:DropDownList ID="ddl_ordertype" runat="server" 
                                                CssClass="DropDown" TabIndex="3" Width="210px" 
                                                onselectedindexchanged="ddl_ordertype_SelectedIndexChanged">
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
                                                  <td  >
                                                      <asp:Label ID="Label36" runat="server" CssClass="Label" 
                                                          Text="Order Number:" Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_OrderNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" Columns="1" 
                                                          Width="200px" TabIndex="4"></asp:TextBox>
                                                  </td>
                                                  <td  >
                                                      <asp:Label ID="Label61" runat="server" CssClass="Label" Text="County:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                     <asp:DropDownList ID="ddl_County" runat="server" 
                                                          AutoPostBack="True" CssClass="DropDown" TabIndex="14" Width="210px">
                                                      </asp:DropDownList>
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
                                                      <asp:Label ID="Label62" runat="server" CssClass="Label" Text="City :" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_City" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="15" Width="200px"></asp:TextBox>
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
                                                      <asp:Label ID="Label63" runat="server" CssClass="Label" Text="Zip:" 
                                                          Font-Size="14px"></asp:Label>
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
                                                      <asp:Label ID="Label46" runat="server" CssClass="Label" Text="Contract Number:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_ContractNumber" runat="server" CssClass="textbox" 
                                                          style="text-transform:uppercase;" TabIndex="7" Width="200px"></asp:TextBox>
                                                  </td>
                                                  <td>
                                                      <asp:Label ID="Label59" runat="server" CssClass="Label" 
                                                          Text="Borrower Address:" Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_BarrowerAddress" runat="server" CssClass="textbox" Height="50px" 
                                                          style="text-transform:uppercase;" TabIndex="17" Width="200px"></asp:TextBox>
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
                                                      <asp:Label ID="Label31" runat="server" CssClass="Label" Text="Task" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_ordersTask" runat="server" CssClass="DropDown" 
                                                          TabIndex="18" Width="210px">
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
                                                      <asp:Label ID="Label67" runat="server" CssClass="Label" Text="Status:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:DropDownList ID="ddl_orderstatus" runat="server" CssClass="DropDown" 
                                                          TabIndex="19" Width="210px">
                                                      </asp:DropDownList>
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
                                                      <asp:Label ID="Label464" runat="server" CssClass="Label" Text="Notes:" 
                                                          Font-Size="14px"></asp:Label>
                                                  </td>
                                                  <td>
                                                      <asp:TextBox ID="txt_Notes" runat="server" CssClass="textbox" Height="80px" 
                                                          style="text-transform: uppercase;" TabIndex="20" Width="200px"></asp:TextBox>
                                                  </td>
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
                                        <asp:GridView ID="Gv_Import" runat="server">
                                        </asp:GridView>
                                    </td>
                          </tr>
                           
                                </table>
               
               </div>

					</div>
					<div class="tab-pane" id="panel-235561">
						
        <table style="width: 100%">
        
        <tr><td style="width: 328px" ><br /></td></tr>
        
        
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
        <table align="center" style="width:30%">
                                    <tr>
                                        <td  align="right">
                                                  <a href="Web_Call_Order_Research.aspx" tabindex="6">
                                <div class="imgWebCallResearch" >
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
                                    <asp:Label ID="label2" runat="server" Text="Web/Call Research"  CssClass="Label" Width="105"></asp:Label>
                                    </a>
                                    </td></tr>
                                </table>
        
        </td>
        <td style="width: 151px">
        <table align="center" style="width:30%">
                                    <tr>
                                        <td  align="right">
                                                 <a href="Mail_Fax_Order_Que.aspx" tabindex="8">
                                <div class="imgMailFaxQue">
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
                                    <asp:Label ID="label3" runat="server" Text="Mail/Fax" CssClass="Label" Width="95"></asp:Label>
                                    </a>
                                    </td></tr>
                                </table>
        
        </td>

        <td style="width: 150px">
        <table align="center" style="width:30%">
                                    <tr>
                                        <td align="right">
                                                 <a  href="QualityQue.aspx" tabindex="10">
                                <div class="imgQcQue"></div>
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
                                    <asp:Label ID="label4" runat="server" Text="Quality Check" CssClass="Label" Width="115"></asp:Label>
                                    </a>
                                    </td></tr>
                                </table>
        
        </td>

        <td style="width: 150px">
        <table align="center" style="width:30%">
                                    <tr>
                                        <td align="right" >
                                        <asp:LinkButton ID="LinkExport" runat="server" TabIndex="18" onclick="LinkExport_Click" 
                                              >
                                             
                                <div id="DiExport" runat="server" class="imgExport">
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
                                            Width="85px"></asp:Label>
                                            </asp:LinkButton> 
                                    </td></tr>
                                </table>
        
        
        </td>

        <td style="width: 150px">
        <table align="center" style="width:30%">
                        <tr>
                        <td  align="center" style="width: 122px">
                        <asp:LinkButton ID="LinkBtn_Order_search" runat="server" 
                                onclick="LinkBtn_Order_search_Click" TabIndex="4" >
                         <div id="divorder_search" runat="server" class="imgReport" >
                                </div>
                        </asp:LinkButton>
                        </td>
                        
                        </tr>
                        <tr>
                        <td align="center" style="width: 122px">
                        <asp:LinkButton ID="LinkButton1" runat="server" TabIndex="5"
                                onclick="LinkBtn_Order_search_Click" style="text-decoration:none" >
                        <asp:Label ID="label1" runat="server" Text="Search Orders" CssClass="Label" Width="90"></asp:Label>
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
                                        <td align="right">
                                             
                                <asp:LinkButton ID="lnk_webcall_allocation" runat="server" tabindex="12"
                                                onclick="lnk_webcall_allocation_Click">
                                <div id="divwebalocate" runat="server" class="imgWebCallAllocate">
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
                                    <asp:Label ID="label7" runat="server" Text="Web/Call Order" CssClass="Label" Width="145"></asp:Label>
                                    </asp:LinkButton> 
                                    </td></tr>
                                </table>
        
        </td>
        <td style="width: 150px">
        
        <table align="center" style="width:30%">
                                    <tr>
                                        <td  align="right">
                                         <asp:LinkButton ID="LinkMailFaxAllocate" runat="server" TabIndex="14" onclick="LinkMailFaxAllocate_Click" >
                                                
                                <div id="divMailalocate" runat="server" class="imgMailFaxAllocate">
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
                                    <asp:Label ID="label8" runat="server" Text="Mail/Fax Order" 
                                            CssClass="Label" Width="140px"></asp:Label>
                                            </asp:LinkButton>
                                    </td></tr>
                                </table>
        </td>

       
     <td style="width: 150px">
     <table align="center" style="width:30%">
                                    <tr>
                                        <td  align="right">
                                         <asp:LinkButton ID="LinkQualityAllocate" TabIndex="16"    runat="server" onclick="LinkQualityAllocate_Click" 
                                                >
                                                
                                                 
                                 <div id="divQCalocate" runat="server" class="imgQualityAllocate">
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
                                    <asp:Label ID="label9" runat="server" Text="Quality Check Order" 
                                            CssClass="Label" Width="168px"></asp:Label>
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
         <table align="center" style="width:44%">
                                    <tr>
                                        <td align="right">
                                             
                                <asp:LinkButton ID="LinkButton2" runat="server" tabindex="12"
                                                onclick="lnk_webcall_allocation_Click">
                                <div id="div1" runat="server" class="imgWebCallAllocate">
                                </div>
                                
                                </asp:LinkButton>
                                </td>
                                        <td valign="top" align="left">
                                        <div align="center" id="div2"  runat="server"  class="bubble">
                                        <asp:Label ID="Label11" CssClass="Label"  runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                   <asp:LinkButton ID="LinkButton3" runat="server" TabIndex="13" 
                                            onclick="lnk_webcall_allocation1_Click">
                                    <asp:Label ID="label12" runat="server" Text="Clarification" CssClass="Label" Width="145"></asp:Label>
                                    </asp:LinkButton> 
                                    </td></tr>
                                </table>
        
        </td>
        <td style="width: 150px">
        
        <table align="center" style="width:30%">
                                    <tr>
                                        <td  align="right">
                                         <asp:LinkButton ID="LinkButton4" runat="server" TabIndex="14" onclick="LinkMailFaxAllocate_Click" >
                                                
                                <div id="div3" runat="server" class="imgMailFaxAllocate">
                                </div>
                                </asp:LinkButton></td>
                                        <td valign="top" align="left">
                                        <div align="center" id="div4" runat="server"  class="bubble">
                                        <asp:Label ID="Label13"  CssClass="Label" runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                           </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                    <asp:LinkButton ID="LinkButton5" runat="server" TabIndex="15" 
                                            onclick="LinkMailFaxAllocate1_Click">
                                    <asp:Label ID="label15" runat="server" Text="Hold" 
                                            CssClass="Label" Width="140px"></asp:Label>
                                            </asp:LinkButton>
                                    </td></tr>
                                </table>
        </td>

        <td style="width:150px">
        
        <table align="center" style="width:30%">
                                    <tr>
                                        <td  align="right">
                                         <asp:LinkButton ID="LinkButton6" TabIndex="16"    runat="server" onclick="LinkQualityAllocate_Click" 
                                                >
                                                
                                                 
                                 <div id="div5" runat="server" class="imgQualityAllocate">
                                 </div>
                                 </asp:LinkButton>
                                 </td>
                                        <td valign="top" align="left">
                                        <div align="center"  id="div6" runat="server"  class="bubble">
                                        <asp:Label ID="Label16"  CssClass="Label" runat="server" Font-Bold="True" 
                                                ForeColor="White" ></asp:Label>

                                        </div>
                                            </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2" align="center">
                                     <asp:LinkButton ID="LinkButton7" TabIndex="17"    runat="server" 
                                            onclick="LinkQualityAllocate1_Click" >
                                    <asp:Label ID="label17" runat="server" Text="Cancelled" 
                                            CssClass="Label" Width="168px"></asp:Label>
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

            
            </ContentTemplate></asp:UpdatePanel>
            </div>
            </div>
            </div>

</asp:Content>

