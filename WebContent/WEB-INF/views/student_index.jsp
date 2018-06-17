<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.minjxu.exam.entity.* "%>
<%@ page import="java.util.List"%>

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


<title>考试信息数字化平台</title>
<link rel="SHORTCUT ICON" href="../img/circle.jpg" />
</head>
<body>
	<%
		Student student = (Student) session.getAttribute("user");
	/*
		List<ExamView> stuExams = (List<ExamView>) session
				.getAttribute("stuExams");
		ExamView stuExam = (ExamView)session.getAttribute("recentExam");
	*/
		int ID = student.getStuId();
		String IC = student.getStuIC();
	%>
	<div class="viewFrameWork sidebar-full" id="viewFrameWork">
		<!-- viewFrameWork-sidebar -->
		<div class="viewFrameWork-sidebar">
			<a href="../index.jsp" class="sidebar-top sidebar-logo sidebar-btn"
				title="首页"> <!--小图标样式--> <span class="icon-logo logo-min"><i
					class="glyphicon glyphicon-log-out"></i></span> <!--对有没有logo进行判断--> <img
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
								</div> <span class="nav-title">考试信息</span>
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
									String name = student.getStuName();
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

			</div>
			<div class="body-bottom body-content">
				<div class="page_wrapper ">

					<div class="exam_process_wrapper">
						<div class="top_wrapper">
							<div class="exam_process_top">
								<h1 class="exam_process_title">最近考试</h1>
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
										StuExamView stuExam  = null;
										for(StuExamView view : stuExams){
											if(view.getExamDate()!=null){
												stuExam = view;
												break;
											}
										}
										out.print(stuExam.getLessonName());
										%>
									</span>
								</h1>
								<p class="page_item_time">
									<%
									if(stuExam.getExamDate()!=null){
										out.print(stuExam.getExamDate()+"  第"+stuExam.getExamTime()/10
												+ "-"+stuExam.getExamTime()%10+"节课");
									}else{
										out.print("未安排");
									}
									%>
								</p>
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
									<li>监考老师：<%
									if(stuExam.getExamTeacher()!=null){
										out.print(stuExam.getExamTeacher());
									}else{
										out.print("未安排");
									}
										%></li>
									<li>成绩：<%
									int grade = stuExam.getScore();
									if(grade>0){
										out.print(grade);
									}else{
										out.print("未批改");
									}
									
										%></li>
								</ul>
							</div>
						</div>


					</div>

					<!-- 正在进行 结束 -->

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
							<br />
							<div class="item item-static">
								<div class="item-label">学&nbsp;&nbsp;号：</div>
								<div class="item-data">
									<%
										out.write(ID + "");
									%>
								</div>
							</div><div class="item item-static">
								<div class="item-label">班&nbsp;&nbsp;级：</div>
								<div class="item-data">
									<%
									List<Clazz> clazzs = (List<Clazz>) session
									.getAttribute("clazzs");
									for(Clazz clazz : clazzs){
										if(clazz.getClassId()==student.getClassId()){
											out.write(clazz.getClassName());
										}
									}
									%>
								</div>
							</div><br />
							<div class="item item-static">
								<div class="item-label">身份证：</div>
								<div class="item-data">
									<span class="item-value"> <%
									 	out.write(IC);
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



	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-dialog.min.js"></script>
	<script type="text/javascript" src="../js/admin-base.js"></script>
	<script type="text/javascript" src="../js/user.js"></script>


</body>
</html>