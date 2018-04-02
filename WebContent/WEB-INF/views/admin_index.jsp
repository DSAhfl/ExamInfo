<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="../css/ksx-base.css">
<link rel="stylesheet" type="text/css" href="../css/admin_index.css">

<link rel="SHORTCUT ICON" href="../img/circle.jpg" />

<title>考试信息数字化平台</title>

</head>

<body>

	<div class="viewFrameWork sidebar-full" id="viewFrameWork">
		<!-- viewFrameWork-sidebar -->
		<div class="viewFrameWork-sidebar">
			<a href="../index.jsp" class="sidebar-top sidebar-logo sidebar-btn"
				title="管理员端首页"> <!--小图标样式--> <span class="icon-logo logo-min"><i
					class="glyphicon glyphicon-log-out"></i></span><!--对有没有logo进行判断--> <img
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

						<li class="sidebar-nav-active"><a
							href="./index"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="首页">
								<div class="nav-icon font-color">
									<i class="glyphicon glyphicon-home"></i>
								</div> <span class="nav-title font-color">首页</span>
						</a></li>



						<li class="nav-item"><a
							href="./exam"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="考试管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-list-alt"></i>
								</div> <span class="nav-title">考试管理</span>
						</a></li>

						<li class="nav-item"><a
							href="./lesson"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="课程管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-book"></i>
								</div> <span class="nav-title">课程管理</span>
						</a></li>

						<li class="nav-item"><a
							href="./student"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="学生管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-paperclip"></i>
								</div> <span class="nav-title">学生管理</span>
						</a></li>
						<li class="nav-item"><a
							href="./teacher"
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
					<li class="nav-item"><a class="sidebar-bottom-wrap"
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
							<div class="company-name">点点滴滴</div>
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
									href="#"> <i
										class="glyphicon glyphicon-paperclip"></i> <span
										class="section-add-menu-title">添加学生</span>
								</a></li>



								<li class="dropdown-menu-list section-add-menu-list"><a
									href="#">
										<i class="glyphicon glyphicon-leaf"></i> <span
										class="section-add-menu-title">添加教师</span>
								</a></li>

								<li class="dropdown-menu-list section-add-menu-list"><a
									href="#"> <i
										class="glyphicon glyphicon-file"></i> <span
										class="section-add-menu-title">创建考试</span>
								</a></li>


								<li class="dropdown-menu-list section-add-menu-list"><a
									href="#"> <i
										class="glyphicon glyphicon-list"></i> <span
										class="section-add-menu-title">创建课程</span>
								</a></li>

							</ul>
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
								<span class="see_all"><a
									href="./exam">查看全部<i
										class="glyphicon glyphicon-chevron-right"></i></a></span>
							</div>
							<div class="divide_line"></div>
						</div>



						<div class="page_item animate">
							<div class="page_item_main">
								<h1 class="page_item_title">
									<span>考试示例</span><span>（总分：100.0）</span>
								</h1>
								<p class="page_item_time">2018-03-23 12:00 至 2018-03-26
									12:00</p>
								<ul class="page_item_information">
									<li>创建人：点点滴滴</li>
									<li>类型：选题组卷</li>
									<li>信息：登录考试</li>
									<li>时长：60</li>
								</ul>
							</div>
							<ul class="near_footer_nav">
								<li data-toggle="tooltip" data-placement="top"
									data-container="body" data-original-title="编辑"
									onclick="#"><a
									href="#"><i
										class="glyphicon glyphicon-pencil"></i></a></li>
								<li class="examed_total" data-toggle="tooltip"
									data-placement="top" data-container="body"
									data-original-title="成绩查询批改"
									onclick="#"><a
									href="#"><i
										class="glyphicon glyphicon-edit"></i></a></li>
							</ul>
						</div>


					</div>

					<!-- 正在进行 结束 -->

					<!-- 最近添加 开始 -->

					<div class="exam_near_wrapper">
						<div class="top_wrapper">
							<div class="exam_near_top">
								<h1 class="exam_near_title">最近添加</h1>
								<span class="see_all"><a
									href="./exam">查看全部<i
										class="glyphicon glyphicon-chevron-right"></i></a></span>
							</div>
							<div class="divide_line"></div>
						</div>

						<div class="page_item animate">
							<div class="page_item_main">
								<h1 class="page_item_title">
									<span>考试示例</span><span>（总分：100.0）</span>
								</h1>
								<p class="page_item_time">2018-03-23 12:00 至 2018-03-26
									12:00</p>
								<ul class="page_item_information">
									<li>创建人：点点滴滴</li>
									<li>类型：选题组卷</li>
									<li>信息：登录考试</li>
									<li>时长：60</li>
								</ul>
							</div>
							<ul class="near_footer_nav">
								<li data-toggle="tooltip" data-placement="top"
									data-container="body" data-original-title="编辑"
									onclick="#"><a
									href="#"><i
										class="glyphicon glyphicon-pencil"></i></a></li>
								<li class="examed_total" data-toggle="tooltip"
									data-placement="top" data-container="body"
									data-original-title="成绩查询批改"
									onclick="#"><a
									href="#"><i
										class="glyphicon glyphicon-edit"></i></a></li>
							</ul>
						</div>


						<div class="create_new_wrapper" style="width: 542px;">
							<div class="page_exam_create animate"
								onclick="#">
								<ul class="exam_create_wrapper">
									<li class="exam_create_btn"><a
										href="#"><i
											class="glyphicon glyphicon-plus-sign"></i></a></li>
									<li class="exam_create_prompt">创建新考试</li>
								</ul>
							</div>

						</div>

					</div>
					<!-- 最近添加 结束 -->
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap-dialog.min.js"></script>
	<script type="text/javascript" src="../js/admin-base.js"></script>


</body>
</html>