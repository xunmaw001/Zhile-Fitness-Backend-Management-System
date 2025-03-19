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
<title>新闻资讯</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="../../layui/css/layui.css">
<link rel="stylesheet" href="../../xznstatic/css/style_1.css" />
<link rel="stylesheet" href="../../xznstatic/css/responsive.css" />
<link rel="stylesheet" href="../../xznstatic/css/color1.css" id="jssDefault" />
<link rel="stylesheet" href="../../xznstatic/css/tk.css" />
<link rel="stylesheet" href="../../xznstatic/css/tk-inner.css" />
<script src="../../xznstatic/js/jquery-1.12.4.min.js"></script>
<script src="../../xznstatic/js/bootstrap.min.js"></script>
<script src="../../xznstatic/js/owl.carousel.min.js"></script>
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

    <div class="page-container" id="innerpage-wrap">
      <div class="container">
        <div class="row">
          <div class="main col-md-9 inner-left" role="main">
            <article class="blog-wrap">
              <div class="blog-article hentry format-image" v-for="(item,index) in dataList" v-bind:key="index">
                <figure>
                  <a class="swipebox-x" :href="'../news/detail.jsp?id='+item.id">
                    <img class="img-responsive" :src="item.picture" width="240" height="171" />
                  </a>
                </figure>
                <div class="entry-summary post-summary">
                  <header class="entry-header">
                    <h2 class="entry-title post-title"> 
                      <a :href="'../news/detail.jsp?id='+item.id">{{item.title}}</a></h2>
                  </header>
                  <div class="entry-meta post-meta">
                    <ul>
                      <li class="entry-date date">
                        <time class="entry-date">{{item.addtime}}</time>
                      </li>
                      <li class="tags"><a href="/a/xinwenzhongxin/gongsidongtai/">新闻资讯</a></li>
                    </ul>
                  </div>
                  <div class="entry-content">
                    <p>{{item.content|newsDesc}}...</p>
                  </div>
                  <a :href="'../news/detail.jsp?id='+item.id" class="read-more-link">查看详细</a>
                </div>
              </div>
            </article>
            <div class="news-pagination-wrap">
              <div id="pages">
                <div class="page">
                  <div class="pager" id="pager"></div>
                </div>
              </div>
            </div>
          </div>
          <aside class="sidebar col-md-3 inner-right" role="complementary">
            <img src="../../xznstatic/images/activities.png">
          </aside>
        </div>
      </div>
    </div>

    <section class="footer-bottom-area" id="copyright">
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
        dataList: [],
      },
      filters: {
        newsDesc: function(val) {
          if (val) {
            val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
            if (val.length > 60) {
              val = val.substring(0, 60);
            }

            return val;
          }
          return '';
        }
      },
      methods: {
        jump(url) {
          jump(url)
        }
      }
    })

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
      var layer = layui.layer;
      var element = layui.element;
      var carousel = layui.carousel;
      var laypage = layui.laypage;
      var http = layui.http;
      var jquery = layui.jquery;

      var limit = 5;

      http.request('config/list', 'get', {
        page: 1,
        limit: limit
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

      // 获取列表数据
      http.request('news/list', 'get', {
        page: 1,
        limit: limit
      }, function(res) {
        vue.dataList = res.data.list
        // 分页
        laypage.render({
          elem: 'pager',
          count: res.data.total,
          limit: limit,
          jump: function(obj, first) {
            //首次不执行
            if (!first) {
              http.request('news/list', 'get', {
                page: obj.curr,
                limit: obj.limit
              }, function(res) {
                vue.dataList = res.data.list;
              })
            }
          }
        });
      })
    });
  </script>

  <script src="../../xznstatic/js/jquery-1.12.4.min.js"></script>
  <script src="../../xznstatic/js/bootstrap.min.js"></script>
  <script src="../../xznstatic/js/owl.carousel.min.js"></script>
  <script src="../../xznstatic/js/jquery.themepunch.tools.min.js"></script>
  <script src="../../xznstatic/js/jquery.themepunch.revolution.min.js"></script>
  <script src="../../xznstatic/js/jquery.themepunch.extensions.min.js"></script>
  <script src="../../xznstatic/js/jquery.fancybox.pack.js"></script>
  <script src="../../xznstatic/js/jquery.appear.js"></script>
  <script src="../../xznstatic/js/menuzord.js"></script>
  <script src="../../xznstatic/js/custom.js"></script>
</body>
</html>