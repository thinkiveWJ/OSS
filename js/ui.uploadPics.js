 //下面用于多图片上传预览功能

    function setImagePreviews(id1,id2) {

        var docObj = document.getElementById(id1);

        var dd = document.getElementById(id2);

        dd.innerHTML = "";

        var fileList = docObj.files;
        for (var i = 0; i < fileList.length; i++) {            
        	if(!/\.(jpeg|gif|png|bmp|jpg)$/.test(fileList[i].name.toLowerCase())){
        		window.message({'text':"请选择正确的图片格式！",title:"提示信息"});
        		return;
        	}
            dd.innerHTML += "<img id='img" + i + "'  />";

            var imgObjPreview = document.getElementById("img"+i); 

            if (docObj.files && docObj.files[i]) {
                //火狐下，直接设img属性
                //imgObjPreview.src = docObj.files[0].getAsDataURL();
                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            	var docObjUrl=docObj.files[i]
            	var dataUrl=window.URL.createObjectURL(docObjUrl);
                imgObjPreview.src = dataUrl;
            }else {
                //IE下，使用滤镜
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                var localImagId = document.getElementById("img" + i);
                //图片异常的捕捉，防止用户修改后缀来伪造图片
                try {
                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                }
                catch (e) {
                    window.message({text:"您上传的图片格式不正确，请重新选择!",title:"提示信息"});
                    return false;
                }
                imgObjPreview.style.display = 'none';

                document.selection.empty();
            }
        }  
        return true;
    }