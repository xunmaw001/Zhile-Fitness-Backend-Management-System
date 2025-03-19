<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html class=" js csstransforms csstransforms3d csstransitions">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>注册</title>
  <link rel="stylesheet" href="../../layui/css/layui.css">
  <link rel="stylesheet" href="../../xznstatic/css/stylelogin.css">
  <link href="../../xznstatic/css/popup-box.css" rel="stylesheet" type="text/css" media="all">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="../../xznstatic/js/jquery-2.1.1.min.js"></script>
  <script src="../../xznstatic/js/jquery.magnific-popup.js" type="text/javascript"></script>
  <script type="text/javascript" src="../../xznstatic/js/modernizr.custom.53451.js"></script>
  <script>
    $(document).ready(function () {
      $('.popup-with-zoom-anim').magnificPopup({
        type: 'inline',
        fixedContentPos: false,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: true,
        preloader: false,
        midClick: true,
        removalDelay: 300,
        mainClass: 'my-mfp-zoom-in'
      });
    });
  </script>
  <style>
    .layui-form-item {
      margin-bottom: 0!important;
    }
    .signin-agile, .signup-agileinfo {
      height: auto!important;
    }
  </style>
</head>

<body>
  <h1>注册</h1>
  <div id="app" class="w3layouts">
    <div class="signin-agile">
      <h2>注册</h2>
      <form class="layui-form login-form">
        <div class="layui-form-item layui-form-text input">
          <div class="layui-input-inline" style="width: 300px;">
            <input type="text" id="adminid" name="adminid" placeholder="请输入管理员id" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item layui-form-text input">
          <div class="layui-input-inline" style="width: 300px;">
            <input type="text" id="isreply" name="isreply" placeholder="请输入是否回复" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item" style="margin-top: 15px;">
          <div class="layui-input-block" style="margin-left: 0;">
            <button class="layui-btn btn-submit" lay-submit lay-filter="register">注册</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
          </div>
        </div>
      </form>
    </div>
    <div class="signup-agileinfo">
      <h3>登录</h3>
      <p>经本站注册系统完成注册程序并通过身份认证的用户即成为正式用户，可以获得本站规定用户所应享有的一切权限；未经认证仅享有本站规定的部分会员权限。<span v-text="projectName"></span>有权对会员的权限设计进行变更。</p>
      <div class="more">
        <a class="book popup-with-zoom-anim button-isi zoomIn animated" data-wow-delay=".5s" @click="loginClick()">已有账号？去登录</a>
      </div>
    </div>
    <div class="clear"></div>
  </div>

  <script src="../../layui/layui.js"></script>
  <script src="../../js/vue.js"></script>
  <!-- 组件配置信息 -->
  <script src="../../js/config.js"></script>
  <!-- 扩展插件配置信息 -->
  <script src="../../modules/config.js"></script>
  <!-- 工具方法 -->
  <script src="../../js/utils.js"></script>

  <script>
    var vue = new Vue({
      el: '#app',
      data: {
        projectName: projectName
      },
      methods: {
        loginClick() {
          window.location.href = '../login/login.jsp';
        }
      }
    });

    layui.use(['layer', 'element', 'carousel', 'form', 'http', 'jquery'], function() {
      var layer = layui.layer;
      var element = layui.element;
      var carousel = layui.carousel;
      var form = layui.form;
      var http = layui.http;
      var jquery = layui.jquery;

      var tablename = http.getParam('tablename');
              
      // 注册
      form.on('submit(register)', function(data) {
        data = data.field;
        if(!data.userid){
          layer.msg('用户id不能为空', {
            time: 2000,
            icon: 5
          });
          return false
        }
                                                                        if(!isIntNumer(data.isreply)){
          layer.msg('是否回复应输入整数', {
            time: 2000,
            icon: 5
          });
          return false
        }
                        http.requestJson(tablename + '/register', 'post', data, function(res) {
          layer.msg('注册成功', {
            time: 2000,
            icon: 6
          },function(){
            // 路径访问设置
            window.location.href = '../login/login.jsp';
          });
        });
        return false
      });
    });
  </script>
</body>

</html>