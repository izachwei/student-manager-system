var pageContext = $("#PageContext").val();
$(function() {
    $("#registerBtn").click(function () {
        layer.open({
                type:1,
                title:"",
                content: $("#registerDiv"),
                area: ['400px', '500px']
            }
        );
    });

    $("#registerSmt").click(function () {
        var data = $("#form2").serialize();
        $.post($("#form2").attr("action"),data,function (result) {
            if(result.rs){
                layer.msg("注册成功",{icon: 1,time:1000},function () {
                    layer.closeAll();
                });
            }else{
                layer.msg("注册失败，服务器拉闸了！",{icon: 5,time:2000},function () {
                    layer.closeAll();
                });
            }
        },"json");
    });

    /* 退出按钮 */
   $("#exitBtn").click(function () {
       $.ajax({
           type:"post",
           url: pageContext+"/user/exit",
           success:function (data) {
               if(data.result){
                   layer.msg(data.msg,{time:700},function () {
                       window.location.reload();
                   });
               }else{
                   layer.msg(data.msg,{time:700},function () {
                       window.location.reload();
                   });
               }
           },
           dataType:"json"
       });
   });
});
/*ajax请求登录
       $.post()
      第一个参数：url
      第二个参数：请求参数 data
      第三个参数：回调函数
      第四个参数：返回数据类型 默认只能判断*/

function user_login() {
    var data = $("#form1").serialize();
    $.post($("#form1").attr("action"),data,function (result) {
        if(result.result==true){
            $("#msg").attr("style","display:none;");
            layer.msg("登录成功",{time:700},function () {
                window.location=pageContext+"/user/index";
            });
        }else{
            $("#msg").attr("style","display:block;");
        }
    },"json");
}
