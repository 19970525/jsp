<%--
  Created by IntelliJ IDEA.
  User: pengjun
  Date: 2019/7/18
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
  <style type="text/css">
    body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
  </style>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZSg580wRq1SlsFzbArhrcAmIQZZW7e1u"></script>
  <title>计算驾车时间与距离</title>
</head>
<body>
经度：<input type="text" id="a" value="<%=session.getAttribute("lat").toString()%>"/>
纬度：<input type="text" id="b" value="<%=session.getAttribute("lng").toString()%>"/>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
  // 百度地图API功能
  var map = new BMap.Map("allmap");
  var lng =  document.getElementById("a").value;
  var lat = document.getElementById("b").value;
  var point = new BMap.Point(parseFloat(lng),parseFloat(lat));
  point = new BMap.Point(lng,lat);
  map.addControl(new BMap.NavigationControl()); //平移缩放控件
  map.addControl(new BMap.OverviewMapControl()); //缩略地图控件
  map.addControl(new BMap.ScaleControl(BMAP_ANCHOR_TOP_LEFT)); //比例尺控件（里面的参数可以确定空间位置，也可以默认）
  map.addControl(new BMap.MapTypeControl()); //地图类型控件
  map.addControl(new BMap.GeolocationControl) //定位控件

  //信息窗口
  var opts = {
    width : 230,     // 信息窗口宽度
    height: 90,     // 信息窗口高度
    title : "您的快递正在赶来..."  // 信息窗口标题
  }
  var date = new Date().toLocaleDateString();
  var infoWindow;
  //信息窗口
  setTimeout(function(){map.openInfoWindow(infoWindow, point)},"3000");

  //路程和时间
  var output = "大概需要";
  var searchComplete = function (results){
    if (transit.getStatus() != BMAP_STATUS_SUCCESS){
      return ;
    }
    var plan = results.getPlan(0);
    output += plan.getDuration(true) + "送达！<br>";                //获取时间
    output += "总路程为：" ;
    output += plan.getDistance(true) + "<br>";             //获取距离
  }
  var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
    onSearchComplete: searchComplete,
    onPolylinesSet: function(){
      setTimeout(function(){},"1000");
      infoWindow = new BMap.InfoWindow(output+"\n"+date, opts);  // 创建信息窗口对象
    }});



  map.panTo(point);
  // alert('您的位置：'+r.point.lng+','+r.point.lat);
  transit.search("兰州", point);  //从起点和终端确定路程和时间
  // alert('您的位置：'+r.point.lng+','+r.point.lat);
  transit.search(point, "武汉");  //从起点和终端确定路程和时间

  //弹跳动画和标注图片
  var myIcon = new BMap.Icon("images/car.png", new BMap.Size(150,75));
  var marker2 = new BMap.Marker(point,{icon:myIcon});  // 创建标注
  marker2.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
  map.addOverlay(marker2);              // 将标注添加到地图中



  map.centerAndZoom(point, 15);
  map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

</script>

