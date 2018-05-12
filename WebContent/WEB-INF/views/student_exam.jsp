<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.minjxu.exam.entity.* "%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/styles.min.css">
<link rel="stylesheet" type="text/css" href="../css/jquery.bootgrid.css">
<link rel="stylesheet" type="text/css" href="../css/base.css">
<link rel="stylesheet" type="text/css" href="../css/ksx-base.css">


<link rel="shortcut icon" href="../img/circle.jpg">

<title>考试信息数字化平台</title>

<style type="text/css">
.user_info {
	cursor: pointer;
}

#top a {
	text-decoration: none;
}

#animationLoading {
	position: fixed
}

div#grid-data-footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	padding-right: 180px;
	height: 90px;
	padding-top: 30px;
	background: #fff;
	margin-bottom: 0;
}

table#grid-data {
	padding-bottom: 90px;
}

#grid-data-footer .row .infoBar .actions .btn-group:last-child .dropdown-menu
	{
	top: -260px;
}
</style>


</head>

<body>

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

						<li class="nav-item"><a href="./index" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="首页">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-home"></i>
								</div> <span class="nav-title">首页</span>
						</a></li>

						<li class="sidebar-nav-active"><a href="./exam"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="考试管理">
								<div class="nav-icon font-color">
									<i class="glyphicon glyphicon-list-alt"></i>
								</div> <span class="nav-title font-color">考试信息</span>
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
									Student student = (Student) session.getAttribute("user");
									String name = student.getStuName();
									out.write(name);
								%>
							</div>
						</div>
						<div class="nav-right">
						</div>
					</div>

				</div>
				<!-- body-section-add keep static -->

			</div>
			<div class="body-bottom body-content">
				<table id="grid-data" class="table bootgrid-table JColResizer"
					aria-busy="false">
					<thead>
						<tr>
							<th class="select-cell" style="width: 4.7%;"><label
								class="select-label"><input name="select"
									type="checkbox" class="select-box" value="all"><span
									class="select-box"><i class="icons8-checked-checkbox"></i></span></label></th>
							<th class="text-left"
								style="width: 15%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">课程名称</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 15%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">任课老师</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">考试日期</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">考试时间</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">考试地点</span><span
									class="icon glyphicon "></span></a></th>
							<th class="text-left"
								style="width: 15%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">监考老师</span><span
									class="icon glyphicon "></span></a></th>
							<th class="text-left" style="width: 15%;"><a
								href="javascript:void(0);" class="column-header-anchor "><span
									class="text">成绩</span><span
									class="icon glyphicon icons8-settings"></span></a></th>
						</tr>
					</thead>
					<tbody>
			<%
			
				List<StuExamView> stuExams = (List<StuExamView>) session
					.getAttribute("stuExamViews");
			for (StuExamView stuExam : stuExams) {
				out.println("<tr><td class='select-cell' ><label class='select-label'>"
						+ "<input name='select' type='checkbox' class='select-box' ><span class='select-box'>"
						+ "<i class='icons8-checked-checkbox'></i></span></label></td>");
				out.println("<td class='text-left' style='width: 116px;'>"
						+ stuExam.getLessonName() + "</td>");
				out.println("<td class='text-left' style='width: 178px'>"+stuExam.getLessonTeacher()+"</td>");
				out.println("<td class='text-left' style='width: 178px'>");
				if (stuExam.getExamDate()==null) {
					out.print("未安排");
				} else {
					out.print(stuExam.getExamDate());
				}
				out.println("</td><td class='text-left' style='width: 178px'>");
				if (stuExam.getExamTime() == 0) {
					out.print("未安排");
				} else {
					out.print("第"+stuExam.getExamTime()/10
							+ "-"+stuExam.getExamTime()%10+"节课");
				}
				out.println("</td>"
						+ "<td class='text-left' style='width: 175px'>");
				if (stuExam.getRoomName()==null) {
					out.print("未安排");
				} else {
					out.print(stuExam.getRoomName());
				}
				out.println("</td><td class='text-left' style='width: 115px'>");
				if(stuExam.getExamTeacher()==null){
					out.print("未安排");
				}else{
					out.print(stuExam.getExamTeacher());
				}
				out.println("</td><td class='text-left' style='width: 80px;'>");
				if (stuExam.getScore() == 0) {
					out.print("未批改");
				} else {
					out.print(stuExam.getScore());
				}
				out.println("</td></tr>");
			}
			
			%>
					</tbody>
				</table>
				<div id="grid-data-footer" class="bootgrid-footer container-fluid">
					<div class="row">
						<div class="col-sm-6 infoBar">
							<div class="infos">
								共<%
								out.print(stuExams.size());
							%>项记录
							</div>

						</div>
						<div class="col-sm-6">
							<ul class="pagination">
								<li class="first disabled" aria-disabled="true"><a
									href="#first" class="button"><i
										class="glyphicon glyphicon-step-backward"></i></a></li>
								<li class="prev disabled" aria-disabled="true"><a
									href="#prev" class="button"><i
										class="glyphicon glyphicon-chevron-left"></i></a></li>
								<li class="page-1 active" aria-disabled="false"
									aria-selected="true"><a href="#1" class="button">1</a></li>
								<li class="next disabled" aria-disabled="true"><a
									href="#next" class="button"><i
										class="glyphicon glyphicon-chevron-right"></i></a></li>
								<li class="last disabled" aria-disabled="true"><a
									href="#last" class="button"><i
										class="glyphicon glyphicon-step-forward"></i></a></li>
							</ul>
						</div>
					</div>
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
										out.write(student.getStuId() + "");
									%>
								</div>
							</div>
							<br />
							<div class="item item-static">
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
							</div>
							<br />
							<div class="item item-static">
								<div class="item-label">身份证：</div>
								<div class="item-data">
									<span class="item-value"> <%
 	out.write(student.getStuIC());
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

<!--  
	<div class="modal fade" id="chooseLessonModal" tabindex="-1"
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
					<div class="title">选修课程</div>
					<form id="chooseLessonForm">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">课程：</div>
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="true" data-target="#">
										<a id="dropdownText">请选择课程</a> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
										<%
										/*
										List<Lesson> lessons = (List<Lesson>) session
												.getAttribute("allLessons");
										for (Lesson lesson : lessons) {
											out.print("<li><a href='#'>" + lesson.getLessonName()
													+ "</a></li>");
										}*/
										%>
									</ul>
								</div>
							</div>
						</div>
					</form>
					<div class="error-info hidden" id="errorInfo"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gray" id="cancelSetPwdBtn"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="chooseBtn">确定</button>
				</div>
			</div>
		</div>
	</div>
-->

	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-dialog.min.js"></script>
	<script type="text/javascript" src="../js/admin-base.js"></script>
	<script type="text/javascript" src="../js/user.js"></script>
</body>
</html>