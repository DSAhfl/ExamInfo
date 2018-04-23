$(function() {
	// initial tooltip
	$('[data-toggle="tooltip"]').tooltip();
	// initial popover
	$('[data-toggle="popover"]').popover();

	// ajaxstart with loading shown
	$(document).ajaxStart(function() {
		$("#spinnerLoading").removeClass("hidden");
	});
	// ajaxstop with loading hidden
	$(document).ajaxStop(function() {
		$("#spinnerLoading").addClass("hidden");
	});

	if ($(".sidebar-fold").hasClass("icon-unfold")) {
		$('.sidebar-nav [data-toggle="tooltip"]').tooltip('destroy');
	}

	// fold sidebar
	$("#sidebar-fold").click(
			function(e) {
				e.stopPropagation();
				e.preventDefault();
				if ($(this).hasClass("icon-unfold")) {
					// fold sidebar
					$(this).removeClass("icon-unfold").addClass("icon-fold")
							.attr("title", "展开导航").attr("data-original-title",
									"展开导航");
					$(this).children(".glyphicon").removeClass(
							"glyphicon-chevron-left").addClass(
							"glyphicon-chevron-right");
					$(".viewFrameWork").removeClass("sidebar-full").addClass(
							"sidebar-min");
					document.cookie = "ksxFoldState=fold; path =; domain=;";
					$('.sidebar-inner [data-toggle="tooltip"]').tooltip();
				} else if ($(this).hasClass("icon-fold")) {
					// unfold sidebar
					$(this).removeClass("icon-fold").addClass("icon-unfold")
							.attr("title", "收起导航").attr("data-original-title",
									"收起导航");
					$(this).children(".glyphicon").removeClass(
							"glyphicon-chevron-right").addClass(
							"glyphicon-chevron-left");
					$(".viewFrameWork").removeClass("sidebar-min").addClass(
							"sidebar-full");
					document.cookie = "ksxFoldState=unfold; path =; domain=;";
					/* $('.sidebar-inner [data-toggle="tooltip"]').tooltip(); */
					$('.sidebar-nav [data-toggle="tooltip"]')
							.tooltip('destroy');
				}
			});

	// 一级导航对应模块显示激活状态
	$(function() {
		var current_url = window.location.href;
		$(".sidebar-nav .nav-item a").each(function(index, element) {
			var item_url = $(this).attr("href");
			// alert(current_url+"..."+item_url);
			if (current_url.indexOf(item_url) != -1) {
				$(this).parent(".nav-item").addClass("sidebar-nav-active");
				$(this).children("div,span").addClass("font-color");
			} else {
				$(this).parent(".nav-item").removeClass("sidebar-nav-active");
				$(this).children("div,span").removeClass("font-color");
			}
		});
	});

	// 导航hover时显示激活状态
	$(".nav-item a").hover(function() {
		$(this).parent(".nav-item").addClass("sidebar-nav-active");
		$(this).children("div,span").addClass("font-color");
	}, function() {
		$(this).parent(".nav-item").removeClass("sidebar-nav-active");
		$(this).children("div,span").removeClass("font-color");
	});

	// 导航栏个人中心
	$("#userInfoBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();

		$("#userInfoModal").modal();
	});

	// 导航栏修改密码
	$("#setPasswordBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();

		$("#setPasswordModal").modal();
	});

	$("#chooseLessonBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();

		$("#chooseLessonModal").modal();
	});

	$(".createExamBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();

		$("#createExamModal").modal();
	});

	$(".updateExamBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#updateExamModal").modal();
	});

	$(".scoreExamBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#scoreExamModal").modal();
	});
	
	$(".updateLessonBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#updateLessonModal").modal();
	});
	
	$(".createLessonBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#createLessonModal").modal();
	});
	$(".addTeacherBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#addTeacherModal").modal();
	});
	
	$(".updateTeacherBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#updateTeacherModal").modal();
	});
	
	$(".addStudentBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#addStudentModal").modal();
	});
	
	$(".updateStudentBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#updateStudentModal").modal();
	});
	
	

});

// set cookie
function setCookie(c_name, value) {
	document.cookie = c_name + "=" + escape(value);
}

// get cookie
function getCookie(c_name) {
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=")
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1;
			c_end = document.cookie.indexOf(";", c_start);
			if (c_end == -1) {
				c_end = document.cookie.length
			}
			return unescape(document.cookie.substring(c_start, c_end));
		}
	}
	return "";
}

// 退出登陆(清空cookie,session&&sessionId)
$("#logoutBtn").click(function(e) {
	e.stopPropagation();
	e.preventDefault();

	$.ajax({
		type : "POST",
		cache : false,
		dataType : "json",
		url : "/account/logout",
		success : function(msg) {
			var jump_url = msg.bizContent.url;
			window.location.href = jump_url;
		}
	});

})


