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
       <jsp:include page="../common/header.jsp"/>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- 导入菜单栏 -->
        <jsp:include page="../common/memu.jsp"/>
    </aside>

    <!-- 内容 -->
    <div class="content-wrapper">
        <!-- 内容标题 -->
        <section class="content-header">
            <h1>
                轻化工大学
                <small>计算机学院</small>
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
                                <a href="${pageContext.request.contextPath}/clazz/findAll"><button class="btn btn-info btn-flat">查询班级</button></a>
                                <a href="javascript:void(0)" id="addClazz" class="btn btn-success btn-flat">添加班级</a>
                            </h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="clazzTable" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                      <th>班级姓名</th>
                                      <th>技术方向</th>
                                      <th>开始时间</th>
                                      <th>结束时间</th>
                                      <th>工程师</th>
                                       <th>分组</th>
                                      <th>班级人数</th>
                                      <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${clazzes}" var="clazz">
                                        <tr id="${clazz.clazzId}">
                                            <td>${clazz.clazzName}</td>
                                            <td>${clazz.clazzDirection}</td>
                                            <td>${clazz.startTimeTxt}</td>
                                            <td>${clazz.endTimeTxt}</td>
                                            <td>${clazz.clazzEngineerName}</td>
                                            <td>
                                                <c:if test="${clazz.clazzGroupNum==0}">
                                                    <div class="panel-group " id="accordion" style="width: 100px">
                                                        <div class="panel panel-info " >
                                                            <div class=" panel-heading" >
                                                                <h4 class="panel-title">
                                                                    <a  data-toggle="collapse" data-parent="#accordion"
                                                                       href="#collapseOne${clazz.clazzId}">
                                                                        学员分组
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseOne${clazz.clazzId}" class="panel-collapse collapse">
                                                                <div class="panel-title">
                                                                    <a class=" btn btn-success randomGroup btn-flat" style="display: inline-flex;width: 100px"  >随机分组</a>
                                                                    <a class=" btn btn-warning selfGroup btn-flat" style=" display: inline-flex; width: 100px" href="/clazz/findAll">自定义分组</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${clazz.clazzGroupNum!=0}">
                                                    <a  href="${pageContext.request.contextPath}/group/findGroupByClazzId?clazzId=${clazz.clazzId}" class="btn  btn-flat btn-info showStudentMsg">分组详情</a>
                                                </c:if>
                                            </td>
                                            <td>${clazz.clazzStuCount}
                                                <c:if test="${clazz.clazzStuCount==0}">
                                                    <a class="btn btn-flat btn-link importStudent">导入</a>
                                                </c:if>
                                                <c:if test="${clazz.clazzStuCount!=0}">
                                                    <a  href="${pageContext.request.contextPath}/stu/findStuByClazzId?stuClazzId=${clazz.clazzId}" class="btn btn-flat btn-link showStudentMsg">详情</a>
                                                </c:if>
                                            </td>
                                            <td>
                                                <button class="btn btn-flat btn-xs btn-info updateClazz">编辑</button>
                                                <button class="btn btn-flat  btn-danger btn-xs deleteClazz">删除</button>
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
<!-- 添加班级模态框 -->
<div  id="addClazzDiv" class="box box-info" style="display: none">
   <%-- <div class="box-header with-border">
        <h3 class="box-title" ><i class="fa fa-user-plus"></i></h3>
    </div>--%>
    <!-- /.box-header -->
    <!-- form start -->
    <form class="form-horizontal" id="addClazzForm">
        <div class="box-body">
            <div class="form-group">
                <label for="clazz_name" class="col-sm-3 control-label">班级姓名</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="clazz_name" name="clazzName" placeholder="班级姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="technology_direction" class="col-sm-3 control-label">技术方向</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="technology_direction" name="clazzDirection" placeholder="技术方向">
                </div>
            </div>
            <div class="form-group">
                <label for="start_time" class="col-sm-3 control-label">开始时间</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="start_time" name="clazzStartTime" placeholder="开始时间">
                </div>
            </div>
            <div class="form-group">
                <label for="end_time" class="col-sm-3 control-label">结束时间</label>

                <div class="col-sm-9">
                    <input type="text" class="form-control" id="end_time" name="clazzEndTime" placeholder="结束时间">
                </div>
            </div>
           <%-- <div class="form-group">
                <label>开始时间</label>
                <div class="input-group">
                    <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" class="form-control pull-right" id="startDate" placeholder="开始" name="startTime">

                    <span class="input-group-addon">到</span>
                    <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" class="form-control pull-right" id="endDate" placeholder="结束" name="endTime">
                </div>
            </div>--%>

            <div class="form-group">
                <label for="clazz_engineerId" class="col-sm-3 control-label">工程师</label>
                <div class="col-sm-9">
                    <select class="form-control select2 select2-hidden-accessible" name="clazzEngineerId" id="clazz_engineerId" style="width: 100%;" tabindex="-1" aria-hidden="true">

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="remarks" class="col-sm-3 control-label">备注信息</label>
                <div class="col-sm-9">
                    <textarea  class="form-control" id="remarks" name="clazzClazzRemark" placeholder="备注信息"  cols="30" rows="10"></textarea>
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


        /* 分组情况 */
        $(".content").delegate(".randomGroup","click",function () {
            var $tr = $(this).parents("tr");
            var clazzId =$tr.attr("id");
            layer.open({
                    type:2,
                    title:"学员分组",
                    content: "${pageContext.request.contextPath}/group/randomGroupUI?clazzId="+clazzId,
                    area: ['300px', '250px']
                }
            );
        });
        /* 分组 取消按钮 */
        $("#qxBtn_group").click(function () {
            layer.closeAll();
        });

        /* 导入班级 ajax */
        $(".content").delegate(".importStudent","click",function () {
            var $tr = $(this).parents("tr");
            var clazzId =$tr.attr("id");
            layer.open({
                    type:2,
                    title:"导入学员",
                    content: "${pageContext.request.contextPath}/stu/importStuUI?clazzId="+clazzId,
                    area: ['400px', '600px']
                }
            );
        });


        /* 工程师下拉列表的事件 */
        $.post("${pageContext.request.contextPath}/engineer/findAll",function (result) {
            var engineers = result.engineers;
            $("#clazz_engineerId").append("<option selected value=''>---请选择---</option>");
            if(result.success) {
                for (var i = 0; i < engineers.length; i++) {
                    $("#clazz_engineerId").append("<option value='" + engineers[i].engineerId + "'>" + engineers[i].engineerName + "</option>");
                }
            }else{
                $("#clazz_engineerId").append("<option selected value=''>---"+result.success+"---</option>");
            }
        });

        /* 增加班级 */
        $("#addClazz").click(function () {
            layer.open({
                    type:1,
                    title:"添加班级",
                    content: $("#addClazzDiv"),
                    area: ['400px', '640px']
                }
            );
        });

        /* 更改班级 ajax */
        $(".content").delegate(".updateClazz","click",function () {
            var $tr = $(this).parents("tr");
            var clazzId =$tr.attr("id");
            layer.open({
                    type:2,
                    title:"更改班级",
                    content: "${pageContext.request.contextPath}/clazz/updateClazzUI?clazzId="+clazzId,
                    area: ['400px', '800px']
                }
            );
        });




        /* 添加班级弹出框 提交按钮  */
        $("#addSmtBtn").click(function () {
            var formData = $("#addClazzForm").serialize();
            $.post("${pageContext.request.contextPath}/clazz/addClazz",formData,function (data) {
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

        /* 添加班级弹出框 取消按钮 */
        $("#qxBtn").click(function () {
            layer.closeAll();
        });

        /* 删除班级 ajax */
        $(".content").delegate(".deleteClazz","click",function () {
                var $tr = $(this).parents("tr");
                var clazzId =$tr.attr("id");
                layer.confirm('确定该元素吗?', {icon: 3, title:'提示'},function(index){
                 $.ajax({
                        type:"POST",
                        data:{"clazzId":clazzId},
                        url:"${pageContext.request.contextPath}/clazz/delClazz",
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


    $("#end_time,#start_time").datepicker({
        format: 'yyyy-mm-dd',
        autoclose:true,
        language:"zh-CN"
        }
    );
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


/*$(function () {
        $('#example1').DataTable()
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false
        })
    })*/
</script>
</body>
</html>

