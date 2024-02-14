<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><tiles:getAsString name="title"/></title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/a26f9e7c74.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Noto+Sans+KR:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/project/css/header.css">
    <link rel="stylesheet" href="/static/project/css/reward.css">
    <script defer src="/static/project/js/reward.js"></script>

</head>
<body>
<div class="projectEditorWrap">
    <!--header-->
    <tiles:insertAttribute name="header"/>
    <%--        </div>--%>
    <%--    </div>--%>
    <!--body-->
    <tiles:insertAttribute name="body"/>
</div>
</body>
</html>
