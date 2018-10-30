<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body>
    <!-- 更改班级 -->
    <div  id="udClazzDiv" class="box box-info" >
        <form class="form-horizontal" id="udClazzForm">
            <input  type="hidden" value="${clazzUd.clazzId}" name="id">
            <div class="box-body">
                <div class="form-group">
                    <label for="clazz_name_ud" class="col-sm-3 control-label">班级姓名</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="clazz_name_ud" name="name" placeholder="班级姓名" value="${clazzUd.clazzName}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="clazz_name_ud" class="col-sm-3 control-label">技术方向</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="technology_direction_ud" name="technologyDirection" placeholder="技术方向"
                               value="${clazzUd.clazzDirection}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="start_time_ud" class="col-sm-3 control-label">开始时间</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="start_time_ud" name="startTime" placeholder="开始时间" value="${clazzUd.startTimeTxt}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="end_time_ud" class="col-sm-3 control-label">结束时间</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="end_time_ud" name="endTime" placeholder="结束时间" value="${clazzUd.endTimeTxt}">
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
                    <label for="student_count_ud" class="col-sm-3 control-label">班级人数</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="student_count_ud" name="studentCount" placeholder="班级人数"
                               value="${clazzUd.clazzStuCount}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="remarks_ud" class="col-sm-3 control-label">备注信息</label>
                    <div class="col-sm-9">
                        <textarea  class="form-control" id="remarks_ud" name="remarks" placeholder="备注信息"
                                    cols="30" rows="10">${clazzUd.clazzClazzRemark}</textarea>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <button id="qxBtn_ud" type="button" class="btn btn-default">取消</button>
                <button type="button" id="udSmtBtn" class="btn btn-info pull-right">提交</button>
            </div>
            <!-- /.box-footer -->
        </form>
    </div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>
<script>
    $(function () {
        /* 更改信息框 取消按钮 */
       $("#qxBtn_ud").click(function () {
           var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
           parent.layer.close(index);
       });
       /* 提交更改信息 */
        $("#udSmtBtn").click(function () {
            var data = $("#udClazzForm").serialize();
            $.ajax({
                type:"POST",
                data:data,
                url:"${pageContext.request.contextPath}/clazz/updateClazz",
                success:function (data) {
                    if(data.result){
                        layer.msg(data.msg,{icon: 1,time:700},function () {
                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index);
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



       $("#end_time_ud,#start_time_ud").datepicker({
                format: 'yyyy-mm-dd',
                autoclose:true,
                language:"zh-CN"
            }
        );
    });



</script>
</html>
