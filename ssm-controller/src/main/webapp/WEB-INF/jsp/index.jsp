<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login V14</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="static/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="static/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="static/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="static/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="static/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="static/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="static/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="static/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="static/css/util.css">
<link rel="stylesheet" type="text/css" href="static/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="static/css/dragverify.css"/>

<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<div class="login100-form validate-form flex-sb flex-w"
					>
					<span class="login100-form-title p-b-32"> Welcome! </span> <span
						class="txt1 p-b-11"> 用户名 </span><a class="txt3" onclick="next()">  </a>
					<div class="wrap-input100 validate-input m-b-36"
						data-validate="Username is required">
						<input class="input100" type="text" name="name" id="name"> <span
							class="focus-input100"></span>
					</div>

					<span class="txt1 p-b-11"> 密码 </span>
					<div class="wrap-input100 validate-input m-b-12"
						data-validate="Password is required">
						<span class="btn-show-pass"> <i class="fa fa-eye"></i>
						</span> <input class="input100" type="password" name="pass" id="pass"> <span
							class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-b-48">
						<div class="contact100-form-checkbox"></div>
							<div id="dragverify"></div>
						<div>
							<a href="#" class="txt3" onclick="next()"> 注册账号 </a>
							<script type="text/javascript">function next(){window.location = "toRegister";}</script>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="log" onclick="go()">登录</button>
					</div>

				</div>
			</div>
		</div>
	</div>

<script></script>

	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="static/vendor/jquery/jquery-3.2.1.min.js"></script>
	
    <script type="text/javascript" src="static/js/dragverify.js"></script>
	<!--===============================================================================================-->
	<script src="static/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="static/vendor/bootstrap/js/popper.js"></script>
	<script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="static/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="static/vendor/daterangepicker/moment.min.js"></script>
	<script src="static/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="static/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="static/js/main.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
		<script type="text/javascript">


	function go(){
		var info={};
		info.name=$("#name").val();
		info.pass=$("#pass").val();
		
	if(flag==1){

	$.ajax({
        url:'login',
            type:'POST',
            data:JSON.stringify(info),
            contentType:"application/json;utf-8",
            cache:false,
            success:function(data){

                if (data.success){
                   toastr.success("登录成功!");
                   //window.location = "goodsList";
                   if(data.admin){
                	   window.location = "goodsList";
                       }
                   else{
                   window.location="usergoods";
                       }
                } else
                {
                    toastr.error("登录失败!");
                    
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
           	 toastr.error("ajax异常:"+errorThrown);

            }
})

}
	else{ toastr.warning("请拖动滑块");
	}
}

	</script>

</body>
</html>