(function(){
    var content={
    		gender:{
    			0:"男",
    			1:"女"
    		},
    		/****手工单状态
    		 * 0:新建
     * 1:总部派发城市
     * 2:城市派发门店
     * 3:已使用
     * 4:作废*****/
    		saleStatus:{
    			0:"新建",
    			1:"总部派发城市",
    			2:"城市派发门店",
    			3:"已使用",
    			4:"作废"
    		},
    		payChannel:{
    			3:"快钱",
    			1:"翼码",
    			2:"喔噻"
    		},
    		bindingFlag:{
    			Y:"已绑定",
    			N:"未绑定"
    		},
    	/**
    	 * pointType 1-交易，2-积分兑换，3-手工上调,4-收工下调，5-过期,6-活动发放
    	 */	
    		pointType:{
    			1:"交易",
    			2:"积分兑换",
    			3:"手工上调",
    			4:"收工下调",
    			5:"过期",
    			6:"活动发放"
    		},
    		/**
    		 * 0-门店消费，1-线上消费，2-签到，3-其他    来源途径 pointChannel
    		 */
    		pointChannel:{
    			0:"门店消费",
    			1:"线上消费",
    			2:"签到",
    			3:"其他" 
    		}
    };
    $.fn.getDictionary=function(key,value){
        if(content[key]){
            if(content[key][value]){
                return content[key][value];
            }
        }
    }
})(jQuery); 