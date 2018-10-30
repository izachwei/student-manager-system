<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">
    <!-- 左边功能菜单 -->
    <c:choose>
        <c:when test="${empty user}">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.request.contextPath}/dist/img/user_default.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>请先登录</p>
                    <a href="#"><i class="fa fa-circle text-red"></i> 离线</a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- 用户模块 -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.request.contextPath}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${user.userName}</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>
            <!-- /.search form -->
            <!-- 功能菜单 style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="active treeview">
                    <a href="#">
                        <i class="fa fa-wechat"></i> <span>班级管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="active"><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-plus-square-o"></i> 添加班级</a></li>
                        <li><a href="${pageContext.request.contextPath}/clazz/findAll"><i class="glyphicon glyphicon-search "></i> 查看班级</a></li>
                    </ul>
                </li>
                <li class="active treeview">
                    <a href="#">
                        <i class="fa fa-wechat"></i> <span>学员管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="active"><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-plus-square-o"></i> 添加学员</a></li>
                        <li><a href="${pageContext.request.contextPath}/clazz/findAll"><i class="glyphicon glyphicon-search "></i> 查看学员</a></li>
                    </ul>
                </li>

            </ul>
        </c:otherwise>
    </c:choose>
</section>
<!-- /.sidebar -->
