<%--
  Created by IntelliJ IDEA.
  User: 智慧
  Date: 2020/4/9
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>内部结算标准</title>
    <%@include file="/jsps/common/header.jsp" %>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-inline" role="form">
                模板:
                <div class="form-group">
                    <label class="sr-only" for="inputfile">文件输入</label>
                    <input type="file" id="inputfile">
                </div>
                上传:
                <div class="form-group">
                    <label class="sr-only" for="inputfile2">文件输入</label>
                    <input type="file" id="inputfile2">
                </div>
                <button type="button" class="btn btn-default" onclick="nb_daoru()">确定导入</button>
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#nb_xinzengModal" onclick="xzclick()" style="float: right">新增</button>
            </form>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-inline" role="form" id="cxform">
                <div class="form-group">
                    下游名称:&nbsp;
                    <select class="form-control" id="downstreamName1" name="downstreamName">

                    </select>&nbsp;&nbsp;&nbsp;
                    服务类型:&nbsp;
                    <select class="form-control" id="serviceType1" name="serviceType">

                    </select>&nbsp;&nbsp;&nbsp;
                    质保标志:&nbsp;
                    <select class="form-control" id="qualityStandard1" name="qualityStandard">

                    </select>&nbsp;&nbsp;&nbsp;
                    品牌:&nbsp;
                    <select class="form-control" id="brand1" name="brand">

                    </select>&nbsp;&nbsp;&nbsp;
                    产品层次:&nbsp;
                    <select class="form-control" id="productId1" name="productId" onchange="seltwoProduct()">

                    </select>
                    <select class="form-control" id="twoProductId1" name="twoProductId">
                        <option value="">--请选择--</option>
                    </select>
                    <select class="form-control" id="commodityGroupId1" name="commodityGroupId">

                    </select>
                </div><br>
                &nbsp;
                <div style="text-align: center">
                    <button type="button" class="btn btn-default" onclick="ManufacturerLimit()">查询</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" onclick="nb_daochu()">全部导出</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" onclick="nb_daochu(1)">选中导出</button>
                </div>
            </form>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table id="InteriorTable"></table>
        </div>
    </div>
</div>
<!-- 新增 模态框（Modal） -->
<div class="modal fade" id="nb_xinzengModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">内部标准新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline" role="form" id="nb_xzform">
                    <div class="form-group">
                        下游名称:&nbsp;
                        <select class="form-control" id="downstreamName" name="downstreamName">
                            <option>--请选择--</option>
                        </select>&nbsp;&nbsp;
                        服务类型:&nbsp;
                        <select class="form-control" id="serviceType" name="serviceType">
                            <option>--请选择--</option>
                        </select>&nbsp;&nbsp;
                        质保标志:&nbsp;
                        <select class="form-control" id="qualityStandard" name="qualityStandard">
                            <option>--请选择--</option>
                        </select>
                        <br>&nbsp;<br>
                        &nbsp;品牌:&nbsp;
                        <select class="form-control" id="brand" name="brand">
                            <option>--请选择--</option>
                        </select>&nbsp;&nbsp;
                        产品层次:&nbsp;
                        <select class="form-control" id="productId" name="productId" onchange="seltwoProduct()">
                            <option value="">--请选择--</option>
                        </select>
                        <select class="form-control" id="twoProductId" name="twoProductId">
                            <option>--请选择--</option>
                        </select>
                        <select class="form-control" id="commodityGroupId" name="commodityGroupId">
                            <option>--请选择--</option>
                        </select>
                        <br>&nbsp;<br>
                        <span style="color: red ">*</span>结算类型:&nbsp;
                        <select class="form-control" id="closeType" name="closeType">
                            <option value="">--请选择--</option>
                            <option value="按比例">按比例</option>
                            <option value="按固定值">按固定值</option>
                        </select>&nbsp;&nbsp;
                        <span style="color: red ">*</span>结算值:&nbsp;
                        <input type="text" class="form-control" id="closeScale" name="closeScale" oninput="value=value.replace(/[^\d]/g,'')">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="nb_xinzeng()">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 修改 模态框（Modal） -->
<div class="modal fade" id="cs_xiougaiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" >内部标准修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline" role="form" id="xgform">
                    <input type="hidden" id="id" name="id">
                    <div class="form-group">
                        下游名称:&nbsp;
                        <select class="form-control" id="downstreamName2" name="downstreamName">
                            <option value="">--请选择--</option>
                        </select>&nbsp;&nbsp;
                        服务类型:&nbsp;
                        <select class="form-control" id="serviceType2" name="serviceType">
                            <option>--请选择--</option>
                        </select>&nbsp;&nbsp;
                        质保标志:&nbsp;
                        <select class="form-control" id="qualityStandard2" name="qualityStandard">
                            <option>--请选择--</option>
                        </select>
                        <br>&nbsp;<br>
                        &nbsp;品牌:&nbsp;
                        <select class="form-control" id="brand2" name="brand">
                            <option>--请选择--</option>
                        </select>&nbsp;&nbsp;
                        产品层次:&nbsp;
                        <select class="form-control" id="productId2" name="productId" onchange="seltwoProduct()">
                            <option value="">--请选择--</option>
                        </select>
                        <select class="form-control" id="twoProductId2" name="twoProductId">
                            <option>--请选择--</option>
                        </select>
                        <select class="form-control" id="commodityGroupId2" name="commodityGroupId">
                            <option>--请选择--</option>
                        </select>
                        <br>&nbsp;<br>
                        维修措施类型:&nbsp;
                        <select class="form-control" id="maintenanceMeasures" name="maintenanceMeasures">
                            <option>--请选择--</option>
                        </select>
                        <br>&nbsp;<br>
                        <span style="color: red ">*</span>结算类型:&nbsp;
                        <select class="form-control" id="closeType2" name="closeType">
                            <option value="">--请选择--</option>
                            <option value="按比例">按比例</option>
                            <option value="按固定值">按固定值</option>
                        </select>&nbsp;&nbsp;
                        <span style="color: red ">*</span>结算值:&nbsp;
                        <input type="text" class="form-control" id="closeScale2" name="closeScale" oninput="value=value.replace(/^\D*(\d*(?:\.\d{0,1})?).*$/g, '$1')">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="xiougai()">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    $(function () {
        /*下游名称查询*/
        selAwDepartment(1);
        /*服务类型查询*/
        selAwServiceType(1);
        /*保质标志查询*/
        selAwSign(1);
        /*品牌查询*/
        selbrand(1);
        /*产品层次查询*///品类
        selProduct(1);
        //商品组
        selCommodityGroup(1);
        /*内部结算标准 分页*/
        InteriorLimit();
    })
    /*新增click*/
    function xzclick() {
        /*下游名称查询*/
        selAwDepartment(1)
        /*服务类型查询*/
        selAwServiceType(1);
        /*保质标志查询*/
        selAwSign(1);
        /*品牌查询*/
        selbrand(1);
        /*产品层次查询*///品类
        selProduct(1);
        //商品组
        selCommodityGroup(1);
    }
    /*下游名称查询*/
    function selAwDepartment(downstreamName) {
        $.ajax({
            url:"/user/selAwDepartment",
            type:"post",
            dataType:"json",
            success:function(data){
                if(data){
                    var m="";
                    if(downstreamName!=null&&downstreamName!=1){
                        m+="<option value=\"" + downstreamName + "\">" + downstreamName + "</option>";
                    }
                        m+="<option value=\"\">--请选择--</option>";
                    $(data).each(function (a,b) {
                        if(b.departmentName!=downstreamName&&b.upDepartmentId!=0) {
                            m += "<option value=\"" + b.departmentName + "\">" + b.departmentName + "</option>";
                        }
                    })
                    if(downstreamName==1) {
                        $("#downstreamName").html(m);
                        $("#downstreamName1").html(m);
                    }
                    $("#downstreamName2").html(m);
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*服务类型查询*/
    function selAwServiceType(serviceType) {
        $.ajax({
            url:"/user/selAwServiceType",
            type:"post",
            dataType:"json",
            success:function(data){
                if(data){
                    var m="";
                    if(serviceType!=null&&serviceType!=1){
                        m+="<option value=\""+serviceType+"\">"+serviceType+"</option>";
                    }
                    m+="<option value=\"\">--请选择--</option>";
                    $(data).each(function (a,b) {
                        if(b.serviceType!=serviceType){
                            m+="<option value=\""+b.serviceType+"\">"+b.serviceType+"</option>";
                        }
                    })
                    if(serviceType==1){
                        $("#serviceType").html(m);
                        $("#serviceType1").html(m);
                    }
                    $("#serviceType2").html(m);
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*保质标志查询*/
    function selAwSign(qualityStandard) {
        $.ajax({
            url:"/user/selAwSign",
            type:"post",
            dataType:"json",
            success:function(data){
                if(data){
                    var m="";
                    if(qualityStandard!=null&&qualityStandard!=1){
                        m+="<option value=\""+qualityStandard+"\">"+qualityStandard+"</option>";
                    }
                    m+="<option value=\"\">--请选择--</option>";
                    $(data).each(function (a,b) {
                        if(b.signName!=qualityStandard){
                            m+="<option value=\""+b.signName+"\">"+b.signName+"</option>";
                        }
                    })
                    if(qualityStandard==1){
                        $("#qualityStandard").html(m);
                        $("#qualityStandard1").html(m);
                    }
                    $("#qualityStandard2").html(m);
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*品牌查询*/
    function selbrand(brand) {
        $.ajax({
            url:"/user/selbrand",
            type:"post",
            dataType:"json",
            success:function(data){
                if(data){
                    var m="";
                    if(brand!=null&&brand!=1){
                        m+="<option value=\""+brand+"\">"+brand+"</option>";
                    }
                    m+="<option value=\"\">--请选择--</option>";
                    $(data).each(function (a,b) {
                        if(b.brandName!=brand) {
                            m += "<option value=\"" + b.brandName + "\">" + b.brandName + "</option>";
                        }
                    })
                    if(brand==1){
                        $("#brand").html(m);
                        $("#brand1").html(m);
                    }
                    $("#brand2").html(m);

                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*产品层次查询*///品类
    function selProduct(productId) {
        $.ajax({
            url:"/user/selProduct",
            type:"post",
            dataType:"json",
            success:function(data){
                if(data){
                    var m="";
                    if(productId!=null&&productId!=1){
                        m+="<option value=\""+productId+"\">"+productId+"</option>"
                    }
                    m+="<option value=\"\">--请选择--</option>";
                    $(data).each(function (a,b) {
                        if(b.productName!=productId){
                            m+="<option value=\""+b.productName+"\">"+b.productName+"</option>";
                        }
                    })
                    if(productId==1){
                        $("#productId").html(m);
                        $("#productId1").html(m);
                    }
                    $("#productId2").html(m);

                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    //二级品类
    function seltwoProduct(twoProductId) {

        var id=$("#productId option:checked").val();
        var id1=$("#productId1 option:checked").val();
        var id2=$("#productId2 option:checked").val();
        if(id!=""){
            $("#twoProductId").html("<option value=\"\">--请选择--</option>");
            $.ajax({
                url:"/user/seltwoProduct",
                type:"post",
                dataType:"json",
                data:{
                    id:id
                },
                success:function(data){
                    if(data){
                        var m="<option value=\"\">--请选择--</option>";
                        $(data).each(function (a,b) {
                            m+="<option value=\""+b.productName+"\">"+b.productName+"</option>";
                        })
                        $("#twoProductId").html(m);
                    }
                }
            })
        }else {
            $("#twoProductId").html("<option value=\"\">--请选择--</option>");
        }
        if(id1!=""){
            $("#twoProductId1").html("<option value=\"\">--请选择--</option>");
            $.ajax({
                url:"/user/seltwoProduct",
                type:"post",
                dataType:"json",
                data:{
                    id:id1
                },
                success:function(data){
                    if(data){
                        var m="<option value=\"\">--请选择--</option>";
                        $(data).each(function (a,b) {
                            m+="<option value=\""+b.productName+"\">"+b.productName+"</option>";
                        })
                        $("#twoProductId1").html(m);
                    }
                }
            })
        }else {
            $("#twoProductId1").html("<option value=\"\">--请选择--</option>");
        }
        if(id2!=""){
            $("#twoProductId2").html("<option value=\"\">--请选择--</option>");
            $.ajax({
                url:"/user/seltwoProduct",
                type:"post",
                dataType:"json",
                data:{
                    id:id2
                },
                success:function(data){
                    if(data){
                        var m="<option value=\"\">--请选择--</option>";
                        $(data).each(function (a,b) {
                            if(b.productName!=twoProductId) {
                                m += "<option value=\"" + b.productName + "\">" + b.productName + "</option>";
                            }
                        })
                        $("#twoProductId2").html(m);
                    }
                }
            })
        }else {
            $("#twoProductId2").html("<option value=\"\">--请选择--</option>");
        }
    }
    //商品组
    function selCommodityGroup(commodityGroupId) {
        $.ajax({
            url:"/user/selCommodityGroup",
            type:"post",
            dataType:"json",
            success:function(data){
                if(data){
                    var m="";
                    if(commodityGroupId!=null&&commodityGroupId!=1){
                        m+="<option value=\""+commodityGroupId+"\">"+commodityGroupId+"</option>";
                    }
                    m+="<option value=\"\">--请选择--</option>";
                    $(data).each(function (a,b) {
                        if(b.commodityGroup!=commodityGroupId){
                            m+="<option value=\""+b.commodityGroup+"\">"+b.commodityGroup+"</option>";
                        }
                    })
                    if(commodityGroupId==1){
                        $("#commodityGroupId").html(m);
                        $("#commodityGroupId1").html(m);
                    }
                    $("#commodityGroupId2").html(m);
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*维修措施类型查询*/
    function selMaintenanceMeasuresType(maintenanceMeasures) {
        $.ajax({
            url:"/user/selMaintenanceMeasuresType",
            type:"post",
            dataType:"json",
            success:function(data){
                if(data){
                    var m="";
                    if(maintenanceMeasures!=null){
                        m+="<option value=\""+maintenanceMeasures+"\">"+maintenanceMeasures+"</option>";
                    }
                    m+="<option value=\"\">--请选择--</option>";
                    $(data).each(function (a,b) {
                        if(b.maintenanceMeasuresType!=maintenanceMeasures){
                            m+="<option value=\""+b.maintenanceMeasuresType+"\">"+b.maintenanceMeasuresType+"</option>";
                        }
                    })
                    $("#maintenanceMeasures").html(m);
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*结算类型*/
    function selcloseType(closeType) {
        var m="";
        if(closeType!=null){
            m+="<option value=\""+closeType+"\">"+closeType+"</option>";
        }
        m+="<option value=\"\">--请选择--</option>";
        if(closeType!="按比例"){
            m+="<option value=\"按比例\">按比例</option>";
        }
        if(closeType!="按固定值"){
            m+="<option value=\"按固定值\">按固定值</option>";
        }
        $("#closeType2").html(m);

    }
    /*内部结算标准 先判断是否重复*/
    function nb_xinzeng() {
        //结算类型
        var closeType=$("#closeType option:checked").val();
        //结算值
        var closeScale=$("#closeScale").val();
        /*判断来源和结算值是否为空*/
        if(closeType==""){
            alert("请选择结算类型！")
            return false;
        }else if(closeScale==""){
            alert("请输入结算值！")
            return false;
        }
        $.ajax({
            url:"/user/selInterior2",
            type:"post",
            dataType:"json",
            data:$("#nb_xzform").serialize(),
            success:function(data){
                if(data==0){
                    nb_xinzeng2();
                }else {
                    alert("新增数据已存在！")
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*新增*/
    function nb_xinzeng2() {
        $.ajax({
            url:"/user/insInterior",
            type:"post",
            dataType:"json",
            data:$("#nb_xzform").serialize(),
            success:function(data){
                if(data){
                    $("#nb_xinzengModal").modal("hide")
                    InteriorLimit();
                    alert("添加成功！")
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*内部结算标准分页*/
    function InteriorLimit() {
        $('#InteriorTable').bootstrapTable('destroy');
        $("#InteriorTable").bootstrapTable({
            url: "${pageContext.request.contextPath}/user/selInterior?" + $("#cxform").serialize(),//请求的路径
            pagination: true,//分页的开关，默认是关闭的
            sidePagination: "server",//client客户端分页，server服务端
            sortName: "id",
            columns: [//field对应的是entity中的属性  title:列名
                {
                    field: 'id', // 返回json数据中的name
                    title: '序号', // 表格表头显示文字
                    formatter: function (value, row, index) {
                        return index + 1;
                    }
                }, {
                    checkbox: true,
                    visible: true
                }, {
                    field: 'shangyouName',
                    title: '结算上游'
                }, {
                    field: 'downstreamName',
                    title: '结算下游'
                }, {
                    field: 'serviceType',
                    title: '服务类型',
                },{
                    field: 'qualityStandard',
                    title: '质保标志',
                },{
                    field: 'brand',
                    title: '品牌',
                },{
                    field: 'productId',
                    title: '品类',
                },{
                    field: 'twoProductId',
                    title: '二级品类',
                },{
                    field: 'commodityGroupId',
                    title: '商品组',
                },{
                    field: 'maintenanceMeasures',
                    title: '维修措施类型',
                },{
                    field: 'closeType',
                    title: '结算类型',
                },{
                    field: 'closeScale',
                    title: '结算比例值',
                },{
                    title: "操作",
                    field: 'id',
                    align: "center",
                    valign: "middle",
                    formatter: function (value, row, index) {
                        var id = value;
                        var result = "";
                        result += "<button type=\"submit\" data-toggle=\"modal\" data-target=\"#cs_xiougaiModal\" class=\"btn btn-default\" onclick=\"updInterior('" + id + "')\">修改</button>";
                        result += "<button type=\"submit\" class=\"btn btn-default\" onclick=\"delInterior('" + id + "')\">删除</button>";
                        return result;
                    }
                }
            ]
        });
    }
    /*删除内部结算标准*/
    function delInterior(id) {
        $.ajax({
            url:"/user/delInterior",
            type:"post",
            dataType:"json",
            data:{
                id:id
            },
            success:function(data){
                if(data){
                    alert("删除成功！");
                    InteriorLimit();
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*查询内部结算标准*/
    function updInterior(id) {
        $("#id").val(id);
        $.ajax({
            url:"/user/selInteriorid",
            type:"post",
            dataType:"json",
            data:{
                id:id
            },
            success:function(data){
                if(data){
                    selAwDepartment(data.downstreamName);//结算下游
                    selAwServiceType(data.serviceType);//服务类型
                    /*保质标志查询*/
                    selAwSign(data.qualityStandard);
                    /*品牌查询*/
                    selbrand(data.brand);
                    /*产品层次查询*///品类
                    selProduct(data.productId);
                    /*二级品类*/
                    if(data.twoProductId==null){
                        $("#twoProductId2").html("<option value=\"\">--请选择--</option>");
                    }else {
                        $("#twoProductId2").html("<option value=\""+data.twoProductId+"\">"+data.twoProductId+"</option>");
                    }
                    //商品组
                    selCommodityGroup(data.commodityGroupId);
                    //维修措施类型
                    selMaintenanceMeasuresType(data.maintenanceMeasures);
                    //结算类型
                    selcloseType(data.closeType);
                    //结算值
                    $("#closeScale2").val(data.closeScale);
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    //修改前查询是否有重复
    function xiougai() {
        //结算类型
        var closeType=$("#closeType2 option:checked").val();
        //结算值
        var closeScale=$("#closeScale2").val();
        /*判断来源和结算值是否为空*/
        if(closeType==""){
            alert("请选择结算类型！")
            return false;
        }else if(closeScale==""){
            alert("请输入结算值！")
            return false;
        }
        $.ajax({
            url:"/user/selInterior2",
            type:"post",
            dataType:"json",
            data:$("#nb_xzform").serialize(),
            success:function(data){
                if(data==0){
                    xiougai2();
                }else {
                    alert("修改数据已存在！")
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    //进行修改
    function xiougai2() {
        $.ajax({
            url:"/user/updInterior",
            type:"post",
            dataType:"json",
            data:$("#xgform").serialize(),
            success:function(data){
                if(data){
                    $("#cs_xiougaiModal").modal("hide")
                    InteriorLimit();
                    alert("修改成功！")
                }
            },error:function () {
                alert("异常！");
            }
        })
    }
    /*导出*/
    function nb_daochu(a) {
        var type = "filename";
        var formData = new FormData();//这里需要实例化一个FormData来进行文件上传
        var dom=$("#inputfile")[0].files[0];
        formData.append(type,dom);
        if(dom!=null){
            if(a==1){
                var allData = $('#InteriorTable').bootstrapTable('getSelections');
            }else {
                var allData = $('#InteriorTable').bootstrapTable('getData');
            }
            if (allData.length == 0) {
                if(a=1){
                    alert("请先勾选！");
                }else {
                    alert("没有数据，无法导出！");
                }
            } else {
                var id = new Array();
                for (var i = 0; i < allData.length; i++) {
                    id.push(allData[i].id);
                }
                formData.append("id",id);
                $.ajax({
                    url: "/user/nboutput",
                    dataType: "json",
                    type: "post",
                    data: formData,
                    processData : false,
                    contentType : false,
                    traditional: true, //默认false
                    success: function (data) {
                        if (data) {
                            alert("导出成功！请到:(E://追云工作室/山山快修/作业/xlsx文件存储)路径下查找文件！");
                        } else {
                            alert("导出失败！");
                        }
                    }
                })
            }
        }else {
            alert("请先选择模板！");
        }
    }
    //导入
    function nb_daoru() {
        var type = "filename";
        var formData = new FormData();//这里需要实例化一个FormData来进行文件上传
        var dom=$("#inputfile2")[0].files[0];
        formData.append(type,dom);
        if(dom!=null){
            $.ajax({
                url: "/user/nbdaoru",
                dataType: "json",
                type: "post",
                data: formData,
                processData : false,
                contentType : false,
                success: function (data) {
                    if (data) {
                        alert("导入成功！");
                        InteriorLimit();
                    } else {
                        alert("没有可导入的数据！");
                    }
                },error:function () {
                    alert("异常！");
                }
            })
        }else {
            alert("请先选择文件！");
        }
    }
</script>
</html>
