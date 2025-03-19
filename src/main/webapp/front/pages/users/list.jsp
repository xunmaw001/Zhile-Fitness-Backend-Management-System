<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<!--通用-->
<meta name="format-detection" content="telephone=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0">
<title>管理员列表页</title>
<link rel="stylesheet" href="../../layui/css/layui.css">
<link rel="stylesheet" href="../../xznstatic/css/style_1.css" />
<link rel="stylesheet" href="../../xznstatic/css/responsive.css" />
<link rel="stylesheet" href="../../xznstatic/css/color1.css" id="jssDefault" />
<link rel="stylesheet" href="../../xznstatic/css/tk.css" />
<link rel="stylesheet" href="../../xznstatic/css/tk-inner.css" />
</head>
<body >
  <div id="app">
    <div class="layui-carousel" id="swiper">
      <div carousel-item id="swiper-item">
        <div v-for="(item,index) in swiperList" v-bind:key="index">
          <img class="swiper-item" :src="item.img" width="100%" height="400px">
        </div>
      </div>
    </div>

    <fieldset class="search-container" style="text-align: center;margin-top: 50px;margin-bottom: 30px;">
      <form class="layui-form">
        <div class="layui-inline" style="margin-bottom: 10px;">
          <div class="layui-input-inline">
            <input type="text" name="username" id="username" placeholder="用户名" autocomplete="off" class="layui-input">
          </div>
        </div>   
        <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
          <button id="btn-search" type="button" class="layui-btn" style="background-color: #F5BB00;">
            搜索
          </button>
          <button v-if="isAuth('users','新增')" @click="jump('../users/add.jsp')" type="button" class="layui-btn btn-theme">
            <i class="layui-icon">&#xe654;</i> 添加
          </button>
        </div>
      </form>
    </fieldset>

    <div class="page-container" id="innerpage-wrap">
      <div class="container">
        <div class="row">
          <div class="main col-xs-12 inner-left" role="main" id="cw100">
            <div class="our-work picture-wrap">
              <div id="gallery-container">
                <div class="row gallery-3-columns isotope-x clearfix">
                  <div class="gallery-item isotope-item print-media col-lg-3 col-sm-3 col-xs-6" v-for="(item,index) in dataList" v-bind:key="index">
                    <div class="inner-contents">
                      <figure style="text-align: center;">
                        <a class="gallery-btn swipebox" :href="'../users/detail.jsp?id='+item.id">查看更多</a>
                        <div class="media-container"></div>
                        <a :href="'../users/detail.jsp?id='+item.id">
                      </figure>
                      <h5 class="item-title" v-if="item.price"><span style="color: red;">{{item.price}} RMB</span>
                    </div>
                  </div>
                </div>
                <div id="pages" class="page">
                  <div class="pager" id="pager"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <section class="footer-bottom-area" id="copyright" style="margin-top: 30px;">
      <div class="container ">
        <div class="footer-bottom">
          <div class="clearfix">
            <div class="Copy-LE" style="text-align: center;">
              <div class="copy-right">
                <p v-text="projectName"></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-angle-up"></span></div>
  </div>

  <script src="../../layui/layui.js"></script>
  <script src="../../js/vue.js"></script>
  <script src="../../js/config.js"></script>
  <script src="../../modules/config.js"></script>
  <script src="../../js/utils.js"></script>

  <script>
    var vue = new Vue({
      el: '#app',
      data: {
        projectName: projectName,
        swiperList: [{
          img: '../../img/banner.jpg'
        }],
        dataList: []
      },
      methods: {
        isAuth(tablename, button) {
          return isFrontAuth(tablename, button)
        },
        jump(url) {
          jump(url)
        }
      }
    });

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
      var layer = layui.layer;
      var element = layui.element;
      var carousel = layui.carousel;
      var laypage = layui.laypage;
      var http = layui.http;
      var jquery = layui.jquery;

      var limit = 8;

      http.request('config/list', 'get', {
        page: 1,
        limit: 5
      }, function(res) {
        if (res.data.list.length > 0) {
          var swiperItemHtml = '';
          for (let item of res.data.list) {
            if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
              swiperItemHtml +=
                '<div>' +
                '<img class="swiper-item" src="' + item.value + '" width="100%" height="400px">' +
                '</div>';
            }
          }
          jquery('#swiper-item').html(swiperItemHtml);
          // 轮播图
          carousel.render({
            elem: '#swiper',
            width: '100%',
            height: '400px',
            arrow: 'always',
            anim: 'fade',
            interval: 1800,
            indicator: 'inside'
          });
        }
      });

      // 分页列表
      pageList();

      // 搜索按钮
      jquery('#btn-search').click(function(e) {
        pageList();
      });

      function pageList() {
        var param = {
          page: 1,
          limit: limit
        };
        if (jquery('#username').val()) {
          param['username'] = jquery('#username').val() ? '%' + jquery('#username').val() + '%' : '';
        }  
        // 获取列表数据
        http.request('users/list', 'get', param, function(res) {
          vue.dataList = res.data.list
          // 分页
          laypage.render({
            elem: 'pager',
            count: res.data.total,
            limit: limit,
            jump: function(obj, first) {
              param.page = obj.curr;
              //首次不执行
              if (!first) {
                http.request('users/list', 'get', param, function(res) {
                  vue.dataList = res.data.list;
                })
              }
            }
          });
        })
      }
    });
  </script>
</body>
</html>