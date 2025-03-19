<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html class=" js csstransforms csstransforms3d csstransitions">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>登录</title>
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
  </style>
</head>

<body>
  <h1>登录</h1>
  <div id="app" class="w3layouts">
    <div class="signin-agile">
      <h2>登录</h2>
      <form class="layui-form login-form">
        <div class="layui-form-item layui-form-text">
          <div class="layui-input-inline" style="width: 300px;">
            <input type="text" name="username" required lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-inline" style="width: 300px;">
            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
             class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block" style="text-align: left;margin-left: 0;">
            <input v-if="item.tableName!='users'" v-for="(item,index) in menu" v-bind:key="index" type="radio" name="role" id="role" :value="item.tableName" :title="item.roleName">
          </div>
        </div>
        <div class="layui-form-item" style="margin-top: 15px;">
          <div class="layui-input-block" style="margin-left: 0;">
            <button class="layui-btn btn-submit" lay-submit lay-filter="login">登录</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
          </div>
        </div>
      </form>
    </div>
    <div class="signup-agileinfo">
      <h3>注册</h3>
      <p>经本站注册系统完成注册程序并通过身份认证的用户即成为正式用户，可以获得本站规定用户所应享有的一切权限；未经认证仅享有本站规定的部分会员权限。<span v-text="projectName"></span>有权对会员的权限设计进行变更。</p>
      <div class="more">
        <a class="book popup-with-zoom-anim button-isi zoomIn animated" style="margin-right: 10px;" data-wow-delay=".5s" v-if="item.tableName!='users'" v-for="(item,index) in menu" v-bind:key="index" @click="registerClick(item.tableName)">注册{{item.roleName.replace('注册','')}}</a>
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
        menu: menu,
        projectName: projectName
      },
      methods: {
        jump(url) {
          jump(url)
        },
        registerClick(tablename) {
          window.location.href = '../' + tablename + '/register.jsp?tablename=' + tablename;
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

      // 登录
      form.on('submit(login)', function(data) {
        data = data.field;
        if (!data.role) {
          layer.msg('请选择登录用户类型', {
            time: 2000,
            icon: 5
          });
          return false;
        }
        http.request(data.role + '/login', 'get', data, function(res) {
          layer.msg('登录成功', {
            time: 2000,
            icon: 6
          });
          // 登录凭证
          localStorage.setItem('Token', res.token);
          localStorage.setItem('role', jquery('#role:checked').attr('title'));
          // 当前登录用户角色
          localStorage.setItem('userTable', data.role);
          localStorage.setItem('sessionTable', data.role);
          // 用户名称
          localStorage.setItem('adminName', data.username);
          http.request(data.role + '/session', 'get', {}, function(res) {
            // 用户id
            localStorage.setItem('userid', res.data.id);
            // 路径访问设置
            window.location.href = '../../index.jsp';
          })
        });
        return false
      });

    });

    /**
      * 跳转登录
      * @param {Object} tablename
      */
    function registerClick(tablename) {
      window.location.href = '../' + tablename + '/register.jsp?tablename=' + tablename;
    }
  </script>
</body>

</html>