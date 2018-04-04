<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

						<li class="sidebar-nav-active"><a href="./lesson"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="课程管理">
								<div class="nav-icon  font-color">
									<i class="glyphicon glyphicon-book"></i>
								</div> <span class="nav-title font-color">课程管理</span>
						</a></li>

						<li class="nav-item"><a href="./student"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="学生管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-paperclip"></i>
								</div> <span class="nav-title">学生管理</span>
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
							<div class="company-name">点点滴滴</div>
						</div>

					</div>

					<div class="body-toolbar clearfix">
						<div class="body-toolbar-left pull-left toolbar-left-operation">
						</div>
						<div class="body-toolbar-right pull-right toolbar-right-operation">
							<div class="search-section">
								<div class="search-section-normal" id="normalSearch">
									<i class="glyphicon glyphicon-search search-section-icon"
										id="searchIcon"></i> <input
										class="search-section-area placeholder" name="exam_name"
										type="text" placeholder="请输入课程名称">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- body-section-add keep static -->
				<div class="body-top-right body-section-add createLessonBtn">
					<div class="section-add-btn">
						<i class="glyphicon glyphicon-plus section-add-icon"></i> <span
							class="section-add-title">创建课程</span>
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
							<th data-column-id="examName" class="text-left"
								style="width: 30%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">课程名称</span><span
									class="icon glyphicon "></span></a></th>

							<th data-column-id="createUserName" class="text-left"
								style="width: 30%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">任课教师</span><span
									class="icon glyphicon "></span></a></th>

							<th data-column-id="sender" class="text-left" style="width: 30%;"><a
								href="javascript:void(0);" class="column-header-anchor "><span
									class="text">操作</span><span
									class="icon glyphicon icons8-settings"></span></a></th>
						</tr>
					</thead>
					<tbody>
						<tr data-row-id="112322">
							<td class="select-cell" style=""><label class="select-label"><input
									name="select" type="checkbox" class="select-box" value="112322"><span
									class="select-box"><i class="icons8-checked-checkbox"></i></span></label></td>
							<td class="text-left" style="width: 116px;">考试示例</td>
							<td class="text-left" style="width: 115px;">点点滴滴</td>
							<td class="text-left" style="width: 186px;"><a href="#"
								class="glyphicon glyphicon-edit updateLessonBtn" examid="112322"
								data-toggle="tooltip" data-placement="top" data-container="body"
								title="" data-original-title="编辑"></a> <a href="#"
								class="glyphicon glyphicon-trash linkScore"
								data-toggle="tooltip" data-placement="top" data-container="body"
								title="" examid="112322" data-original-title="删除"></a></td>
						</tr>
					</tbody>
				</table>
				<div id="grid-data-footer" class="bootgrid-footer container-fluid">
					<div class="row">
						<div class="col-sm-6 infoBar">
							<div class="infos">共1项记录</div>

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
					<form id="setPwdForm">
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

	<div class="modal fade" id="updateLessonModal" tabindex="-1"
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
					<div class="title">编辑课程</div>
					<form id="updateLessonForm">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">课程名称：</div>
								<input class="item-input" type="text" value="考试示例"
									placeholder="请输入课程名称"> <i
									class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">任课教师：</div>
								<input class="item-input" type="text" value="点点滴滴"
									placeholder="请输入任课教师姓名"> <i
									class="icon item-icon icon-m_exam_error"></i>
							</div>
						</div>
					</form>

					<div class="error-info hidden" id="errorInfoLesson"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gray" id="cancelLessonBtn"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="saveLessonBtn">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="createLessonModal" tabindex="-1"
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
					<div class="title">创建课程</div>
					<form id="updateLessonForm">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">课程名称：</div>
								<input class="item-input" type="text" placeholder="请输入课程名称">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">任课教师：</div>
								<input class="item-input" type="text" placeholder="请输入任课教师姓名">
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
						</div>
					</form>

					<div class="error-info hidden" id="errorInfoLesson"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gray" id="cancelLessonBtn"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="saveLessonBtn">保存</button>
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