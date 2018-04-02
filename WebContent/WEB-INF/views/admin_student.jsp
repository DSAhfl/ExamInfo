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



						<li class="nav-item"><a href="./exam"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="考试管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-list-alt"></i>
								</div> <span class="nav-title ">考试管理</span>
						</a></li>

						<li class="nav-item"><a href="./lesson" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="课程管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-book"></i>
								</div> <span class="nav-title">课程管理</span>
						</a></li>

						<li class="sidebar-nav-active"><a href="./student" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="学生管理">
								<div class="nav-icon   font-color">
									<i class="glyphicon glyphicon-paperclip"></i>
								</div> <span class="nav-title font-color">学生管理</span>
						</a></li>
						<li class="nav-item"><a href="./teacher" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="教师管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-leaf"></i>
								</div> <span class="nav-title">教师管理</span>
						</a></li>


					</ul>
				</div>
			</div>


			<div class="sidebar-bottom sidebar-btn">
				<ul class="sidebar-trans">

					<li class="nav-item"><a class="sidebar-bottom-wrap"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<div class="nav-icon">
								<i class="glyphicon glyphicon-cog"></i>
							</div> <span class="nav-title">点点滴滴</span>
					</a>
						<div class="dropdown-menu company-info-panel">
							<div class="info-content">
								<div class="info-content-img">
									<img src="../img/circle.jpg" class="user_img" alt="">
								</div>
								<div class="info-content-wrap">
									<div class="user" id="user">
										<span>点点滴滴</span> <a href="#"
											class="glyphicon glyphicon-wrench "> <i
											class="unread-notice"></i>

										</a>
									</div>
									<div class="company">点点滴滴</div>
									<a role="button" class="btn btn-danger btn-exit" id="logoutBtn">
										<i class="glyphicon glyphicon-off"></i> 退出
									</a>
								</div>
							</div>
						</div></li>
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
							<button type="button" class="btn btn-default inactive"
								id="batchDel">
								<i class="glyphicon glyphicon-trash btn-icon-left"></i> 删除
							</button>
						</div>
						<div class="body-toolbar-right pull-right toolbar-right-operation">
							<div class="search-section">
								<div class="search-section-normal" id="normalSearch">
									<i class="glyphicon glyphicon-search search-section-icon"
										id="searchIcon"></i> <input
										class="search-section-area placeholder" name="exam_name"
										type="text" placeholder="请输入学生名称">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- body-section-add keep static -->
				<div class="body-top-right body-section-add">
					<div class="section-add-btn" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="glyphicon glyphicon-plus section-add-icon"></i> <span
							class="section-add-title">添加</span>
					</div>
					<div class="dropdown-menu section-add-panel">
						<div class="section-add-panel-content">
							<ul class="section-add-menu">

								<li class="dropdown-menu-list section-add-menu-list"><a
									href="#"> <i class="glyphicon glyphicon-paperclip"></i> <span
										class="section-add-menu-title">添加学生</span>
								</a></li>

								<li class="dropdown-menu-list section-add-menu-list"><a
									href="#"> <i class="glyphicon glyphicon-leaf"></i> <span
										class="section-add-menu-title">添加教师</span>
								</a></li>

								<li class="dropdown-menu-list section-add-menu-list"><a
									href="#"> <i class="glyphicon glyphicon-file"></i> <span
										class="section-add-menu-title">创建考试</span>
								</a></li>

								<li class="dropdown-menu-list section-add-menu-list"><a
									href="#"> <i class="glyphicon glyphicon-list"></i> <span
										class="section-add-menu-title">创建课程</span>
								</a></li>
							</ul>
						</div>
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
								style="width: 10.2%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">考试名称</span><span
									class="icon glyphicon "></span></a></th>
							<th data-column-id="examStyleName" class="text-left"
								style="width: 10%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">分类</span><span
									class="icon glyphicon "></span></a></th>
							<th data-column-id="paperTotalScore" class="text-left"
								style="width: 6.3%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">总分</span><span
									class="icon glyphicon "></span></a></th>
							<th data-column-id="examStartTime" class="text-left"
								style="width: 15.8%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">开始时间</span><span
									class="icon glyphicon "></span></a></th>
							<th data-column-id="examEndTime" class="text-left"
								style="width: 15.2%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">结束时间</span><span
									class="icon glyphicon "></span></a></th>
							<th data-column-id="createUserName" class="text-left"
								style="width: 9.1%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">创建人</span><span
									class="icon glyphicon "></span></a></th>
							<th data-column-id="createTime" class="text-left"
								style="width: 13.2%;"><a href="javascript:void(0);"
								class="column-header-anchor sortable"><span class="text">创建时间</span><span
									class="icon glyphicon "></span></a></th>
							<th data-column-id="sender" class="text-left"
								style="width: 15.5%;"><a href="javascript:void(0);"
								class="column-header-anchor "><span class="text">操作</span><span
									class="icon glyphicon icons8-settings"></span></a></th>
						</tr>
					</thead>
					<tbody>
						<tr data-row-id="112322">
							<td class="select-cell" style=""><label class="select-label"><input
									name="select" type="checkbox" class="select-box" value="112322"><span
									class="select-box"><i class="icons8-checked-checkbox"></i></span></label></td>
							<td class="text-left" style="width: 116px;">考试示例</td>
							<td class="text-left" style="width: 116px;">示例</td>
							<td class="text-left" style="width: 80px;">100</td>
							<td class="text-left" style="width: 178px;">2018-03-23 12:00</td>
							<td class="text-left" style="width: 175px;">2018-03-26 12:00</td>
							<td class="text-left" style="width: 115px;">点点滴滴</td>
							<td class="text-left" style="width: 159px;">2018-03-23 12:00</td>
							<td class="text-left" style="width: 186px;">
								<a href="#" class="glyphicon glyphicon-edit updateExam" examid="112322"
								data-toggle="tooltip" data-placement="top" data-container="body"
								title="" data-original-title="编辑"></a>
								<a href="#" class="glyphicon glyphicon-pencil linkScore"
								data-toggle="tooltip" data-placement="top" data-container="body"
								title="" examid="112322" data-original-title="成绩查询批改"></a>
								<a href="#" class="glyphicon glyphicon-trash linkScore"
								data-toggle="tooltip" data-placement="top" data-container="body"
								title="" examid="112322" data-original-title="删除"></a>
							</td>
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
									href="#first" class="button"><i class="glyphicon glyphicon-step-backward"></i></a></li>
								<li class="prev disabled" aria-disabled="true"><a
									href="#prev" class="button"><i class="glyphicon glyphicon-chevron-left"></i></a></li>
								<li class="page-1 active" aria-disabled="false"
									aria-selected="true"><a href="#1" class="button">1</a></li>
								<li class="next disabled" aria-disabled="true"><a
									href="#next" class="button"><i
										class="glyphicon glyphicon-chevron-right"></i></a></li>
								<li class="last disabled" aria-disabled="true"><a
									href="#last" class="button"><i class="glyphicon glyphicon-step-forward"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-dialog.min.js"></script>
	<script type="text/javascript" src="../js/admin-base.js"></script>
	<script type="text/javascript" src="../js/jquery.qrcode.min.js"></script>
	<script type="text/javascript" src="../js/admin_examManager.js"></script>

</body>
</html>