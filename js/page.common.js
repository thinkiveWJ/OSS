﻿$(function() {
        var topwin=window.top;
        var tfun=function(obj) {
		window.console.log(obj);
	};
        window.Msg=topwin.Msg?topwin.Msg:{};
        window.message = topwin.Msg?topwin.Msg.message:tfun;
        window.error= topwin.Msg?topwin.Msg.message:tfun;
	window.frameDialog = topwin.frameDialog;
	window.dialog = topwin.dialog; 
	window.frameMask = topwin.frameMask; //全局遮罩
	window.frameUnMask = topwin.frameUnMask; //取消全局遮罩
        window.fullShipFrame=topwin.fullShipFrame;
});
var editorFormId = "#editorForm";//默认编辑区表单ID
//默认网格控件配置
var defaultGridOpts = {
	datatype : "json",
	mtype : "POST",
	altclass : 'alt-row',
	altRows : true,
	hoverrows : false,
	viewrecords : true,
	width : $("body").innerWidth() - 24,
	autowidth : false,
	shrinkToFit : false,
	rownumbers : true,
	rownumWidth : 30,
	rowNum : 20,
	//rowList : [ 10, 20, 30 ]
	multiboxonly : true,
//	multiselect : true,//checkbox
	gridview : true,
	beforeRequest : function() {
		$(this).jqGrid('setGridParam', {
			postData:{condition: getRequestParams ? getRequestParams() : {}}
		});
	}
};

/**
 *POST提交方法
 * url 
 * data 数据
 * mask bool类型  提交的同时是否要有遮罩 默认是true
 * mel jquery查询表达式 可以是任何block布局的元素  默认是“body” 
 * 示例  POST("http://localhost:8080/tmis/masterdata/taxFilingUnit.do?command=load",{id:"1"},function(data){}})
 */
window.POST=function(url,data,callback,mask,mel){
	var isMask=typeof mask==="undefined"?true:mask, $maskEl=null;
	if(isMask){
		$maskEl=typeof mel==="undefined"?$("body"):$(mel);
	    $maskEl.mask("与服务器交互数据中,请耐心等待...");
	}
	return $.ajax({"url":url,"data": data,type:"post",contentType: 'application/json',dataType:"json",success:function(data,xhr){
		if (data.validateErrors) {
			var status = data.status;
			if(status==0) {
				var errors = [], validateErrors = data.validateErrors;
				for(var i in validateErrors ) {
					var cdata = validateErrors[i];
					errors.push(cdata.message);
				}
				var msg = errors.join("<br/>");
				window.error({"title":"验证错误",text:msg});
			} else {
				
			}
			return;
		}
		if (data.error) {
			/*window.error({"title":"发生错误",text:data.error});*/
			window.Msg.error(data.error);
			return;
		}
		callback(data,xhr);
		if (data.message) {
			window.Msg.alert(data.message,
			 "消息","info",2
			);
		}
	}}).fail(function(err,xhr){
		if(err &&( err.status==0 || err.status==200)){
			return;
		}
		window.error({title:"发生"+err.status+"错误",text:err.statusText});
	}).always(function(){
		if(isMask){
	    $maskEl.unMask();
	    }
	});
};


/**
 *GET提交方法
 * url 
 * data 数据
 * mask bool类型  提交的同时是否要有遮罩 默认是true
 * mel jquery查询表达式 可以是任何block布局的元素  默认是“body” 
 * 示例  GET("http://localhost:8080/tmis/masterdata/taxFilingUnit.do?command=load",{id:"1"},function(data){}})
 */
window.GET=function(url,data,callback,mask,mel){
	var isMask=typeof mask==="undefined"?true:mask, $maskEl=null;
	if(isMask){
		$maskEl=typeof mel==="undefined"?$("body"):$(mel);
	    $maskEl.mask("与服务器交互数据中,请耐心等待...");
	}
    return $.ajax({"url":url,"data":data,type:"get",dataType:"json",success:function(data,xhr){
			if (data.error) {
					window.error({"title":"发生错误",text:data.error});
					return;
				}
				callback(data,xhr);
			if (data.message) {
					window.message({
						text : data.message,
						title : "消息"
					});
				}
	}}).fail(function(err,xhr){
		if(err &&( err.status==0 || err.status==200)){
			return;
		}
		window.error({title:"发生"+err.status+"错误",text:err.statusText});
	}).always(function(){
		if(isMask){
	    $maskEl.unMask();
	    }
	});
};

/**
 * 重置窗体大小
 */
var resizeFun = function() {
	var $doc = $("body"), allHei = $doc.height(), allWid = $doc.width(), laveHei = 12, laveWid = allWid - 26;
	$(".page-list-panel .head-panel,.page-list-panel .ui-jqgrid-view .ui-jqgrid-titlebar,.page-list-panel .ui-jqgrid-view .ui-jqgrid-hdiv,.page-list-panel .ui-jqgrid-pager").each(function(index, item) {
		var $item = $(item);
		if ($item.css("display") !== "none") {
			laveHei += $item.outerHeight(true);
		}
	});
	laveHei = allHei - laveHei;
	var $list=$(typeof listId==="string"?listId:"");
	if($list.length>0){
		if (allWid === window.oldWidth) {
		    $list.jqGrid("setGridHeight", laveHei);
	    } else if (laveHei === window.oldHeight) {
		    $list.jqGrid("setGridWidth", laveWid, false).jqGrid("autoFillWidth");
	    } else {
		    $list.jqGrid("setGridHeight", laveHei).jqGrid("setGridWidth", laveWid, false).jqGrid("autoFillWidth");
	    }
	}
	window.oldWidth = allWid;
	window.oldHeight = laveHei;
	if(window._resize){
		window._resize(allWid,allHei);
	}
};

/**
 * 获取需要附加的请求参数
 */
var getRequestParams = function(vals) {
	var result = $(".search-panel").getFormData();
	if ($(".search-panel").data("show")) {
		result["isFast"] = false;
	} else {
		result["isFast"] = true;
	}
	result["q"] = $.trim($("#fastQueryText").val());
	return result;
};

/**
 * 从上方显示出panel
 */
var showSlidePanel=function(el,callback){
	return $(el).show({
				effect : "slide",
				direction : "up",
				easing : 'easeInOutExpo',
				duration : 600,
				complete:callback
		});
};
/**
 * 往上方收起panel
 */
var hideSlidePanel=function(el,callback){
	return $(el).hide({
				effect : "slide",
				direction : "up",
				easing : 'easeInOutExpo',
				duration : 400,
				complete:callback
		});
};
var hideSlidePanel2=function(el){
	return $(el).hide({
				effect : "slide",
				direction : "up",
				easing : 'easeInOutExpo',
				duration : 400,
				complete: function () {
					showStep1();
				}
		});
};
/****显示第一步******/
function showStep1(){
	window.editChoose1Sale={};//编辑choose1
	$(".page-editor-panel .title-bar").hide();
	$(".page-editor-panel  .page-content").hide();
	$(".page-editor-panel .step1").show();
	$(".page-editor-panel .step1").show();
	$(".choose-setp2-content2 table.choose-content-condition").nextAll().remove(".ui-jqgrid");
	$(".choose-setp2-content2 table.choose-content-condition").after('<table id="chooseTableStep2"></table><div id="choosePageStep2"></div>');
	$(".choose-setp2-content3 table.choose-content-condition").nextAll().remove(".ui-jqgrid");
	$(".choose-setp2-content3 table.choose-content-condition").after('<table id="chooseTableStep3"></table><div id="choosePageStep3"></div>');
}
var showLeftPanel=function(el){
	return $(el).show({
		effect : "slide",
		direction : "left",
		easing : 'easeInOutExpo',
		duration : 600
	});
}
var hideLeftPanel=function(el){
	return $(el).hide({
		effect : "slide",
		direction : "left",
		easing : 'easeInOutExpo',
		duration : 400
	});
}
var showShipPanel = function ($el,callback) 
{           
            $el.show(
                {
                    effect: "fade",
                    duration: 200,
                    complete: function () {
                        $(this).find(".bottom-panel").show(
                            {
                                effect: "slide",
                                direction: "down",
                                easing: 'easeInOutExpo',
                                duration: 300,
                                complete:function(){
                                	if(callback){
                                		callback();
                                	}
                                }
                            }
                       );
                    }
                }
            );
};
var hideShipPanel = function ($el,callback) 
{
          $el.find(".bottom-panel").hide(
                {
                    effect: "slide",
                    direction: "down",
                    easing: 'easeInOutExpo',
                    duration: 200,
                    complete: function () {
                        $el.hide(
                            {
                                effect: "fade", 
                                duration: 400,
                                complete:function(){
                                	if(callback){
                                		callback();
                                	}
                                }
                            }
                            );
                    }
                }
            );
};

/**
 * 初始化按钮
 * 
 * funs 对象{buttonIdOrName:function(){}} 处理程序，可以进行覆盖原始的方法
 * buttons 数组，jquery查询表达式  可以把不在默认检索区域的按钮加入
 */
var _initButtons = function(funs,buttons) {//
	var overFuns = $.extend({
		insertBTN : function(ev) {
			//console.log(ev.target);
			var $i=$(ev.currentTarget).find("i"),
			$piel= showSlidePanel(".page-editor-panel").find("h4 i").removeClass();
			if($i.length){
				$piel.addClass($i.attr("class"));
			}
			window._EDITDATA = undefined;
			$(editorFormId).resetHasXTypeForm();
			if(window._insert){
				window._insert(ev);
			}
			//console.log(this);
		},
		deployData : function(ev) {
			//console.log(ev.target);
			var $i=$(ev.currentTarget).find("i"),
			idAry = $(listId).jqGrid("getGridParam", "selarrrow");
			if (idAry.length === 0) {
				window.message({
					text : "请选择要发布的记录!",
					title : "提示"
				});
				return;
			}
			if (idAry.length > 1) {
				window.message({
					text : "每次只能发布单条记录!",
					title : "提示"
				});
				return;
			}
			$piel=showSlidePanel("#test").find("h4 i").removeClass();
		},
		editBTN : function(ev) {
			var $i=$(ev.currentTarget).find("i"),
			idAry = $(listId).jqGrid("getGridParam", "selarrrow");
			if (idAry.length === 0) {
				window.message({
					text : "请选择要修改的记录!",
					title : "提示"
				});
				return;
			}
			if (idAry.length > 1) {
				window.message({
					text : "每次只能修改单条记录!",
					title : "提示"
				});
				return;
			}
			GET(loadUrl,{id:idAry[0],dc: (new Date()).getTime()},function(data){
                var $piel =showSlidePanel(".page-editor-panel").find("h4 i").removeClass();
			    if($i.length){
				    $piel.addClass($i.attr("class"));
			    }
				if(data.fieldConfig){
					$(editorFormId).configFormField(data.fieldConfig);
					window._FIELDCONFIG=data.fieldConfig;
					$(editorFormId).resetHasXTypeForm(data.entity);
					window._EDITDATA = data.entity;
				}else{
					$(editorFormId).resetHasXTypeForm(data);
					window._EDITDATA = data;
				}
				if(window._edit){
					window._edit();
				}
			});
		},
		viewBTN : function(ev) {
			var $i=$(ev.currentTarget).find("i"),
			idAry = $(listId).jqGrid("getGridParam", "selarrrow");
			if (idAry.length === 0) {
				window.message({
					text : "请选择要查看的记录!",
					title : "提示"
				});
				return;
			}
			if (idAry.length > 1) {
				window.message({
					text : "每次只能查看单条记录!",
					title : "提示"
				});
				return;
			}
			GET(loadUrl,{id:idAry[0],dc: (new Date()).getTime()},function(data){
                var $piel =showSlidePanel(".page-editor-panel").find("h4 i").removeClass();
			    if($i.length){
				    $piel.addClass($i.attr("class"));
			    }
				if(data.fieldConfig){
					$(editorFormId).configFormField(data.fieldConfig);
					window._FIELDCONFIG=data.fieldConfig;
					$(editorFormId).resetHasXTypeForm(data.entity);
					window._EDITDATA = data.entity;
				}else{
					$(editorFormId).resetHasXTypeForm(data);
					//window._EDITDATA = data;
					$(editorFormId).find("input,textarea").each(function(){
						$(this).attr("disabled","disabled");
					});
					$("#editorSave").css("display","none");
					$("#resetBTN").css("display","none");
				}
				if(window._edit){
					window._edit();
				}
			});
		},
		editorSave : function() {
			if ($(editorFormId + " [data-validate]").valid()) {
				POST(saveUrl,$(editorFormId).getFormData(),function(data){
					$(listId).trigger("reloadGrid");
					hideSlidePanel(".page-editor-panel");
				});
			}
		},
		resetBTN : function(ev) {
			var $pn=$(ev.target).closest(".page-editor-panel");
			if(window._FIELDCONFIG){
					$(editorFormId).configFormField(window._FIELDCONFIG);
			}
			$pn.find("form").resetHasXTypeForm(window._EDITDATA);
			if(window._reset){
				window._reset($pn);
			}
		},
		deleteBTN : function() {
			var idAry = $(listId).jqGrid("getGridParam", "selarrrow");
			if (idAry.length === 0) {
				window.message({
					text : "请选择要删除的记录!",
					title : "提示"
				});
				return;
			}

			window.message({
				text : "确认要删除所选择的记录吗?",
				title : "提醒",
				buttons : {
					"确认" : function() {
						window.top.$(this).dialog("close");
                        POST(deleteUrl,{id:idAry},function(data){
                        		$(listId).trigger("reloadGrid");
								if(window._delete){
									window._delete();
								}
                        });
					},
					"取消" : function() {
						window.top.$(this).dialog("close");
					}
				}
			});

		},
		cancelBTN : function() {
			hideSlidePanel(".page-editor-panel,.page-view-panel");
		},
		cancelBTNForSelf : function() {
			hideSlidePanel(".page-editor-panel,.page-view-panel");
			$("#editorSave").show();
			$("#resetBTN").show();
		},
		searchRip : function(ev) {
			$(".search-panel").show().data("show", true);
			$(ev.target).closest("td").hide().prev().hide();
			resizeFun();
		},
		searchRipClose : function() {
			$(".search-panel").hide().data("show", false);
			$(".toolbar table td:last").show().prev().show();
			resizeFun();
		},
		advancedSearch : function()
		{
			$(listId).trigger("reloadGrid",[{page:1}]);
		},
		fastSearch : function()
		{
			$(listId).trigger("reloadGrid",[{page:1}]);
		},
		exportBTN : function()
		{
		    var url = "/TMIS/common/exportExcel.do?command=export&type=" + exportKey ;
		    var form = $("#exportExcelForm") ;
		    form.attr( "action", url ) ;
		    form.find( "input[name=data]" ).val( encodeURI(JSON.stringify( getRequestParams() ) ) ) ;
		    form.get(0).submit() ;
		}
	}, funs);
	var $btns= $(".toolbar button,.title-bar button,.search-panel button,.bottom-bar button");
	if(buttons){
		for(var i in buttons){
			$btns=$btns.add(buttons[i]);
		}
	}
	$btns.button().click(function(ev) {
		var id = $(this).attr("id") || $(this).attr("name");
		if (id && overFuns[id]) {
			overFuns[id](ev);
		}
	});
};

/**
 *初始化表单中的控件 
 * ovFuns 对象{inputNameOrId:function(el){}}  可以复写对某个控件的处理
 */
var _initFormControls = function(ovFuns) {
	var $forms = $("body");
	$forms.find("[data-xtype]").each(function(index, item) {
		var $item = $(item), data = $item.data(), ename = $item.attr("name"), eid = $item.attr("id");
        if(data.opt && typeof data.opt==="string"){data.opt=new Function("return "+data.opt+";")();}
        if (ovFuns && ovFuns[ename]) {
			ovFuns[ename].call($item);return;
		}
		switch (data.xtype.toLowerCase()) {
			case "ajaxchosen":
				$item.ajaxChosen();
				break;
			case "chosen":
				$item.chosen();
				break;
			case "buttonset":
				$item.buttonset();
				break;
			case "datetime":
				$item.datepicker($.extend({
					dateFormat : "yy-mm-dd",
					changeMonth: true,
					changeYear:true
				},data.opt));
				break;
			case "upload":

				(function($titem) {
					$titem.uploadFile({
						url : "/TMIS/platform/accessory_.do?command=upload",
						removeUrl : "/TMIS/platform/accessory_.do?command=remove",
						dowloadUrl: "/TMIS/platform/accessory_.do?command=download&id={id}",
						returnType : "JSON",
						showDone : false,
						showStatusAfterSuccess : false
					});

				})($item);
				break;
			case "digits":
				break;
			case "number":
				break;
			case "email":
				break;
			case "url":
				break;
			case "hidden":
				break;
			case "pick":
				$item.pick();
				break;
		}
	});
};
/**
 * 初始化表单的验证(带xtype)
 * formQuery 表单
 * tobj 可以覆盖原先的验证配置
 */
var _initValidateForXTypeForm = function(formQuery, tobj) {
	var $queryForm = $(formQuery), r = {}, m = {};
	$queryForm.find("[data-validate]").each(function(index, item) {
		var $item = $(item), nOi = $item.attr("name") || $item.attr("id");
		if (nOi) {
			r[nOi] = new Function("return " + $item.data("validate") + ";")();
			if ($item.data("errormessage")) {
				m[nOi] = $item.data("errormessage");
			}
		}
	});
	var obj = $.extend({
		rules : r,
		messages : m
	}, tobj);
	$queryForm.validate(obj);
};

//$.metadata.setType("attr", "data-validate");

$("body").ready(function() {
    //$( document ).ajaxStart(function() {$( "body" ).mask();}).ajaxComplete(function(){$("body").unMask();}).ajaxError( function(ar1, ar2, ar3) {console.log(ar3);var eobj = {"text" : ar3 ? ar3.message || ar3 : "","title" : "发生错误"};/*window.message(eobj);*/});
	if (resizeFun) {
		$(window).resize(resizeFun);
	}
});

/******td button删除操作	deleteInfoUrl:删除的url  dataArr：入参*******/
function deleteInfoButton(deleteInfoUrl,dataArr){
	window.message({
		text : "确认要删除所选择的这条记录吗?",
		title : "提醒",
		buttons : {
			"确认" : function() {
				window.top.$(this).dialog("close");
                POST(deleteInfoUrl,JSON.stringify(dataArr),function(data){
                		$(listId).trigger("reloadGrid");
						if(window._delete){
							window._delete();
						}
                });
			},
			"取消" : function() {
				window.top.$(this).dialog("close");
			}
		}
	});
}
/***修改按钮**queryEditDataUrl：查询修改的详细信息,dataArr：入参,editPanelId：编辑面板的id    deptListFlag{};填充查询列表:id*/
function editInfoButton(queryEditDataUrl,dataArr,editPanelId,deptListFlag){
	POST(queryEditDataUrl,JSON.stringify(dataArr),function(data){
		if(data.rspCode&&data.rspCode<=0){
			if(data.rspCode&&data.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
			window.message({title:"提示信息",text: result.rspMsg});
			return;
		}
		/****角色设定**/
		if(deptListFlag.dataFlag){
			data=data.data;
		}
		if(deptListFlag.queryPosition){
			var queryPositionByDeptIdUrl=deptListFlag.queryPosition.queryPositionByDeptIdUrl;
			var queryPositionId=deptListFlag.queryPosition.queryPositionId;
			POST(queryPositionByDeptIdUrl,JSON.stringify({deptId:data.deptId}),function(result){
				if(result.rspCode&&result.rspCode<=0){if(result.rspCode&&result.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
					window.message({title:"提示信息",text: result.rspMsg});
					return;
				}
				var result=result.rows;
				for(var i in result){
					result[i]={text:result[i].positionName,value:result[i].positionId};
				}
				result.unshift({text:"",value:""});
				$(queryPositionId).data("chosen")._clearOptions();
				$(queryPositionId).data("chosen")._addOptions(result);
				completeFunc(data,editPanelId);
			});
		}
		/***城市派发****/
		if(deptListFlag.dataListFlag){
			data=data.rows[0];
		}
		if(deptListFlag.cityFlagUrl){
			$("#singleNum").val();
			$("#singleShowNum").html("手工单派发数("+data.sale_count+")");
			$("#endCode").val(data.end_sale_id);
			POST(deptListFlag.cityFlagUrl,JSON.stringify({regionId:data.region_id}),function(result){
				if(result.rspCode&&result.rspCode<=0){if(result.rspCode&&result.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
					window.message({title:"提示信息",text: result.rspMsg});
					return;
				}
				var result=result.rows;
				var cityName="";
				var cityId="";
				for(i in result){
					cityName=result[i].cityName;
					cityId=result[i].cityId;
					result[i]={text:cityName,value:cityId};
				}
				result.unshift({text:"请选择城市",value:""});
				$(deptListFlag.sendCity).data("chosen")._enabled();
				$(deptListFlag.sendCity).data("chosen")._clearOptions();
				$(deptListFlag.sendCity).data("chosen")._addOptions(result);
				completeFunc(data,editPanelId);
			});
		}
		/****门店派发***/
		if(deptListFlag.storeFlagUrl){
			$("#singleShowNum").html("手工单派发数("+data.sale_count+")");
			POST(deptListFlag.storeFlagUrl,JSON.stringify({districtId:data.districtId}),function(result){
				if(result.rspCode&&result.rspCode<=0){if(result.rspCode&&result.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
					window.message({title:"提示信息",text: result.rspMsg});
					return;
				}
				var result=result.rows;
				var storeName="",storeId="";
				for(i in result){
					storeId=result[i].storeId;
					storeName=result[i].storeName;
					result[i]={text:storeName,value:storeId};
				}
				result.unshift({text:"请选择门店",value:""});
				$(deptListFlag.sendCity).data("chosen")._enabled();
				$(deptListFlag.sendCity).data("chosen")._clearOptions();
				$(deptListFlag.sendCity).data("chosen")._addOptions(result);
				completeFunc(data,editPanelId);
			});
		}
		/****岗位管理***/
		if(deptListFlag.deptList){
			var str="<option></option>";
			var deptLis=data.deptList;
			for(var i in deptLis){
				deptLis[i]={text:deptLis[i].deptName,value:deptLis[i].deptId};
			}
			deptLis.unshift({text:"",value:""});
			$(deptListFlag.deptList).data("chosen")._clearOptions();
			$(deptListFlag.deptList).data("chosen")._addOptions(deptLis);
		}
		if(deptListFlag.funcList){
			var str="";
			var funcLis=data.funcList;
			for(var i in funcLis){
				if(funcLis[i].defaultFlg=="N"){
					str+='<label><input id="'+funcLis[i].funcId+'" type="checkbox"/>'+funcLis[i].funcName+'</label>';
				}else if(funcLis[i].defaultFlg=="Y"){
					str+='<label><input id="'+funcLis[i].funcId+'" checked type="checkbox"/>'+funcLis[i].funcName+'</label>';
				}
			}
			$(deptListFlag.funcList).html(str);
		}
		if(deptListFlag.itemTypeList){
			var str1="";
			var itemTypeList=data.itemTypeList;
			for(var i in itemTypeList){
				if(itemTypeList[i].defaultFlg=="N"){
					str1+='<label><input id="'+itemTypeList[i].itemTypeCode+'" type="checkbox" />'+itemTypeList[i].itemTypeName+'</label>';
				}else if(itemTypeList[i].defaultFlg=="Y"){
					str1+='<label><input id="'+itemTypeList[i].itemTypeCode+'" checked type="checkbox" />'+itemTypeList[i].itemTypeName+'</label>';
				}
			}
			$(deptListFlag.itemTypeList).html(str1);
		}
		if(deptListFlag.completeFuncFlag){
			completeFunc(data,editPanelId);
		}
		/***银行账户维护**/
		if(deptListFlag.findBankNameByCode){
			POST(deptListFlag.findBankNameByCode.url,JSON.stringify({bankAccount:data.bankAccount}),function(result){
				if(result.rspCode&&result.rspCode<=0){if(result.rspCode&&result.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
					window.message({title:"提示信息",text: result.rspMsg});
					return;
				}
				var bankName=result["data"]?result["data"]["bankName"]:"";
				var bankCode=result["data"]?result["data"]["bankCode"]:"";
				$(deptListFlag.findBankNameByCode.bankNameId).val(bankName);
				$(deptListFlag.findBankNameByCode.banCodeId).val(bankCode);
				completeFunc(data,editPanelId);
			});
		}
	});
}
function completeFunc(data,editPanelId){
	if(data.fieldConfig){
		$(editPanelId).configFormField(data.fieldConfig);
		window._FIELDCONFIG=data.fieldConfig;
		$(editPanelId).resetHasXTypeForm(data.entity);
		window._EDITDATA = data.entity;
	}else{
		$(editPanelId).resetHasXTypeForm(data);
		window._EDITDATA = data;
	}
	if(window._edit){
		window._edit();
	}
}
/*拼凑8位字符串不够补0*****/
function addend8(str){
	if(str==""||str==null||str=="undefined"){
		return;
	}
	var str=str+"";
	str=str.length>=8?str:"00000000".substring(0,8-str.length)+str;
	return str;
}
