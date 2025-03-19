<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="renderer" content="webkit" />
  <meta name="robots" content="index, follow" />
  <title>入口页</title>
  <link rel="stylesheet" href="./layui/css/layui.css">
  <link rel="stylesheet" href="./xznstatic/css/style_1.css" />
  <link rel="stylesheet" href="./xznstatic/css/tk.css" /> 
</head>

<body scrolling="no" style="overflow-y: hidden;overflow-x: hidden;">
  <div id="app">
    <header class="header header-v1 has-over-section stricky dark-header" id="header">
      <div class="header-top" id="header-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-9 col-md-12 col-sm-12 pull-right">
              <div class="top-info">
                <div class="clearfix">
                  <ul class="contact-info pull-left">
                    <li><span v-text="projectName"></span></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="header-menu-wrapper" id="header-menu-wrapper">
        <div class="container">
          <nav class="navigation clearfix">
            <div id="menuzord" class="menuzord"> <a href="/" class="menuzord-brand"> <img src="./xznstatic/images/logo.png" id="skin-logo-img" width="192" height="65" /> </a>
              <a class="mmenu-btn noDis" href="#mmenu"><i class="fa fa-bars"></i></a>
              <ul class="menuzord-menu">
                <li class="Lev1 flip-flop-btn">
                  <a href="javascript:navPage('./pages/home/home.jsp')" class="menu1"><span data-hover="首页">首页</span></a>
                </li>
                <li class="Lev1 flip-flop-btn" v-for="(item,index) in indexNav" v-bind:key="index">
                  <a :href="'javascript:navPage(\''+item.url+'\')'" class="menu1"><span :data-hover="item.name">{{item.name}}</span></a>
                </li>
                <li class="Lev1 flip-flop-btn">
                  <a href="javascript:centerPage();" class="menu1"><span data-hover="我的">我的</span></a>
                </li>
                <li class="Lev1 flip-flop-btn">
                  <a target="_blank" :href="adminurl" class="menu1"><span data-hover="跳转到后台">跳转到后台</span></a>
                </li>
                <li class="Lev1 flip-flop-btn" v-if="cartFlag">
                  <a href="javascript:navPage('./pages/cart/list.jsp')" class="menu1"><span data-hover="购物车"><i class="layui-icon" style="font-size: 30px;">&#xe657;</i>购物车</span></a>
                </li>
                <li class="Lev1 flip-flop-btn" v-if="chatFlag">
                  <a href="javascript:chatTap()" class="menu1"><span data-hover="客服"><i class="layui-icon" style="font-size: 30px;">&#xe677;</i>在线客服</span></a>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </div>
    </header>
  </div>

  <iframe src="./pages/home/home.jsp" id="iframe" frameborder="0" scrolling="auto" onload="changeFrameHeight()"></iframe>

  <script src="./layui/layui.js"></script>
  <script src="./js/vue.js"></script>
  <script src="./js/config.js"></script>
  <script src="./xznstatic/js/jquery-1.12.4.min.js"></script>
  <script src="./xznstatic/js/bootstrap.min.js"></script>

  <script>
    projectName = '欢迎访问' + projectName + '！';
    $('#foottext').text(projectName);
    var vue = new Vue({
      el: '#app',
      created: function() {
        
      },
      data: {
        indexNav: indexNav,
        cartFlag: cartFlag,
        adminurl: adminurl,
        chatFlag: chatFlag,
        swiperList: [],
        projectName: projectName
      }
    });

    layui.config({
      base: './modules/http/'
    }).use(['layer', 'form', 'element', 'carousel', 'http', 'jquery'], function() {
      var layer = layui.layer;
      var element = layui.element;
      var form = layui.form;
      var carousel = layui.carousel;
      var http = layui.http;
      var jquery = layui.jquery;

      // 获取轮播图 数据
      http.request('config/list', 'get', {
        page: 1,
        limit: 5
      }, function(res) {
        if (res.data.list.length > 0) {
          let swiperList = [];
          res.data.list.forEach(element => {
            if (element.value != null) {
              swiperList.push({
                img: element.value
              });
            }
          });
          vue.swiperList = swiperList;
        }
      }, false);
    });
    
    function chatTap(){
      var userTable = localStorage.getItem('userTable');
      if (userTable) {
        layui.layer.open({
          type: 2,
          title: '客服聊天',
          area: ['600px', '600px'],
          content: './pages/chat/chat.jsp'
        });
      } else {
        window.location.href = './pages/login/login.jsp'
      }
    }
    
    // 导航栏跳转
    function navPage(url) {
      localStorage.setItem('iframeUrl', url);
      document.getElementById('iframe').src = url;
    }

    // 跳转到个人中心也
    function centerPage() {
      var userTable = localStorage.getItem('userTable');
      if (userTable) {
        localStorage.setItem('iframeUrl', './pages/' + userTable + '/center.jsp');
        document.getElementById('iframe').src = './pages/' + userTable + '/center.jsp';
      } else {
        window.location.href = './pages/login/login.jsp'
      }
    }

    var iframeUrl = localStorage.getItem('iframeUrl');
                            if(iframeUrl == null) {
                                iframeUrl = './pages/home/home.jsp'
                            }
    document.getElementById('iframe').src = iframeUrl;

    //  窗口变化时候iframe自适应
    function changeFrameHeight() {
      var header = document.getElementById('header').offsetHeight;
      var ifm = document.getElementById("iframe");
      ifm.height = document.documentElement.clientHeight - header;
      ifm.width = document.documentElement.clientWidth;
    }

    // reasize 事件 窗口大小变化后执行的方法
    window.onresize = function() {
      changeFrameHeight();
    }
  </script>

  <script src="./xznstatic/js/jquery.themepunch.tools.min.js"></script>
  <script src="./xznstatic/js/jquery.themepunch.revolution.min.js"></script>
  <script src="./xznstatic/js/jquery.themepunch.extensions.min.js"></script>
  <script src="./xznstatic/js/menuzord.js"></script>
  <script src="./xznstatic/js/custom.js"></script>  
</body>

</html>
