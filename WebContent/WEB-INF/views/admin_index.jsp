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
<link rel="stylesheet" type="text/css" href="../css/base.css">
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
								</div> <span class="nav-title">考试管理</span>
						</a></li>

						<li class="nav-item"><a href="./lesson" data-toggle="tooltip"
							data-placement="right" data-container="body" title=""
							data-original-title="课程管理">
								<div class="nav-icon">
									<i class="glyphicon glyphicon-book"></i>
								</div> <span class="nav-title">课程管理</span>
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
									class="updateExamBtn"><a href=""><i
										class="glyphicon glyphicon-pencil"></i></a></li>
								<li class="examed_total" data-toggle="tooltip"
									data-placement="top" data-container="body"
									data-original-title="成绩查询批改" onclick=""><a href="#"><i
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
								<span class="see_all"><a href="./exam">查看全部<i
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
									class="updateExamBtn"><a href=""><i
										class="glyphicon glyphicon-pencil"></i></a></li>
								<li class="examed_total" data-toggle="tooltip"
									data-placement="top" data-container="body"
									data-original-title="成绩查询批改" onclick=""><a href="#"><i
										class="glyphicon glyphicon-edit"></i></a></li>
							</ul>
						</div>


						<div class="create_new_wrapper" style="width: 542px;">
							<div class="page_exam_create animate createExamBtn">
								<ul class="exam_create_wrapper">
									<li class="exam_create_btn"><a href="#"><i
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
					<form id="createExamForm">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">考试课程：</div>
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="true">
										请选择课程 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
										<li><a href="#">C++</a></li>
										<li><a href="#">Java</a></li>
										<li><a href="#">MySQL</a></li>
									</ul>
								</div>
							</div>
							<div class="item item-input-group">
								<div class="item-label">开始时间：</div>
								<div class="input-group date form_date " data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input name="date" class="item-input" type="text" readonly
										placeholder="请选择日期" style="width: 160px; background: #FFF;">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">结束时间：</div>
								<div class="input-group date form_date " data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input name="date" class="item-input" type="text" readonly
										placeholder="请选择日期" style="width: 160px; background: #FFF;">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<i class="icon item-icon icon-m_exam_error"></i>
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

	<div class="modal fade" id="updateExamModal" tabindex="-1"
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
					<div class="title">编辑考试</div>
					<form id="updateExamForm">
						<div class="items">
							<div class="item item-input-group">
								<div class="item-label">考试课程：</div>
								<input class="item-input" type="text" value="考试示例"
									readonly="readonly"> <i
									class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">开始时间：</div>
								<div class="input-group date form_date " data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input name="date" class="item-input" type="text" readonly
										placeholder="请选择日期" style="width: 160px; background: #FFF;">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<i class="icon item-icon icon-m_exam_error"></i>
							</div>
							<div class="item item-input-group">
								<div class="item-label">结束时间：</div>
								<div class="input-group date form_date " data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input name="date" class="item-input" type="text" readonly
										placeholder="请选择日期" style="width: 160px; background: #FFF;">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<i class="icon item-icon icon-m_exam_error"></i>
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
	<script type="text/javascript"
		src="../js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
	<script type="text/javascript"
		src="../js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_date').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	</script>

</body>
</html>