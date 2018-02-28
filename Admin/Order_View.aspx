<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminHome.master" AutoEventWireup="true" CodeFile="Order_View.aspx.cs" Inherits="Admin_Order_View" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
      <script language="javascript" type="text/javascript">
        function show()
        {
              document.write("<head id="Head1" runat='server'></head>");
        }
</script>
    <div id="DivCreate"  runat="server" style="height:100%; width:100%;" class="DivContentBody">
           
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
                                               >
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
                                                      <asp:Label ID="Label64" runat="server" CssClass="Label" Text="Notes:" 
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
                                                 Text="Submit" TabIndex="21" Width="120px" />
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
                                        &nbsp;</td>
                          </tr>
                           
                                </table>
               
               </div>  
</asp:Content>


