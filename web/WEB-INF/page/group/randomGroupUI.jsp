<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body>
<!-- 学员分组 -->
<div  id="randomGroupDiv" class="box box-info" >
    <div class="box-header with-border">
        <h3 class="box-title" >班级:<b>${clazz.clazzName}</b> 分组信息</h3>
     </div>
    <!-- /.box-header -->
    <!-- form start -->
    <form class="form-horizontal" id="randomGroupFrom">
        <div class="box-body">
            <input type="hidden" name="clazzId" value="${clazz.clazzId}" >
            <div class="form-group">

                <label for="group_count" class="col-sm-4 control-label">小组人数</label>

                <div class="col-sm-8">
                    <select class="form-control select2 select2-hidden-accessible" name="groupCount" id="group_count" style="width: 100%;" tabindex="-1" aria-hidden="true">
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer" style="margin-top: 50px;">
                <button id="qxBtn_group" type="button" class="btn btn-default">取消</button>
                <button type="button" id="addSmtBtn_group" class="btn btn-info pull-right">提交</button>
            </div>
        </div>
        <!-- /.box-footer -->
    </form>
</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>

<script type="text/javascript">
    $(function () {


        // 重新刷新，关闭弹窗
        $("#qxBtn_group").click(function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        });
        /* 分组弹出框 提交按钮  */
        $("#addSmtBtn_group").click(function () {
            var formData = $("#randomGroupFrom").serialize();
            $.post("${pageContext.request.contextPath}/clazz/randomGroup",formData,function (data) {
                    if(data.result){
                        layer.msg(data.msg,{"icon":1,time:700},function () {
                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index);
                            parent.location.reload();
                        });
                    }else {
                        layer.msg(data.msg,{"icon":5,time:2000},function () {

                        });
                    }
                },
                "json");
        });
    })
</script>
</html>

