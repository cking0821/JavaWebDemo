<%--
  Created by IntelliJ IDEA.
  User: enmonster
  Date: 2018/7/2
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort()	+ path + "/";
%>
<!DOCTYPE>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hello ECharts</title>
    <!-- 使用单文件引入的方式使用ECharts.JS -->
    <script src="resources/js/echarts.min.js"></script>
    <script src="resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<!-- DOM用来设置展示ECharts图表的区域 -->
<div id="myDiv" style="height: 400px"></div>
<p>I'm programming</p>
<div id="second" style = "height: 400px; margin: 0;"></div>
<script type="text/javascript">
    /**
     * loadData()
     * @param option
     * AJAX
     */
    function loadData(option) {
        $.ajax({
            type : 'post',	//传输类型
            async : false,	//同步执行
            url : 'bar.do',	//web.xml中注册的Servlet的url-pattern
            data : {},
            dataType : 'json', //返回数据形式为json
            success : function(result) {
                if (result) {
                    //初始化xAxis[0]的data
                    option.xAxis[0].data = [];
                    for (var i=0; i<result.length; i++) {
                        option.xAxis[0].data.push(result[i].name);
                    }
                    //初始化series[0]的data
                    option.series[0].data = [];
                    for (var i=0; i<result.length; i++) {
                        option.series[0].data.push(result[i].num);
                    }
                }
            },
            error : function(errorMsg) {
                alert("加载数据失败");
            }
        });
    }
    //get element by id = "myDiv"
    var myChart = echarts.init(document.getElementById('myDiv'));
    var option = {
        tooltip : {
            show : true
        },
        legend : {
            data : [ '销量' ]
        },
        xAxis : [ {
            type : 'category'
        } ],
        yAxis : [ {
            type : 'value'
        } ],
        series : [ {
            name : '销量',
            type : 'bar'
           //you can set this type => line ,bar ,pie, scatter
        } ]
    };
    //加载数据到option  your defined function
    loadData(option);
    //设置option
    myChart.setOption(option);
</script>
<script type="text/javascript">
    function loadData(option) {
        $.ajax({
            type : 'post',	//传输类型
            async : false,	//同步执行
            url : 'bar.do',	//web.xml中注册的Servlet的url-pattern
            data : {},
            dataType : 'json', //返回数据形式为json
            success : function(result) {
                if (result) {
                    //初始化xAxis[0]的data
                    option.xAxis[0].data = [];
                    for (var i=0; i<result.length; i++) {
                        option.xAxis[0].data.push(result[i].name);
                    }
                    //初始化series[0]的data
                    option.series[0].data = [];
                    for (var i=0; i<result.length; i++) {
                        option.series[0].data.push(result[i].num);
                    }
                }
            },
            error : function(errorMsg) {
                alert("加载数据失败");
            }
        });
    }
    //get element by id = "myDiv"
    var myChart = echarts.init(document.getElementById('second'));
    var option = {
        tooltip : {
            show : true
        },
        legend : {
            data : [ '销量' ]
        },
        xAxis : [ {
            type : 'category'
        } ],
        yAxis : [ {
            type : 'value'
        } ],
        series : [ {
            name : '销量',
            type : 'line'
        } ]
    };
    //加载数据到option  your defined function
    loadData(option);
    //设置option
    myChart.setOption(option);
</script>

</body>