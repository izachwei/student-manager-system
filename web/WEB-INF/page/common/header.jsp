<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Logo -->
<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
<a href="javacript:void(0)" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini">系统</span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><i class="fa fa-plane"></i> 学生管理系统</span>
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
    </a>

    <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
            <li class="dropdown user user-menu">
                <c:choose>
                    <c:when test="${empty user}">
                        <a href="${pageContext.request.contextPath}/user/loginUI">
                        <span class="hidden-xs"><i class="fa fa-frown-o fa-2x"></i>  请先登录</span>
                        </a>
                     </c:when>
                    <c:otherwise>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/dist/img/user7-128x128.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">${user.userName}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="${pageContext.request.contextPath}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                        ${user.userName} - 全栈架构工程师
                                    <small>上次登录时间. 2018-10-20</small>
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <%--<li class="user-body">
                                <div class="row">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </li>--%>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">个人中心</a>
                                </div>
                                <div class="pull-right">
                                    <button id="exitBtn" class="btn btn-default btn-flat">退出</button>
                                </div>
                            </li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>
</nav>
