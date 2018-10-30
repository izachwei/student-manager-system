<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>学生管理系统</title>
    <!-- 导入CSS-->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body class="hold-transition skin-blue  sidebar-mini layui-bg-black" >
<div class="wrapper">

    <!--头部-->
    <header class="main-header">
        <!-- 头部导入头部 -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/header.jsp"/>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- 导入菜单栏 -->
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/memu.jsp"/>
    </aside>

    <!-- 内容 -->
    <div class="content-wrapper">
        <!-- 内容标题 -->
        <section class="content-header">
            <h1>
                ${clazz.clazzName}
                <small>${students[0].studentSchool}</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/user/index"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a class="active">学生管理</a></li>
            </ol>
        </section>
        <section class="content">

            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">班级${clazz.clazzName}分组信息</font></font></h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                            <i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
                            <i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="panel-group" id="accordion">

                        <c:forEach items="${groups}" var="group" >
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseOne${group.groupId}">
                                                ${group.groupName}
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne${group.groupId}" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        组名：<p>${group.groupName}</p>
                                        小组人数：<p>${group.groupCount}</p>
                                        组长：
                                            <c:choose>
                                                <c:when test="${empty group.groupLeaderId}">
                                                   <p>无</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p>${group.groupLeaderId}</p>
                                                </c:otherwise>
                                            </c:choose>
                                        项目：
                                            <c:choose>
                                                <c:when test="${empty group.groupProjectId}">
                                                    <p>无</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p> ${group.groupProjectId}</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                </div>
            </div>
            <!-- /.box -->

        </section>
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/footer.jsp"/>
    </footer>
</div>

<!-- 导入js -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
<!-- page script -->
<script>

    $(function () {

    } );

</script>
</body>
</html>


