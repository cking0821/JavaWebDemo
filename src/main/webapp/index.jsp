<%--
  Created by IntelliJ IDEA.
  User: enmonster
  Date: 2018/7/3
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="en">
    <style>
        <!--html, body {. .}这个是设置html, body的样式-- >
        html, body {
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
        }
    </style>
    <script src="resources/js/echarts.min.js"></script>
    <script src="resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div id="content" style="height:100%; width:100%;display: table;">

    <div id="left" style="background: #99B898; width:40%; height:100%;
            position:relative;top:0;left: 0; display:table-cell;">
        <p style="text-align: center; font-weight: 400;font-size: 30px">The Statistics of Call</p>
        <p>readme</p>
    </div>

    <div id="right" style="height:100%; width:60%; position: relative;display: table-cell;">
        <div id="top" style="background: #FFFFFF; height: 420px; position: absolute; top:0;left: 0;width: 50%">
            <div id="topLeft" style="position:absolute; height:100%;width: 90%">
            </div>
            <div id="topRight" style="position:absolute; left: 552px; width: 90%;height:100%;"><!--#FFA500-->
            </div>
        </div>

        <div id="bottom" style="background: #FFFFFF; height: 420px; position: absolute;top:490px;width: 50%;">
            <div id="bottomLeft" style="position: absolute;height:100%;width:90% ">
            </div>
            <!--
            width:90%  指的是在父框架的基础上的90%-->
            <div id="bottomRight" style="position: absolute; left: 552px; height:100%;width: 90%;">
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    /**
     * loadData()
     * @param option
     * AJAX
     */
    function loadData(option) {
        $.ajax({
            type: 'post',	//传输类型
            async: false,	//同步执行
            url: 'statistics.display',	//web.xml中注册的Servlet的url-pattern
            data: {},
            dataType: 'json', //返回数据形式为json
            success: function (result) {
                if (result) {
                    //初始化xAxis[0]的data
                    option.xAxis[0].data = [];
                    for (var i = 0; i < result.length; i++) {
                        option.xAxis[0].data.push(result[i].yearMonth);
                    }
                    //初始化series[0]的data
                    option.series[0].data = [];
                    for (var i = 0; i < result.length; i++) {
                        option.series[0].data.push(result[i].callDuration);
                    }
                }
            },
            error: function (errorMsg) {
                alert("加载数据失败");
            }
        });
    }

    var myChart = echarts.init(document.getElementById('topLeft'));
    var option = {
        tooltip: {show: true},
        legend: {data: ['每月通话详情']},
        //如下两行是不可改变的。即x轴是种类；y轴是值
        xAxis: [{type: 'category'}],
        yAxis: [{type: 'value'}],
        //you can set this type => line ,bar ,pie, scatter
        series: [{name: '每月通话详情',type: 'bar'}]
    };
    //加载数据到option  your defined function
    loadData(option);
    //设置option
    myChart.setOption(option);
</script>
<script type="text/javascript">
    function loadData(option) {
        $.ajax({
            type: 'post',	//传输类型
            async: false,	//同步执行
            url: 'intimacy.display',	//web.xml中注册的Servlet的url-pattern
            data: {},
            dataType: 'json', //返回数据形式为json
            success: function (result) {
                if (result) {
                    //初始化xAxis[0]的data
                    option.xAxis[0].data = [];
                    for (var i = 0; i < result.length; i++) {
                        option.xAxis[0].data.push(result[i].callee);
                    }
                    //初始化series[0]的data
                    option.series[0].data = [];
                    for (var i = 0; i < result.length; i++) {
                        option.series[0].data.push(result[i].totalTime);
                    }
                }
            },
            error: function (errorMsg) {
                alert("加载数据失败");
            }
        });
    }

    var myChart = echarts.init(document.getElementById('topRight'));
    var option = {
        tooltip: {show: true},
        legend: {type:plain,data: ['好友亲密度']},
        xAxis: [{type: 'category'}],
        yAxis: [{type: 'value'}],
        series: [{name: '好友亲密度',type: 'pie'}]
    };
    //加载数据到option  your defined function
    loadData(option);
    //设置option
    myChart.setOption(option);
</script>
<script type="text/javascript">
    function loadData(option) {
        $.ajax({
            type: 'post',	//传输类型
            async: false,	//同步执行
            url: 'bar.display',	//web.xml中注册的Servlet的url-pattern
            data: {},
            dataType: 'json', //返回数据形式为json
            success: function (result) {
                if (result) {
                    //初始化xAxis[0]的data
                    option.xAxis[0].data = [];
                    for (var i = 0; i < result.length; i++) {
                        option.xAxis[0].data.push(result[i].name);
                    }
                    //初始化series[0]的data
                    option.series[0].data = [];
                    for (var i = 0; i < result.length; i++) {
                        option.series[0].data.push(result[i].num);
                    }
                }
            },
            error: function (errorMsg) {
                alert("加载数据失败");
            }
        });
    }

    var myChart = echarts.init(document.getElementById('bottomLeft'));
    var option = {
        tooltip: {show: true},
        legend: {data: ['销量']},
        xAxis: [{type: 'category'}],
        yAxis: [{type: 'value'}],
        series: [{name: '销量', type: 'bar'}]
    };
    //加载数据到option  your defined function
    loadData(option);
    //设置option
    myChart.setOption(option);
</script>
<script type="text/javascript">
    function loadData(option) {
        $.ajax({
            type: 'post',	//传输类型
            async: false,	//同步执行
            url: 'bar.display',	//web.xml中注册的Servlet的url-pattern
            data: {},
            dataType: 'json', //返回数据形式为json
            success: function (result) {
                if (result) {
                    //初始化xAxis[0]的data
                    option.xAxis[0].data = [];
                    for (var i = 0; i < result.length; i++) {
                        option.xAxis[0].data.push(result[i].name);
                    }
                    //初始化series[0]的data
                    option.series[0].data = [];
                    for (var i = 0; i < result.length; i++) {
                        option.series[0].data.push(result[i].num);
                    }
                }
            },
            error: function (errorMsg) {
                alert("加载数据失败");
            }
        });
    }

    //get element by id = "myDiv"
    var myChart = echarts.init(document.getElementById('bottomRight'));
    var option = {
        tooltip: {show: true},
        legend: {data: ['销量']},
        xAxis: [{type: 'category'}],
        yAxis: [{type: 'value'}],
        series: [{name: '销量',type: 'line'}]
    };
    //加载数据到option  your defined function
    loadData(option);
    //设置option
    myChart.setOption(option);
</script>
</body>
</html>
