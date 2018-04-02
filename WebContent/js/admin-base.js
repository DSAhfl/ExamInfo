$(function () {
    // initial tooltip
    $('[data-toggle="tooltip"]').tooltip();
    // initial popover
    $('[data-toggle="popover"]').popover();

    // ajaxstart with loading shown
    $( document ).ajaxStart(function() {
        $("#spinnerLoading").removeClass("hidden");
    });
    // ajaxstop with loading hidden
    $( document ).ajaxStop(function() {
        $("#spinnerLoading").addClass("hidden");
    });



    if($(".sidebar-fold").hasClass("icon-unfold")){
        $('.sidebar-nav [data-toggle="tooltip"]').tooltip('destroy');
    }

    // fold sidebar
    $("#sidebar-fold").click(function(e) {
        e.stopPropagation();
        e.preventDefault();
        if($(this).hasClass("icon-unfold")){
            // fold sidebar
            $(this).removeClass("icon-unfold").addClass("icon-fold").attr("title","展开导航").attr("data-original-title","展开导航");
            $(this).children(".glyphicon").removeClass("glyphicon-chevron-left").addClass("glyphicon-chevron-right");
            $(".viewFrameWork").removeClass("sidebar-full").addClass("sidebar-min");
            document.cookie = "ksxFoldState=fold; path =; domain=;";
            $('.sidebar-inner [data-toggle="tooltip"]').tooltip();
        }else if ($(this).hasClass("icon-fold")) {
            // unfold sidebar
            $(this).removeClass("icon-fold").addClass("icon-unfold").attr("title","收起导航").attr("data-original-title","收起导航");
            $(this).children(".glyphicon").removeClass("glyphicon-chevron-right").addClass("glyphicon-chevron-left");
            $(".viewFrameWork").removeClass("sidebar-min").addClass("sidebar-full");
            document.cookie = "ksxFoldState=unfold; path =; domain=;";
            /*$('.sidebar-inner [data-toggle="tooltip"]').tooltip();*/
            $('.sidebar-nav [data-toggle="tooltip"]').tooltip('destroy');
        }
    });

    //一级导航对应模块显示激活状态
    $(function () {
        var current_url = window.location.href;
        $(".sidebar-nav .nav-item a").each(function (index, element) {
            var item_url = $(this).attr("href");
            //alert(current_url+"..."+item_url);
            if(current_url.indexOf(item_url) != -1){
                $(this).parent(".nav-item").addClass("sidebar-nav-active");
                $(this).children("div,span").addClass("font-color");
            }else {
                $(this).parent(".nav-item").removeClass("sidebar-nav-active");
                $(this).children("div,span").removeClass("font-color");
            }
        });
    });

    //导航hover时显示激活状态
    $(".nav-item a").hover(function(){
        $(this).parent(".nav-item").addClass("sidebar-nav-active");
        $(this).children("div,span").addClass("font-color");
    },function(){
        $(this).parent(".nav-item").removeClass("sidebar-nav-active");
        $(this).children("div,span").removeClass("font-color");
    });


});



// set cookie
function setCookie(c_name,value){
    document.cookie=c_name+ "=" +escape(value);
}

// get cookie
function getCookie(c_name){
    if(document.cookie.length>0){
        c_start=document.cookie.indexOf(c_name + "=")
        if(c_start!=-1){
            c_start=c_start + c_name.length+1;
            c_end=document.cookie.indexOf(";",c_start);
            if (c_end==-1){
                c_end=document.cookie.length
            }
            return unescape(document.cookie.substring(c_start,c_end));
        }
    }
    return "";
}

// 退出登陆(清空cookie,session&&sessionId)
$("#logoutBtn").click(function (e) {
    e.stopPropagation();
    e.preventDefault();

    $.ajax({
        type: "POST",
        cache : false,
        dataType: "json",
        url: "/account/logout",
        success: function(msg){
            var jump_url = msg.bizContent.url;
            window.location.href = jump_url;
        }
    });

})


// 显示发布成功对话框
function showSelOk(id, url, password,trialExamLink,type,isSkipLogin) {
    $("#exam_url").text(url);
    if(isSkipLogin == 1){
        $('#sendForm').addClass('hidden');
    }
    if(password){
        $("#exam_password").text(password);
        $(".guide-pwd").removeClass('hidden');
    }
    if(type == 'exam'){
        var sendUrl = '/admin/exam_notice/' + id;
    }else {
        var sendUrl = '/course/course_notice/' + id;
    }
    var jumpUrl ='';
    createQrcode(url);
    $('#okModal').modal({
        backdrop: "static",
        keyboard: false
    });
    $("#okModal .btn-div").click(function (e) {
        if(e.target.nodeName.toUpperCase() == 'BUTTON'){
            if(e.target.innerText == '确定' && type =='exam'){
                jumpUrl = '/account/admin/index';
            }else if(e.target.innerText == '确定' && type =='course'){
                jumpUrl = '/course/course_mgr';
            }else {
                jumpUrl = trialExamLink;
            }
            sendNotice(sendUrl,jumpUrl);
        }
    });
}

//生成二维码
function createQrcode(examUrl) {
    //二维码生成
    $("#invite-link-qrcode").html("");
    $("#invite-link-qrcode").qrcode({
        width: 150,
        height: 150,
        text: examUrl
    });
    //clear canvas before download again
    $("#small").html("");
    $("#medium").html("");
    $("#large").html("");

    $("#small").qrcode({
        width: 560,
        height: 560,
        text: examUrl
    });
    var download0 = $("#small canvas")[0];
    $("a[download-size=0]").click(function() {
        if (download0.msToBlob) {//IE9+浏览器下载二维码
            var blob = download0.msToBlob();
            window.navigator.msSaveBlob(blob, $("input[name=examName]").val() + "_二维码小.png");
        }else{ //其他浏览器下载二维码
            this.href = download0.toDataURL();
            this.download = $("input[name=examName]").val() + "_二维码小.png";
        }
    });

    $("#medium").qrcode({
        width: 1050,
        height: 1050,
        text: examUrl
    });
    var download1 = $("#medium canvas")[0];
    $("a[download-size=1]").click(function() {
        if (download1.msToBlob) {//IE9+浏览器
            var blob = download1.msToBlob();
            window.navigator.msSaveBlob(blob, $("input[name=examName]").val() + "_二维码中.png");
        }else{
            this.href = download1.toDataURL();
            this.download = $("input[name=examName]").val() + "_二维码中.png";
        }
    });

    $("#large").qrcode({
        width: 3500,
        height: 3500,
        text: examUrl
    });
    var download2 = $("#large canvas")[0];
    $("a[download-size=2]").click(function() {
        if (download2.msToBlob) {//IE9+浏览器
            var blob = download2.msToBlob();
            window.navigator.msSaveBlob(blob, $("input[name=examName]").val() + "_二维码大.png");
        }else {
            this.href = download2.toDataURL();
            this.download = $("input[name=examName]").val() + "_二维码大.png";
        }
    });
}
