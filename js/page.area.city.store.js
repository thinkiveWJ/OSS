/***********初始化区域********/
	function initAreaSearch(queryArea,queryCity,queryCityArea,queryStore){
		POST(queryArea,JSON.stringify({}),function(result){
			if(result.rspCode&&result.rspCode<=0){if(result.rspCode&&result.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
    			window.message({title:"提示信息",text: result.rspMsg});
    			return;
    		}
			var result=result.rows;
			var str="";areaName="",areaId="";
			for(var i in result){
				areaName=result[i].regionName;
				areaId=result[i].regionId;
				result[i]={text:areaName,value:areaId};
			}
			result.unshift({text:"请选择区域",value:""});
			$("#areaSearch").data("chosen")._clearOptions();
			$("#areaSearch").data("chosen")._addOptions(result);
			$("#areaSearch").unbind("change").bind("change",function(){
				var regionId=$("#areaSearch").data("chosen").selectedItem();
				if(regionId){
					regionId=regionId["value"];
					$("#citySearch").data("chosen")._enabled();
					$("#cityAreaSearch").data("chosen")._disabled();
					$("#cityAreaSearch").data("chosen")._clearOptions();
					$("#storeSearch").data("chosen")._disabled();
					$("#storeSearch").data("chosen")._clearOptions();
				}else{
					$("#citySearch").data("chosen")._disabled();
					$("#citySearch").data("chosen")._clearOptions();
					$("#cityAreaSearch").data("chosen")._disabled();
					$("#cityAreaSearch").data("chosen")._clearOptions();
					$("#storeSearch").data("chosen")._disabled();
					$("#storeSearch").data("chosen")._clearOptions();
					return;
				}
				POST(queryCity,JSON.stringify({regionId:regionId}),function(result){
					if(result.rspCode&&result.rspCode<=0){if(result.rspCode&&result.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
		    			window.message({title:"提示信息",text: result.rspMsg});
		    			return;
		    		}
					initCity(result,queryCityArea,queryStore);
				});
			});
		});
	}
	/*****根据区域id选择城市****/
	function initCity(result,queryCityArea,queryStore){
		var result=result.rows;
		var str="";cityName="",cityId="";
		for(var i in result){
			cityName=result[i].cityName;
			cityId=result[i].cityId;
			result[i]={text:cityName,value:cityId};
		}
		result.unshift({text:"请选择城市",value:""});
		$("#citySearch").data("chosen")._clearOptions();
		$("#citySearch").data("chosen")._addOptions(result);
		$("#citySearch").unbind("change").bind("change",function(){
			var cityId=$("#citySearch").data("chosen").selectedItem();
			if(cityId){
				cityId=cityId["value"];
				$("#cityAreaSearch").data("chosen")._enabled();
				$("#storeSearch").data("chosen")._disabled();
				$("#storeSearch").data("chosen")._clearOptions();
			}else{
				$("#cityAreaSearch").data("chosen")._disabled();
				$("#cityAreaSearch").data("chosen")._clearOptions();
				$("#storeSearch").data("chosen")._disabled();
				$("#storeSearch").data("chosen")._clearOptions();
				return;
			}
			POST(queryCityArea,JSON.stringify({cityId:cityId}),function(result){
				if(result.rspCode&&result.rspCode<=0){if(result.rspCode&&result.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
	    			window.message({title:"提示信息",text: result.rspMsg});
	    			return;
	    		}
				initCityArea(result,queryStore);
			});
		});
	}
	/*****根据城市id查询城区******/
	function initCityArea(result,queryStore){
		var result=result.rows;
		var str="";districtName="",districtId="";
		for(var i in result){
			districtName=result[i].districtName;
			districtId=result[i].districtId;
			result[i]={text:districtName,value:districtId};
		}
		result.unshift({text:"请选择城区",value:""});
		$("#cityAreaSearch").data("chosen")._clearOptions();
		$("#cityAreaSearch").data("chosen")._addOptions(result);
		$("#cityAreaSearch").unbind("change").bind("change",function(){
			var districtId=$("#cityAreaSearch").data("chosen").selectedItem();
			if(districtId){
				districtId=districtId["value"];
				$("#storeSearch").data("chosen")._enabled();
			}else{
				$("#storeSearch").data("chosen")._disabled();
				$("#storeSearch").data("chosen")._clearOptions();
				return;
			}
			POST(queryStore,JSON.stringify({districtId:districtId}),function(result){
				if(result.rspCode&&result.rspCode<=0){if(result.rspCode&&result.rspCode==-2){window.top.location.href=window.top.location.href.substring(0,window.top.location.href.indexOf("platform.do"));return;}
	    			window.message({title:"提示信息",text: result.rspMsg});
	    			return;
	    		}
				initStore(result);
			});
		});
	}
	/******根据城区查询门店******/
	function initStore(result){
		var result=result.rows;
		var str="";storeName="",storeId="";
		for(var i in result){
			storeName=result[i].storeName;
			storeId=result[i].storeId;
			result[i]={text:storeName,value:storeId};
		}
		result.unshift({text:"请选择城区",value:""});
		$("#storeSearch").data("chosen")._clearOptions();
		$("#storeSearch").data("chosen")._addOptions(result);
	}