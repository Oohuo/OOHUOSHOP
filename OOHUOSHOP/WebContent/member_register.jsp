<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/icd_meta.jsp" />
<title>哦豁商城-注册会员</title>
<script language="JavaScript" type="text/JavaScript">
	function loginCheck() {
		if (loginForm.verification2.value == "") {
			alert("验证码不能为空，请输入验证码！");
			loginForm.verification2.focus();
			return false;
		}
		if (loginForm.verification2.value != loginForm.verification1.value) {
			alert("验证码错误！");
			loginForm.verification2.focus();
			return false;
		}

		return true;

	}
</script>
<jsp:include page="/icd_link.jsp" />
</head>
<body>
	<jsp:include page="/icd_top.jsp"></jsp:include>

	<!-- 主内容 -->
	<div class="wrapper" style="min-height: 500px;">
		<div class="panel" style="margin-top: 20px">
			<div class="panel-heading" style="font-size: 18px">
				<strong>会员注册</strong>
			</div>
			<div class="panel-body row">
				<div class="col-xs-3"></div>

				<div class="col-xs-6" style="padding: 30px 60px">
					<div class="panel" style="border: none;">
						<div class="panel-heading" style="background: none;">
							<strong>欢迎注册成为会员</strong>
						</div>
						<div class="panel-body">
							<form name="loginForm" action="${ctx}/member_register"
								method="post" onsubmit="return loginCheck();">
								<c:if test="${!empty msg}">
									<div class="form-group">
										<div id="formError" class="alert alert-danger">${msg}</div>
									</div>
									<c:remove var="msg" />
								</c:if>
								<c:if test="${!empty zhanghao}">
									<div class="form-group">
										<input type="text" name="mobile" id="mobile"
											value="${zhanghao}" placeholder="请输入手机号"
											class="form-control input-lg">
									</div>
								</c:if>
								<c:if test="${empty zhanghao}">
									<div class="form-group">
										<input type="text" name="mobile" id="mobile" value=""
											placeholder="请输入手机号" class="form-control input-lg">
									</div>
								</c:if>
								<div class="form-group">
									<input type="password" name="pwd" id="password" value=""
										placeholder="请输入密码" class="form-control input-lg">
								</div>
								<div class="form-group">
									<input type="password" name="pwd2" id="password" value=""
										placeholder="请再输入密码" class="form-control input-lg">
								</div>
								<%
									//获取随机数
									int num1 = (int) (Math.random() * 10);
									int num2 = (int) (Math.random() * 10);
									int num3 = (int) (Math.random() * 10);
									int num4 = (int) (Math.random() * 10);

									String num = num1 + "" + num2 + num3 + num4;
								%>
								<div class="form-group">
									<input name="verification1" type="hidden" value="<%=num%>" />
									<input name="verification2" type="text" placeholder="   请输入验证码"
										style="width: 285px; height: 43px;"> <img
										src="image/<%=num1%>.png" /> <img src="image/<%=num2%>.png" />
									<img src="image/<%=num3%>.png" /> <img
										src="image/<%=num4%>.png" />

								</div>

								<button type="submit" class="btn btn-primary btn-wider btn-lg">注册</button>
								&nbsp; &nbsp;
								<button type="reset" class="btn btn-wider btn-lg">重置</button>
							</form>
						</div>
					</div>
				</div>

				<div class="col-xs-3"></div>

			</div>
		</div>
	</div>
	<!-- /主内容 -->

	<jsp:include page="/icd_bottom.jsp"></jsp:include>

	<script src="${ctx}/zui/lib/jquery/jquery.js"></script>
	<script src="${ctx}/js/jquery.scrollUp.min.js"></script>
	<script src="${ctx}/zui/js/zui.js"></script>
	<script src="${ctx}/js/my.js"></script>
</body>
</html>