$(function() {

	$("#addTeacher").click(
			function(e) {
				$("#addTeacherModal .item-input-group").removeClass("error");
				$("#errorAddTeacher").text("").addClass("hidden");
				
				if ($("#addTeacherName").val() == "") {
					$("#addTeacherName").parent(".item-input-group")
					.addClass("error");
					$("#errorAddTeacher").text("请输入教师姓名").removeClass(
					"hidden");
					return;
				}
				
				var IC = $("#addTeacherIC").val();
				if (IC == '' || !((/\d{18}$/.test(IC)))) {
					$("#addTeacherIC").parent(".item-input-group").addClass("error");
					$("#errorAddTeacher").text("请输入18位数字身份证").removeClass("hidden");
					return;
				}
				
				document.getElementById("addTeacherForm").submit();
			});
	
	$("#updateTeacher").click(
			function(e) {
				$("#updateTeacherModal .item-input-group").removeClass("error");
				$("#errorUpdateTeacher").text("").addClass("hidden");
				
				if ($("#updateTeacherName").val() == "") {
					$("#updateTeacherName").parent(".item-input-group")
					.addClass("error");
					$("#errorUpdateTeacher").text("请输入教师姓名").removeClass(
					"hidden");
					return;
				}
				
				var IC = $("#updateTeacherIC").val();
				if (IC == '' || !((/\d{18}$/.test(IC)))) {
					$("#updateTeacherIC").parent(".item-input-group").addClass("error");
					$("#errorUpdateTeacher").text("请输入18位数字身份证").removeClass("hidden");
					return;
				}
				
				document.getElementById("updateTeacherForm").submit();
			});
	
	
	$("#addStudent").click(
			function(e) {
				$("#addStudentModal .item-input-group").removeClass("error");
				$("#errorAddStudent").text("").addClass("hidden");

				if ($("#addStuName").val() == "") {
					$("#addStuName").parent(".item-input-group")
							.addClass("error");
					$("#errorAddStudent").text("请输入学生姓名").removeClass(
							"hidden");
					return;
				}
				
				if ($("#addStuClass").val() == "") {
					$("#addStuClass").parent(".item-input-group")
					.addClass("error");
					$("#errorAddStudent").text("请输入学生班级").removeClass(
					"hidden");
					return;
				}

				var IC = $("#addStuIC").val();
				if (IC == '' || !((/\d{18}$/.test(IC)))) {
					$("#addStuIC").parent(".item-input-group").addClass("error");
					$("#errorAddStudent").text("请输入18位数字身份证").removeClass("hidden");
					return;
				}

				document.getElementById("addStudentForm").submit();
			});
	
	$("#updateStudent").click(
			function(e) {
				$("#updateStudentModal .item-input-group").removeClass("error");
				$("#errorUpdateStudent").text("").addClass("hidden");
				
				if ($("#updateStudentName").val() == "") {
					$("#updateStudentName").parent(".item-input-group")
					.addClass("error");
					$("#errorUpdateStudent").text("请输入学生姓名").removeClass(
					"hidden");
					return;
				}
				
				if ($("#updateStudentClass").val() == "") {
					$("#updateStudentClass").parent(".item-input-group")
					.addClass("error");
					$("#errorUpdateStudent").text("请输入学生班级").removeClass(
					"hidden");
					return;
				}
				
				var IC = $("#updateStudentIC").val();
				if (IC == '' || !((/\d{18}$/.test(IC)))) {
					$("#updateStudentIC").parent(".item-input-group").addClass("error");
					$("#errorUpdateStudent").text("请输入18位数字身份证").removeClass("hidden");
					return;
				}
				
				document.getElementById("updateStudentForm").submit();
			});

	$("#updateLesson").click(
			function(e) {
				$("#updateLessonModal .item-input-group").removeClass("error");
				$("#errorUpdateLesson").text("").addClass("hidden");

				if ($("#updateLessonName").val() == "") {
					$("#updateLessonName").parent(".item-input-group")
							.addClass("error");
					$("#errorUpdateLesson").text("请输入课程名称").removeClass(
							"hidden");
					return;
				}

				if ($("#updateLessonTeacher").val() == "") {
					$("#updateLessonTeacher").parent(".item-input-group")
							.addClass("error");
					$("#errorUpdateLesson").text("请输入教师名称").removeClass(
							"hidden");
					return;
				}

				document.getElementById("updateLessonForm").submit();
			});

	$("#createLesson").click(
			function(e) {
				$("#createLessonModal .item-input-group").removeClass("error");
				$("#errorCreateLesson").text("").addClass("hidden");

				if ($("#createLessonName").val() == "") {
					$("#createLessonName").parent(".item-input-group")
							.addClass("error");
					$("#errorCreateLesson").text("请输入课程名称").removeClass(
							"hidden");
					return;
				}

				if ($("#createLessonTeacher").val() == "") {
					$("#createLessonTeacher").parent(".item-input-group")
							.addClass("error");
					$("#errorCreateLesson").text("请输入教师名称").removeClass(
							"hidden");
					return;
				}

				document.getElementById("createLessonForm").submit();
			});

	// update score
	$("#saveScoreBtn").click(function(e) {
		$("#errorInfoUpdateExam").text("").addClass("hidden");
		var score = $("#score").val();
		if (score == '' || !(score == "100" || (/^[1-9][0-9]?$/.test(score)))) {
			$("#score").parent(".item-input-group").addClass("error");
			$("#errorInfoScore").text("请输入0-100之间的数字").removeClass("hidden");
			return;
		}

		document.getElementById("setScoreForm").submit();
	});

	// create exam
	$("#createExamBtn").click(function() {
		$("#errorInfoCreateExam").text("").addClass("hidden");

		if ($("#dropdownText1").html() == "请选择课程") {
			$("#errorInfoCreateExam").text("请选择课程").removeClass("hidden");
			return;
		}

		if ($("#createExamDate").val() == '') {
			$("#errorInfoCreateExam").text("请选择考试日期").removeClass("hidden");
			return;
		}
		if ($("#dropdownText2").html() == "请选择时间") {
			$("#errorInfoCreateExam").text("请选择考试时间").removeClass("hidden");
			return;
		}
		document.getElementById("createExamForm").submit();
	});

	$("#updateExam").click(function(e) {
		$("#errorInfoUpdateExam").text("").addClass("hidden");
		if ($("#editExamDate").val() == '') {
			$("#errorInfoUpdateExam").text("请选择考试日期").removeClass("hidden");
			return;
		}
		
	
		document.getElementById("updateExamForm").submit();
	});

	// choose lesson dropdown menu
	$("#dropdown-menu1 a").click(function() {

		$("#dropdownText1").html($(this).text());
		$("#createExamName").val($(this).text());
	});
	//choose exam time dropdown menu
	$("#dropdown-menu2 a").click(function() {
		
		$("#dropdownText2").html($(this).text());
		$("#createExamTime").val($(this).text());
	});
	//choose exam time dropdown menu
	$("#dropdown-menu3 a").click(function() {
		
		$("#dropdownText3").html($(this).text());
		$("#editExamTime").val($(this).text());
	});
	//choose exam room dropdown menu
	$("#dropdown-menu4 a").click(function() {
		
		$("#dropdownText4").html($(this).text());
		$("#editExamRoom").val($(this).text());
	});
	$("#dropdown-menu5 a").click(function() {
		
		$("#dropdownText5").html($(this).text());
		$("#editExamTeacher").val($(this).text());
	});

	$("#chooseBtn").click(
			function(e) {
				$("#errorInfo").text("").addClass("hidden");
				if ($("#dropdownText").html() == "请选择课程") {
					$("#errorInfo").text("请选择课程").removeClass("hidden");
					return;
				}
				var url = "/ExamInfo/student/chooseLesson?lesson="
						+ $("#dropdownText").html();
				window.location.href = url;
				// document.getElementById("chooseLessonForm").submit();
			});

	// 编辑用户信息
	$("#userEditBtn").click(
			function(e) {
				e.stopPropagation();
				e.preventDefault();

				$("#userInfoModal .modal-user-info").addClass("edit-mode");
				$("#userInfoModal .modal-user-info .item").addClass(
						"item-input-group");
			});

	// 取消编辑
	$("#userInfoModal .close, #cancelEditBtn").click(
			function(e) {
				$("#userInfoModal .modal-user-info").removeClass("edit-mode");
				$("#userInfoModal .modal-user-info .item").removeClass(
						"item-input-group");
			});

	// 上传头像
	$("#characterUpload").change(function() {
		$("#spinnerLoading").removeClass("hidden");
		$('#characterForm').submit();
	});

	$("#characterIframe").load(function() {
		$('#characterForm')[0].reset();
		var msg = $(this).contents().find("body").text();

		if (msg == '') {
			return;
		} else {
			msg = JSON.parse(msg);
		}

		if (msg.success) {
			$(".character-img").attr("src", msg.bizContent);
		} else {
			alert(msg.desc);
		}
		$("#spinnerLoading").addClass("hidden");
	});

	// 绑定微信
	$("body").on("click", ".modal-user-info .btn-wechat.unbind", function(e) {
		e.stopPropagation();
		e.preventDefault();

		window.location.href = weBindUrl;
	});

	// 解绑微信
	$("body").on(
			"click",
			".modal-user-info .btn-wechat.binded",
			function(e) {
				e.stopPropagation();
				e.preventDefault();

				$.ajax({
					type : "POST",
					cache : false,
					headers : {
						"cache-control" : "no-cache"
					},
					dataType : "json",
					url : "/account/user/unbind_wechat",
					success : function(msg) {
						if (msg.success) {
							$(this).removeClass("binded").addClass("unbind")
									.text("绑定微信");
						} else {
							alert("发生未知错误,重试或联系管理员");
						}
					}
				});
			});

	// 保存编辑信息
	$("#saveEditBtn").click(
			function(e) {
				// e.stopPropagation();
				// e.preventDefault();

				var _user = $("#userInfoForm input[name=user]");
				$("#userInfoForm").find(".item").removeClass("error");

				if ($(_user).val() == '') {
					$(_user).parent(".item").addClass("error");
					return;
				}

				$("#userInfoModal .modal-user-info").removeClass("edit-mode");
				$("#userInfoModal .modal-user-info .item").removeClass(
						"item-input-group");

				document.getElementById("userInfoForm").submit();
			});

	// *************************************************

	// 取消保存密码
	$("#cancelSetPwdBtn").click(function(e) {
		$("#setPwdForm")[0].reset();
	});

	// 保存密码
	$("#savePasswordBtn").click(
			function(e) {
				$("#setPasswordModal .item-input-group").removeClass("error");
				$("#errorInfoPwd").text("").addClass("hidden");

				// 验证旧密码
				if (!oldPwdVal($("#oldPassword").val())) {
					$("#oldPassword").parent(".item-input-group").addClass(
							"error");
					$("#errorInfoPwd").text("请输入原密码").removeClass("hidden");
					return;
				}
				// 验证新密码
				if (!newPwdVal($("#newPassword").val())) {
					$("#newPassword").parent(".item-input-group").addClass(
							"error");
					$("#errorInfoPwd").text("新密码为6-20位数字、字母或符号的任意组合，且不能与原密码相同")
							.removeClass("hidden");
					return;
				}
				// 验证重复新密码
				if (!reNewPwdVal($("#reNewPassword").val())) {
					$("#reNewPassword").parent(".item-input-group").addClass(
							"error");
					$("#errorInfoPwd").text("新密码不一致").removeClass("hidden");
					return;
				}

				document.getElementById("setPwdForm").submit();
			});

	// 验证密码
	// 旧密码验证方法
	function oldPwdVal(val) {
		return (val != '');
	}

	// 新密码验证方法
	function newPwdVal(val) {
		var newPwd = val;
		if (newPwd == '') {
			return false;
		} else if (newPwd == $("#oldPassword").val()) {
			return false;
		} else if (ClientWrongLongPassword(newPwd)) {
			return false;
		} else if (!pwdVal(newPwd)) {
			return false;
		}
		return true;
	}
	// 重复新密码验证方法
	function reNewPwdVal(val) {
		var newPwd = val;
		if (newPwd == '') {
			return false;
		}
		if (newPwd != $("#newPassword").val()) {
			return false;
		}
		return true;
	}
	// 密码低于5位或高于20位，提示错误
	function ClientWrongLongPassword(pwd) {
		return !(IsLongEnough(pwd, "6")) || IsLongOver(pwd, "20");
	}
	function IsLongEnough(strWord, nAtLeastThisLong) {
		if ((strWord == null) || isNaN(nAtLeastThisLong)) {
			return false;
		} else if (strWord.length < nAtLeastThisLong) {
			return false;
		}
		return true;
	}

	function IsLongOver(strWord, nAtLeastThisLong) {
		if ((strWord == null) || isNaN(nAtLeastThisLong)) {
			return false;
		} else if (strWord.length <= nAtLeastThisLong) {
			return false;
		}
		return true;
	}
	// 密码强度验证
	function pwdVal(pwd) {
		var hasAlpha = 0;
		var hasNum = 0;
		var hasOther = 0;
		if (/^([A-Za-z0-9.]|\-)+$/.test(pwd)) {
			hasNum++;
		}
		/*
		 * if( (/[\!\@\#\$\%\^\&\*\(\)_\+\-\='\";:\[{\]}\|\.>\,<\/?\`~]/g).test(
		 * pwd) ){ hasOther++; }
		 */

		return (hasNum >= 1);
	}

});