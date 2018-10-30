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

        <!-- 表格部分 -->
        <section class="content" >
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a href="javascript:void(0)" id="addStudent" class="btn btn-success btn-flat">添加学员</a>
                            </h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="clazzTable" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>学员姓名</th>
                                    <th>学员学号</th>
                                    <th>学员性别</th>
                                    <th>所在班级</th>
                                    <th>大学名称</th>
                                    <th>手机</th>
                                    <th>专业</th>
                                    <th>所在组</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${students}" var="stu">
                                    <tr id="${stu.studentId}">
                                        <td>${stu.studentName}</td>
                                        <td>${stu.studentNum}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${stu.studentSex == 1}">
                                                    男
                                                </c:when>
                                                <c:otherwise>
                                                    女
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${stu.studentClazzName}</td>
                                        <td>${stu.studentSchool}</td>
                                        <td>${stu.studentPhone}</td>
                                        <td>${stu.studentProfession}</td>
                                        <td>
                                            <c:if test="${ empty  stu.studentGroupId}">
                                                <a class="btn btn-flat btn-info importStudent">加入组</a>
                                            </c:if>
                                            <c:if test="${ not empty stu.studentGroupId}">
                                                <a class="btn btn-flat btn-link showStudentMsg">${stu.studentGroup.groupName}</a>
                                            </c:if>
                                        </td>
                                        <td>
                                            <button class="btn btn-flat btn-xs btn-info updateStudent">编辑</button>
                                            <button class="btn btn-flat  btn-danger btn-xs deleteStudent">删除</button>
                                                <c:choose>
                                                    <c:when test="${stu.studentUser.userStatus == 1}">
                                                          <button class="btn btn-flat  btn-success btn-xs lockStudent"><i class="fa  fa-unlock"></i> 锁定</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-flat  btn-danger btn-xs unlockStudent"> <i class="fa fa-lock"></i> 解锁</button>
                                                    </c:otherwise>
                                                </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/footer.jsp"/>
    </footer>
</div>
<!-- 添加学员模态框 -->
<div  id="addStudentDiv" class="box box-info" style="display: none">
    <form class="form-horizontal" id="addStudentForm">
        <div class="box-body">
            <input type="hidden" value="${clazz.clazzId}" name="studentClazzId" >
            <div class="form-group">
                <label for="student_clazz_name" class="col-sm-3 control-label">所在班级</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" value="${clazz.clazzName}"  readonly="true" id="student_clazz_name" name="studentClazzName" placeholder="实训方向">
                </div>
            </div>
            <div class="form-group">

                <label for="student_name" class="col-sm-3 control-label">学员姓名</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="student_name" name="studentName" placeholder="学员姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="student_num" class="col-sm-3 control-label">学号</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="student_num" name="studentNum" placeholder="学号">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">性别</label>

                <div class="col-sm-9">
                    <input type="radio" name="studentSex" value="1" checked="checked" /> 男
                    <input type="radio" name="studentSex" value="0" /> 女
                </div>
            </div>
            <div class="form-group">
                <label for="student_school" class="col-sm-3 control-label">大学名称</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="student_school" name="studentSchool" placeholder="大学名称">
                </div>
            </div>
            <div class="form-group">
                <label for="student_phone" class="col-sm-3 control-label">手机号码</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="student_phone" name="studentPhone" placeholder="手机号码">
                </div>
            </div>
            <div class="form-group">
                <label for="student_profession" class="col-sm-3 control-label">大学专业</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="student_profession" name="studentProfession" placeholder="大学专业">
                </div>
            </div>
            <div class="form-group">
                <label for="student_direction" class="col-sm-3 control-label">实训方向</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="student_direction" name="studentDirection" placeholder="实训方向">
                </div>
            </div>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button id="qxBtn" type="button" class="btn btn-default">取消</button>
            <button type="button" id="addSmtBtn" class="btn btn-info pull-right">提交</button>
        </div>
        <!-- /.box-footer -->
    </form>
</div>


<!-- 导入js -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
<!-- page script -->
<script>

    $(function () {

        /* 解锁学生 ajax */
        $(".content").delegate(".unlockStudent","click",function () {
            var $tr = $(this).parents("tr");
            var studentId =$tr.attr("id");
            $.post("${pageContext.request.contextPath}/stu/unlockStudent",{"studentId":studentId},function (result) {
                layer.msg(result.msg,{time:700},function () {
                    window.location.reload();
                })
            })
        });

        /* 解锁学生 ajax */
        $(".content").delegate(".lockStudent","click",function () {
            var $tr = $(this).parents("tr");
            var studentId =$tr.attr("id");
            $.post("${pageContext.request.contextPath}/stu/lockStudent",{"studentId":studentId},function (result) {
                layer.msg(result.msg,{time:700},function () {
                    window.location.reload();
                })
            })
        });

        /* 添加学员弹出框 提交按钮  */
        $("#addSmtBtn").click(function () {
            var formData = $("#addStudentForm").serialize();
            $.post("${pageContext.request.contextPath}/stu/addStudent",formData,function (data) {
                    if(data.result){
                        layer.msg(data.msg,{"icon":1,time:700},function () {
                            layer.closeAll();
                            window.location.reload();
                        });
                    }else {
                        layer.msg(data.msg,{"icon":5,time:2000},function () {

                        });
                    }
                },
                "json");
        });


        /* 增加学员 */
        $("#addStudent").click(function () {
            layer.open({
                    type:1,
                    title:"添加学员",
                    content: $("#addStudentDiv"),
                    area: ['400px', '600px']
                }
            );
        });

        /* 删除学员 ajax */
        $(".content").delegate(".deleteStudent","click",function () {
            var $tr = $(this).parents("tr");
            var studentId =$tr.attr("id");
            layer.confirm('确定该元素吗?', {icon: 3, title:'提示'},function(index){
                $.ajax({
                    type:"POST",
                    data:{"studentId":studentId},
                    url:"${pageContext.request.contextPath}/stu/delStudent",
                    success:function (data) {
                        if(data.result){
                            layer.msg(data.msg,{icon: 1,time:700},function () {
                                layer.close(index);
                                window.location.reload();
                            })
                        }else {
                            layer.msg(data.msg,{icon: 5,time:2000},function () {
                                layer.close(index);
                            })
                        }
                    },
                    dataType:"json"
                });
            });

        });



        /* 更改学员 */
        $(".content").delegate(".updateStudent","click",function () {
            var $tr = $(this).parents("tr");
            var studentId =$tr.attr("id");
            layer.open({
                    type:2,
                    title:"更改学员",
                    content: "${pageContext.request.contextPath}/stu/updateStudentUI?studentId="+studentId,
                    area: ['400px', '800px']
                }
            );
        });


        /* 添加班级弹出框 取消按钮 */
        $("#qxBtn").click(function () {
            layer.closeAll();
        });



        $("#clazzTable").DataTable(
            {
                'paging'      : true,
                'lengthChange': true,
                'searching'   : true,
                'ordering'    : true,
                'info'        : true,
                'autoWidth'   : false,
                'language':{
                    "paginate": {
                        "next": "下一页",
                        "previous":"上一页"
                    },
                    "sZeroRecords": "没有找到",
                    "search":"快速搜索",
                    "emptyTable":"无可用数据",
                    "lengthMenu": "_MENU_ 项/页",
                    "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项"
                }

            });
    } );

</script>
</body>
</html>


