<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/cssPart.jsp"/>
</head>
<body>

    <div class="panel panel-default margin">
        <p class="lead">
            请按以下步骤执行
        <ol>
            <li>下载统一导入模板<a href="${pageContext.request.contextPath}/stu/downloadmd" class="btn-link"><h6>
                《学员信息导入数据_模板.xlsx》</h6>
            </a><br/></li>
            <li>将学员基础信息填入模板,上传提交。</li>
        </ol>
        </p>
    </div>

    <div id="uploader" class="wu-example margin">
        <!--用来存放文件信息-->
        <div class="btns">
            <div id="picker" style="float: left;margin-right: 5px">选择文件</div>
            <button id="uploadBtn" class="btn btn-default" style="height: 40px">开始上传</button>
        </div>
        <div id="thelist" class="uploader-list"></div>
    </div>

    <div class="box-footer" id="btnOKDiv">
        <button type="button" class="btn btn-flat btn-success pull-right layerClose">重新查询</button>
    </div>

</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/page/common/jsPart.jsp"/>

<script type="text/javascript">
    $(function () {


        // 重新刷新，关闭弹窗
        $(".layerClose").click(function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
            parent.location.reload();
        });

        //创建上传文件对象
        var uploader = WebUploader.create({

            // swf文件路径
            swf: '${pageContext.request.contextPath}/bower_components/webuploader/Uploader.swf',

            // 文件接收服务端。
            server: '${pageContext.request.contextPath}/stu/uploaderFile',

            // 传入参数。可选。
            formData: { "clazzId": "${clazzId}"},
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#picker',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            //只能上传一个文件
            fileNumLimit:1
        });

        //点击上传按钮，实现上传
        $("#uploadBtn").click(function () {
           uploader.upload();
        });
        //选择文件 完毕
        uploader.on( 'fileQueued', function( file ) {
            if(file.name.indexOf("xls")==-1 && file.name.indexOf("xlsx")==-1){
                layer.msg("文件格式不对",{icon:5,time:700});
                return;
            }
            $("#thelist").append( '<div id="' + file.id + '" class="item">' +
                '<h4 class="info">' + file.name + '</h4>' +
                '<p class="state">等待上传...</p>' +
                '</div>' );
        });

        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                $percent = $li.find('.progress .progress-bar');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<div class="progress progress-striped active">' +
                    '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                    '</div>' +
                    '</div>').appendTo( $li ).find('.progress-bar');
            }

            $li.find('p.state').text('上传中');
            $percent.css( 'width', percentage * 100 + '%' );
        });
        uploader.on( 'uploadSuccess', function( file,data) {
            var $li = $( '#'+file.id );
            if(data["success"]){
                $("#thelist").find("h4").html("");
                $li.find('p.state').text("成功插入了"+data.updateCount+"条数据").css({"color":"green","font-size":"20px"});
                $("#btnOKDiv").show();
            }else{
                $li.find('p.state').text("操作失败! "+data.msg).css({"background-color":"red","font-size":"20px"});
            }
        });

        uploader.on( 'uploadError', function( file ) {
            $( '#'+file.id ).find('p.state').text('上传出错').css({"background-color":"red","font-size":"20px"});;
        });

        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress').fadeOut();
        });
    });

</script>
</html>

