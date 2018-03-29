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
<link rel="stylesheet" type="text/css" href="../css/ksx-base.css">
<link rel="stylesheet" type="text/css" href="../css/styles.min.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/jquery.bootgrid.css">
<link rel="stylesheet" type="text/css" href="../css/pikaday.css">
<link rel="stylesheet" type="text/css" href="../css/admin_index.css">
<!-- growingIO  website data analysis -->
<script type="text/javascript" async="" src="../js/vds.js"></script>
<script type="text/javascript">
		var _vds = _vds || [];
		window._vds = _vds;
		(function() {
			_vds.push([ 'setAccountId', '87d10bc8158a4ed0a2206a6f0bdd2a5c' ]);
	
			_vds.push([ 'setCS1', 'user_id', '3825663' ]);
			_vds.push([ 'setCS2', 'company_id', '52562' ]);
			_vds.push([ 'setCS3', 'company_name', '点点滴滴' ]);
			_vds.push([ 'setCS4', 'company_right', '8' ]);
	
			(function() {
				var vds = document.createElement('script');
				vds.type = 'text/javascript';
				vds.async = true;
				vds.src = ('https:' == document.location.protocol ? 'https://'
						: 'http://')
						+ 'dn-growing.qbox.me/vds.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(vds, s);
			})();
		})();
	</script>


<title>Insert title here</title>

</head>
<body>
	<button type="button" class="btn btn-primary">（首选项）Primary</button>
	<div class="viewFrameWork sidebar-full" id="viewFrameWork">
		<!-- viewFrameWork-sidebar -->
		<div class="viewFrameWork-sidebar">
			<a href="https://admin.kaoshixing.com/account/admin/index"
				class="sidebar-top sidebar-logo sidebar-btn" title="管理员端首页"> <!--小图标样式-->
				<span class="icon-logo logo-min" data-name="点点滴滴">点</span> <!--对有没有logo进行判断-->
				<img class="icon-logo logo-full logo-ksx"
				src="./admin_index_files/logo-transparent-header.svg">
			</a>
			<div class="sidebar-inner">

				<div class="sidebar-fold icon-unfold" id="sidebar-fold"
					data-toggle="tooltip" data-placement="right" data-container="body"
					title="" data-original-title="收起导航">
					<i class="icons8 icons8-icon"></i>
				</div>


				<div class="sidebar-nav">
					<ul class="sidebar-trans">

						<li class="sidebar-nav-active"><a
							href="https://admin.kaoshixing.com/account/admin/index/"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="首页">
								<div class="nav-icon font-color">
									<i class="icon icon-ksx-home icon-index"></i>
								</div> <span class="nav-title font-color">首页</span>
						</a></li>



						<li class="nav-item"><a
							href="https://admin.kaoshixing.com/admin/exam_mgr_new"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="考试管理">
								<div class="nav-icon">
									<i class="icon icon-ksx-examination-management icon-exam"></i>
								</div> <span class="nav-title">考试管理</span>
						</a></li>



						<li class="nav-item"><a
							href="https://admin.kaoshixing.com/admin/user_mgr_new"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="人员管理">
								<div class="nav-icon">
									<i class="icon icon-ksx-Personnel-management icon-user"></i>
								</div> <span class="nav-title">人员管理</span>
						</a></li>



						<li class="nav-item"><a
							href="https://admin.kaoshixing.com/admin/file/manager/"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="学习">
								<div class="nav-icon">
									<i class="icon icon-ksx-study icon-course"></i>
								</div> <span class="nav-title">学习</span>
						</a></li>



						<li class="nav-item"><a
							href="https://admin.kaoshixing.com/account/admin_pay_center"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="支付中心">
								<div class="nav-icon">
									<i class="icon icon-ksx-pay2 icon-pay"></i>
								</div> <span class="nav-title">支付中心</span>
						</a></li>



						<li class="nav-item"><a
							href="https://admin.kaoshixing.com/admin/sub_admin_mgr/"
							data-toggle="tooltip" data-placement="right"
							data-container="body" title="" data-original-title="系统管理">
								<div class="nav-icon">
									<i class="icon icon-ksx-System-management icon-system"></i>
								</div> <span class="nav-title">系统管理</span>
						</a></li>




					</ul>
				</div>
			</div>


			<div class="sidebar-bottom sidebar-btn">
				<ul class="sidebar-trans">
					<li class="nav-item"><a class="sidebar-bottom-wrap"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<div class="nav-icon">
								<i class="icon icon-ksx-Customer-service icon-headset"></i>
							</div> <span class="nav-title">客服</span>
					</a>
						<div class="dropdown-menu company-info-panel person-servers-panel">
							<div class="info-content">
								<div class="info-content-wrap">
									<div class="telephone">
										<div class="icon"></div>
										<div class="intro">010-64465210</div>
									</div>
									<div class="qq">
										<a
											href="http://wpa.qq.com/msgrd?v=201712191738&amp;uin=3236665960&amp;site=qq&amp;menu=yes"
											target="_blank">
											<div class="icon"></div>
											<div class="intro">在线咨询</div>
										</a>
									</div>
								</div>
							</div>
						</div></li>
					<li class="nav-item"><a class="sidebar-bottom-wrap"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<div class="nav-icon">
								<i class="icon icon-ksx-mine icon-admin"></i>
							</div> <span class="nav-title">点点滴滴</span>
					</a>
						<div class="dropdown-menu company-info-panel">

							<ul class="info-header">
								<li class="nav-state-icon nav-state-online"
									style="border-right: 1px solid #f7f7f7;">
									<div id="stateUserCountBar" class="stateCountBar"
										role="progressbar" aria-valuenow="4.0" aria-valuemin="0"
										aria-valuemax="100" style="width: 4.0%">
										<span class="state-title">用户数量</span><span
											class="state-user-count" id="stateUserCount"
											style="position: absolute">1&nbsp;/&nbsp;25</span>
									</div>
								</li>
								<li class="nav-state-icon nav-state-online">
									<div id="stateOnlineStoreBar" class="stateCountBar"
										role="progressbar" aria-valuenow="0.0" aria-valuemin="0"
										aria-valuemax="100" style="width: 0.0%">
										<span class="state-title">存储空间</span><span
											class="state-online-store" id="stateOnlineStore"
											style="position: absolute">0.0&nbsp;/&nbsp;1024.0MB</span>
									</div>
								</li>
							</ul>
							<div class="info-content">
								<div class="info-content-img">
									<img src="./admin_index_files/default-pic.png" class="user_img"
										alt="">
								</div>
								<div class="info-content-wrap">
									<div class="user" id="user">
										<span>点点滴滴</span> <a
											href="https://admin.kaoshixing.com/admin/admin_information"
											class="icons8-edit-property information-edit"> <i
											class="unread-notice"></i>

										</a> <span class="company-info">免费版（2100-01-01）</span>
									</div>
									<div class="company">点点滴滴</div>
									<a role="button" class="btn btn-default exam-entrance"
										href="https://exam.kaoshixing.com/exam"> <i
										class="icons8-icon-6 btn-icon-left"></i> 考试入口
									</a> <a role="button" class="btn btn-danger btn-exit"
										id="logoutBtn"> <i class="icons8-shutdown btn-icon-left"></i>
										退出
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
							<div class="company-info">免费版（2100-01-01）</div>
						</div>
						<div class="nav-right nav-state">
							<div class="nav-state-icon nav-state-message">
								<i class="icons8-notification state-message-icon"
									id="stateMessage"> <span class="state-message-count hidden">0</span>
								</i>
							</div>
						</div>
					</div>
					<div class="body-toolbar clearfix">
						<div class="nav-right nav-state pull-left toolbar-left-operation">
							<div class="nav-state-icon nav-state-online">
								<span class="state-online-title">用户</span> <span
									class="state-user-count" id="stateUserCount">1/25</span>
								<div class="progress">
									<div class="progress-bar" id="stateUserCountBar"
										role="progressbar" aria-valuenow="4.0" aria-valuemin="0"
										aria-valuemax="100" style="width: 4.0%;"></div>
								</div>
							</div>

							<div class="nav-state-icon nav-state-online">
								<span class="state-online-title">存储空间</span> <span
									class="state-online-store" id="stateOnlineStore">0.0/1024.0MB</span>
								<div class="progress">
									<div class="progress-bar" id="stateOnlineStoreBar"
										role="progressbar" aria-valuenow="0.0" aria-valuemin="0"
										aria-valuemax="100" style="width: 0.0%;"></div>
								</div>
							</div>










						</div>
						<div class="body-toolbar-right pull-right toolbar-right-operation">
							<button type="button" class="btn btn-default" id=""
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">考试登录地址</button>
							<div class="dropdown-menu login-info-panel">
								<div class="title">登陆地址</div>
								<div class="qrcode" id="mobile_url_qrcode">
									<canvas width="100" height="100"></canvas>
								</div>
								<div class="btn-group" role="group" aria-label="...">
									<span id="login-link" class="btn btn-default btn-url">https://www.kaoshixing.com/account/login/52562</span>
									<button class="btn btn-warning btn-copy"
										data-clipboard-target="#login-link" id="copyUrlBtn">复制链接</button>
								</div>






							</div>
							<div class="beginners-guide beginners-guide-large guide-right"
								id="guide-second" style="display: none">
								<div class="guide-wrapper">
									<div class="guide-word">想要快速创建考试、添加考生和试题？点这里就好啦～</div>
									<a class="guide-button" id="btn-second">知道了--&gt;</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- body-section-add keep static -->
				<div class="body-top-right body-section-add">
					<div class="section-add-btn" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="icons8-plus-math section-add-icon"></i> <span
							class="section-add-title">添加</span>
					</div>
					<div class="dropdown-menu section-add-panel">
						<div class="section-add-panel-content">
							<ul class="section-add-menu">



								<li class="dropdown-menu-list section-add-menu-list"><a
									href="https://admin.kaoshixing.com/admin/user_add"> <i
										class="icons8-user-group-man-man dropdown-menu-icon icon-user"></i>
										<span class="section-add-menu-title">添加考生</span>
								</a></li>



								<li class="dropdown-menu-list section-add-menu-list"><a
									href="https://admin.kaoshixing.com/admin/online_import_html">
										<i
										class="icons8-bulleted-list dropdown-menu-icon icon-question"></i>
										<span class="section-add-menu-title">添加试题</span>
								</a></li>



								<li class="dropdown-menu-list section-add-menu-list"><a
									href="https://admin.kaoshixing.com/admin/paper_add_new"> <i
										class="icons8-test-partial-passed dropdown-menu-icon icon-exam"></i>
										<span class="section-add-menu-title">创建考试</span>
								</a></li>


								<li class="dropdown-menu-list section-add-menu-list"><a
									href="https://admin.kaoshixing.com/course/course_add/"> <i
										class="icon icon-ksx-Shape dropdown-menu-icon icon-exam"></i>
										<span class="section-add-menu-title">创建课程</span>
								</a></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="body-bottom body-content">
				<!-- loading -->
				<div class="spinner-wrapper hidden" id="spinnerLoading">
					<div class="spinner">
						<div class="rect1"></div>
						<div class="rect2"></div>
						<div class="rect3"></div>
						<div class="rect4"></div>
						<div class="rect5"></div>
					</div>
				</div>
				<div class="page_wrapper ">

					<div class="exam_process_wrapper">
						<div class="top_wrapper">
							<div class="exam_process_top">
								<h1 class="exam_process_title">正在进行（1）</h1>
								<span class="see_all"><a
									href="https://admin.kaoshixing.com/admin/exam_mgr_new">查看全部<i
										class="icons8-forward"></i></a></span>
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
								<p class="examer_total">0人正在考试</p>
							</div>
							<ul class="process_footer_nav">
								<li data-toggle="tooltip" data-placement="top"
									data-container="body" data-original-title="编辑"
									onclick="document.location=&#39;https://admin.kaoshixing.com/admin/exam/update/112322&#39;"><a
									href="https://admin.kaoshixing.com/admin/exam/update/112322"><i
										class="icons8-edit"></i></a></li>
								<li data-toggle="tooltip" data-placement="top"
									data-container="body" data-original-title="考试链接"
									class="linkExam"><a
									href="https://admin.kaoshixing.com/account/admin/index#"
									examid="112322" examname="考试示例"><i class="icons8-attach"></i></a></li>
								<li class="examed_total" data-toggle="tooltip"
									data-placement="top" data-container="body"
									data-original-title="成绩查询批改"
									onclick="document.location=&#39;https://admin.kaoshixing.com/admin/result/mgr_new?examInfoId=112322&#39;"><a
									href="https://admin.kaoshixing.com/admin/result/mgr_new?examInfoId=112322">0人已考</a></li>
							</ul>
						</div>


					</div>

					<!-- 正在进行 结束 -->

					<!-- 最近添加 开始 -->

					<div class="exam_near_wrapper">
						<div class="top_wrapper">
							<div class="exam_near_top">
								<h1 class="exam_near_title">最近添加（1）</h1>
								<span class="see_all"><a
									href="https://admin.kaoshixing.com/admin/exam_mgr_new">查看全部<i
										class="icons8-forward"></i></a></span>
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
									onclick="document.location=&#39;https://admin.kaoshixing.com/admin/exam/update/112322&#39;"><a
									href="https://admin.kaoshixing.com/admin/exam/update/112322"><i
										class="icons8-edit"></i></a></li>
								<li class="examed_total" data-toggle="tooltip"
									data-placement="top" data-container="body"
									data-original-title="成绩查询批改"
									onclick="document.location=&#39;https://admin.kaoshixing.com/admin/result/mgr_new?examInfoId=112322&#39;"><a
									href="https://admin.kaoshixing.com/admin/result/mgr_new?examInfoId=112322">0人已考</a></li>
							</ul>
						</div>


						<div class="create_new_wrapper" style="width: 542px;">
							<div class="page_exam_create animate"
								onclick="document.location=&#39;https://admin.kaoshixing.com/admin/paper_add_new&#39;;">
								<ul class="exam_create_wrapper">
									<li class="exam_create_btn"><a
										href="https://admin.kaoshixing.com/admin/paper_add_new"><i
											class="icons8-plus-filled"></i></a></li>
									<li class="exam_create_prompt">创建新考试</li>
								</ul>
							</div>

							<div class="create_new_prompt animate">
								<div class="prompt_wrapper">
									<div class="prompt_word">点击这里，创建新的考试。</div>
									<a class="already_known">下一步--&gt;</a>
								</div>
							</div>
						</div>

					</div>
					<!-- 最近添加 结束 -->
				</div>
			</div>
		</div>
	</div>

	<!--超管后台新版本通知-->
	<div class="modal fade" id="changeLogModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-600 change-log-modal" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div class="title"></div>
					<div class="version"></div>
				</div>
				<div class="modal-body">
					<div class="content"></div>
					<div class="btn-row">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							id="getChangeBtn">知道了</button>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="okModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-share" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">考试链接</h4>
				</div>
				<div class="modal-body">
					<div class="qr-code">
						<div id="invite-link-qrcode" class="invite-link-qrcode"></div>
						<div class="download-qrcode">
							<p class="qrcode-prompt">微信扫码后可直接考试</p>
							<!-- <a id="downloadImgLink"><img src="/admin/static/newVersion/images/download_erweima.png" style="margin:25px 0"></a> -->
							<div class="btn-group">
								<button type="button"
									class="btn btn-default btn-download dropdown-toggle"
									data-toggle="dropdown">
									下载<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a download-size="0" class="downloadImgLink"
										href="https://admin.kaoshixing.com/account/admin/index#">小</a></li>
									<li><a download-size="1" class="downloadImgLink"
										href="https://admin.kaoshixing.com/account/admin/index#">中</a></li>
									<li><a download-size="2" class="downloadImgLink"
										href="https://admin.kaoshixing.com/account/admin/index#">大</a></li>
								</ul>
							</div>
							<span id="small" style="display: none;"></span> <span id="medium"
								style="display: none;"></span> <span id="large"
								style="display: none;"></span>
						</div>
					</div>
					<div class="guide">
						<span class="address">考试地址：<span id="exam_url"></span></span>
						<button type="button" data-clipboard-target="#exam_url"
							class="btn btn-default btn-copy">复制链接</button>
					</div>
					<div step="6" class="guide guide-pwd hidden">
						<span class="address">考试密码：<span id="exam_password"></span></span>
						<button type="button" class="btn btn-default btn-copy"
							id="copyPasswordLink" data-clipboard-target="#exam_password">复制考试密码</button>
					</div>
					<form
						action="https://admin.kaoshixing.com/admin/exam_email_notice/"
						name="form" method="post" id="sendForm" class="sendForm">
						发送考试通知:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							name="sendEmail" type="checkbox" id="email" class="email"
							value="1"> 邮件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							name="sendMessage" type="checkbox" id="message" class="message"
							value="1"> 短信 <i class="help-tips"> ?
							<div class="notificationTips">
								<h4>什么是"发送考试通知"?</h4>
								<p>
									将会发送考试的日期、时间、考试名称和考试链接给考生。支持对已验证邮箱的考生发送邮件,和对已预留手机号的考生发送短信,如无考生联系方式,将无法送达。发送短信时,第三方供应商将会收取一定的费用。<a
										href="https://admin.kaoshixing.com/account/admin_pay_center">去充值-&gt;</a>
								</p>
								<div>
									<img src="./admin_index_files/SMS_notification.png">
									<div class="notification">
										<p class="notificationContent"></p>
										<p class="notificationUrl"></p>
									</div>
								</div>
							</div>
						</i>



					</form>
					<div class="btn-div">
						<button type="button" class="btn btn-primary btnOk">确定</button>
						<button id="trial-link" class="btn btn-warning"></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sendAnimation">消息发送中...群发完成后您将在消息中心收到提醒</div>
	<div class="spinner-wrapper hidden" id="animationLoading">
		<div class="spinner">
			<div class="rect1"></div>
			<div class="rect2"></div>
			<div class="rect3"></div>
			<div class="rect4"></div>
			<div class="rect5"></div>
		</div>
	</div>



	<script type="text/javascript" src="../js/jquery.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/jquery.bootgrid-ksx.js"></script>
	<script type="text/javascript" src="../js/bootstrap-dialog.min.js"></script>
	<script type="text/javascript" src="../js/colResizable-1.6.min.js"></script>
	<script type="text/javascript" src="../js/admin-base.js"></script>

	<script type="text/javascript" src="../js/pikaday.js"></script>
	<script type="text/javascript" src="../js/pikaday.jquery.js"></script>
	<script src="../js/jquery.qrcode.min.js"></script>
	<script src="../js/clipboard.min.js"></script>






</body>
</html>