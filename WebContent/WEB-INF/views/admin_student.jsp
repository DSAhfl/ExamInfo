<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.minjxu.exam.entity.* "%>
<%@ page import="java.util.* "%>
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
				title="管理员端首页"> <!--小图标样式--> <span class="icon-logo logo-min"><i
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



						<li class="nav-item"><a href="./exam" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="考试管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-list-alt"></i>
								</div> <span class="nav-title ">考试管理</span>
						</a></li>

						<li class="nav-item"><a href="./score" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="成绩管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-file"></i>
								</div> <span class="nav-title">成绩管理</span>
						</a></li>

						<li class="nav-item"><a href="./lesson" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="课程管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-book"></i>
								</div> <span class="nav-title">课程管理</span>
						</a></li>

						<li class="sidebar-nav-active"><a href="./student"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="学生管理">
								<div class="nav-icon   font-color">
									<i class="glyphicon glyphicon-paperclip"></i>
								</div> <span class="nav-title font-color">学生管理</span>
						</a></li>
						<li class="nav-item"><a href="./teacher"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="教师管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-leaf"></i>
								</div> <span class="nav-title">教师管理</span>
						</a></li>


					</ul>
				</div>
			</div>


			<div class="sidebar-bottom sidebar-btn">
				<ul class="sidebar-trans">
					<li class="nav-item"  id="setPasswordBtn"><a class="sidebar-bottom-wrap"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
									Admin admin = (Admin)session.getAttribute("user");
									out.write(admin.getAdminName());
								%>
							</div>
						</div>
						<div class="nav-right">
							<%
								String msg = (String) session.getAttribute("msg");
																		if (msg != null) {
							%>
							<div class="alert alert-info alert-dismissible" role="alert"
								style="width: 500px; right: 100px;">
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<strong>${msg }</strong>
							</div>
							<%
								}
								session.removeAttribute("msg");
							%>
						</div>
					</div>

					<div class="body-toolbar clearfix">
						<div class="body-toolbar-left pull-left toolbar-left-operation">
						</div>
						<div class="body-toolbar-right pull-right toolbar-right-operation">
						</div>
					</div>
				</div>
				<!-- body-section-add keep static -->
				<div class="body-top-right body-section-add addStudentBtn">
					<div class="section-add-btn" >
						<i class="glyphicon glyphicon-plus section-add-icon"></i> <span
							class="section-add-title">添加学生</span>
					</div>
					
				</div>
			</div>
			<div class="body-bottom body-content">
				<table id="grid-data" class="table bootgrid-table JColResizer"
					aria-busy="false">
					<thead>
						<tr>
							<th class="select-cell" style="width: 4.7%;"><label
								class="select-label"><input name="select"
									type="checkbox" class="select-box" value="all"
									{{ctx.checked}}=""><span class="select-box"><i
										class="icons8-checked-checkbox"></i></span></label></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">学生学号</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">学生姓名</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">班级</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">身份证</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left" style="width: 20%;"><a
								href="javascript:void(0);" class="column-header-anchor "><span
									class="text">操作</span><span
									class="icon glyphicon icons8-settings"></span></a></th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Student> students = (List<Student>)session.getAttribute("students");
							List<Clazz> clazzs = (List<Clazz>) session.getAttribute("clazzs");
						
							for(Student student : students){
							
								out.println("<tr><td class='select-cell' ><label class='select-label'>"
						        		+ "<input name='select' type='checkbox' class='select-box' ><span class='select-box'>"
						        		+ "<i class='icons8-checked-checkbox'></i></span></label></td>");
								out.println("<td class='text-left' style='width: 116px;'>"
										+ student.getStuId() + "</td>");
								out.println("<td class='text-left' style='width: 115px'>"
										+ student.getStuName() + "</td>");
								for(Clazz clazz : clazzs){
									if(clazz.getClassId()==student.getClassId()){
										out.println("<td class='text-left' style='width: 115px'>"
												+ clazz.getClassName() + "</td>");
										break;
									}
								}
								out.println("<td class='text-left' style='width: 115px'>"
										+ student.getStuIC() + "</td>");
								out.println( "<td class='text-left' style='width: 80px;'><a href='#'"
										+"class='glyphicon glyphicon-edit updateStudentBtn'"
										+"data-toggle='tooltip' data-placement='top' data-container='body'"
										+"data-original-title='编辑'></a>"
										+ "<a href='/ExamInfo/admin/deleteStudent?studentId="
										+ student.getStuId()
										+ "' "
										+ "class='glyphicon glyphicon-trash dropout'"
										+ "data-toggle='tooltip' data-placement='top' data-container='body'"
										+ " data-original-title='删除'></a></td>");
								out.println("</tr>");
							}
						%>
						
					</tbody>
				</table>
				<div id="grid-data-footer" class="bootgrid-footer container-fluid">
					<div class="row">
						<div class="col-sm-6 infoBar">
							<div class="infos">共<%out.print(students.size()); %>项记录</div>

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
					<form id="setPwdForm" action="chgPwd" method="post">
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
	
		<div class="modal fade" id="addStudentModal" tabindex="-1"
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
					<div class="title">添加学生</div>
					<form id="addStudentForm" action="./addStudent">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">学生姓名：</div>
								<input class="item-input" name="stuName" id="addStuName" type="text" placeholder="请输入学生姓名">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">班级：</div>
								<input class="item-input" name="stuClass" id="addStuClass" type="text" placeholder="请输入学生班级">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">身份证：</div>
								<input class="item-input" name="stuIC" id="addStuIC" type="text" placeholder="请输入身份证">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
						</div>
					</form>

					<div class="error-info hidden" id="errorAddStudent"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gray" id="cancelLessonBtn"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="addStudent">保存</button>
				</div>
			</div>
		</div>
	</div>
		<div class="modal fade" id="updateStudentModal" tabindex="-1"
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
					<div class="title">编辑学生信息</div>
					<form id="updateStudentForm" action="updateStudent">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">学生学号：</div>
								<input class="item-input" name="stuId" id="updateStudentId" type="text" value="1111"
									readonly="readonly"> <i
									class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">学生姓名：</div>
								<input class="item-input" name="stuName" id="updateStudentName" type="text" value="示例" placeholder="请输入学生姓名">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">班级：</div>
								<input class="item-input" name="stuClass" id="updateStudentClass" type="text" placeholder="请输入学生班级">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">身份证：</div>
								<input class="item-input" name="stuIC" id="updateStudentIC" type="text" value="100" placeholder="请输入身份证">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
						</div>
					</form>

					<div class="error-info hidden" id="errorUpdateStudent"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gray" id="cancelLessonBtn"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="updateStudent">保存</button>
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