<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="WEB-INF/page/common/cssPart.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <jsp:include page="WEB-INF/page/common/header.jsp"/>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- 菜单 -->
        <jsp:include page="WEB-INF/page/common/memu.jsp"/>
    </aside>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- 内容标题 -->
        <section class="content-header">
            <h1>
                轻化工大学
                <small>计算机学院</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/user/index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">用户登录</li>
            </ol>
            <hr >
        </section>
        <!-- 登录表单  -->
        <div class="box box-info" style="width: 450px; margin:0 auto; margin-top: 50px;" >
            <div class="box-header with-border">
                <h4 class="title" style="text-align: center">用户登录</h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form id="form1"  class="form-horizontal" action="${pageContext.request.contextPath}/user/login" method="post" >
                <div id="msg" style="display:none;">
                    <h5 style="color: red;text-align: center">账户或密码错误！</h5>
                </div>
                <div class="box-body" >
                    <div class="form-group">
                        <label for="inputName" class="col-sm-2 control-label">账户名</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="userName" id="inputName" placeholder="账户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="userPwd" id="inputPassword3" placeholder="密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> 下次自动登录
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <%--<a href="${pageContext.request.contextPath}/user/registerUI"></a>--%>
                    <button type="button" id="registerBtn" class="btn btn-default">注册</button>
                    <button type="button" class="btn btn-info pull-right" onclick="user_login()">登录</button>
                </div>
                <!-- /.box-footer -->
            </form>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <!-- 导入底部 -->
        <jsp:include page="WEB-INF/page/common/footer.jsp"/>
    </footer>
</div>
</body>
<!-- 注册弹出框 -->
<div id="registerDiv" style="display: none" >
    <div class="box box-success">
        <div class="box-header with-border">
            <h4 class="title" style="text-align: center">用户注册</h4>
        </div>
        <div class="box-body" style="width: 80% ;margin-left: 40px" >
            <form class="form-horizontal" id="form2" action="${pageContext.request.contextPath}/user/register" method="post">
                <div class="form-group">
                    <input type="email" class="form-control" id="user_email" name="userEmail"  placeholder="邮箱">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="user_name" name="userName" placeholder="用户名">
                    <!--<span class="glyphicon glyphicon-user form-control-feedback"></span>-->
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="user_password"  name="userPassword" placeholder="密码">
                    <!--<span class="glyphicon glyphicon-lock form-control-feedback"></span>-->
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="user_password2"  placeholder="确认密码">
                    <!--<span class="glyphicon glyphicon-log-in form-control-feedback"></span>-->
                </div>
                <div class="form-group" style="" >
                    <button type="button" class="btn btn-primary" id="registerSmt" style="width: 100%; margin-top: 2px;">注册</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- ./导入js -->
<jsp:include page="WEB-INF/page/common/jsPart.jsp"/>
</html>
