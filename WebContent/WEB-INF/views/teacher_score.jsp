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
<link rel="stylesheet" type="text/css" href="../css/bootstrap-datetimepicker.css">


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



						<li class="nav-item"><a href="./exam"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="考试管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-list-alt"></i>
								</div> <span class="nav-title  font-color">考试管理</span>
						</a></li>

						<li class="sidebar-nav-active"><a href="./score" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="考试管理">
								<div class="nav-icon   font-color">
									<i class="glyphicon glyphicon-file"></i>
								</div> <span class="nav-title">成绩管理</span>
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
				

				</div>
				<!-- body-section-add keep static -->

			</div>
			<div class="body-bottom body-content" style="background:#FFF;">
				<table id="grid-data" class="table bootgrid-table JColResizer"
					aria-busy="false">
					<thead>
						<tr>
							<th class="select-cell" style="width: 4.7%;"><label
								class="select-label"><input name="select"
									type="checkbox" class="select-box" value="all"
									><span class="select-box"><i
										class="icons8-checked-checkbox"></i></span></label></th>
							<th class="text-left"
								style="width: 15%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">考试名称</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">学生学号</span><span
									class="icon glyphicon "></span></a></th>
							<th class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">学生姓名</span><span
									class="icon glyphicon "></span></a></th>
							<th  class="text-left"
								style="width: 20%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">班级</span><span
									class="icon glyphicon "></span></a></th>
							<th class="text-left"
								style="width: 15%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">分数</span><span
									class="icon glyphicon "></span></a></th>
							<th class="text-left" style="width: 20%;"><a
								href="javascript:void(0);" class="column-header-anchor "><span
									class="text">操作</span><span
									class="icon glyphicon icons8-settings"></span></a></th>
						</tr>
					</thead>
					<tbody>
					<%
			        List<Student> students = (List<Student>) session.getAttribute("students");
			        List<Score> scores = (List<Score>)session.getAttribute("scores");
			        List<Clazz> clazzs = (List<Clazz>)session.getAttribute("clazzs");
			        int clazzId = 0;
			        for(Score score : scores){
			        	String lessonName = null;
			       		boolean belong = false;//只显示属于该教师的课程的考试成绩
			        	for(Lesson lesson : teacherLessons){
			        		if(lesson.getLessonId() == score.getLessonId()){
			        			belong = true;
			        			lessonName = lesson.getLessonName();
			        			break;
			        		}
			        	}
			        	if(belong){
			        		String scoreVal = score.getScore()+"";
			        		if(scoreVal.equals("-1")){
			        			scoreVal = "未批改";
			        		}
			        		out.print("<tr ><td class='select-cell' ><label class='select-label'>"
			        		+ "<input name='select' type='checkbox' class='select-box' ><span class='select-box'>"
			        		+ "<i class='icons8-checked-checkbox'></i></span></label></td>"
							+ "<td class='text-left' style='width: 116px;''>"
			        		+ lessonName
							+"</td><td class='text-left' style='width: 178px;'>"
			        		+ score.getStuId()
			        		+"</td><td class='text-left' style='width: 175px;'>");
			        		for(Student student : students){
			        			if(student.getStuId()==score.getStuId()){
			        				out.print(student.getStuName());
			        				clazzId = student.getClassId();
			        				break;
			        			}
			        		}
			        		out.print("</td><td class='text-left' style='width: 115px;'>");
			        		for(Clazz clazz : clazzs){
			        			if(clazz.getClassId() == clazzId){
			        				out.print(clazz.getClassName());
			        				break;
			        			}
			        		}
			        		out.print("</td><td class='text-left' style='width: 115px;'>"			        		
			        		+ scoreVal
			        		+"</td><td class='text-left' style='width: 186px;'> <a href='#'"
							+"class='glyphicon glyphicon-pencil linkScore setScoreBtn'"
							+"data-toggle='tooltip' data-placement='top' data-container='body'"
							+"data-original-title='成绩修改'></a></td></tr>");
			        	}
			        }
					%>
						
					</tbody>
				</table>
				
				<!-- 
				<div id="grid-data-footer" class="bootgrid-footer container-fluid">
					<div class="row">
						<div class="col-sm-6 infoBar">
							<div class="infos">共<%out.print(scores.size()); %>项记录</div>

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
				-->
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
									<span class="item-value"> 
										<%
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

	<div class="modal fade" id="setScoreModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-440 modal-set-password" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="title">修改成绩</div>
					<form id="setScoreForm" action="./setScore" method="post">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">考试课程：</div>
								<input class="item-input" type="text" id="scoreExamName" name="examName" value="考试示例"
									readonly="readonly"> <i
									class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">学生学号：</div>
								<input class="item-input" type="text" id="scoreStuId" name="stuId"
									id="stuId" placeholder="请输入学号" readonly="readonly">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">学生姓名：</div>
								<input class="item-input" type="text" id="scoreStuName" name="stuId"
									id="stuName" placeholder="请输入学号" readonly="readonly">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">学生成绩：</div>
								<input class="item-input" type="text" id="score" name="score"
									id="score" placeholder="请输入成绩">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>							
						</div>
					</form>
					<div class="error-info hidden" id="errorInfoScore"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gray" id="cancelSetPwdBtn"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="saveScoreBtn">确定</button>
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
			format: 'yyyy-mm-dd hh:ii:ss',
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 0,
			forceParse : 0,
			minuteStep :5,
		});
	</script>
</body>
</html>