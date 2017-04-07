(function($){
	/*
		id1----input type file 的id
		id2----img  src 的id（即需要预览的上传照片的id）
		id3----input需要展示的图片名字
		src----img  的某人图片的url
	*/
	$.fn.upLoadPicFunc=function(id1,id2,id3){
		$(id1).change(function(){
				var fileImg = $(id2);
				var explorer = navigator.userAgent;
				var imgSrc = $(this)[0].value;
				if (explorer.indexOf('MSIE') >= 0) {
					if (!/\.(jpg|jpeg|png|JPG|PNG|JPEG)$/.test(imgSrc)) {
						imgSrc = "";
						return false;
					}else{
						//填充图片名称
						fileName=imgSrc.substring(imgSrc.lastIndexOf("\\")+1);
						if(id3){
							fillPicName(id3,fileName);
						}
						fileImg.attr("src",imgSrc);
					}
				}else{
					if (!/\.(jpg|jpeg|png|JPG|PNG|JPEG)$/.test(imgSrc)) {
						imgSrc = "";
						return false;
					}else{
						var file = $(this)[0].files[0];
						fileName=imgSrc.substring(imgSrc.lastIndexOf("\\")+1);
						//填充图片名称
						if(id3){
							fillPicName(id3,fileName);
						}
						var url = URL.createObjectURL(file);
						fileImg.attr("src",url);
					}
				}
			});
	}
	/******多张图片上传****/
	$.fn.upMorePic=function(id4,id5,id3){
		var fileImg = $(id5);
			var explorer = navigator.userAgent;
			var imgSrc = $(id4)[0].value;
			if (explorer.indexOf('MSIE') >= 0) {
				if (!/\.(jpg|jpeg|png|JPG|PNG|JPEG)$/.test(imgSrc)) {
					imgSrc = "";
					return false;
				}else{
					//填充图片名称
					fileName=imgSrc.substring(imgSrc.lastIndexOf("\\")+1);
					if(id3){
						fillPicName(id3,fileName);
					}
					fileImg.attr("src",imgSrc);
				}
			}else{
				if (!/\.(jpg|jpeg|png|JPG|PNG|JPEG)$/.test(imgSrc)) {
					imgSrc = "";
					return false;
				}else{
					var file = $(id4)[0].files[0];
					fileName=imgSrc.substring(imgSrc.lastIndexOf("\\")+1);
					//填充图片名称
					if(id3){
						fillPicName(id3,fileName);
					}
					var url = URL.createObjectURL(file);
					fileImg.attr("src",url);
				}
			}
	}
})(jQuery);
/******填充图片名称*******/
function fillPicName(id3,fileName){
	var name=$(id3)[0].tagName.toUpperCase();
	if(name=="INPUT"||name=="TEXTAREA"){
		$(id3).val(fileName);
	}else{
		$(id3).text(fileName);
	}
}