﻿<%--
 * Copyright 2016 Centrify Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *  http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/
--%>

<%@ Page Title="Sign in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <script type="text/javascript">
        function DisplayLoadingDiv() {
            document.getElementById("Loading").style.display = '';
        }
    </script>

    <div class="row">
        <div class="row">
            <div id="Loading" style="display: none">
                <div class="loadingFade">
                    <div class="loadingLabelLocation">
                        <asp:Label ID="MFALoad_Label" runat="server" CssClass="text-white" Text="" />
                    </div>
                    <div class="loadingImageLocation">
                        <img src="Images/loadingMFA.gif" style="vertical-align: middle" alt="Processing" width="110" height="110" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="row">
                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </asp:PlaceHolder>
            </div>

            <div class="row">
                <asp:PlaceHolder runat="server" ID="SuccessMessage" Visible="false">
                    <asp:Literal runat="server" ID="SuccessText" />
                </asp:PlaceHolder>
            </div>
            <div id="Login_Div" runat="server">
                <br />
                <h3>Please Sign In</h3>
                <br />
                <div class="row">
                    <div class="row">
                        <asp:Label ID="UserName_Label" runat="server" AssociatedControlID="UserName_TextBox" CssClass="col-md-2 control-label">User Name</asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="UserName_TextBox" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-2 col-md-offset-4" runat="server" id="StartAuthentication_Next_Button_Div">
                            <asp:Button ID="StartAuthentication_Next_Button" runat="server" OnClick="StartAuthentication" Text="Next" CssClass="btn btn-default" OnClientClick="DisplayLoadingDiv()" />
                        </div>
                    </div>
                    <div class="row">
                        <asp:Label ID="MFAChallenge_DropDownList_Label" runat="server" Visible="false" AssociatedControlID="MFAChallenge_DropDownList" CssClass="col-md-2 control-label">Authentication Method</asp:Label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="MFAChallenge_DropDownList" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="MFAChallenge_SelectedIndexChanged" CssClass="form-control" Visible="false" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label ID="MFAAnswer_Label" runat="server" Visible="false" AssociatedControlID="MFAAnswer_Textbox" CssClass="col-md-2 control-label">Answer</asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="MFAAnswer_Textbox" runat="server" TextMode="Password" CssClass="form-control" Visible="false" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-xs-2  col-sm-offset-2" runat="server" id="ForgotPass_Button_Div">
                            <asp:Button ID="ForgotPass_Button" runat="server" OnClick="AdvanceAuthentication" OnClientClick="DisplayLoadingDiv()" Text="Forgot Password" CssClass="btn btn-default" Visible="false" />
                        </div>
                        <div class="col-xs-2" runat="server" id="RememberMe_Div" visible="false">
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" ID="RememberMe_Label" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-xs-2 col-sm-offset-4" runat="server" id="AdvanceAuthentication_Next_Button_Div">
                            <asp:Button ID="AdvanceAuthentication_Next_Button" runat="server" OnClick="AdvanceAuthentication" OnClientClick="DisplayLoadingDiv()" Text="Next" CssClass="btn btn-default" Visible="false" />
                        </div>
                        <div class="col-md-offset-5" runat="server" id="Register_HyperLink_Div">
                            Need and account?
                                <asp:HyperLink ID="Register_HyperLink" runat="server" Text="Register" NavigateUrl="~/Register.aspx" />
                            here.
                        </div>
                    </div>
                    <div>
                        <asp:Timer ID="StartTextOob_Timer" runat="server" OnTick="StartTextOob_TimerTick" Interval="7000" Enabled="false"></asp:Timer>
                    </div>

                </div>
            </div>
            <div id="SocialLogin_Div" runat="server">
                <hr />
                <br />
                <h3>Or Sign In With</h3>
                <br />
                <div class="row">
                    <asp:ImageButton ID="SocialLogin_FB_Button" runat="Server" ImageUrl="~/Images/login-fb.png" OnClick="SocialLogin" />
                    <asp:ImageButton ID="SocialLogin_Google_Button" runat="Server" ImageUrl="~/Images/login-g.png" OnClick="SocialLogin" />
                </div>
                <div class="row">
                    <asp:ImageButton ID="SocialLogin_LinkedIn_Button" runat="Server" ImageUrl="~/Images/login-li.png" OnClick="SocialLogin" />
                    <asp:ImageButton ID="SocialLogin_Microsoft_Button" runat="Server" ImageUrl="~/Images/login-ms.png" OnClick="SocialLogin" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>