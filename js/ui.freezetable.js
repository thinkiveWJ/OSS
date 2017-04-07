(function ($, undefined) {
    var _iswebkit = /webkit/.test(navigator.userAgent.toLowerCase());
    var _isie = /msie/.test(navigator.userAgent.toLowerCase()) && !/opera/.test(navigator.userAgent.toLowerCase());
    var _issupport = (_isie && document.documentMode <= 7) ? false : true;
    var addEvent = function (ele, eventName, fun) {
        if (ele.attachEvent) {
            ele.attachEvent("on" + eventName, fun);
        } else if (ele.addEventListener) {
            ele.addEventListener(eventName, fun, false);
        }
    };
    var removeEvent = function (ele, eventName, fun) {
        if (ele.detachEvent) {
            ele.detachEvent("on" + eventName, fun);
        } else if (ele.removeEventListener) {
            ele.removeEventListener(eventName, fun);
        }
    };
    var FreezeTable = function (el) {
        console.log("init freeze table");
        this.el = el;
        var me = this;
        this.parent = el.parent();
        this.oldHeader = this.el.find("thead");
        // this.freezeHeader=;
        this.headerHeight = this.oldHeader.height();
        this.freezeHeader = this.oldHeader.clone();
        this.freezeTable  = $("<table class='freeze'>").append(this.freezeHeader);
        var parentWidth = this.parent.width();
        console.log( this.headerHeight);
        this.freezeDiv=$("<div>").addClass("freeze-div").append(this.freezeTable).css({width:parentWidth,height:this.headerHeight});
         
        
        //this.oldHeader.css("visibility", "collapse");
        this.el.css("margin-top", -this.headerHeight);
        this.parent.height(this.parent.height()-this.headerHeight);
        //return;
        this.parent.before(this.freezeDiv);
        this.scrollHandler = function (ev) {
            me.freeze();
        };
        addEvent(this.parent[0], "scroll", this.scrollHandler);
        this.bindCheckbox();
        //this.parent.bind("scroll", this.scrollHandler);
        this.refresh();
    };
    FreezeTable.prototype.bindCheckbox = function () {
        var cis1 = this.oldHeader.find("input[type=checkbox]");
        var cis2 = this.freezeHeader.find("input[type=checkbox]");
        cis2.each(function (index) {
            var ownItem = cis1.eq(index);
            var that = $(this);
            (function (own) {
                that.click(function () {
                    own.trigger("click");
                });
            })(ownItem);
        });
    };
    FreezeTable.prototype.unBindCheckbox = function () {

    };
    FreezeTable.prototype.setOption = function (opts) {
        console.log("setOption", opts);
    };
    FreezeTable.prototype.destroy = function () {
        this.unBindCheckbox();
        // this.parent.unbind("scroll", this.scrollHandler);
        removeEvent(this.parent[0], "scroll", this.scrollHandler);
        //this.oldHeader.css("visibility", "visible");
        this.freezeTable.remove();
        this.el.removeData("freeze-table");
    };
    FreezeTable.prototype.refresh = function () {
        // console.log(this.el.width());
        if (_iswebkit) {
            this.freezeTable.width(this.el.outerWidth());
        } else {
            this.freezeTable.width(this.el.width());
        }
        var $ths1 = this.oldHeader.find("th"),
            $ths2 = this.freezeHeader.find("th");
        $ths2.each(function (index) {
            var ic = $ths1.eq(index);
            var iw = ic.innerWidth();
            $(this).innerWidth(iw);
        });
    };
    FreezeTable.prototype.freeze = function () {
       this.freezeTable.css("margin-left",-this.parent.scrollLeft());
    };
    $.fn.freezeTable = function (opts) {
    	return;//DEBUG
        if (!_issupport) {
            console.log("NOT SUPPORT");
            return this;
        }
        var otherArgs = [];
        for (var i = 1, len = arguments.length; i < len; i++) {
            otherArgs.push(arguments[i]);
        }
        return this.each(function (index, item) {
            var me = $(item);
            var instObj = me.data("freeze-table");
            if (!instObj) {
                var instObj = new FreezeTable(me);
                me.data("freeze-table", instObj);
            }
            if (typeof opts === "string") {
                var method = instObj[opts];
                if (method && typeof method === "function") {
                    method.apply(instObj, otherArgs);
                }
            } else if (typeof opts === "object") {
                instObj.setOption(opts);
            }
        });
    };
})(jQuery);