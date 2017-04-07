$("body").ready(function () {


    var $bgImg = $("#bg_img"),
           ih = 0,
           iw = 0;
    var resizeWin = function () {
        if (!$bgImg.data("isload")) { return; }

        var winW = $(document).width(),
            winH = $(document).height(),
              ws = (winW / winH),
              is = (iw / ih),
              nw = 0,
              nh = 0;

        var cssobj = {};
        if (ws > is) {
            nw = winW;
            nh = ih * (winW / iw);
            cssobj = { "margin-top": (winH - nh) / 2, "margin-left": 0 };
        } else {
            nh = winH;
            nw = iw * (winH / ih);
            cssobj = { "margin-top": 0, "margin-left": (winW - nw) / 2 };
        }
        $bgImg.height(nh).width(nw).css(cssobj);
    };
    $(window).resize(resizeWin);
    $("#j_username").focus();
    $bgImg.attr("onload", function () {
        setTimeout(function () {
            $bgImg.data("isload", true);
            ih = $bgImg[0].height,
            iw = $bgImg[0].width;
            resizeWin();
            $bgImg.css("visibility", "visible").animate({ "opacity": 1 }, 500);
        }, 200);
    });
    $("#login_form").on("submit", function () {
        var $vthis = $(this),
            $u = $vthis.find("#j_username"),
            $p = $vthis.find("#j_password"),
            un = $u.val(),
            pw = $p.val();
        if ($vthis.data("ismask")) { return false; }


        if ($.trim(un) === "") {
            $u.focus();
        } else {
            if (pw === "") {
                $p.focus();
            } else {
                $vthis.formMask(function () {
                	var submitArray = new Array() ;
                    submitArray.push( "j_username=" ) ;
                    submitArray.push( encodeURIComponent(un) ) ;
                    submitArray.push( "&j_password=" ) ;
                    submitArray.push( encodeURIComponent(pw) ) ;
                    submitArray.push( "&captcha=NONE" ) ;
                    $.ajax({
                        url: "j_spring_security_check",
                        type: "POST",
                        data: submitArray.join(""),
                        dataType: "JSON",
                        success: function (data, xhr) {
                        	if(data.rspCode&&data.rspCode<=0){
            	    			window.message({title:"提示信息",text: data.rspMsg});
            	    			return;
            	    		}
                        	$vthis.unformMask(function () {
                        		if( data.status )
                                {
                            		window.location.replace("homePage_.do");
                                }
                                else
                                {
                                	alert(data.message);
                                }
                            });
                        }
                    });                    
                });
            }
        }
        return false;
    });
});


//clear auto fill
$(window).on("load", function () {
    setTimeout(function () {
        var $waary = $("#login_form input");//:-webkit-autofill
        if ($waary.length === 0) { return; }
        var lfNV = [];
        $waary.each(function (index, item) {
            var $item = $(item),
                text = $item.val();
            lfNV.push({ "oldvalue": text, el: $item });
        });
        $("#login_form")[0].reset();
        for (var i in lfNV) {
            lfNV[i].el.val(lfNV[i].oldvalue);
        }
    }, 300);
});