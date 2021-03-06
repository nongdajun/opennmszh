<%--
/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2008-2012 The OpenNMS Group, Inc.
 * OpenNMS(R) is Copyright (C) 1999-2012 The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is a registered trademark of The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * OpenNMS(R) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OpenNMS(R).  If not, see:
 *      http://www.gnu.org/licenses/
 *
 * For more information contact:
 *     OpenNMS(R) Licensing <license@opennms.org>
 *     http://www.opennms.org/
 *     http://www.opennms.com/
 *******************************************************************************/

--%>

<%@page language="java" contentType="text/html" session="true" import="org.opennms.netmgt.config.discovery.*, org.opennms.web.admin.discovery.ActionDiscoveryServlet" %>
<% 
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	}
%>

<%
HttpSession sess = request.getSession(false);
DiscoveryConfiguration currConfig  = (DiscoveryConfiguration) sess.getAttribute("discoveryConfiguration");
%>

<html>
<head>
  <title>添加URL | 管理 | OpenNMS Web控制台</title>
  <base href="<%=org.opennms.web.api.Util.calculateUrlBase( request )%>" />
  <link rel="stylesheet" type="text/css" href="css/styles.css" />
</head>

<body>
<script type="text/javascript">
function addIncludeUrl() {
	if(isNaN(document.getElementById("timeout").value)){
		alert("超时无效。");
		document.getElementById("timeout").focus();
		return;		
	}

	if(isNaN(document.getElementById("retries").value)){
		alert("重试字段无效。");
		document.getElementById("retries").focus();
		return;		
	}	

	opener.document.getElementById("iuurl").value=document.getElementById("url").value;
	opener.document.getElementById("iutimeout").value=document.getElementById("timeout").value;
	opener.document.getElementById("iuretries").value=document.getElementById("retries").value;
	opener.document.getElementById("modifyDiscoveryConfig").action=opener.document.getElementById("modifyDiscoveryConfig").action+"?action=<%=ActionDiscoveryServlet.addIncludeUrlAction%>";
	opener.document.getElementById("modifyDiscoveryConfig").submit();
	window.close();
	opener.document.focus();
}

</script>


<!-- Body -->

    <h3>添加一个包含IP地址列表的URL</h3>
										   

<table class="standard">
 <tr>
	  <td class="standard" align="center" width="17%">URL:<input type="text" id="url" name="url" size="30"/></td>
	  <td class="standard" align="center" width="17%">超时 (毫秒):<input type="text" id="timeout" name="timeout" size="4" value="<%=currConfig.getTimeout()%>"/></td>
	  <td class="standard" align="center" width="17%">重试:<input type="text" id="retries" name="retries" size="2" value="<%=currConfig.getRetries()%>"/></td>
 </tr>
</table>

<input type="button" name="addIncludeUrl" id="addIncludeUrl" value="添加" onclick="addIncludeUrl();" />
<input type="button" name="cancel" id="cancel" value="取消" onclick="window.close();opener.document.focus();" />

  <hr />

</body>
</html>
