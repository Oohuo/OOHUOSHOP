<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/icd_meta.jsp" />
<title>会员-密码修改</title>
<jsp:include page="/icd_link.jsp" />
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
</head>
<body>
	<jsp:include page="/icd_top.jsp"></jsp:include>
	<%
		//获取随机数
		int num1 = (int) (Math.random() * 10);
		int num2 = (int) (Math.random() * 10);
		int num3 = (int) (Math.random() * 10);
		int num4 = (int) (Math.random() * 10);

		String num = num1 + "" + num2 + num3 + num4;
	%>

	<!-- 主内容 -->
	<div class="wrapper" style="min-height: 500px">
		<!--  -->
		<div class="row" style="padding: 20px 0px;">
			<!-- /左边 -->
			<div class="col-xs-2">
				<jsp:include page="/member/icd_menu.jsp">
					<jsp:param value="pwd" name="tag" />
				</jsp:include>
			</div>
			<!-- /左边 -->

			<!-- 右边 -->
			<div class="col-xs-10">
				<div class="panel">
					<div class="panel-heading">
						<strong><i class="icon-user"></i> 修改密码</strong>
					</div>
					<div class="panel-body">
						<form action="${ctx}/member/changepwd" method="post"
							class="form-horizontal" onsubmit="return loginCheck();">
							<c:if test="${!empty msg}">
								<div class="form-group">
									<div id="formError" class="alert alert-danger">${msg}</div>
								</div>
								<c:remove var="msg" />
							</c:if>
							<div class="form-group">
								<label class="col-xs-2 control-label">会员名：</label>
								<div class="col-xs-4">${sessionScope.curr_mbr.mobile}</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label">原密码：</label>
								<div class="col-xs-4 required">
									<input type="password" name="pwd" id="pwd" placeholder="请输入原密码"
										class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-2 control-label">新密码：</label>
								<div class="col-xs-4 required">
									<input type="password" name="pwd2" id="pwd2"
										placeholder="请输入新密码" class="form-control" />
								</div>
							</div>
							<div class="form-group">
							<label class="col-xs-2 control-label">验证码： </label>
									<input name="verification1" type="hidden" value="<%=num%>"  />
									<input name="verification2" type="text" placeholder="   请输入验证码"
										style="width: 145px; height: 32px;"> 
										<img src="http://localhost:8080/OOHUOSHOP/image/blue/<%=num1%>.png" /> 
										<img src="http://localhost:8080/OOHUOSHOP/image/yellow/<%=num2%>.png" />
									    <img src="http://localhost:8080/OOHUOSHOP/image/red/<%=num3%>.png" />
									    <img src="http://localhost:8080/OOHUOSHOP/image/green/<%=num4%>.png" />

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