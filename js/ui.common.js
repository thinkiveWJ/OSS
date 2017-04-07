/**!
 * jQuery Common Function
 * 2014-02-27 / *
 * author Qunpeng.Li
 ***/
var DEBUG=true;
var getDc=function(){
    return (new Date()).getTime();
};
var getDcUrl=function(url){
    return  url.indexOf("?")===-1?url+"?dc="+getDc():url+"&dc="+getDc();
};

var userAgent = navigator.userAgent.toLowerCase();
    // Figure out what browser is being used 
    jQuery.browser = {
        version: (userAgent.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [])[1],
        safari: /webkit/.test(userAgent),
        opera: /opera/.test(userAgent),
        msie: /msie/.test(userAgent) && !/opera/.test(userAgent),
        mozilla: /mozilla/.test(userAgent) && !/(compatible|webkit)/.test(userAgent)
    };
function toDecimal2( x )
{
    var f = parseFloat( x ) ;
    if( isNaN( f ) )
    {
        return x ;
    }
    var f = Math.round( x * 100 ) / 100 ;
    var s = f.toString() ;
    var rs = s.indexOf( '.' ) ;
    if( rs < 0 )
    {
        rs = s.length ;
        s += '.' ;
    }
    while( s.length <= rs + 2 )
    {
        s += '0' ;
    }
    return s ;
}
function fmoney( s, n )
{
   n = n > 0 && n <= 20 ? n : 2 ;
   s = parseFloat( ( s + "" ).replace( /[^\d\.-]/g, "" ) ).toFixed( n ) + "" ;
   var l = s.split( "." )[0].split( "" ).reverse(), r = s.split( "." )[1] ;
   t = "" ;
   for( var i = 0; i < l.length; i ++ )
   {   
      t += l[i] + ( ( i + 1 ) % 3 == 0 && ( i + 1 ) != l.length ? "," : "" ) ;
   }
   t = t.split( "" ).reverse().join( "" ) + "." + r ;
   return t.replace( '-,', '-' ) ;
}
(function($) {
    /*
     * Window Console
     */
    if (!window.console) {
        window.console = {};
    }
    var cfuns = ["log", "time", "timeEnd", "error"];
    for (var i in cfuns) {
        if (!window.console[cfuns[i]]) {
            window.console[cfuns[i]] = function() {
            };
        }
    }
    /*
     * Lock form controls and buttons
     * callback:function
     */
    $.fn.formMask = function(callback) {
        if (!this.is("form")) {
            console.log("非表单不能处理");
            return this;
        }
        if (this.data("ismask")) {
            console.log("不需要重复处理");
            return this;
        }
        this.find("input[type=text],input[type=password],input[type=checkbox],input[type=file],input[type=radio],select").not(".disabled").each(function(index, item) {
            $(item).data("rn_oper", true).attr("disabled", true);
            if (!$(item).hasClass("disabled")) {
                $(item).addClass("disabled");
            }
        });
        this.find("input[type=submit],input[type=reset],input[type=button],button").not(".disabled").each(function(index, item) {
            $(item).data("rn_oper", true).attr("disabled", true);
            if (!$(item).hasClass("disabled")) {
                $(item).addClass("disabled");
            }
        });
        this.data("ismask", true);
        if (callback !== undefined) {
            callback();
        }
        return this;
    };
    /*
     * Unlock form controls and buttons
     * callback:function
     */
    $.fn.unformMask = function(callback) {
        if (!this.is("form")) {
            console.log("非表单不能处理");
            return this;
        }
        if (!this.data("ismask")) {
            console.log("没有可清除的对象");
            return this;
        }
        this.find("input[type=text],input[type=password],input[type=checkbox],input[type=file],input[type=radio],select").each(function(index, item) {
            var $item = $(item);
            if ($item.data("rn_oper")) {
                $item.removeAttr("disabled");
                $item.removeData("rn_oper");
                if ($item.hasClass("disabled")) {
                    $item.removeClass("disabled");
                }
            }
        });
        this.find("input[type=submit],input[type=reset],input[type=button],button").each(function(index, item) {
            var $item = $(item);
            if ($item.data("rn_oper")) {
                $item.removeAttr("disabled");
                $item.removeData("rn_oper");
                if ($item.hasClass("disabled")) {
                    $item.removeClass("disabled");
                }
            }
        });
        this.removeData("ismask");
        if (callback !== undefined) {
            callback();
        }
        return this;
    };

    $.fn.mask = function(title) {
        if (this.is("div") || this.is("body")) {
            if (this.data("ismask")) {
                this.find(".ui-mask div:last").text(title);
                return this;
            }

            //var h = this.outerHeight(),
            //    w = this.outerWidth();
            var html = ["<div class='ui-mask' style='width:100%; height:100%; position:absolute;z-index:100;left:0px; bottom:0px;right:0px; top:0px; opacity:0;'>", "<div class='ui-widget-overlay'></div>", "<div style='color:white;font-size: 15px;font-weight: bold;font-family: 微软雅黑;position:absolute;left:50%;top:50%; margin-left:-130px;width:260px;'>", title ? title : "", "</div>", "</div>"].join("");
            var $thtml = $(html);

            this.append($thtml);
            $thtml.fadeIn('fast', function() {//'slow'
                $(this).fadeTo(400, 1);
            });
            this.data("ismask", true);
        } else {
            console.log("非容器元素不能处理");
            return this;
        }
        return this;
    };
    $.fn.unMask = function() {
        this.find(".ui-mask").fadeOut(200, 0, function() {
            $(this).remove();
        });
        this.removeData("ismask");
        return this;
    };
    $.fn.getFormData = function() {
        var obj = {};
        this.find("input:not([type=button]):not([type=radio]),select,textarea,input[type=radio]:checked,input[type=checkbox]").each(function(index, item) {
            var $item = $(item), data = $item.data(), xtype = data.xtype, label = $item.attr("name") || $item.attr("id"), val = null;
            if (label) {
                if (data.xtype) {
                    switch (data.xtype.toLowerCase()) {
                        case "ajaxchosen":
                        case "chosen":
                            val = $item.data("chosen").selectedItem();
                            val=val?val["value"]:val;
                            break;
                        case "upload":
                            val = data.fileItems();
                            break;
                            case "pick":
                            val= $item.pick("getValue");
                            break;
                        default:
                            val = $item.val();
                            break;
                    }
                } else {
                    if(item.type==="checkbox"){
                        val=item.checked?true:false;
                    }else{
                        val = $item.val();
                    }
                    
                }
                obj[label] = val;
            }
        });
        return obj;
    };
    
    $.fn.allSelect=function(){
        return this.each(function(index,item){
            $(item).bind("change",function(el){
                var $this= $(this),$trs=$this.closest("table").find("tbody tr"),checked=this.checked;
                $trs.each(function(tidx,titem){
                    var $ipu=$(titem).find("input[type=checkbox]:eq(0)");
                    if($ipu.length>0){
                        $ipu[0].checked=checked;
                    }
                });
            });
        });
    };
    
    $.fn.setFormData = function(formdata)
    {
        this.find("input:not([type=button]),select,textarea,label[name]").each(function(index, item)
        {
            var $item = $(item), data = $item.data(), xtype = data.xtype, label = $item.attr("name") || $item.attr("id"), val = null;
            if (label)
            {
                val = formdata[label];
                if (val != undefined) {
                    if (data.xtype) {
                        switch (data.xtype.toLowerCase())
                        {
                            case "ajaxchosen":
                            case "chosen":
                                val = $item.data( "chosen" ).selectedItem( val ) ;
                                break ;
                            case "upload":
                                val = data.fileItems( val ) ;
                                break;
                            case "radio":
                                if( $item.removeAttr( "checked" ).val() == val + "" )
                                {
                                    $item.attr( "checked", true )[0].checked = true ;
                                }
                                break;
                            case "pick":
                                $item.pick( "setValue", val ) ;
                                break;
                            default:
                                if( $item.attr( "data-format" ) )
                                {
                                    var formatValue = $item.attr( "data-format" ) ;
                                    if( formatValue == "0.00;#" )
                                    {
                                        $item.val( toDecimal2( val ) ) ;
                                    }
                                    else if( formatValue == "#,##0.00;#" )
                                    {
                                        $item.val( fmoney( val ) ) ;
                                    }
                                    else if( formatValue == "0.######;#" )
                                    {
                                        $item.val( parseFloat( val ) ) ;
                                    }
                                    else if( formatValue == "0;#" )
                                    {
                                        $item.val( parseInt( val ) ) ;
                                    }
                                    else if( formatValue == "0;#INTEGER" )
                                    {
                                        $item.val( ffs( val ) ) ;
                                    }
                                }
                                else
                                {
                                    $item.val( val ) ;
                                }
                                break;
                        }
                    }
                    else
                    {
                        if( $item.is("[type=radio]") )
                        {
                            if ( $item.removeAttr( "checked" ).val() == val + "" )
                            {
                                $item.attr( "checked", true )[0].checked = true ;
                            }
                        }
                        else if( $item.is( "[type=checkbox]" ) )
                        {
                            $item[0].checked = val ;
                        }
                        else if( $item.is( "label" ) )
                        {
                            if( $item.attr( "data-format" ) )
                            {
                                var formatValue = $item.attr( "data-format" ) ;
                                if( formatValue == "0.00;#" )
                                {
                                    $item.text( toDecimal2( val ) ) ;
                                }
                                else if( formatValue == "#,##0.00;#" )
                                {
                                    $item.text( fmoney( val ) ) ;
                                }
                                else if( formatValue == "0.######;#" )
                                {
                                    $item.text( parseFloat( val ) ) ;
                                }
                                else if( formatValue == "0;#" )
                                {
                                    $item.text( parseInt( val ) ) ;
                                }
                                else if( formatValue == "#,##0.00;#" )
                                {
                                    $item.text( fmoney( val, 2 ) ) ;
                                }
                                else if( formatValue == "0;#INTEGER" )
                                {
                                    $item.text( ffs( val ) ) ;
                                }
                            }
                            else
                            {
                                $item.text( val ) ;
                            }
                        }
                        else
                        {
                            if( $item.attr( "data-format" ) )
                            {
                                var formatValue = $item.attr( "data-format" ) ;
                                if( formatValue == "0.00;#" )
                                {
                                    $item.val( toDecimal2( val ) ) ;
                                }
                                else if( formatValue == "#,##0.00;#" )
                                {
                                    $item.val( fmoney( val ) ) ;
                                }
                                else if( formatValue == "0.######;#" )
                                {
                                    $item.val( parseFloat( val ) ) ;
                                }
                                else if( formatValue == "0;#" )
                                {
                                    $item.val( parseInt( val ) ) ;
                                }
                                else if( formatValue == "0;#INTEGER" )
                                {
                                    $item.val( ffs( val ) ) ;
                                }
                            }
                            else
                            {
                                $item.val( val ) ;
                            }
                        }

                    }
                }
            }
        });
        return this;
    };
    $.fn.configFormField=function(fieldConfig){
        for(var fieldName in fieldConfig){
            var config=fieldConfig[fieldName];
            this.find("select[name="+fieldName+"]").each(function(index,item){
                var $item=$(item),data=$item.data(),xtype=data.xtype;
                switch(xtype){
                    case "ajaxchosen":
                     data.chosen._clearOptions(1);
                     data.chosen._addOptions(config);
                     break;
                    case "chosen":
                     data.chosen._clearOptions(1);
                     data.chosen._addOptions(config);
                    break;
                    default:
                    break;
                }           
            });
        }
    };
    $.fn.resetHasXTypeForm = function(data) {
        if (this.is("form")) {
            if (this.resetForm) {
                this.resetForm();
                this.find("input[type=hidden]").val('');
            };
        }
        this.find("[data-xtype]").each(function(index, item) {
            var $item = $(item), xtype = $item.data("xtype");
            //console.log(xtype);
            switch (xtype) {
                case "ajaxchosen":
                    var cdata=$item.data("chosen");
                    if(cdata.is_multiple){
                      cdata._clearOptions();
                    }else{
                      cdata._clearOptions(1);
                    }
                    break;
                case "chosen":
                    $item.data("chosen").selectedItem("");
                    break;
                case "upload":
                    $item.data("fileItems")([]);
                    break;
                case "pick":
                    $item.pick("setValue", []);
                    break;
            }
        });

        if (data) {
            this.setFormData(data);
        }

        this.find("em.valid,em.error,div.valid,div.error").hide();
        return this;
    };

})(jQuery);
