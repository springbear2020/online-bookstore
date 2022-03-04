<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>尚硅谷会员登录页面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        // 页面加载完成之后
        $(function () {

            // 给注册按钮添加事件
            $("#sub_btn").click(function () {

                // 获取用户名
                let usernameValue = $("#username").val();
                // 验证用户名是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
                let usernameReg = /^\w{5,15}$/;
                // 验证用户信息
                if (!usernameReg.test(usernameValue)) {
                    // 提示用户
                    $("span.errorMsg").text("用户名不合法！");
                    return false;
                }

                // 获取密码
                let passwordValue = $("#password").val();
                // 验证密码是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
                let passwordReg = /^\w{5,15}$/;
                // 验证用户信息
                if (!passwordReg.test(passwordValue)) {
                    // 提示用户
                    $("span.errorMsg").text("密码不合法！");
                    return false;
                }

                // 阻止表单提交
                return true;
            });

        });
    </script>
</head>
<body>
<div id="login_header">
    <img class="logo_img" alt="" src="static/img/logo.gif">
</div>

<div class="login_banner">

    <div id="l_content">
        <span class="login_word">欢迎登录</span>
    </div>

    <div id="content">
        <div class="login_form">
            <div class="login_box">
                <div class="tit">
                    <h1>尚硅谷会员</h1>
                    <a href="pages/user/register.jsp">立即注册</a>
                </div>
                <div class="msg_cont">
                    <b></b>
                    <span class="errorMsg">
                        ${ empty requestScope.msg ? "请输入用户名和密码":requestScope.msg}
                    </span>
                </div>
                <div class="form">
                    <form action="userServlet" method="post">
                        <label>用户名称：</label>
                        <label for="username"></label><input value="admin" class="inputText" type="text"
                                                             placeholder="请输入用户名" autocomplete="off"
                    <%-- value="${ requestScope.username }"--%>
                                                             tabindex="1" name="username" id="username"/>
                        <br/>
                        <br/>
                        <label>用户密码：</label>
                        <label for="password"></label><input class="inputText" type="password" placeholder="请输入密码"
                                                             autocomplete="off" tabindex="1"
                                                             name="password" id="password" value="admin"
                    />
                        <br/>
                        <br/>
                        <input type="submit" value="登录" id="sub_btn"/>
                        <input type="hidden" name="action" value="login"/>

                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

<%@include file="/pages/common/footer.jsp" %>

</body>
</html>