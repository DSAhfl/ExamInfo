<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.minjxu.exam.entity.* "%>
<%@ page import="java.util.* "%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/styles.min.css">
<link rel="stylesheet" type="text/css" href="../css/base.css">
<link rel="stylesheet" type="text/css" href="../css/ksx-base.css">
<link rel="stylesheet" type="text/css" href="../css/admin_index.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap-datetimepicker.css">

<title>考试信息数字化平台</title>
<link rel="SHORTCUT ICON" href="../img/circle.jpg" />
</head>
<body>

	<div class="viewFrameWork sidebar-full" id="viewFrameWork">
		<!-- viewFrameWork-sidebar -->
		<div class="viewFrameWork-sidebar">
			<a href="../index.jsp" class="sidebar-top sidebar-logo sidebar-btn"
				title="首页"> <!--小图标样式--> <span class="icon-logo logo-min"><i
					class="glyphicon glyphicon-log-out"></i></span> <img
				class="icon-logo logo-full logo-ksx" src="../img/circle.jpg">
			</a>
			<div class="sidebar-inner">

				<div class="sidebar-fold icon-unfold" id="sidebar-fold"
					data-toggle="tooltip" data-placement="right" data-container="body"
					title="" data-original-title="收起导航">
					<i class="glyphicon glyphicon-chevron-left"></i>
				</div>


				<div class="sidebar-nav">
					<ul class="sidebar-trans">

						<li class="sidebar-nav-active"><a href="./index"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="首页">
								<div class="nav-icon font-color">
									<i class="glyphicon glyphicon-home"></i>
								</div> <span class="nav-title font-color">首页</span>
						</a></li>

						<li class="nav-item"><a href="./exam" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="考试管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-list-alt"></i>
								</div> <span class="nav-title">考试管理</span>
						</a></li>

						<li class="nav-item"><a href="./score" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="考试管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-file"></i>
								</div> <span class="nav-title">成绩查看</span>
						</a></li>

					</ul>
				</div>
			</div>
			<div class="sidebar-bottom sidebar-btn">
				<ul class="sidebar-trans">
					<li class="nav-item" id="userInfoBtn"><a
						class="sidebar-bottom-wrap" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
							<div class="nav-icon">
								<i class="glyphicon glyphicon-user"></i>
							</div> <span class="nav-title">个人信息</span>
					</a></li>
					<li class="nav-item" id="setPasswordBtn"><a
						class="sidebar-bottom-wrap" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
							<div class="nav-icon">
								<i class="glyphicon glyphicon-cog"></i>
							</div> <span class="nav-title">修改密码</span>
					</a></li>
				</ul>
			</div>

		</div>

		<!-- viewFrameWork-body -->
		<div class="viewFrameWork-body">
			<div class="body-top body-addition">
				<!-- body operation area -->
				<div class="body-top-left body-operation">
					<!-- toolbar delayed on given pages, navpills, dropdown and search-section are changable -->
					<div class="body-nav">
						<div class="nav-left nav-title">
							<div class="company-name">
								<%
									List<Lesson> teacherLessons = (List<Lesson>)session.getAttribute("teacherLessons");
									List<Exam> teacherExams = (List<Exam>)session.getAttribute("teacherExams");
									Teacher teacher = (Teacher) session.getAttribute("user");
									String name = teacher.getTeacherName();
									out.write(name);
								%>
							</div>
						</div>
						<div class="nav-right">
							<%
								String update = (String) session.getAttribute("update");
																		if (update != null) {
							%>
							<div class="alert alert-info alert-dismissible" role="alert"
								style="width: 500px; right: 100px;">
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<strong>${update }</strong>
							</div>
							<%
								}
								session.removeAttribute("update");
							%>
						</div>
					</div>

				</div>

				<!-- body-section-add keep static -->

			</div>
			<div class="body-bottom body-content">

				<div class="page_wrapper ">
					<!-- 最近考试 结束 -->
					<div class="exam_near_wrapper">
						<div class="top_wrapper">
							<div class="exam_process_top">
								<h1 class="exam_process_title">最近添加</h1>
								<span class="see_all"><a href="./exam">查看全部<i
										class="glyphicon glyphicon-chevron-right"></i></a></span>
							</div>
							<div class="divide_line"></div>
						</div>

						<div class="page_item animate">
							<div class="page_item_main">
								<h1 class="page_item_title">
									<span>
									<%
									List<StuExamView> stuExams = (List<StuExamView>) session
									.getAttribute("stuExamViews");
									StuExamView stuExam = stuExams.get(0);
									out.print(stuExam.getLessonName());
									%></span>
								</h1>
								<p class="page_item_time">
								<%if(stuExam.getExamDate()!=null){
									out.print(stuExam.getExamDate()+"  第"+stuExam.getExamTime()/10
											+ "-"+stuExam.getExamTime()%10+"节课");
								}else{
									out.print("未安排");
								} %></p>
								<ul class="page_item_information">
									<li>任课教师：<%
											out.print(stuExam.getLessonTeacher());
										%></li>
									<li>考试地点：<%
									if(stuExam.getRoomName()!=null){
										out.print(stuExam.getRoomName());
									}else{
										out.print("未安排");
									}
										%></li>
									<li>考试班级：<%
									if(stuExam.getClazzName()!=null){
										out.print(stuExam.getClazzName());
									}else{
										out.print("未安排");
									}
										%></li>
									<li>监考老师：<%
									if(stuExam.getExamTeacher()!=null){
										out.print(stuExam.getExamTeacher());
									}else{
										out.print("未安排");
									}
										%></li>
								</ul>
							</div>
						</div>

						<div class="create_new_wrapper" style="width: 542px;">
							<div class="page_exam_create animate createExamBtn">
								<ul class="exam_create_wrapper">
									<li class="exam_create_btn"><a><i
											class="glyphicon glyphicon-plus-sign"></i></a></li>
									<li class="exam_create_prompt">创建新考试</li>
								</ul>
							</div>

						</div>
					</div>

					<!-- 最近考试 结束 -->
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="userInfoModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-user-info" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="user-header">
						<div class="character">
							<div class="img-wrapper">

								<img class="img character-img" src="../img/tx.jpg">
							</div>
						</div>
						<div class="icon-operation icon-edit" id="userEditBtn">
							<i class="icon glyphicon glyphicon-pencil"></i>
						</div>
						<div class="icon-operation icon-cancel" id="cancelEditBtn">
							<i class="icon glyphicon glyphicon-remove"></i>
						</div>
						<div class="icon-operation icon-save" id="saveEditBtn">
							<i class="icon glyphicon glyphicon-pencil"></i>
						</div>

					</div>


					<div class="items">
						<form id="userInfoForm" action="./chgInfo" method="post">
							<div class="item">
								<div class="item-label">姓&nbsp;&nbsp;名：</div>
								<div class="item-data">
									<span class="item-value"> <%
									 	out.write(name);
									 %>
									</span>
								</div>
								<input class="item-input" type="text" name="user"
									value="<%out.write(name);%>" placeholder="请输入姓名"> <i
									class="icon item-icon icon-m_exam_error"></i>
							</div>
							<br /> <br />
							<div class="item item-static">
								<div class="item-label">工&nbsp;&nbsp;号：</div>
								<div class="item-data">
									<%
										out.write(teacher.getTeacherId() + "");
									%>
								</div>
							</div>
							<br /> <br />
							<div class="item item-static">
								<div class="item-label">身份证：</div>
								<div class="item-data">
									<span class="item-value"> <%
									 	out.write(teacher.getTeacherIC());
									 %>
									</span>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="setPasswordModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-440 modal-set-password" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="title">修改密码</div>
					<form id="setPwdForm" method="post" action="./chgPwd">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">原密码：</div>
								<input class="item-input" type="password" name="oldPassword"
									id="oldPassword" placeholder="请输入原密码"> <i
									class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">新密码：</div>
								<input class="item-input" type="password" name="newPassword"
									id="newPassword" placeholder="新密码为6-20位数字、字母或符号的任意组合">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">确认密码：</div>
								<input class="item-input" type="password" name="reNewPassword"
									id="reNewPassword" placeholder="请再次输入新密码"> <i
									class="icon item-icon icon-m_exam_error"></i>
							</div>
						</div>
					</form>

					<div class="error-info hidden" id="errorInfoPwd"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gray" id="cancelSetPwdBtn"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="savePasswordBtn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="createExamModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-440 modal-set-password" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="title">创建考试</div>
					<form id="createExamForm" action="./createExam" method="post">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">考试课程：</div>
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="true">
										<a id="dropdownText1">请选择课程</a> <span class="caret"></span>
										<input id="createExamName" name="createExamName" value="" style="display:none;">
									</button>
									<ul class="dropdown-menu" id="dropdown-menu1" aria-labelledby="dropdownMenu1">
										<%
											for (Lesson lesson : teacherLessons) {
													out.print("<li><a href='#'>" + lesson.getLessonName()
														+ "</a></li>");
											}
										%>
									</ul>
								</div>
							</div>
							<div class="item item-input-group">
								<div class="item-label">开始时间：</div>
								<div class="input-group date form_date " data-date=""
									data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd hh:ii:ss">
									<input name="createExamDate" id="createExamDate" class="item-input" type="text" readonly
										placeholder="请选择考试日期" style="width: 160px; background: #FFF;">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">考试时间：</div>
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="true">
										<a id="dropdownText2">请选择时间</a> <span class="caret"></span>
										<input id="createExamTime" name="createExamTime" value="" style="display:none;">
									</button>
									<ul class="dropdown-menu" id="dropdown-menu2" aria-labelledby="dropdownMenu1">
										<li><a href='#'>第1-2节课</a></li>
										<li><a href='#'>第3-4节课</a></li>
										<li><a href='#'>第5-6节课</a></li>
										<li><a href='#'>第7-8节课</a></li>
									</ul>
								</div>
							</div>
						</div>
					</form>

					<div class="error-info hidden" id="errorInfoCreateExam"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gray" id="cancelSetPwdBtn"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="createExamBtn">保存</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-dialog.min.js"></script>
	<script type="text/javascript" src="../js/admin-base.js"></script>
	<script type="text/javascript" src="../js/user.js"></script>
	<script type="text/javascript"
		src="../js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
	<script type="text/javascript"
		src="../js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_date').datetimepicker({
			format: 'yyyy-mm-dd',
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			minuteStep :5,
		});
	</script>
</body>
</html>