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
		$("#dropdownText").text("请选择课程");
		$("#errorInfo").text("").addClass("hidden");
		$("#chooseLessonModal").modal();
	});

	$(".createExamBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		$("#dropdownText").text("请选择课程");
		$("#errorInfoCreateExam").text("").addClass("hidden");
		$("#createExamModal").modal();
	});

	$(".updateExamDateBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		$("#errorInfoUpdateExam").text("").addClass("hidden");
		$("#dropdownMenu1").attr('disabled',false);
		$("#dropdownMenu2").attr('disabled',false);
		$("#dropdownMenu3").attr('disabled',false);
		$(".input-group-addon").show();
		
		$("#editExamTeacher").parent(".item-input-group").removeClass("error");
		$("#editExamName").val($(this).parent().parent().children().eq(1).text());
		$("#editExamDate").val($(this).parent().parent().children().eq(2).text());
		$("#editExamTime").val($(this).parent().parent().children().eq(3).text());
		$("#dropdownText3").text($(this).parent().parent().children().eq(3).text());
		$("#editExamRoom").val($(this).parent().parent().children().eq(4).text());
		$("#dropdownText4").text($(this).parent().parent().children().eq(4).text());
		$("#editExamClass").val($(this).parent().parent().children().eq(5).text());
		$("#dropdownText5").text($(this).parent().parent().children().eq(6).text());
		$("#editExamTeacher").val($(this).parent().parent().children().eq(6).text());
		
		$("#dropdownMenu1").attr('disabled',true);
		$("#dropdownMenu2").attr('disabled',true);
		$("#dropdownMenu3").attr('disabled',true);
		
		$("#updateExamModal").modal();
		
	});
	
	$(".updateExamTimeBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		$("#errorInfoUpdateExam").text("").addClass("hidden");
		$("#dropdownMenu1").attr('disabled',false);
		$("#dropdownMenu2").attr('disabled',false);
		$("#dropdownMenu3").attr('disabled',false);
		$(".input-group-addon").show();
		
		$("#editExamTeacher").parent(".item-input-group").removeClass("error");
		$("#editExamName").val($(this).parent().parent().children().eq(1).text());
		$("#editExamDate").val($(this).parent().parent().children().eq(2).text());
		$("#editExamTime").val($(this).parent().parent().children().eq(3).text());
		$("#dropdownText3").text($(this).parent().parent().children().eq(3).text());
		$("#editExamRoom").val($(this).parent().parent().children().eq(4).text());
		$("#dropdownText4").text($(this).parent().parent().children().eq(4).text());
		$("#editExamClass").val($(this).parent().parent().children().eq(5).text());
		$("#dropdownText5").text($(this).parent().parent().children().eq(6).text());
		$("#editExamTeacher").val($(this).parent().parent().children().eq(6).text());
		
		$("#dropdownMenu2").attr('disabled',true);
		$("#dropdownMenu3").attr('disabled',true);
		$(".input-group-addon").hide();
		
		
		$("#updateExamModal").modal();
		
	});
	
	
	$(".updateExamRoomBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		$("#errorInfoUpdateExam").text("").addClass("hidden");
		$("#dropdownMenu1").attr('disabled',false);
		$("#dropdownMenu2").attr('disabled',false);
		$("#dropdownMenu3").attr('disabled',false);
		$(".input-group-addon").show();
		
		$("#editExamTeacher").parent(".item-input-group").removeClass("error");
		$("#editExamName").val($(this).parent().parent().children().eq(1).text());
		$("#editExamDate").val($(this).parent().parent().children().eq(2).text());
		$("#editExamTime").val($(this).parent().parent().children().eq(3).text());
		$("#dropdownText3").text($(this).parent().parent().children().eq(3).text());
		$("#editExamRoom").val($(this).parent().parent().children().eq(4).text());
		$("#dropdownText4").text($(this).parent().parent().children().eq(4).text());
		$("#editExamClass").val($(this).parent().parent().children().eq(5).text());
		$("#dropdownText5").text($(this).parent().parent().children().eq(6).text());
		$("#editExamTeacher").val($(this).parent().parent().children().eq(6).text());
		
		$("#dropdownMenu1").attr('disabled',true);
		$("#dropdownMenu3").attr('disabled',true);
		$(".input-group-addon").hide();
		
		$("#updateExamModal").modal();
		
	});
	
	$(".updateExamTeacherBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		$("#errorInfoUpdateExam").text("").addClass("hidden");
		$("#dropdownMenu1").attr('disabled',false);
		$("#dropdownMenu2").attr('disabled',false);
		$("#dropdownMenu3").attr('disabled',false);
		$(".input-group-addon").show();
		
		$("#editExamTeacher").parent(".item-input-group").removeClass("error");
		$("#editExamName").val($(this).parent().parent().children().eq(1).text());
		$("#editExamDate").val($(this).parent().parent().children().eq(2).text());
		$("#editExamTime").val($(this).parent().parent().children().eq(3).text());
		$("#dropdownText3").text($(this).parent().parent().children().eq(3).text());
		$("#editExamRoom").val($(this).parent().parent().children().eq(4).text());
		$("#dropdownText4").text($(this).parent().parent().children().eq(4).text());
		$("#editExamClass").val($(this).parent().parent().children().eq(5).text());
		$("#dropdownText5").text($(this).parent().parent().children().eq(6).text());
		$("#editExamTeacher").val($(this).parent().parent().children().eq(6).text());
		
		$("#dropdownMenu1").attr('disabled',true);
		$("#dropdownMenu2").attr('disabled',true);
		$(".input-group-addon").hide();
		
		$("#updateExamModal").modal();
		
	});

	$(".setScoreBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		$("#errorInfoScore").text("").addClass("hidden");
		$("#scoreExamName").val($(this).parent().parent().children().eq(1).text());
		$("#scoreStuId").val($(this).parent().parent().children().eq(2).text());
		$("#scoreStuName").val($(this).parent().parent().children().eq(3).text());
		$("#score").val($(this).parent().parent().children().eq(5).text());
		$("#setScoreModal").modal();
	});
	
	
	$(".updateLessonBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#errorUpdateLesson").text("").addClass("hidden");
		$("#updateLessonName").val($(this).parent().parent().children().eq(1).text());
		$("#dropdownText5").text($(this).parent().parent().children().eq(2).text());
		$("#updateLessonTeacher").val($(this).parent().parent().children().eq(2).text());
		
		$("#updateLessonModal").modal();
	});
	
	$(".createLessonBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#errorCreateLesson").text("").addClass("hidden");
		$("#createLessonName").text("");
		$("#createLessonTeacher").text("");	
		
		$("#createLessonModal").modal();
	});
	$(".addTeacherBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#errorAddTeacher").text("").addClass("hidden");
		$("#addTeacherName").text("");
		$("#addTeacherIC").text("");	
		
		$("#addTeacherModal").modal();
	});
	
	$(".updateTeacherBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#errorUpdateTeacher").text("").addClass("hidden");
		$("#updateTeacherId").val($(this).parent().parent().children().eq(1).text());
		$("#updateTeacherName").val($(this).parent().parent().children().eq(2).text());
		$("#updateTeacherIC").val($(this).parent().parent().children().eq(3).text());
		
		$("#updateTeacherModal").modal();
	});
	
	$(".addStudentBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#errorAddStudent").text("").addClass("hidden");
		$("#addStuName").text("");
		$("#addStuClass").text("");
		$("#addStuIC").text("");
		
		$("#addStudentModal").modal();
	});
	
	$(".updateStudentBtn").click(function(e) {
		e.stopPropagation();
		e.preventDefault();
		
		$("#errorUpdateStudent").text("").addClass("hidden");
		$("#updateStudentId").val($(this).parent().parent().children().eq(1).text());
		$("#updateStudentName").val($(this).parent().parent().children().eq(2).text());
		$("#updateStudentClass").val($(this).parent().parent().children().eq(3).text());
		$("#updateStudentIC").val($(this).parent().parent().children().eq(4).text());
		
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




