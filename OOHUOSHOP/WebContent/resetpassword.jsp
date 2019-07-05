<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/icd_meta.jsp" />
<title>哦豁商城-找回密码</title>
<script language="JavaScript" type="text/JavaScript"> 
	function loginCheck() {
		if (loginForm.verification1.value == "") {
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
	<div class="wrapper" style="min-height: 500px">
		<!--  -->
		<div class="row" style="padding: 20px 0px;">
			<!-- /左边 -->
			
			<!-- /左边 -->

			<!-- 右边 -->
			<div class="col-xs-10">
				<div class="panel">
					<div class="panel-heading">
						<strong><i class="icon-user"></i> 修改密码</strong>
					</div>
					<div class="panel-body">
						<form action="${ctx}/forgetpwd" method="post"
							class="form-horizontal">
							<c:if test="${!empty msg}">
								<div class="form-group">
									<div id="formError" class="alert alert-danger">${msg}</div>
								</div>
								<c:remove var="msg" />
							</c:if>
							<div class="form-group">
								<label class="col-xs-2 control-label">手机号</label>
								<div class="col-xs-4 required">
									<input type="text" name="mobile" id="mobile" placeholder="请输入手机号"
										class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label">新密码</label>
								<div class="col-xs-4 required">
									<input type="password" name="fpwd" id="fpwd" placeholder="请输入新密码"
										class="form-control" />
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-10">
									<input type="submit" id="submit" class="btn btn-primary"
										style="min-width: 80px" value="保存" data-loading="稍候..." />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /右边 -->
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