<%--
/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2009-2012 The OpenNMS Group, Inc.
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

<%-- 
  This page is included by other JSPs to create a box containing an
  abbreviated list of outages.
  
  It expects that a <base> tag has been set in the including page
  that directs all URLs to be relative to the servlet context.
--%>

<%@page language="java"
	contentType="text/html"
	session="true"
	import="org.opennms.web.outage.*,
	    org.opennms.web.element.ElementUtil,
	    org.opennms.web.element.Service,
	    org.opennms.netmgt.EventConstants,
		java.util.*
	"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	Outage[] outages = (Outage[])request.getAttribute("outages");
	Integer serviceId = (Integer)request.getAttribute("serviceId");
%>
<c:set var="serviceId"><%=serviceId%></c:set>

<c:url var="outageLink" value="outage/list.htm">
  <c:param name="filter" value="service=${serviceId}"/>
</c:url>
<h3><a href="${outageLink}">最近故障</a></h3>

<table>

<% if (outages.length == 0) { %>
  <td colspan="3">在过去24小时，这项服务没有故障。</td>
<% } else { %>
  <tr>
    <th>产生</th>
    <th>恢复</th>
    <th>故障ID</th>
  </tr>
  <%
      for(int i=0; i < outages.length; i++) {
      Outage outage = outages[i];
      pageContext.setAttribute("outage", outage);
  %>
     <tr class="<%=(outages[i].getRegainedServiceTime() == null) ? "Critical" : "Normal"%>">
      <td class="divider"><fmt:formatDate value="${outage.lostServiceTime}" type="date" dateStyle="default"/>&nbsp;<fmt:formatDate value="${outage.lostServiceTime}" type="time" pattern="HH:mm:ss"/></td>
      <% if( outages[i].getRegainedServiceTime() == null ) { %>
        <td class="divider bright"><b>Down</b></td>
      <% } else { %>
        <td class="divider bright"><fmt:formatDate value="${outage.regainedServiceTime}" type="date" dateStyle="default"/>&nbsp;<fmt:formatDate value="${outage.regainedServiceTime}" type="time" pattern="HH:mm:ss"/></td>      
      <% } %>
      <td class="divider"><a href="outage/detail.htm?id=<%=outages[i].getId()%>"><%=outages[i].getId()%></a></td>
    </tr>
  <% } %>
<% } %>

</table>
