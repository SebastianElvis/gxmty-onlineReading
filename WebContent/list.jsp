<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DirTree</title>
	<!-- Bootstrap Core CSS -->
	<link href="/gxmty/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="/gxmty/css/modern-business.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="/gxmty/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
</head>

<body>
	<ul>
	<s:iterator value="fileArrayList">
		<s:if test="isFile()==true">
			<li>
				<s:a href="./Reading?uri=%{uri}/%{getName()}" >
					<s:property value="getName()" />
				</s:a>
			</li>
		</s:if>
		<s:elseif test="isDirectory()==true">
			<li>
				<s:a href="./List?originalUri=%{uri}/%{getName()}" >
					<s:property value="getName()" />
				</s:a>
			</li>
		</s:elseif>
	</s:iterator>
	</ul>
	<script>   
		for(var i=0;i<document.links.length;i++){   
		document.links[i].href=encodeURI(document.links[i].href);   
		}   
	</script>   
	<!-- jQuery -->
	<script src="/gxmty/js/jquery.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="/gxmty/js/bootstrap.min.js"></script>

</body>

</html>