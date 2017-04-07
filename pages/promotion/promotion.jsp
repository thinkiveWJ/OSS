<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>促销演示</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="Promotion Page">

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/index.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="bootstrap/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <p class="navbar-brand">促销演示</p>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul id="componentList" class="nav nav-sidebar">
                    <li class="active"><a id="promList" href="#">促销列表<span class="sr-only">(current)</span></a></li>
                    <li>test</li>
                    <li><a id="promotion" href="#">促销维护</a></li>
                    <li><a id="order" href="#">订单信息</a></li>
                    <li><a id="bill" href="#">结算信息</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div id="promListContent" class="container-fluid" style="margin-top:18px">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h3 class="page-header">促销列表</h3>
            <div class="table-responsive">
                <table class="table table-striped" style="table-layout: fixed;WORD-BREAK: break-all; WORD-WRAP: break-word">
                    <thead>
                    <tr>
                        <th class="col-md-1">选择</th>
                        <th class="col-md-2">促销描述</th>
                        <th class="col-md-2">开始日期</th>
                        <th class="col-md-2">失效日期</th>
                        <th class="col-md-2">生效日历类型</th>
                        <th class="col-md-2">生效日历内容</th>
                        <th class="col-md-1">优先级</th>
                    </tr>
                    </thead>
                    <tbody id="promotionList">
                    </tbody>
                </table>
            </div>
            <div class="row placeholder">
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <button id="queryBtn" class="btn btn-lg btn-primary main" type="button" style="margin-left:-200px">查询</button>
                    <button id="chooseBtn" class="btn btn-lg btn-primary main" type="button">选中</button>
                    <button id="relationAndBtn" class="btn btn-lg btn-primary main" type="button">保存捆绑促销关系</button>
                    <button id="relationXorBtn" class="btn btn-lg btn-primary main" type="button">保存互斥促销关系</button>
                </div>
            </div>
        </div>
    </div>

    <div id="promotionContent" class="container-fluid" style="display:none;margin-top:18px">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h3 class="page-header">促销信息</h3>
<!--            <div class="table-responsive">
                <table class="table table-striped" style="table-layout: fixed;WORD-BREAK: break-all; WORD-WRAP: break-word">
                    <thead>
                    <tr>
                        <th class="col-md-1">选择</th>
                        <th class="col-md-2">促销条件</th>
                        <th class="col-md-2">促销内容</th>
                        <th class="col-md-2">开始时间</th>
                        <th class="col-md-2">失效时间</th>
                        <th class="col-md-2">生效日历类型</th>
                        <th class="col-md-2">生效日历内容</th>
                        <th class="col-md-1">优先级</th>
                    </tr>
                    </thead>
                    <tbody id="promotionList">
                    </tbody>
                </table>
            </div>-->
<!--            <div class="row placeholder">
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <button id="queryBtn" class="btn btn-lg btn-primary main" type="button" style="margin-left:-200px">查询</button>
                    <button id="deleteBtn" class="btn btn-lg btn-primary main" type="button" style="margin-left:100px">删除</button>
                </div>
            </div>-->
            <div class="row placeholder">
                <div id="areaCheckboxList" class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">促销区域</label>
<!--                    <label class="checkbox inline">
                        <input type="checkbox" id="areaId1" name="areaId" class="form-control col-xs-12" style="margin-top: -5" value="1">上海</input>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" id="areaId2" name="areaId" class="form-control col-xs-12" style="margin-top: -5" value="2">江苏</input>
                    </label>-->
                </div>
                <div id="storeCheckboxList" class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">促销门店</label>
<!--                    <label class="checkbox inline">
                        <input type="checkbox" id="storeId1" name="storeId" class="form-control col-xs-12" style="margin-top: -5" value="82452001">吉林长白山万达店</input>
                        <input type="checkbox" id="storeId3" name="storeId" class="form-control col-xs-12" style="margin-top: -5" value="74002002">荆州人信汇店</input>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" id="storeId2" name="storeId" class="form-control col-xs-12" style="margin-top: -5" value="74002001">荆州万达店</input>
                    </label>-->
                </div>
            </div>
            <div class="row placeholder">
                <div id="itemTypeCheckboxList" class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">促销商品分类</label>
<!--                    <label class="checkbox inline">
                        <input type="checkbox" id="itemTypeId1" name="itemTypeId" class="form-control col-xs-12" style="margin-top: -5" value="1">衣服</input>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" id="itemTypeId2" name="itemTypeId" class="form-control col-xs-12" style="margin-top: -5" value="2">裤子</input>
                    </label>-->
                </div>
                <div id="itemCheckboxList" class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">促销商品</label>
<!--                    <label class="checkbox inline">
                        <input type="checkbox" id="itemId1" name="skuId" class="form-control col-xs-12" style="margin-top: -5" value="1">大衣</input>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" id="itemId2" name="skuId" class="form-control col-xs-12" style="margin-top: -5" value="2">衬衫</input>
                    </label>-->
                </div>
            </div>
            <div class="row placeholder">
                <div id="customerArea" class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">促销客户群体</label>
                    <div class="row">
                        <label class="checkbox inline" style="margin-top: -4">
                            <label style="font-weight:bold;" style="margin-top: -5">客户类型</label>
                            <input type="checkbox" id="customerType1" name="customerType" class="form-control" style="margin-top: 0" value="vip">VIP</input>
                            <input type="checkbox" id="customerType2" name="customerType" class="form-control" style="margin-top: 0" value="normal">普通</input>
                            <input type="checkbox" id="customerType3" name="customerType" class="form-control" style="margin-top: 0" value="staff">员工</input>
                        </label>
                    </div>
                    <div class="row" style="margin-left: 176">
                        <label class="control-label">生日</label>
                        <input type="radio" id="birthMonth" name="birth" class="form-control" style="margin-top: 0" value="birthMonth">生日当月</input>
                        <input type="radio" id="birthDay" name="birth" class="form-control" style="margin-top: 0" value="birthDay">生日当日</input>
                    </div>
                    <div class="row" style="margin-left: 176">
                        <label class="control-label">性别</label>
                        <input type="radio" name="sex" id="sexMale" class="form-control" style="margin-top: 0" value="male">男
                        <input type="radio" name="sex" id="sexFemale" class="form-control" style="margin-top: 0" value="female">女
                    </div>
                </div>
                <div class="form-inline col-xs-6">
                    <label for="priority" class="col-sm-4 control-label">优先级</label>
                    <select id="priority" name="priority" class="form-control" required>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select>
                </div>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">开始日期</label>
                    <input type="date" id="startDate" name="startDate" class="form-control col-xs-12" required/>
                    <input type="time" id="startTime" name="startTime" class="form-control col-xs-12" required/>
                </div>
                <div class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">失效日期</label>
                    <input type="date" id="expireDate" name="expireDate" class="form-control col-xs-12" required/>
                    <input type="time" id="expireTime" name="expireTime" class="form-control col-xs-12" required/>
                </div>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label for="calendarType" class="col-sm-4 control-label">生效日历类型</label>
                    <select id="calendarType" name="calendarType" class="form-control" required>
                        <option value="">请选择</option>
                        <option value="week">周</option>
                        <option value="month">月</option>
                    </select>
                </div>
                <div id="calendarValueCheckboxList" class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">生效日历内容</label>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h3 class="page-header">
                促销条件
<!--                <button id="baseConditionBtn" class="btn-primary" style="margin-top: -4" type="button">基本</button>
                <button id="advanceConditionBtn" style="margin-left: -6; margin-top: -4" type="button">高级</button>-->
            </h3>

            <div id="basePromotionArea" class="row placeholder">
                <div class="form-inline col-xs-9 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition1" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="promotionAmtLabel" for="promotionAmt" class="col-sm-2 control-label" style="margin-top: 4">消费金额满</label>
                    <input type="text" id="promotionAmt" name="promotionAmt" class="form-control col-xs-12" style="margin-left: -30" required/>
                    <label id="promotionAmtEndLabel" for="promotionAmt" class="col-sm-1 control-label" style="margin-top: 4">元</label>
                    <input type="radio" name="baseAction" id="baseAction1" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="discountAmtLabel" for="discountAmtInAction" class="col-sm-1 control-label" style="margin-top: 4">减</label>
                    <input type="text" id="discountAmtInAction" name="discountAmtInAction" class="form-control col-xs-12" style="margin-left: -5" required/>
                    <label id="discountAmtEndLabel" for="discountAmtInAction" class="col-sm-1 control-label" style="margin-top: 4">元</label>
                </div>
                <div class="form-inline col-xs-9 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition2" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="promotionQuantityLabel" for="promotionQuantity" class="col-sm-2 control-label" style="margin-top: 4">消费数量满</label>
                    <input type="text" id="promotionQuantity" name="promotionQuantity" class="form-control col-xs-12" style="margin-left: -30" required/>
                    <label id="promotionQuantityEndLabel" for="promotionQuantity" class="col-sm-1 control-label" style="margin-top: 4">件</label>
                    <input type="radio" name="baseAction" id="baseAction2" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="discountInActionLabel" for="discountInAction" class="col-sm-1 control-label" style="margin-top: 4">打</label>
                    <input type="text" id="discountInAction" name="discountInAction" class="form-control col-xs-12" style="margin-left: -5" required/>
                    <label id="discountInActionEndLabel" for="discountInAction" class="col-sm-1 control-label" style="margin-top: 4">折</label>
                </div>
                <div class="form-inline col-xs-9 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition3" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <select id="payChannelPicker" class="form-control col-xs-2" style="margin-left: 12; margin-top: -4">
                        <option value="1">微信</option >
                        <option value="2">支付宝</option >
                        <option value="3">借记卡</option >
                        <option value="4">信用卡</option >
                        <option value="5">现金</option >
                    </select>
                    <label id="payChannelLabel" for="payChannelPicker" class="col-sm-2 control-label" style="margin-top: 4">支付</label>
                    <input type="radio" name="baseAction" id="baseAction3" class="form-control col-xs-2" style="margin-left: 141; margin-top: -2">
                    <label id="pointInActionLabel" for="pointInAction" class="col-sm-2 control-label" style="margin-top: 4">送积分</label>
                    <input type="text" id="pointInAction" name="pointInAction" class="form-control col-xs-12" style="margin-left: -45" required/>
                    <select id="pointPicker" class="form-control">
                        <option value="1">倍</option >
                        <option value="2">个</option >
                    </select>
                </div>
                <div class="form-inline col-xs-12 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition4" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="emptyConditionLabel" class="col-sm-2 control-label" style="margin-top: 4">无条件</label>
                    <input type="radio" name="baseAction" id="baseAction4" class="form-control col-xs-2" style="margin-left: 201; margin-top: -2">
                    <label id="giftInActionLabel" for="giftInAction" class="col-sm-2 control-label" style="margin-top: 4">送礼品</label>
                    <input type="text" id="giftInAction" name="giftInAction" class="form-control col-xs-12" style="margin-left: -91;" required readonly/>
                    <select id="giftPicker" class="form-control" style="margin-top: -4">
                        <option value="">请选择</option >
                        <option value="1">毛绒玩具</option >
                        <option value="2">手套</option >
                    </select>
                    <button id="clearGiftBtn" class="btn btn-lg btn-primary main" style="margin-top: -4" type="button">清除</button>
                </div>
                <div class="form-inline col-xs-12 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition5" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="staffConditionLabel" class="col-sm-2 control-label" style="margin-top: 4">员工内购</label>
                    <input type="radio" name="baseAction" id="baseAction5" class="form-control col-xs-2" style="margin-left: 201; margin-top: -2">
                    <label id="couponInActionLabel" for="couponInAction" class="col-sm-2 control-label" style="margin-top: 4">送优惠券</label>
                    <input type="text" id="couponInAction" name="couponInAction" class="form-control col-xs-12" style="margin-left: -90" required readonly/>
                    <select id="couponPicker" class="form-control">
                        <option value="">请选择</option >
                        <option value="1">满200元减10元</option >
                        <option value="2">满300元减30元</option >
                    </select>
                    <button id="clearCouponBtn" class="btn btn-lg btn-primary main" style="margin-left: 10; margin-top: -4" type="button">清除</button>
                </div>
                <div class="form-inline col-xs-12 placeholder">
                    <input type="radio" name="baseAction" id="baseAction6" class="form-control col-xs-2" style="margin-left: 407; margin-top: -2">
                    <label id="lowPriceLabel" class="col-sm-4 control-label" style="margin-top: 4">送消费商品中的最低价商品1件</label>
                </div>
                <div class="form-inline col-xs-12 placeholder">
                    <input type="radio" name="baseAction" id="baseAction7" class="form-control col-xs-2" style="margin-left: 407; margin-top: -2">
                    <label id="fixPriceLabel" for="fixPrice" class="col-sm-1 control-label" style="margin-top: 4">一口价</label>
                    <input type="text" id="fixPrice" name="fixPrice" class="form-control col-xs-12" required/>
                    <label id="fixPriceEndLabel" for="fixPrice" class="col-sm-1 control-label" style="margin-top: 4">元一件</label>
                </div>
            </div>
<!--            <div id="basePromotionArea" class="row placeholder">
                <div class="form-inline col-xs-9 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition1" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="promotionAmt1Label" for="promotionAmt1" class="col-sm-2 control-label" style="margin-top: 4">消费金额满</label>
                    <input type="text" id="promotionAmt1" name="promotionAmt1" class="form-control col-xs-12" style="margin-left: -30" required/>
                    <label id="discountAmtInConditionLabel" for="discountAmtInCondition" class="col-sm-1 control-label" style="margin-top: 4">元减</label>
                    <input type="text" id="discountAmtInCondition" name="discountAmtInCondition" class="form-control col-xs-12" style="margin-left: -5" required/>
                </div>
                <div class="form-inline col-xs-9 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition2" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="promotionAmt2Label" for="promotionAmt2" class="col-sm-2 control-label" style="margin-top: 4">消费金额满</label>
                    <input type="text" id="promotionAmt2" name="promotionAmt2" class="form-control col-xs-12" style="margin-left: -30" required/>
                    <label id="discountInConditionLabel" for="discountInCondition" class="col-sm-1 control-label" style="margin-top: 4">元打</label>
                    <input type="text" id="discountInCondition" name="discountInCondition" class="form-control col-xs-12" style="margin-left: -5" required/>
                    <label id="discountInConditionEndLabel" for="discountInCondition" class="col-sm-1 control-label" style="margin-top: 4">折</label>
                </div>
                <div class="form-inline col-xs-9 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition3" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="promotionAmt3Label" for="promotionAmt3" class="col-sm-2 control-label" style="margin-top: 4">消费金额满</label>
                    <input type="text" id="promotionAmt3" name="promotionAmt3" class="form-control col-xs-12" style="margin-left: -30" required/>
                    <label id="pointInConditionLabel" for="pointInCondition" class="col-sm-2 control-label" style="margin-top: 4">元送积分</label>
                    <input type="text" id="pointInCondition" name="pointInCondition" class="form-control col-xs-12" style="margin-left: -45" required/>
                </div>
                <div class="form-inline col-xs-10 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition4" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="promotionAmt4Label" for="promotionAmt4" class="col-sm-2 control-label" style="margin-top: 4">消费金额满</label>
                    <input type="text" id="promotionAmt4" name="promotionAmt4" class="form-control col-xs-12" style="margin-left: -45" required/>
                    <label id="giftInActionLabel" for="giftInAction" class="col-sm-2 control-label" style="margin-top: 4">元送礼品</label>
                    <input type="text" id="giftInAction" name="giftInAction" class="form-control col-xs-12" style="margin-left: -60;" required readonly/>
                    <select id="giftPicker" class="form-control" style="margin-top: -4">
                        <option value="">请选择</option >
                        <option value="1">毛绒玩具</option >
                        <option value="2">手套</option >
                    </select>
                    <button id="clearGiftBtn" class="btn btn-lg btn-primary main" style="margin-top: -4" type="button">清除</button>
                </div>
                <div class="form-inline col-xs-11 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition5" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="promotionAmt5Label" for="promotionAmt5" class="col-sm-2 control-label" style="margin-top: 4">消费金额满</label>
                    <input type="text" id="promotionAmt5" name="promotionAmt5" class="form-control col-xs-12" style="margin-left: -61" required/>
                    <label id="couponInActionLabel" for="couponInAction" class="col-sm-2 control-label" style="margin-top: 4">元送优惠券</label>
                    <input type="text" id="couponInAction" name="couponInAction" class="form-control col-xs-12" style="margin-left: -60" required readonly/>
                    <select id="couponPicker" class="form-control">
                        <option value="">请选择</option >
                        <option value="1">满200元减10元</option >
                        <option value="2">满300元减30元</option >
                    </select>
                    <button id="clearCouponBtn" class="btn btn-lg btn-primary main" style="margin-left: 10; margin-top: -4" type="button">清除</button>
                </div>
                <div class="form-inline col-xs-9 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition6" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="promotionQuantity1Label" for="promotionQuantity1" class="col-sm-2 control-label" style="margin-top: 4">消费数量满</label>
                    <input type="text" id="promotionQuantity1" name="promotionQuantity1" class="form-control col-xs-12" style="margin-left: -30" required/>
                    <label id="promotionQuantity1EndLabel" for="promotionQuantity1" class="col-sm-4 control-label" style="margin-top: 4">件送消费商品中的最低价商品1件</label>
                </div>
                <div class="form-inline col-xs-9 placeholder">
                    <input type="radio" name="baseCondition" id="baseCondition7" class="form-control col-xs-2" style="margin-left: 12; margin-top: -2">
                    <label id="payByWeChatLabel" for="payByWeChat" class="col-sm-2 control-label" style="margin-top: 4">微信支付减</label>
                    <input type="text" id="payByWeChat" name="payByWeChat" class="form-control col-xs-12" style="margin-left: -30" required/>
                    <label id="payByWeChatLabelEnd" for="payByWeChat" class="col-sm-2 control-label" style="margin-top: 4">元</label>
                </div>
            </div>-->

            <div id="advanceConditionBtnArea" class="row placeholder" style="display: none">
                <div id="promotionConditionBtnList" class="form-inline col-xs-6">
                    <label class="col-sm-4 control-label">促销条件变量</label>
                </div>
            </div>
<!--            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label for="promotionCondition" class="col-sm-4 control-label">条件描述</label>
                    <input type="text" id="promotionCondition" name="promotionCondition" class="form-control col-xs-12" style="width:65%" required/>
                </div>
            </div>-->
            <div id="advanceConditionArea" class="row placeholder" style="display: none">
                <div class="form-inline col-xs-9">
                    <label for="promotionCondition" class="col-sm-4 control-label">条件描述</label>
                    <input type="text" id="promotionCondition" name="promotionCondition" class="form-control col-xs-6" style="width:50%; margin-left: -95;" required/>
                    <button id="validateConditionBtn" class="btn btn-lg btn-primary main" style="margin-left: 10; margin-top: -4" type="button">验证</button>
                </div>
            </div>

        </div>
        <div id="promotionActionArea" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="display: none">
            <h3 class="page-header">促销内容</h3>
            <div class="row placeholder">
                <div class="form-inline col-xs-9">
                    <label class="col-sm-4 control-label">促销内容变量</label>
                    <div id="promotionActionBtnList" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin-top: -32;">

                    </div>
                </div>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-9">
                    <label for="promotionAction" class="col-sm-4 control-label">内容描述</label>
                    <input type="text" id="promotionAction" name="promotionAction" class="form-control col-xs-6" style="width:50%; margin-left: -95;" required/>
                    <button id="validateActionBtn" class="btn btn-lg btn-primary main" style="margin-left: 10; margin-top: -4" type="button">验证</button>
                </div>
            </div>
        </div>
        <div id="promotionDescArea" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="display: none">
            <h3 class="page-header">促销描述</h3>
            <div class="row placeholder">
                <div class="form-inline col-xs-9">
                    <label for="promotionDesc" class="col-sm-4 control-label">促销描述</label>
                    <input type="text" id="promotionDesc" name="promotionDesc" class="form-control col-xs-6" style="width:50%; margin-left: -95;" required/>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="row placeholder">
                <div id="promotionBtnBox" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <button id="saveBtn" class="btn btn-lg btn-primary main" type="button" style="margin-left:-200px">保存</button>
                    <button id="deleteBtn" class="btn btn-lg btn-primary main" type="button" style="margin-left:100px">删除</button>
                </div>
            </div>
        </div>
    </div>

    <div id="orderContent" class="container-fluid" style="display:none;margin-top:18px">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h3 class="page-header">订单信息</h3>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label for="customerId" class="col-sm-4 control-label">客户号</label>
                    <input type="text" id="customerId" name="customerId" class="form-control col-xs-12" value="1" required autofocus/>
                </div>
                <div class="form-inline col-xs-6">
                    <label for="customerName" class="col-sm-4 control-label">客户姓名</label>
                    <input type="text" id="customerName" name="customerName" class="form-control col-xs-12" value="张三" required readonly/>
                </div>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label for="areaId" class="col-sm-4 control-label">地区号</label>
                    <input type="text" id="areaId" name="areaId" class="form-control col-xs-12" value="1" required/>
                </div>
                <div class="form-inline col-xs-6">
                    <label for="areaName" class="col-sm-4 control-label">地区名</label>
                    <input type="text" id="areaName" name="areaName" class="form-control col-xs-12" value="上海" required readonly/>
                </div>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label for="storeId" class="col-sm-4 control-label">门店号</label>
                    <input type="text" id="storeId" name="storeId" class="form-control col-xs-12" value="82452001" required/>
                </div>
                <div class="form-inline col-xs-6">
                    <label for="storeName" class="col-sm-4 control-label">门店名</label>
                    <input type="text" id="storeName" name="storeName" class="form-control col-xs-12" value="吉林长白山万达店" required readonly/>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th class="col-md-2">商品名称</th>
                        <th class="col-md-2">商品类型</th>
                        <th class="col-md-2">金额</th>
                        <th class="col-md-2">数量</th>
                    </tr>
                    </thead>
                    <tbody id="orderList">
                    <tr>
                        <td skuId="1" class="col-md-3">大衣</td>
                        <td itemTypeId="1" class="col-md-3">衣服</td>
                        <td class="col-md-3"><input type="text" value="200"/></td>
                        <td class="col-md-3"><input type="text" value="4"/></td>
                    </tr>
                    <tr>
                        <td skuId="3" class="col-md-3">牛仔裤</td>
                        <td itemTypeId="2" class="col-md-3">裤子</td>
                        <td class="col-md-3"><input type="text" value="150"/></td>
                        <td class="col-md-3"><input type="text" value="1"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row placeholder">
                <div id="btnBox" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <button id="billBtn" class="btn btn-lg btn-primary main" type="button" style="margin-left:-200px">结算</button>
                </div>
            </div>
        </div>
    </div>

    <div id="billContent" class="container-fluid" style="display:none;margin-top:18px">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h3 class="page-header">结算信息</h3>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th class="col-md-1">商品名称</th>
                        <th class="col-md-1">商品类型</th>
                        <th class="col-md-1">原价</th>
                        <th class="col-md-1">数量</th>
                        <th class="col-md-1">实收金额</th>
                        <th class="col-md-2">促销描述</th>
                        <th class="col-md-2">候选促销描述</th>
                    </tr>
                    </thead>
                    <tbody id="promotionOrderList">
                    </tbody>
                </table>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-12">
                    <h3 class="page-header">支付方式</h3>
                    <div id="payChannelBtnList" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin-top: -32;margin-left: -42">
                    </div>
                </div>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label for="coupon" class="col-sm-4 control-label">使用优惠券</label>
                    <input type="text" id="coupon" name="coupon" class="form-control col-xs-12" required/>
                </div>
            </div>
            <div class="row placeholder">
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <button id="payBtn" class="btn btn-lg btn-primary main" type="button" style="margin-left:-200px">支付</button>
                    <button id="useCandidateBtn" class="btn btn-lg btn-primary main" type="button" style="margin-left:10px">候选支付</button>
                </div>
            </div>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h3 class="page-header">价格信息</h3>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label class="col-sm-2 control-label">原始价格</label>
                    <label id="allConsumeAmt" class="col-sm-3 control-label"></label>
                </div>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label class="col-sm-2 control-label">最终价格</label>
                    <label id="actualConsumeAmt" class="col-sm-3 control-label"></label>
                </div>
            </div>
            <div class="row placeholder">
                <div class="form-inline col-xs-6">
                    <label class="col-sm-2 control-label">节省费用</label>
                    <label id="discountAmt" class="col-sm-3 control-label"></label>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="bootstrap/jquery-2.1.4.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap-modal.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="bootstrap/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bootstrap/assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="bootstrap/jsonService.js"></script>

    <script type="text/javascript">
        var conditionMapping = {};
        var actionMapping = {};
        var payChannelList = [{payChannelId:'WE_CHAT', payChannelName:'微信'}, {payChannelId:'ALI_PAY', payChannelName:'支付宝'}, {payChannelId:'DEBIT_CARD', payChannelName:'借记卡'}, {payChannelId:'CREDIT_CARD', payChannelName:'信用卡'}, {payChannelId:'CASH', payChannelName:'现金'}];
        var areaStoreList = [{areaId:1, areaName:"上海", storeList:[{storeId:82452001, storeName:"吉林长白山万达店"}, {storeId:74002002, storeName:"荆州人信汇店"}]}, {areaId:2, areaName:"江苏", storeList:[{storeId:74002001, storeName:"荆州万达店"}]}];
        var itemAllList = [{itemTypeId:1, itemTypeName:"衣服", itemList:[{skuId:1, skuName:"大衣"}, {skuId:2, skuName:"衬衫"}]}, {itemTypeId:2, itemTypeName:"裤子", itemList:[{skuId:3, skuName:"牛仔裤"}, {skuId:4, skuName:"休闲裤"}]}];
        var promotionId = null;

        $(function()
        {
            $("#promList").bind("click", function() {changeComponent($(this));return false;});
            $("#promotion").bind("click", function() {changeComponent($(this));return false;});
            $("#order").bind("click", function() {changeComponent($(this));return false;});
            $("#bill").bind("click", function() {changeComponent($(this));return false;});

            $("#queryBtn").click(queryPromotionList);
            $("#chooseBtn").click(getPromotion);
            $("#relationAndBtn").bind("click", function() {savePromotionRelation("and");return false;});
            $("#relationXorBtn").bind("click", function() {savePromotionRelation("xor");return false;});

            $("#saveBtn").click(savePromotion);
            $("#deleteBtn").click(deleteHandler);

            $("#billBtn").click(billHandler);
            $("#payBtn").click(payHandler);
            $("#useCandidateBtn").click(useCandidateHandler);

//            $("#baseConditionBtn").click(function() {chooseCondition($(this));});
//            $("#advanceConditionBtn").click(function() {chooseCondition($(this));});

            $("#validateConditionBtn").click(validateConditionHandler);
            $("#validateActionBtn").click(validateActionHandler);

            $("#giftPicker").change(chooseGiftHandler);
            $("#couponPicker").change(chooseCouponHandler);
            $("#clearGiftBtn").click(clearGiftHandler);
            $("#clearCouponBtn").click(clearCouponHandler);

            $("#basePromotionArea input:radio").change(function() {chooseBasePromotion($(this));});

            initAreaStore();

            initAllItem();

            $("#calendarType").bind("change", function() {chooseCalendarType($(this));});
            $("#calendarType").trigger("change");

            conditionMapping.promotionAmt = "促销商品总金额";
            conditionMapping.promotionQuantity = "促销商品总数量";
            conditionMapping.useWeChat = "微信";

            actionMapping.promotionAmt = "促销商品总金额";
            actionMapping.promotionQuantity = "促销商品总数量";
            actionMapping.actualConsumeAmt = "促销后金额";
            actionMapping.promotionLowPrice = "促销商品中的最低价";
            actionMapping.couponList = "送优惠券";
            actionMapping.giftList = "送礼品";
            actionMapping.point = "积分";

            for (var mappingKey in conditionMapping)
            {
                var conditionBtn = $("<button></button>").addClass("btn").addClass("btn-sm").addClass("btn-primary").css({"margin-right": 5}).attr(mappingKey, mappingKey).text(conditionMapping[mappingKey]);
                conditionBtn.bind("click", function() {clickVariable($(this), $("#promotionCondition"));});
                $("#promotionConditionBtnList").append(conditionBtn);
            }

            for (var mappingKey in actionMapping)
            {
                var actionBtn = $("<button></button>").addClass("btn").addClass("btn-sm").addClass("btn-primary").css({"margin-right": 5}).attr(mappingKey, mappingKey).text(actionMapping[mappingKey]);
                actionBtn.bind("click", function() {clickVariable($(this), $("#promotionAction"));});
                $("#promotionActionBtnList").append(actionBtn);
            }

            for (var payChannelIndex in payChannelList)
            {
                var payChannel = payChannelList[payChannelIndex];
                var payChannelId = payChannel.payChannelId;
                var payChannelName = payChannel.payChannelName;

                var payChannelBtn = $("<button></button>").addClass("btn").addClass("btn-sm").css({"margin-left": 15}).attr("payChannel", payChannelId).text(payChannelName);
                $("#payChannelBtnList").append(payChannelBtn);

                var payChannelText = $("<input>", { "type" : "text", "id" : payChannelId, "name" : payChannelId, "readonly" : true, "class" : "form-control", "style" : "width: 50; height: 30"});
                $("#payChannelBtnList").append(payChannelText);

                payChannelBtn.bind("click", function() {clickPayChannel($(this));});
                payChannelText.bind("focusout", function() {leavePayChannelText($(this));});
            }

            queryPromotionList();
        });

        function initAreaStore() {
            for (var areaKey in areaStoreList) {
                var areaObj = areaStoreList[areaKey];
                var areaId = areaObj.areaId;
                var areaName = areaObj.areaName;
                var storeList = areaObj.storeList;

                var areaCheckboxHtml = null;
                if (areaKey == 0) {
                    areaCheckboxHtml = $("<input>", { "type" : "checkbox", "id" : "areaId" + areaId, "name" : "areaId", "value" : areaId, "class" : "form-control", "style" : "margin-top: -5"});
                } else {
                    areaCheckboxHtml = $("<input>", { "type" : "checkbox", "id" : "areaId" + areaId, "name" : "areaId", "value" : areaId, "class" : "form-control", "style" : "margin-top: -5; margin-left: 4"});
                }
                var areaLabelHtml = $("<label>", { "for" : "areaId" + areaId, "class" : "checkbox inline", "text" : areaName, "style" : "margin-top: -8"});
                areaCheckboxHtml.bind("change", function() {chooseArea($(this));});
                $("#areaCheckboxList").append(areaCheckboxHtml);
                $("#areaCheckboxList").append(areaLabelHtml);
            }
        }

        function initAllItem() {
            for (var itemTypeKey in itemAllList) {
                var itemTypeObj = itemAllList[itemTypeKey];
                var itemTypeId = itemTypeObj.itemTypeId;
                var itemTypeName = itemTypeObj.itemTypeName;
                var itemList = itemTypeObj.itemList;

                var itemTypeCheckboxHtml = null;
                if (itemTypeKey == 0) {
                    itemTypeCheckboxHtml = $("<input>", { "type" : "checkbox", "id" : "itemTypeId" + itemTypeId, "name" : "itemTypeId", "value" : itemTypeId, "class" : "form-control", "style" : "margin-top: -5"});
                } else {
                    itemTypeCheckboxHtml = $("<input>", { "type" : "checkbox", "id" : "itemTypeId" + itemTypeId, "name" : "itemTypeId", "value" : itemTypeId, "class" : "form-control", "style" : "margin-top: -5; margin-left: 4"});
                }
                var itemTypeLabelHtml = $("<label>", { "for" : "itemTypeId" + itemTypeId, "class" : "checkbox inline", "text" : itemTypeName, "style" : "margin-top: -8"});
                itemTypeCheckboxHtml.bind("change", function() {chooseItemType($(this));});
                $("#itemTypeCheckboxList").append(itemTypeCheckboxHtml);
                $("#itemTypeCheckboxList").append(itemTypeLabelHtml);
            }
        }

        function clickVariable(obj, target)
        {
            var txt = obj.text();
            txt = target.val() + txt;
            target.val(txt);
        }

        function changeComponent(obj)
        {
            $("#promList").parent().removeClass("active");
            $("#promotion").parent().removeClass("active");
            $("#order").parent().removeClass("active");
            $("#bill").parent().removeClass("active");

            obj.parent().addClass("active");

            var contentList = $("div[id$=Content]");
            for (var i = 0; i < contentList.length; i++)
            {
                var item = $(contentList[i]);
                if (item.is(":visible"))
                {
                    item.hide();
                }
            }

            var activeContent = $("div[id=" + obj.attr("id") + "Content]");
            activeContent.show();
        }

        function queryPromotionList() {
            var promotionReq = {};
            sendJson("queryPromotionList", promotionReq, queryPromotionListSuccessHandler);
        }

        function queryPromotionListSuccessHandler(data) {
            var promotionList = data;

            if (promotionList != null)
            {
                $("#promotionList").empty();

                for (var i = 0; i < promotionList.length; i++)
                {
                    var item = promotionList[i];

                    // 促销描述
                    var promotionDesc = item.promotionDesc;

                    // 开始时间
                    var startDateTemp = new Date(item.startDate);
                    var month = ("0" + (startDateTemp.getMonth() + 1)).slice(-2);
                    var day = ("0" + startDateTemp.getDate()).slice(-2);
                    var startDate = startDateTemp.getFullYear()+"-"+(month)+"-"+(day);
                    // 失效时间
                    var expireDateTemp = new Date(item.expireDate);
                    var month = ("0" + (expireDateTemp.getMonth() + 1)).slice(-2);
                    var day = ("0" + expireDateTemp.getDate()).slice(-2);
                    var expireDate = expireDateTemp.getFullYear()+"-"+(month)+"-"+(day);
                    // 生效日历类型
                    var calendarType = "";
                    if (item.calendarType == "week") {
                        calendarType = "周";
                    } else if (item.calendarType == "month") {
                        calendarType = "月";
                    }
                    // 生效日历内容
                    var calendarValue = item.calendarValue;
                    // 优先级
                    var priority = item.priority;

                    var checkboxHtml = $("<input>", { "type" : "checkbox", "id" : "promotionGroup", "name" : "promotionGroup"}).attr("promotionId", item.promotionId);
//                    checkboxHtml.bind("click", function() {choosePromotion($(this));});

                    var checkboxTd = $("<td></td>").addClass("col-md-1").html(checkboxHtml);
                    var descTd = $("<td></td>").addClass("col-md-2").text(promotionDesc);
                    var startDateTd = $("<td></td>").addClass("col-md-2").text(startDate);
                    var expireDateTd = $("<td></td>").addClass("col-md-2").text(expireDate);
                    var calendarTypeTd = $("<td></td>").addClass("col-md-2").text(calendarType);
                    var calendarValueTd = $("<td></td>").addClass("col-md-2").text(calendarValue);
                    var priorityTd = $("<td></td>").addClass("col-md-1").text(priority);

                    var trHtml = $("<tr></tr>");
                    trHtml.append(checkboxTd);
                    trHtml.append(descTd);
                    trHtml.append(startDateTd);
                    trHtml.append(expireDateTd);
                    trHtml.append(calendarTypeTd);
                    trHtml.append(calendarValueTd);
                    trHtml.append(priorityTd);
                    $("#promotionList").append(trHtml);
                }
            }
        }

//        function choosePromotion(obj) {
//            promotionId = obj.attr("promotionId");
//
//            var promotion = {};
//            promotion.promotionId = promotionId;
//
//            sendJson("getPromotion", promotion, getPromotionSuccessHandler);
//        }

        function getPromotion() {
            var checkedNum = 0;

            // 搜寻表格里的每一个区间
            $("#promotionList").find("td").each(function(i)
            {
                if (i % 7 == 0)
                {
                    var child = $(this).find("input:checkbox:checked");
                    if (child.prop("checked") == true) {
                        checkedNum++;
                        promotionId = child.attr("promotionId");
                    }
                }
            });

            if (checkedNum > 1) {
                alert("只能选择一个促销");
                return;
            }

            var promotion = {};
            promotion.promotionId = promotionId;

            sendJson("getPromotion", promotion, getPromotionSuccessHandler);
        }

        function savePromotionRelation(relationType) {
            var checkedNum = 0;
            var promotionRelation = {};
            promotionRelation.relationType = relationType;

            // 搜寻表格里的每一个区间
            $("#promotionList").find("td").each(function(i)
            {
                if (i % 7 == 0)
                {
                    var child = $(this).find("input:checkbox:checked");
                    if (child.prop("checked") == true) {
                        checkedNum++;
                        if (promotionRelation.promotionId == null) {
                            promotionRelation.promotionId = child.attr("promotionId");;
                        } else {
                            promotionRelation.otherPromotionId = child.attr("promotionId");;
                        }
                    }
                }
            });

            if (checkedNum != 2) {
                alert("只能选择两个促销");
                return;
            }

            sendJson("savePromotionRelation", promotionRelation, savePromotionRelationSuccessHandler);
        }

        function savePromotionRelationSuccessHandler(data) {
            if (data > 0) {
                alert("保存促销关系成功");
            }
        }

        function chooseArea(obj) {
            var value = obj.val();
            // TODO 使用attr返回undefined
            if (obj.prop("checked") == true) {
                for (var areaKey in areaStoreList) {
                    var areaObj = areaStoreList[areaKey];
                    var areaId = areaObj.areaId;
                    var storeList = areaObj.storeList;

                    if (areaId != value) {
                        continue;
                    }

                    for (var storeKey in storeList) {
                        var storeObj = storeList[storeKey];
                        var storeId = storeObj.storeId;
                        var storeName = storeObj.storeName;
                        var checkboxLength = $("#storeCheckboxList").find("input[type='checkbox'][name='storeId']").length;

                        var storeCheckboxHtml = null;
                        if (checkboxLength == 0) {
                            storeCheckboxHtml = $("<input>", { "type": "checkbox", "id": "storeId" + storeId, "name": "storeId", "value": storeId, "class": "form-control", "style": "margin-top: -5"});
                        } else {
                            storeCheckboxHtml = $("<input>", { "type": "checkbox", "id": "storeId" + storeId, "name": "storeId", "value": storeId, "class": "form-control", "style": "margin-top: -5; margin-left: 4"});
                        }
                        var storeLabelHtml = $("<label>", { "for": "storeId" + storeId, "class": "checkbox inline", "text": storeName, "style": "margin-top: -8"});
                        $("#storeCheckboxList").append(storeCheckboxHtml);
                        $("#storeCheckboxList").append(storeLabelHtml);
                    }
                }
            } else {
                for (var areaKey in areaStoreList) {
                    var areaObj = areaStoreList[areaKey];
                    var areaId = areaObj.areaId;
                    var storeList = areaObj.storeList;

                    if (areaId != value) {
                        continue;
                    }

                    for (var storeKey in storeList) {
                        var storeObj = storeList[storeKey];
                        var storeId = storeObj.storeId;
                        var selectorKey = "storeId" + storeId;

                        var storeChildren = $("#storeCheckboxList").find("input[type='checkbox'][name='storeId'], label[for^='storeId']");
                        for (var index in storeChildren) {
                            if ($.isNumeric(index) == false) {
                                continue;
                            }

                            var child = $(storeChildren[index]);
                            if (child.attr("id") == selectorKey || child.attr("for") == selectorKey) {
                                child.remove();
                            }
                        }
                    }

                    $($("#storeCheckboxList").find("input[type='checkbox'][name='storeId']")[0]).removeAttr("style").css("margin-top", "-5");
                }
            }
        }

        function chooseItemType(obj) {
            var value = obj.val();
            // TODO 使用attr返回undefined
            if (obj.prop("checked") == true) {
                for (var itemTypeKey in itemAllList) {
                    var itemTypeObj = itemAllList[itemTypeKey];
                    var itemTypeId = itemTypeObj.itemTypeId;
                    var itemList = itemTypeObj.itemList;

                    if (itemTypeId != value) {
                        continue;
                    }

                    for (var itemKey in itemList) {
                        var itemObj = itemList[itemKey];
                        var skuId = itemObj.skuId;
                        var skuName = itemObj.skuName;
                        var checkboxLength = $("#itemCheckboxList").find("input[type='checkbox'][name='skuId']").length;

                        var itemCheckboxHtml = null;
                        if (checkboxLength == 0) {
                            itemCheckboxHtml = $("<input>", { "type": "checkbox", "id": "skuId" + skuId, "name": "skuId", "value": skuId, "class": "form-control", "style": "margin-top: -5"});
                        } else {
                            itemCheckboxHtml = $("<input>", { "type": "checkbox", "id": "skuId" + skuId, "name": "skuId", "value": skuId, "class": "form-control", "style": "margin-top: -5; margin-left: 4"});
                        }
                        var itemLabelHtml = $("<label>", { "for": "skuId" + skuId, "class": "checkbox inline", "text": skuName, "style": "margin-top: -8"});
                        $("#itemCheckboxList").append(itemCheckboxHtml);
                        $("#itemCheckboxList").append(itemLabelHtml);
                    }
                }
            } else {
                for (var itemTypeKey in itemAllList) {
                    var itemTypeObj = itemAllList[itemTypeKey];
                    var itemTypeId = itemTypeObj.itemTypeId;
                    var itemList = itemTypeObj.itemList;

                    if (itemTypeId != value) {
                        continue;
                    }

                    for (var itemKey in itemList) {
                        var itemObj = itemList[itemKey];
                        var skuId = itemObj.skuId;
                        var selectorKey = "skuId" + skuId;

                        var itemChildren = $("#itemCheckboxList").find("input[type='checkbox'][name='skuId'], label[for^='skuId']");
                        for (var index in itemChildren) {
                            if ($.isNumeric(index) == false) {
                                continue;
                            }

                            var child = $(itemChildren[index]);
                            if (child.attr("id") == selectorKey || child.attr("for") == selectorKey) {
                                child.remove();
                            }
                        }
                    }

                    $($("#itemCheckboxList").find("input[type='checkbox'][name='skuId']")[0]).removeAttr("style").css("margin-top", "-5");
                }
            }
        }

        function setPromotionDesc(baseConditionType, baseActionType, promotionCondition, promotionAction) {
            var promotionDesc = "";

            if (baseConditionType != null && baseConditionType != "" && baseActionType != null && baseActionType != "") {
                if (baseConditionType == 1) {
                    var conditionIndex1 = promotionCondition.indexOf(">=");
                    var promotionAmt = $.trim(promotionCondition.substring(conditionIndex1 + 2, promotionCondition.length));
                    if ($("#promotionAmt").val() == null || $("#promotionAmt").val() == "") {
                        $("#promotionAmt").val(promotionAmt);
                    }

                    promotionDesc = $("#promotionAmtLabel").text() + promotionAmt + $("#promotionAmtEndLabel").text();
                } else if (baseConditionType == 2) {
                    var conditionIndex2 = promotionCondition.indexOf(">=");
                    var promotionQuantity = $.trim(promotionCondition.substring(conditionIndex2 + 2, promotionCondition.length));
                    if ($("#promotionQuantity").val() == null || $("#promotionQuantity").val() == "") {
                        $("#promotionQuantity").val(promotionQuantity);
                    }

                    promotionDesc = $("#promotionQuantityLabel").text() + promotionQuantity + $("#promotionQuantityEndLabel").text();
                } else if (baseConditionType == 3) {
                    var payChannelId = "";
                    var payChannelText = "";
                    var payChannelTextList = $("#payChannelPicker").find("option");
                    for (var index in payChannelTextList) {
                        if ($.isNumeric(index) == false) {
                            continue;
                        }

                        payChannelText = $(payChannelTextList[index]).text();
                        if (promotionCondition.indexOf(payChannelText) != -1) {
                            payChannelId = parseInt(index) + 1;
                            break;
                        }
                    }
                    if ($("#payChannelPicker").val() == null || $("#payChannelPicker").val() == "") {
                        $("#payChannelPicker").val(payChannelId);
                    }

                    promotionDesc = payChannelText + $("#payChannelLabel").text();
                } else if (baseConditionType == 5) {
                    promotionDesc = $("#staffConditionLabel").text();
                }

                if (baseActionType == 1) {
                    var actionIndex1 = promotionAction.indexOf("-");
                    var discountAmtInAction = $.trim(promotionAction.substring(actionIndex1 + 1, promotionAction.length));
                    if ($("#discountAmtInAction").val() == null || $("#discountAmtInAction").val() == "") {
                        $("#discountAmtInAction").val(discountAmtInAction);
                    }

                    promotionDesc = promotionDesc + $("#discountAmtLabel").text() + discountAmtInAction + $("#discountAmtEndLabel").text();
                } else if (baseActionType == 2) {
                    var actionIndex2 = promotionAction.indexOf("*");
                    var actionIndex2End = promotionAction.indexOf("/");
                    var discountInAction = $.trim(promotionAction.substring(actionIndex2 + 1, actionIndex2End));
                    if ($("#discountInAction").val() == null || $("#discountInAction").val() == "") {
                        $("#discountInAction").val(discountInAction);
                    }

                    promotionDesc = promotionDesc + $("#discountInActionLabel").text() + discountInAction + $("#discountInActionEndLabel").text();
                } else if (baseActionType == 3) {
                    var actionIndex3 = promotionAction.indexOf("+");
                    if (actionIndex3 == -1) {
                        actionIndex3 = promotionAction.indexOf("*");
                        if ($("#pointPicker").val() == null || $("#pointPicker").val() == "") {
                            $("#pointPicker").val("1");
                        }
                    } else {
                        if ($("#pointPicker").val() == null || $("#pointPicker").val() == "") {
                            $("#pointPicker").val("2");
                        }
                    }
                    var pointInAction = $.trim(promotionAction.substring(actionIndex3 + 1, promotionAction.length));
                    if ($("#pointInAction").val() == null || $("#pointInAction").val() == "") {
                        $("#pointInAction").val(pointInAction);
                    }

                    promotionDesc = promotionDesc + $("#pointInActionLabel").text() + pointInAction + $("#pointPicker").find("option:selected").text();
                } else if (baseActionType == 4) {
                    var giftIAction = $("#giftInAction").val();
                    var giftInActionLabelText = $("#giftInActionLabel").text();

                    if (promotionDesc.indexOf(giftInActionLabelText) != -1) {
                        promotionDesc = promotionDesc.substring(0, promotionDesc.indexOf(giftInActionLabelText));
                        promotionDesc = promotionDesc + giftInActionLabelText + giftIAction;
                    } else {
                        promotionDesc = promotionDesc + giftInActionLabelText + giftIAction;
                    }

                    $("#promotionDesc").val(promotionDesc);
                } else if (baseActionType == 5) {
                    var couponIAction = $("#couponInAction").val();
                    var couponInActionLabelText = $("#couponInActionLabel").text();

                    if (promotionDesc.indexOf(couponInActionLabelText) != -1) {
                        promotionDesc = promotionDesc.substring(0, promotionDesc.indexOf(couponInActionLabelText));
                        promotionDesc = promotionDesc + couponInActionLabelText + couponIAction;
                    } else {
                        promotionDesc = promotionDesc + couponInActionLabelText + couponIAction;
                    }

                    $("#promotionDesc").val(promotionDesc);
                } else if (baseActionType == 6) {
                    promotionDesc = promotionDesc + $("#lowPriceLabel").text();
                } else if (baseActionType == 7) {
                    var actionIndex7 = promotionAction.indexOf("*");
                    var fixPrice = $.trim(promotionAction.substring(actionIndex7 + 1, promotionAction.length));
                    if ($("#fixPrice").val() == null || $("#fixPrice").val() == "") {
                        $("#fixPrice").val(fixPrice);
                    }

                    promotionDesc = promotionDesc + $("#fixPriceLabel").text() + fixPrice + $("#fixPriceEndLabel").text();
                }

                $("#promotionDesc").val(promotionDesc);

                var baseConditionId = 'baseCondition' + baseConditionType;
                var baseConditionRadio = $("#basePromotionArea input[id=" + baseConditionId + "]:radio");
//                baseConditionRadio.attr("checked", "on");
                baseConditionRadio.trigger("click");

                var baseActionId = 'baseAction' + baseActionType;
                var baseActionRadio = $("#basePromotionArea input[id=" + baseActionId + "]:radio");
//                baseActionRadio.attr("checked", "on");
                baseActionRadio.trigger("click");
            }
        }

        function getPromotionSuccessHandler(data) {
            var promotionConditionExpr = data.promotionCondition;
            var promotionCondition = data.promotionCondition;
            for (var mappingKey in conditionMapping) {
                if (promotionCondition.indexOf(mappingKey) != -1) {
                    promotionCondition = promotionCondition.replace(mappingKey, conditionMapping[mappingKey]);
                }
            }
            var promotionActionExpr = data.promotionAction;
            var promotionAction = data.promotionAction;
            for (var mappingKey in actionMapping) {
                if (promotionAction.indexOf(mappingKey) != -1) {
                    promotionAction = promotionAction.replace(new RegExp(mappingKey, 'g'), actionMapping[mappingKey]);
                }
            }

            clearForm($("#basePromotionArea"));

            var startDateTemp = new Date(data.startDate);
            var month = ("0" + (startDateTemp.getMonth() + 1)).slice(-2);
            var day = ("0" + startDateTemp.getDate()).slice(-2);
            var startDate = startDateTemp.getFullYear()+"-"+(month)+"-"+(day);
            var startTime = data.startTime;
            var expireDateTemp = new Date(data.expireDate);
            var month = ("0" + (expireDateTemp.getMonth() + 1)).slice(-2);
            var day = ("0" + expireDateTemp.getDate()).slice(-2);
            var expireDate = expireDateTemp.getFullYear()+"-"+(month)+"-"+(day);
            var expireTime = data.expireTime;
            var calendarType = data.calendarType;
            var calendarValue = data.calendarValue;
            var priority = data.priority;

            $("#promotionCondition").attr("expr", promotionConditionExpr);
            $("#promotionAction").attr("expr", promotionActionExpr);
            $("#promotionCondition").val(promotionCondition);
            $("#promotionAction").val(promotionAction);

            setPromotionDesc(data.baseConditionType, data.baseActionType, promotionCondition, promotionAction);

            $("#startDate").val(startDate);
            $("#expireDate").val(expireDate);
            $("#startTime").val(startTime);
            $("#expireTime").val(expireTime);
            $("#calendarType").val(calendarType);
            $("#calendarType").trigger("change");
            if (calendarValue != null) {
                var calendarValueArray = calendarValue.split(",");
                $('input[type="checkbox"][name="calendarValue"]').each(
                        function () {
                            var value = $(this).val();
                            for (var i = 0; i < calendarValueArray.length; i++) {
                                var str = calendarValueArray[i];
                                if (value == str) {
                                    $(this).attr("checked", true);
                                }
                            }
                        }
                );
            }
            $("#priority").val(priority);

            // 地区和门店信息
            sendJson("getPromotionStoreList", promotionId, getPromotionStoreListSuccessHandler);

            // 商品信息
            sendJson("getPromotionItemList", promotionId, getPromotionItemListSuccessHandler);

            // 客户信息
            sendJson("getPromotionCustomerList", promotionId, getPromotionCustomerListSuccessHandler);

            // 礼品信息
            sendJson("getPromotionGiftList", promotionId, getPromotionGiftListSuccessHandler);

            // 优惠券信息
            sendJson("getPromotionCouponList", promotionId, getPromotionCouponListSuccessHandler);

            $("#promotion").trigger("click");
        }

        function billHandler()
        {
            calcPromotion(false);
        }

        function calcPromotion(candidateFlag)
        {
            var promotionReq = {};

            var item = $("#orderContent");
            var params = item.find(".form-control").serializeArray();

            for (var param in params)
            {
                promotionReq[params[param].name] = params[param].value;
            }

            // 订单列表
            var orderList = new Array();
            var order = null;

            // 搜寻表格里的每一个区间
            $("#orderList").find("td").each(function(i)
            {
                if (i % 4 == 0)
                {
                    order = {};

                    // 商品ID
                    var skuId = $(this).attr("skuId");
                    order["skuId"] = skuId;

                    // 商品名称
                    var skuName = $(this).text();
                    order["skuName"] = skuName;
                }
                else if (i % 4 == 1)
                {
                    // 商品类型ID
                    var itemTypeId = $(this).attr("itemTypeId");
                    order["itemTypeId"] = itemTypeId;

                    // 商品类型名称
                    var itemTypeName = $(this).text();
                    order["itemTypeName"] = itemTypeName;
                }
                else if (i % 4 == 2)
                {
                    // 金额
                    var price = $($(this).children()[0]).val();
                    order["price"] = price;
                }
                else if (i % 4 == 3)
                {
                    // 数量
                    var quantity = $($(this).children()[0]).val();
                    order["quantity"] = quantity;

                    orderList.push(order);
                }
            });

            promotionReq.orderList = orderList;

            // 支付不为空的情况下
            var billContent = $("#billContent");
            var billParams = billContent.find(".form-control").serializeArray();

            promotionReq.payChannelList = [];

            for (var billParam in billParams)
            {
                var name = billParams[billParam].name;
                var value = billParams[billParam].value;

                if (value != null && value != "") {
                    var payChannelObj = {};
                    payChannelObj.payChannel = name;
                    payChannelObj.payAmt = value;
                    promotionReq.payChannelList.push(payChannelObj);
                }
            }

            // 用正选的还是候选的促销标志
            promotionReq.candidateFlag = candidateFlag;

            sendJson("calcPromotion", promotionReq, calcPromotionSuccessHandler);
        }

        function calcPromotionSuccessHandler(data)
        {
            var allConsumeAmt = data.allConsumeAmt;
            var actualConsumeAmt = data.actualConsumeAmt;
            var promotionOrderList = data.promotionOrderList;
            var candidatePromotionOrderList = data.candidatePromotionOrderList;
//            var promotionItemList = data.promotionItemList;
//            var fullPriceItemList = data.fullPriceItemList;

            $("#allConsumeAmt").text(allConsumeAmt + "元");
            $("#actualConsumeAmt").text(actualConsumeAmt + "元");

            var discountAmt = allConsumeAmt - actualConsumeAmt;
            $("#discountAmt").text(discountAmt.toFixed(2) + "元");

            if (promotionOrderList != null)
            {
                $("#promotionOrderList").empty();

                for (var i = 0; i < promotionOrderList.length; i++)
                {
                    var item = promotionOrderList[i];
                    var candidate = null;
                    if (candidatePromotionOrderList != null && candidatePromotionOrderList.length > 0) {
                        candidate = candidatePromotionOrderList[i];
                    }

                    // 商品名称
                    var skuName = item.skuName;
                    // 商品类型
                    var itemTypeName = item.itemTypeName;
                    // 金额
                    var price = item.price;
                    // 数量
                    var quantity = item.quantity;
                    // 促销后金额
                    var promotionAmt = item.promotionAmt;
                    // 促销描述
                    var promotionDesc = item.promotionDesc;
                    // 候选促销描述
                    var candidatePromotionDesc = null;
                    if (candidate != null) {
                        candidatePromotionDesc = candidate.promotionDesc;
                    }

                    var itemNameTd = $("<td></td>").addClass("col-md-1").text(skuName);
                    var itemTypeNameTd = $("<td></td>").addClass("col-md-1").text(itemTypeName);
                    var consumeAmtTd = $("<td></td>").addClass("col-md-1").text(price);
                    var quantityTd = $("<td></td>").addClass("col-md-1").text(quantity);
                    var promotionAmtTd = $("<td></td>").addClass("col-md-1").text(promotionAmt);
                    var promotionDescTd = $("<td></td>").addClass("col-md-2").html(promotionDesc);
                    var candidatePromotionDescTd = null;
                    if (candidatePromotionDesc != null) {
                        candidatePromotionDescTd = $("<td></td>").addClass("col-md-2").html(candidatePromotionDesc);
                    }

                    var trHtml = $("<tr></tr>");
                    trHtml.append(itemNameTd);
                    trHtml.append(itemTypeNameTd);
                    trHtml.append(consumeAmtTd);
                    trHtml.append(quantityTd);
                    trHtml.append(promotionAmtTd);
                    trHtml.append(promotionDescTd);
                    if (candidatePromotionDescTd != null) {
                        trHtml.append(candidatePromotionDescTd);
                    }
                    $("#promotionOrderList").append(trHtml);
                }
            }

            $("#bill").trigger("click");
        }

//        function exitHandler()
//        {
//            $("#promListContent").show();
//            $("#promotionContent").hide();
//            $("#orderContent").hide();
//            $("#billContent").hide();
//
//            $("#promList").parent().addClass("active");
//            $("#promotion").parent().removeClass("active");
//            $("#order").parent().removeClass("active");
//            $("#bill").parent().removeClass("active");
//        }

        function savePromotion() {
            var promotionReq = {};
            var promotion = {};
            var areaIdList = new Array();
            var storeIdList = new Array();
            var itemTypeIdList = new Array();
            var itemIdList = new Array();
            var areaStoreReqList = new Array();
            var itemAllReqList = new Array();
            var calendarValue = "";
            var customerExpr = customerExprHandler();
            var baseConditionType = baseConditionTypeHandler();
            var baseActionType = baseActionTypeHandler();

            var baseConditionId = 'baseCondition' + baseConditionType;
            var baseConditionRadio = $("#basePromotionArea input[id=" + baseConditionId + "]:radio");
//            baseConditionRadio.trigger("change");
            chooseBasePromotion(baseConditionRadio);

            var baseActionId = 'baseAction' + baseActionType;
            var baseActionRadio = $("#basePromotionArea input[id=" + baseActionId + "]:radio");
            chooseBasePromotion(baseActionRadio);

            var item = $("#promotionContent");
            var params = item.find(".form-control").serializeArray();

            for (var param in params) {
                var name = params[param].name;
                var value = params[param].value;

                if (name == "areaId") {
                    areaIdList.push(value);
                    continue;
                } else if (name == "storeId") {
                    storeIdList.push(value);
                    continue;
                } else if (name == "itemTypeId") {
                    itemTypeIdList.push(value);
                    continue;
                } else if (name == "skuId") {
                    itemIdList.push(value);
                    continue;
                } else if (name == "calendarValue") {
                    if (calendarValue == "") {
                        calendarValue = calendarValue + value;
                    } else {
                        calendarValue = calendarValue + "," + value;
                    }
                    promotion.calendarValue = calendarValue;
                    continue;
                } else if (name == "promotionCondition") {
                    promotion.promotionCondition = $("#promotionCondition").attr("expr");
                    continue;
                } else if (name == "promotionAction") {
                    promotion.promotionAction = $("#promotionAction").attr("expr");
                    continue;
                }

                if (promotion.hasOwnProperty(name)) {
                    if($.isArray(promotion[name])) {
                        promotion[name].push(value);
                    } else {
                        promotion[name] = [promotion[name],value];
                    }
                } else {
                    promotion[name] = value;
                }
            }

            if (promotion.calendarType == "week" || promotion.calendarType == "month") {
                if (promotion.calendarValue == null || promotion.calendarValue == "") {
                    alert("已选择生效日历类型，请继续选择生效日历内容；或者将生效日历类型置为空白");
                    return;
                }
            }

            if (promotion.promotionCondition == null || promotion.promotionAction == null) {
                alert("促销条件为空，或者未选中");
                return;
            }

            if (promotion.startDate == null || promotion.startDate == "") {
                alert("开始日期为空");
                return;
            }
            if (promotion.expireDate == null || promotion.expireDate == "") {
                alert("失效日期为空");
                return;
            }

            if (baseConditionType == 5) {
                var customerTypeList = $("#customerArea").find("input[type='checkbox'][name='customerType']");
                var matchFlag = true;

                for (var i = 0; i < customerTypeList.length; i++) {
                    var child = $(customerTypeList[i]);
                    if (child.prop("checked") == true) {
                        var value = child.val();
                        if (value != "staff") {
                            matchFlag = false;
                            break;
                        }
                    }
                }
                if (matchFlag == false) {
                    alert("客户类型只能选择员工");
                    return;
                }
            }

            promotionReq.customerExpr = customerExpr;

            promotion.promotionId = promotionId;
            promotion.baseConditionType = baseConditionType;
            promotion.baseActionType = baseActionType;

            promotionReq.promotion = promotion;

            for (var areaKey in areaStoreList) {
                var areaObj = areaStoreList[areaKey];
                var areaId = areaObj.areaId;

                for (var checkedAreaIndex in areaIdList) {
                    var checkedAreaId = areaIdList[checkedAreaIndex];
                    if (areaId == checkedAreaId) {
                        if (storeIdList != null && storeIdList.length > 0) {
                            var storeList = areaObj.storeList;
                            for (var storeKey in storeList) {
                                var storeObj = storeList[storeKey];
                                var storeId = storeObj.storeId;

                                for (var checkedStoreIndex in storeIdList) {
                                    var checkedStoreId = storeIdList[checkedStoreIndex];

                                    if (storeId == checkedStoreId) {
                                        var areaReq = {};
                                        areaReq.areaId = areaId;
                                        areaReq.storeId = storeId;
                                        areaStoreReqList.push(areaReq);
                                        break;
                                    }
                                }
                            }
                        } else {
                            var areaReq = {};
                            areaReq.areaId = areaId;
                            areaStoreReqList.push(areaReq);
                        }
                    }
                }
            }
            promotionReq.areaStoreList = areaStoreReqList;

            if (areaStoreReqList.length == 0) {
                alert("没有选择任何区域或者门店");
                return;
            }

            for (var itemTypeKey in itemAllList) {
                var itemTypeObj = itemAllList[itemTypeKey];
                var itemTypeId = itemTypeObj.itemTypeId;

                for (var checkedItemTypeIndex in itemTypeIdList) {
                    var checkedItemTypeId = itemTypeIdList[checkedItemTypeIndex];
                    if (itemTypeId == checkedItemTypeId) {
                        if (itemIdList != null && itemIdList.length > 0) {
                            var itemList = itemTypeObj.itemList;
                            for (var itemKey in itemList) {
                                var itemObj = itemList[itemKey];
                                var skuId = itemObj.skuId;

                                for (var checkedItemIndex in itemIdList) {
                                    var checkedItemId = itemIdList[checkedItemIndex];

                                    if (skuId == checkedItemId) {
                                        var itemTypeReq = {};
                                        itemTypeReq.itemTypeId = itemTypeId;
                                        itemTypeReq.skuId = skuId;
                                        itemAllReqList.push(itemTypeReq);
                                        break;
                                    }
                                }
                            }
                        } else {
                            var itemTypeReq = {};
                            itemTypeReq.itemTypeId = itemTypeId;
                            itemAllReqList.push(itemTypeReq);
                        }
                    }
                }
            }
            promotionReq.itemAllList = itemAllReqList;

            if (itemAllReqList.length == 0) {
                alert("没有选择任何商品类型或者商品");
                return;
            }

            var giftIdList = $("#giftInAction").attr("giftIdList");
            if (giftIdList != null && giftIdList != "") {
                promotionReq.giftList = [];
                giftIdList = giftIdList.split(",");
                for (var i = 0; i < giftIdList.length; i++) {
                    var giftId = giftIdList[i];
                    var gift = {};
                    gift.giftId = giftId;
                    promotionReq.giftList.push(gift);
                }
            }

            var couponIdList = $("#couponInAction").attr("couponIdList");
            if (couponIdList != null && couponIdList != "") {
                promotionReq.couponList = [];
                couponIdList = couponIdList.split(",");
                for (var i = 0; i < couponIdList.length; i++) {
                    var couponId = couponIdList[i];
                    var coupon = {};
                    coupon.couponId = couponId;
                    promotionReq.couponList.push(coupon);
                }
            }

            sendJson("savePromotion", promotionReq, savePromotionSuccessHandler);
        }

        function deleteHandler() {
            if (promotionId == null || promotionId == "" || promotionId == 0) {
                alert("未选中任何促销");
                return;
            }
            sendJson("deletePromotion", promotionId, deletePromotionSuccessHandler);
        }

        function savePromotionSuccessHandler(data) {
            alert("保存成功");
            promotionId = data;
            queryPromotionList();
        }

        function deletePromotionSuccessHandler(data) {
            alert("删除成功");
            promotionId = null;
            queryPromotionList();
            $("#promList").trigger("click");
        }

        function chooseCalendarType(obj) {
            var value = obj.val();

            var calendarValueChildren = $("#calendarValueCheckboxList").find("input[type='checkbox'][name='calendarValue'], label[for^='calendarValue'], br");
            for (var index in calendarValueChildren) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(calendarValueChildren[index]);
                child.remove();
            }

            if (value == "week") {
                for (var i = 1; i < 8; i++) {
                    var checkboxLength = $("#calendarValueCheckboxList").find("input[type='checkbox'][name='calendarValue']").length;

                    var calendarValueCheckboxHtml = null;
                    if (checkboxLength == 0) {
                        calendarValueCheckboxHtml = $("<input>", { "type": "checkbox", "id": "calendarValue" + i, "name": "calendarValue", "value": i, "class": "form-control", "style": "margin-top: -5"});
                    } else {
                        calendarValueCheckboxHtml = $("<input>", { "type": "checkbox", "id": "calendarValue" + i, "name": "calendarValue", "value": i, "class": "form-control", "style": "margin-top: -5; margin-left: 4"});
                    }
                    var calendarValueLabelHtml = $("<label>", { "for": "calendarValue" + i, "class": "checkbox inline", "text": i, "style": "margin-top: -8"});
                    $("#calendarValueCheckboxList").append(calendarValueCheckboxHtml);
                    $("#calendarValueCheckboxList").append(calendarValueLabelHtml);
                }
            } else if (value == "month") {
                for (var i = 1; i < 32; i++) {
                    var calendarValueCheckboxHtml = null;
                    if (i % 10 == 1) {
                        if (i > 1) {
                            var htmlWithBr = $("#calendarValueCheckboxList").html() + "<br/>";
                            $("#calendarValueCheckboxList").html(htmlWithBr);
                            calendarValueCheckboxHtml = $("<input>", { "type": "checkbox", "id": "calendarValue" + i, "name": "calendarValue", "value": i, "class": "form-control", "style": "margin-top: -5; margin-left: 175"});
                        } else if (i == 1) {
                            calendarValueCheckboxHtml = $("<input>", { "type": "checkbox", "id": "calendarValue" + i, "name": "calendarValue", "value": i, "class": "form-control", "style": "margin-top: -5"});
                        }
                    } else if (i / 10 < 1) {
                        calendarValueCheckboxHtml = $("<input>", { "type": "checkbox", "id": "calendarValue" + i, "name": "calendarValue", "value": i, "class": "form-control", "style": "margin-top: -5; margin-left: 13"});
                    } else {
                        calendarValueCheckboxHtml = $("<input>", { "type": "checkbox", "id": "calendarValue" + i, "name": "calendarValue", "value": i, "class": "form-control", "style": "margin-top: -5; margin-left: 4"});
                    }
                    var calendarValueLabelHtml = $("<label>", { "for": "calendarValue" + i, "class": "checkbox inline", "text": i, "style": "margin-top: -8"});
                    $("#calendarValueCheckboxList").append(calendarValueCheckboxHtml);
                    $("#calendarValueCheckboxList").append(calendarValueLabelHtml);
                }
            }
        }

        function validateConditionHandler() {
            var promotionCondition = $("#promotionCondition").val();
            for (var mappingKey in conditionMapping)
            {
                if (promotionCondition.indexOf(conditionMapping[mappingKey]) != -1)
                {
                    promotionCondition = promotionCondition.replace(new RegExp(conditionMapping[mappingKey], 'g'), mappingKey);
                }
            }
            $("#promotionCondition").attr("expr", promotionCondition);

            sendJson("validateCondition", promotionCondition);
        }

        function validateActionHandler() {
            var promotionAction = $("#promotionAction").val();
            for (var mappingKey in actionMapping)
            {
                if (promotionAction.indexOf(actionMapping[mappingKey]) != -1)
                {
                    promotionAction = promotionAction.replace(new RegExp(actionMapping[mappingKey], 'g'), mappingKey);
                }
            }
            $("#promotionAction").attr("expr", promotionAction);

            sendJson("validateAction", promotionAction);
        }

//        function validateConditionSuccessHandler(data) {
//            if (data == false) {
//                $("#basePromotionArea input:radio checked").removeAttr("checked");
//                $("#promotionCondition").removeAttr("expr");
//                $("#promotionCondition").val("");
//                alert("验证失败");
//            }
//        }
//
//        function validateActionSuccessHandler(data) {
//            if (data == false) {
//                $("#basePromotionArea input:radio checked").removeAttr("checked");
//                $("#promotionAction").removeAttr("expr");
//                $("#promotionAction").val("");
//                alert("验证失败");
//            }
//        }

//        function chooseCondition(obj) {
//            var objId = obj.attr("id");
//
//            if (objId == "baseConditionBtn") {
//                $("#basePromotionArea").show();
//                $("#advanceConditionBtnArea").hide();
//                $("#advanceConditionArea").hide();
//                $("#promotionActionArea").hide();
//                $("#promotionDescArea").hide();
//
//                $("#baseConditionBtn").addClass("btn-primary");
//                $("#advanceConditionBtn").removeClass("btn-primary");
//            } else if (objId == "advanceConditionBtn") {
//                $("#basePromotionArea").hide();
//                $("#advanceConditionBtnArea").show();
//                $("#advanceConditionArea").show();
//                $("#promotionActionArea").show();
//                $("#promotionDescArea").show();
//
//                $("#baseConditionBtn").removeClass("btn-primary");
//                $("#advanceConditionBtn").addClass("btn-primary");
//            }
//        }

        function chooseBasePromotion(obj) {
            var inputList = obj.parent().find("input");
            var promotionCondition = "";
            var promotionAction = "";
            var promotionConditionExpr = "";
            var promotionActionExpr = "";
            var baseConditionRadio = $("#basePromotionArea input[name='baseCondition'][type='radio']:checked");
            var baseActionRadio = $("#basePromotionArea input[name='baseAction'][type='radio']:checked");
            var baseConditionType = 0
            var baseActionType = 0;
            var checkCondition = true;
            var checkAction = true;

            if (baseConditionRadio != null) {
                if (baseConditionRadio.attr("id") != null && baseConditionRadio.attr("id") != undefined) {
                    baseConditionType = baseConditionRadio.attr("id").replace("baseCondition", "");
                    promotionCondition = $("#promotionCondition").val();
                }
            }
            if (baseActionRadio != null) {
                if (baseActionRadio.attr("id") != null && baseActionRadio.attr("id") != undefined) {
                    baseActionType = baseActionRadio.attr("id").replace("baseAction", "");
                    promotionAction = $("#promotionAction").val();
                }
            }

            var radioId = obj.attr("id");
            if (radioId.indexOf("baseCondition") != -1) {
                if (baseConditionType == 1) {
                    checkCondition = checkPromotionCondition($("#promotionAmt").val());
                    promotionCondition = "promotionAmt >= " + $("#promotionAmt").val();
                } else if (baseConditionType == 2) {
                    checkCondition = checkPromotionCondition($("#promotionQuantity").val());
                    promotionCondition = "promotionQuantity >= " + $("#promotionQuantity").val();
                } else if (baseConditionType == 3) {
                    var payChannelValue = $("#payChannelPicker").val();
                    if (payChannelValue == 1) {
                        promotionCondition = "useWeChat";
                    } else if (payChannelValue == 2) {
                        promotionCondition = "useAiPay";
                    } else if (payChannelValue == 3) {
                        promotionCondition = "useDebitCard";
                    } else if (payChannelValue == 4) {
                        promotionCondition = "useCreditCard";
                    } else if (payChannelValue == 5) {
                        promotionCondition = "useCash";
                    }
                    checkCondition = true;
                } else if (baseConditionType == 4) {
                    promotionCondition = "true";
                    checkCondition = true;
                } else if (baseConditionType == 5) {
                    promotionCondition = "staffLimitAmt >= promotionAmt";
                    checkCondition = true;
                }

                if (checkCondition == false) {
                    obj.removeAttr("checked");
                    return;
                }

                promotionConditionExpr = promotionCondition;

                for (var mappingKey in conditionMapping) {
                    if (promotionCondition.indexOf(mappingKey) != -1) {
                        promotionCondition = promotionCondition.replace(mappingKey, conditionMapping[mappingKey]);
                    }
                }

                $("#promotionCondition").val(promotionCondition);
                $("#promotionCondition").attr("expr", promotionConditionExpr);
            } else {
                if (baseActionType == 1) {
                    checkAction = checkPromotionAction($("#discountAmtInAction").val());
                    promotionAction = "actualConsumeAmt= promotionAmt - " + $("#discountAmtInAction").val();
                } else if (baseActionType == 2) {
                    checkAction = checkPromotionAction($("#discountInAction").val());
                    promotionAction = "actualConsumeAmt= promotionAmt * " + $("#discountInAction").val() + " / 10";
                } else if (baseActionType == 3) {
                    checkAction = checkPromotionAction($("#pointInAction").val());
                    promotionAction = "point = point ";
                    if ($("#pointPicker").val() == 1) {
                        promotionAction = promotionAction + "* ";
                    } else {
                        promotionAction = promotionAction + "+ ";
                    }
                    promotionAction = promotionAction + $("#pointInAction").val();
                } else if (baseActionType == 4) {
                    promotionAction = "giftList";
                    checkAction = true;
                } else if (baseActionType == 5) {
                    promotionAction = "couponList";
                    checkAction = true;
                } else if (baseActionType == 6) {
                    promotionAction = "actualConsumeAmt = promotionAmt - promotionLowPrice";
                    checkAction = true;
                } else if (baseActionType == 7) {
                    checkAction = checkPromotionAction($("#fixPrice").val());
                    promotionAction = "actualConsumeAmt = promotionQuantity * " + $("#fixPrice").val();
                }

                if (checkAction == false) {
                    obj.removeAttr("checked");
                    return;
                }

                promotionActionExpr = promotionAction;

                for (var mappingKey in actionMapping) {
                    if (promotionAction.indexOf(mappingKey) != -1) {
                        promotionAction = promotionAction.replace(new RegExp(mappingKey, 'g'), actionMapping[mappingKey]);
                    }
                }

                $("#promotionAction").val(promotionAction);
                $("#promotionAction").attr("expr", promotionActionExpr);
            }

            if (baseConditionType != 0 && baseActionType != 0) {
                setPromotionDesc(baseConditionType, baseActionType, promotionCondition, promotionAction);
            }
        }

        function customerExprHandler() {
            var customerExpr = null;
            var customerType = null;
            var birth = null;
            var sex = null;

            var customerTypeList = $("#customerArea").find("input[type='checkbox'][name='customerType']");
            for (var index in customerTypeList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(customerTypeList[index]);
                if (child.prop("checked") == true) {
                    var value = child.val();
                    if (customerType == null) {
                        customerType = "expr.in(customerType, \"" + value + "\"";
                    } else {
                        customerType = customerType + ", \"" + value + "\"";
                    }
                }
            }
            if (customerType != null) {
                customerType = customerType + ")";
            }

            var calendarType = $("#calendarType").val();
            var birthList = $("#customerArea").find("input[type='radio'][name='birth']");
            for (var index in birthList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(birthList[index]);
                if (child.prop("checked") == true) {
//                    var months = null;
//                    var value = child.val();
//                    if (value == 'birthMonth') {
//                        var startTimeTemp = new Date($("#startTime").val());
//                        var minMonth = startTimeTemp.getMonth() + 1;
//                        var expireTimeTemp = new Date($("#expireTime").val());
//                        var maxMonth = expireTimeTemp.getMonth() + 1;
//
//                        // 跨年
//                        if (minMonth > maxMonth) {
//                            for (var i = minMonth; i <= 12; i++) {
//                                if (months == null) {
//                                    months = i;
//                                } else {
//                                    months = months + "," + i;
//                                }
//                            }
//                            for (var i = 1; i <= maxMonth; i++) {
//                                if (months == null) {
//                                    months = i;
//                                } else {
//                                    months = months + "," + i;
//                                }
//                            }
//                        } else {
//                            for (var i = minMonth; i <= maxMonth; i++) {
//                                if (months == null) {
//                                    months = i;
//                                } else {
//                                    months = months + "," + i;
//                                }
//                            }
//                        }
//
//                        birth = "expr.month(birthday) in (" + months + ")";
//                    } else if (value == 'birthDay') {
//                        if (calendarType == 'week') {
//                            alert("无法获取到限定的促销日");
//                            break;
//                        }
//
//                        if (calendarType == 'month') {
//                            var calendarValue = null;
//
//                            var item = $("#promotionContent");
//                            var params = item.find(".form-control").serializeArray();
//
//                            for (var param in params) {
//                                var name = params[param].name;
//                                var value = params[param].value;
//
//                                if (name == "calendarValue") {
//                                    if (calendarValue == null) {
//                                        calendarValue = value;
//                                    } else {
//                                        calendarValue = calendarValue + "," + value;
//                                    }
//                                    continue;
//                                }
//                            }
//                            birth = "expr.month(birthday) in (" + calendarValue + ")";
//                        }
//                    }
                    var value = child.val();
                    if (value == 'birthMonth') {
                        birth = "expr.month(BirthDate) == expr.month(expr.now)";
                    } else if (value == 'birthDay') {
                        birth = "expr.date(BirthDate) == expr.date(expr.now)";
                    }
                    break;
                }
            }

            var sexList = $("#customerArea").find("input[type='radio'][name='sex']");
            for (var index in sexList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(sexList[index]);

                if (child.prop("checked") == true) {
                    var value = child.val();
                    sex = "sex == \"" + value + "\"";
                    break;
                }
            }

            if (customerType != null && customerType != null) {
                customerExpr = customerType;
            }
            if (birth != null) {
                if (customerExpr != null) {
                    customerExpr = customerExpr + " and " + birth;
                } else {
                    customerExpr = birth;
                }
            }
            if (sex != null) {
                if (customerExpr != null) {
                    customerExpr = customerExpr + " and " + sex;
                } else {
                    customerExpr = sex;
                }
            }

            return customerExpr;
        }

        function baseConditionTypeHandler() {
            var baseConditionType = null;
            var baseConditionList = $("#basePromotionArea").find("input[type='radio'][name='baseCondition']");
            for (var index in baseConditionList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(baseConditionList[index]);

                if (child.prop("checked") == true) {
                    var id = child.attr("id");
                    baseConditionType = id.replace("baseCondition", "");
                    break;
                }
            }
            return baseConditionType;
        }

        function baseActionTypeHandler() {
            var baseActionType = null;
            var baseActionList = $("#basePromotionArea").find("input[type='radio'][name='baseAction']");
            for (var index in baseActionList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(baseActionList[index]);

                if (child.prop("checked") == true) {
                    var id = child.attr("id");
                    baseActionType = id.replace("baseAction", "");
                    break;
                }
            }
            return baseActionType;
        }

        function getPromotionStoreListSuccessHandler(data) {
            var areaChildren = $("#areaCheckboxList").find("input[type='checkbox'][name='areaId'], label[for^='areaId']");
            for (var index in areaChildren) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(areaChildren[index]);
                child.remove();
            }

            var storeChildren = $("#storeCheckboxList").find("input[type='checkbox'][name='storeId'], label[for^='storeId']");
            for (var index in storeChildren) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(storeChildren[index]);
                child.remove();
            }

            initAreaStore();

            var areaList = $("#areaCheckboxList").find("input[type='checkbox'][name='areaId']");
            for (var index in areaList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(areaList[index]);
                var childId = child.attr("id");
                var value = child.val();
                var matchFlag = false;

                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    if (value == obj.areaId) {
                        child.attr("checked", true);
                        matchFlag = true;
                        break;
                    }
                }
                if (matchFlag) {
                    chooseArea(child);
                } else {
                    child.attr("checked", false);
                }
            }

            var storeList = $("#storeCheckboxList").find("input[type='checkbox'][name='storeId']");
            for (var index in storeList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(storeList[index]);
                var value = child.val();

                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    if (value == obj.storeId) {
                        child.attr("checked", true);
                        break;
                    }
                }
            }
        }

        function getPromotionItemListSuccessHandler(data) {
            var itemTypeChildren = $("#itemTypeCheckboxList").find("input[type='checkbox'][name='itemTypeId'], label[for^='itemTypeId']");
            for (var index in itemTypeChildren) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(itemTypeChildren[index]);
                child.remove();
            }

            var itemChildren = $("#itemCheckboxList").find("input[type='checkbox'][name='skuId'], label[for^='skuId']");
            for (var index in itemChildren) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(itemChildren[index]);
                child.remove();
            }

            initAllItem();

            var itemTypeList = $("#itemTypeCheckboxList").find("input[type='checkbox'][name='itemTypeId']");
            for (var index in itemTypeList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(itemTypeList[index]);
                var value = child.val();
                var matchFlag = false;

                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    if (value == obj.itemTypeId) {
                        child.attr("checked", true);
                        matchFlag = true;
                        break;
                    }
                }
                if (matchFlag) {
                    chooseItemType(child);
                } else {
                    child.attr("checked", false);
                }
            }

            var itemList = $("#itemCheckboxList").find("input[type='checkbox'][name='skuId']");
            for (var index in itemList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(itemList[index]);
                var value = child.val();

                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    if (value == obj.skuId) {
                        child.attr("checked", true);
                        break;
                    }
                }
            }
        }

        function getPromotionCustomerListSuccessHandler(data) {
            var customerTypeList = $("#customerArea").find("input[type='checkbox'][name='customerType']");
            for (var index in customerTypeList) {
                if ($.isNumeric(index) == false) {
                    continue;
                }

                var child = $(customerTypeList[index]);
                var value = child.val();

                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    var customerTypeObj = null;
                    var customerType = null;
                    var customerExpr = obj.customerExpr;
                    if (customerExpr != null && customerExpr.indexOf("customerType") != -1) {
                        var beginStr = "expr.in(customerType";
                        var beginIndex = customerExpr.indexOf(beginStr) + beginStr.length;
                        if (beginIndex == -1) {
                            continue;
                        }
                        var endStr = ")";
                        var endIndex = customerExpr.substring(beginIndex).indexOf(endStr);
                        if (endIndex == -1) {
                            continue;
                        }
                        customerType = customerExpr.substring(beginIndex, beginIndex + endIndex);
                        if (customerType != null) {
                            if (customerType.indexOf(value) != -1) {
                                child.attr("checked", true);
                                break;
                            }
                        }
                    }
                }
            }

            for (var i = 0; i < data.length; i++) {
                var obj = data[i];
                var customerTypeObj = null;
                var customerType = null;
                var customerExpr = obj.customerExpr;
                if (customerExpr != null && customerExpr.indexOf("BirthDate") != -1) {
                    if (customerExpr.indexOf("month(BirthDate)") != -1) {
                        $("#birthMonth").attr("checked", true);
                    } else if (customerExpr.indexOf("date(BirthDate)") != -1) {
                        $("#birthDay").attr("checked", true);
                    }
                }

                if (customerExpr != null && customerExpr.indexOf("sex") != -1) {
                    if (customerExpr.indexOf("sex == \"male\"") != -1) {
                        $("#sexMale").attr("checked", true);
                    } else if (customerExpr.indexOf("sex == \"female\"") != -1) {
                        $("#sexFemale").attr("checked", true);
                    }
                }
            }
        }


        function clearForm(objE){//objE为form表单
            $(objE).find(':input').each(
                    function(){
                        switch(this.type){
                            case 'passsword':
                            case 'select-multiple':
                            case 'select-one':
                            case 'text':
                            case 'textarea':
                                $(this).val('');
                                break;
                            case 'checkbox':
                            case 'radio':
                                this.checked = false;
                        }
                    }
            );
        }

        function clickPayChannel(obj) {
            var payChannelId = obj.attr("payChannel");
            var txtObj = obj.parent().find("input[type='text'][id=" + payChannelId + "]");

            obj.addClass("btn-primary");

            obj.parent().find("input[type='text']").attr("readonly", true);
            txtObj.removeAttr("readonly");
            txtObj.focus();
        }

        function leavePayChannelText(obj) {
            var payChannelId = obj.attr("id");
            var value = obj.val();
            var btnObj = obj.parent().find("button[payChannel=" + payChannelId + "]");
            if (value == null || value == "") {
                btnObj.removeClass("btn-primary");
            }
        }

        function payHandler() {
            calcPromotion(false);
        }

        function useCandidateHandler() {
            calcPromotion(true);
        }

        function chooseGiftHandler() {
            var key = $("#giftPicker").val();
            var value = $("#giftPicker").find("option:selected").text();
            var oldValue = $("#giftInAction").val();
            var giftIdList = $("#giftInAction").attr("giftIdList");
            var giftDesc = "";

            if (giftIdList == null) {
                giftIdList = [];
            }

            if ($.isArray(giftIdList) == false) {
                var tempValue = giftIdList;
                giftIdList = [];
                if (tempValue != null && tempValue != "") {
                    giftIdList.push(tempValue);
                }
            }

            giftIdList.push(key);
            if (oldValue != null && oldValue != "") {
                giftDesc = oldValue + "," + value;
            } else {
                giftDesc = value;
            }
            $("#giftInAction").attr("giftIdList", giftIdList);
            $("#giftInAction").val(giftDesc);
        }

        function chooseCouponHandler() {
            var key = $("#couponPicker").val();
            var value = $("#couponPicker").find("option:selected").text();
            var oldValue = $("#couponInAction").val();
            var couponIdList = $("#couponInAction").attr("couponIdList");
            var couponDesc = "";

            if (couponIdList == null) {
                couponIdList = [];
            }

            if ($.isArray(couponIdList) == false) {
                var tempValue = couponIdList;
                couponIdList = [];
                if (tempValue != null && tempValue != "") {
                    couponIdList.push(tempValue);
                }
            }

            couponIdList.push(key);
            if (oldValue != null && oldValue != "") {
                couponDesc = oldValue + "," + value;
            } else {
                couponDesc = value;
            }
            $("#couponInAction").attr("couponIdList", couponIdList);
            $("#couponInAction").val(couponDesc);
        }

        function clearGiftHandler() {
            $("#giftPicker").val("");
            $("#giftInAction").val("");
            $("#giftInAction").attr("giftIdList", "");
        }

        function clearCouponHandler() {
            $("#couponPicker").val("");
            $("#couponInAction").val("");
            $("#couponInAction").attr("couponIdList", "");
        }

//        function getPromotionGiftList(promotionId) {
//            sendJson("getPromotionGiftList", promotionId, getPromotionGiftListSuccessHandler);
//        }

        function getPromotionGiftListSuccessHandler(data) {
            var giftIdList = [];
            var giftDesc = "";
            var giftList = $("#giftPicker").find("option");

            for (var i = 0; i < data.length; i++) {
                var gift = data[i];
                giftIdList.push(gift.giftId);
                for (var index in giftList) {
                    if ($.isNumeric(index) == false) {
                        continue;
                    }

                    var giftId = $(giftList[index]).val();
                    var giftText = $(giftList[index]).text();
                    if (gift.giftId == giftId) {
                        if (giftDesc == "") {
                            giftDesc = giftText;
                        } else {
                            giftDesc = giftDesc + "," + giftText;
                        }
                        break;
                    }
                }
            }

            $("#giftInAction").attr("giftIdList", giftIdList);
            $("#giftInAction").val(giftDesc);

            var giftIAction = $("#giftInAction").val();
            var promotionDesc = $("#promotionDesc").val();
            var giftInActionLabelText = $("#giftInActionLabel").text();
            if (promotionDesc.indexOf(giftInActionLabelText) != -1) {
                promotionDesc = promotionDesc.substring(0, promotionDesc.indexOf(giftInActionLabelText));
                promotionDesc = promotionDesc + giftInActionLabelText + giftIAction;
            } else {
                promotionDesc = promotionDesc + giftInActionLabelText + giftIAction;
            }
            $("#promotionDesc").val(promotionDesc);
        }

//        function getPromotionCouponList(promotionId) {
//            sendJson("getPromotionCouponList", promotionId, getPromotionCouponListSuccessHandler);
//        }

        function getPromotionCouponListSuccessHandler(data) {
            var couponIdList = [];
            var couponDesc = "";
            var couponList = $("#couponPicker").find("option");

            for (var i = 0; i < data.length; i++) {
                var coupon = data[i];
                couponIdList.push(coupon.couponId);
                for (var index in couponList) {
                    if ($.isNumeric(index) == false) {
                        continue;
                    }

                    var couponId = $(couponList[index]).val();
                    var couponText = $(couponList[index]).text();
                    if (coupon.couponId == couponId) {
                        if (couponDesc == "") {
                            couponDesc = couponText;
                        } else {
                            couponDesc = couponDesc + "," + couponText;
                        }
                        break;
                    }
                }
            }

            $("#couponInAction").attr("couponIdList", couponIdList);
            $("#couponInAction").val(couponDesc);

            var couponIAction = $("#couponInAction").val();
            var promotionDesc = $("#promotionDesc").val();
            var couponInActionLabelText = $("#couponInActionLabel").text();
            if (promotionDesc.indexOf(couponInActionLabelText) != -1) {
                promotionDesc = promotionDesc.substring(0, promotionDesc.indexOf(couponInActionLabelText));
                promotionDesc = promotionDesc + couponInActionLabelText + couponIAction;
            } else {
                promotionDesc = promotionDesc + couponInActionLabelText + couponIAction;
            }
            $("#promotionDesc").val(promotionDesc);
        }

        function checkPromotionCondition(value) {
            if (value == null || value == "") {
                alert("促销条件为空");
                return false;
            }
            return true;
        }

        function checkPromotionAction(value) {
            if (value == null || value == "") {
                alert("促销内容为空");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
