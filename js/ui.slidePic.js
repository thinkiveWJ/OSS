(function($){
	$.fn.rightPicShow=function(box,imgWidth,time){
		var rollLen = box.find('li').length;
    	box.css('width', imgWidth * rollLen);
    	 var cop = box.clone(), cop2 = box.clone();
         box.before(cop.css('left', -imgWidth * rollLen));
         box.after(cop2.css('left', imgWidth * rollLen));
         checkStatus(box);
         function checkStatus(){
     		var width = parseInt(box.css('width'));
             var path = box.parent().find('ul');
             var len = path.length;
             if (len > 1) {
                 var offs = parseInt(path.eq(1).css('left'));
                 if (path.first().css('left') == "0px") {
                     path.eq(1).css('left', -width);
                     path.last().css('left', width);
                 }
                 if (offs == 0) {
                     path.first().css('left', -width);
                     path.last().css('left', width);
                 }
                 if (path.last().css('left') == "0px") {
                     path.eq(1).css('left', width);
                     path.first().css('left', -width);
                 }
             }
         }
       //点击左侧按钮
     	function leftClick() {
             box.parent().find('ul').animate({ left: '+=' + imgWidth }, 600, function () {
                 checkStatus();
             })
         };
         //点击右侧 
         function rightClick() {
             box.parent().find('ul').animate({ left: '-=' + imgWidth }, 600, function () {
                 checkStatus();
             })
         };
         //每隔time秒轮播一次
         var timePicShow=setInterval(function(){
         	rightClick();
         },time);
//         $(box).find("li").hover(function(){
//        	 clearInterval(timePicShow);
//         },function(){
//         	timePicShow=setInterval(function(){
//             	rightClick();
//             },time);
//         });
	}
})(jQuery);