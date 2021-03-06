<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>

    <%@include file="/pages/common/head.jsp" %>

    <script type="text/javascript">
        // 页面加载完成之后
        $(function () {
            // 给返回登录按钮绑定单击事件
            $("#back_login").click(function () {
                location.href = "${basePath}pages/user/login.jsp"
            });

            // 给用户名输入框绑定失去焦点事件
            $("#username").blur(function () {
                let username = this.value;
                $.getJSON("${basePath}userServlet", "action=ajaxExistsUsername&username=" + username, function (data) {
                    if (data.existence == true) {
                        $("span.errorMsg").text("用户名已存在，请重新输入");
                    } else {
                        $("span.errorMsg").text("用户名可用");
                    }
                });
            });

            // 给验证码图片绑定单击事件
            $("#code_img").click(function () {
                // 在事件响应的 function 函数中有一个 this 对象。这个 this 对象是当前正在响应事件的 dom 对象
                this.src = "${basePath}verifyCode.jpg?date=" + new Date();
            });

            // 给注册按钮添加事件，检查各表单项数据是否合法
            $("#sub_btn").click(function () {

                // 验证用户名是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
                let usernameValue = $("#username").val();
                let usernameReg = /^\w{5,15}$/;
                if (!usernameReg.test(usernameValue)) {
                    $("span.errorMsg").text("用户名不合法！");
                    return false;
                }

                // 验证密码是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
                let passwordValue = $("#password").val();
                let passwordReg = /^\w{5,15}$/;
                if (!passwordReg.test(passwordValue)) {
                    $("span.errorMsg").text("密码不合法！");
                    return false;
                }

                // 验证两次输入的密码是否一致
                let repeatPwdValue = $("#repeatPwd").val();
                if (passwordValue !== repeatPwdValue) {
                    $("span.errorMsg").text("确认密码和密码不一致！");
                    return false;
                }

                // 验证邮件地址是否合法
                let emailValue = $("#email").val();
                let emailReg = /^([a-z0-9_-]+)@([\da-z-]+)\.([a-z]{2,6})$/;
                if (!emailReg.test(emailValue)) {
                    // 提示用户
                    $("span.errorMsg").text("邮件输入不合法！");
                    return false;
                }

                // 图片验证码不允许为空
                let codeValue = $("#code").val();
                if (codeValue === "") {
                    $("span.errorMsg").text("验证码不能为空！")
                    return false;
                }

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
        <span class="login_word">欢迎注册</span>
    </div>

    <div id="content">
        <div class="login_form">
            <div class="login_box">
                <div class="tit">
                    <h1>欢迎您加入尚书房</h1>
                    <span class="errorMsg">${requestScope.msg}</span>
                </div>
                <div class="form">
                    <form action="userServlet" method="post">
                        <label>用户名称：</label>
                        <label for="username"></label><input class="inputText" type="text" placeholder="请输入用户名"
                                                             autocomplete="off" tabindex="1" name="username"
                                                             id="username" value="${requestScope.username}"/>
                        <br/>
                        <br/>
                        <label>用户密码：</label>
                        <label for="password"></label><input class="inputText" type="password" placeholder="请输入密码"
                                                             autocomplete="off" tabindex="1" name="password"
                                                             id="password"/>
                        <br/>
                        <br/>
                        <label>确认密码：</label>
                        <label for="repeatPwd"></label><input class="inputText" type="password" placeholder="确认密码"
                                                              autocomplete="off" tabindex="1" name="repeatPwd"
                                                              id="repeatPwd"/>
                        <br/>
                        <br/>
                        <label>电子邮件：</label>
                        <label for="email"></label><input class="inputText" type="text" placeholder="请输入邮箱地址"
                                                          autocomplete="off" tabindex="1" name="email" id="email"
                                                          value="${requestScope.email}"/>
                        <br/>
                        <br/>
                        <label>验证码：</label>
                        <label for="code"></label><input class="inputText" placeholder="请输入图片中的验证码" type="text"
                                                         style="width: 150px;" id="code" name="code"/>
                        <img id="code_img" alt="" src="verifyCode.jpg"/>
                        <br/>
                        <br/>
                        <input type="submit" value="立即注册" id="sub_btn"/>
                        <input type="button" value="返回登录" id="back_login">
                        <input type="hidden" name="action" value="register"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>