<%--
/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2006-2012 The OpenNMS Group, Inc.
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

<%@page language="java"
	contentType="text/html"
	session="true"
	import="org.opennms.web.alarm.AlarmUtil"
%>

<script type="text/javascript">
<!--
function Blank_TextField_Validator()
{
  if(document.alarm_search.msgmatchany.value == "")
     {
     alert("请输入告警查询文本");
     document.alarm_search.msgmatchany.focus();
     return false;
     }
  return true;
}
-->
</script>

<form name="alarm_search" action="alarm/query" method="get" onsubmit="return Blank_TextField_Validator()">
	<p><label for="msgmatchany">告警文本</label>: <input type="text" id="msgmatchany" name="msgmatchany" /> &nbsp; <label for="relativetime">时间</label>:
		<select id="relativetime" name="relativetime">
			<option value="0" selected><%=AlarmUtil.ANY_RELATIVE_TIMES_OPTION%></option>
			<option value="1">最近1小时</option>
			<option value="2">最近4小时</option>
			<option value="3">最近8小时</option>
			<option value="4">最近12小时</option>
			<option value="5">最近1天</option>
			<option value="6">最近1周</option>
			<option value="7">最近1个月</option>                
		</select>
		<input type="submit" value="查询" /></p>            
	</form>



