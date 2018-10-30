<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body>
    <!-- 更改学员 -->
    <div  id="udClazzDiv" class="box box-info" >
        <form class="form-horizontal" id="addStudentForm">
            <div class="box-body">
                <input type="hidden" value="${studentUd.studentClazzId}" name="studentClazzId" >
                <div class="form-group">
                    <label for="student_clazz_name" class="col-sm-3 control-label">所在班级</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" value="${studentUd.studentClazzName}"  readonly="true" id="student_clazz_name" name="studentClazzName" placeholder="实训方向">
                    </div>
                </div>
                <div class="form-group">

                    <label for="student_name" class="col-sm-3 control-label">学员姓名</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="student_name" name="studentName" value="${studentUd.studentName}" placeholder="学员姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="student_num" class="col-sm-3 control-label">学号</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="student_num" name="studentNum" value="${studentUd.studentNum}" placeholder="学号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">性别</label>

                    <div class="col-sm-9">
                        <c:if test="${studentUd.studentSex == 1}">
                            <input type="radio" name="studentSex" value="1" checked="checked" /> 男
                            <input type="radio" name="studentSex" value="0" /> 女
                        </c:if>
                        <c:if test="${studentUd.studentSex != 1}">
                            <input type="radio" name="studentSex" value="1" /> 男
                            <input type="radio" name="studentSex" value="0"  checked="checked" /> 女
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label for="student_school" class="col-sm-3 control-label">大学名称</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="student_school" name="studentSchool" value="${studentUd.studentSchool}" placeholder="大学名称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="student_phone" class="col-sm-3 control-label">手机号码</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="student_phone" name="studentPhone"  value="${studentUd.studentPhone}"  placeholder="手机号码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="student_profession" class="col-sm-3 control-label">大学专业</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="student_profession" name="studentProfession"  value="${studentUd.studentProfession}" placeholder="大学专业">
                    </div>
                </div>
                <div class="form-group">
                    <label for="student_direction" class="col-sm-3 control-label">实训方向</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="student_direction" name="studentDirection"  value="${studentUd.studentDirection}" placeholder="实训方向">
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
