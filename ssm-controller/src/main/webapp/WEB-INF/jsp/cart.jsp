<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="static/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/vendor/perfect-scrollbar/perfect-scrollbar.css">
	
		<link rel="stylesheet" type="text/css" href="static/css/util3.css">
	<link rel="stylesheet" type="text/css" href="static/css/main3.css">

      <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
<nav class="navbar navbar-light" style="background-color: #D3D3D3;">
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal_add">购物车</button>
<!--   <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal_delete">Middle</button>
  <button type="button" class="btn btn-outline-dark"data-toggle="modal" data-target="#myModal_change">Right</button> -->
	<%-- <button  class="btn "><span class="badge badge-dark">${user.name}</span> </button> --%>
</div>
 

    <!-- <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" id="condition" type="text" placeholder="Search">
      <button class="btn btn-outline-dark my-2 my-sm-0" id="search" type="button" >Search</button>
    
    </form> -->
   

</nav>
<div class="container">
<div class="stepwizard">
    <div class="stepwizard-row setup-panel">
        <div class="stepwizard-step">
            <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
            <p>Step 1</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-2" type="button" class="btn btn-default btn-circle disabled">2</a>
            <p>Step 2</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-3" type="button" class="btn btn-default btn-circle disabled">3</a>
            <p>Step 3</p>
        </div>
    </div>
</div>
<form role="form" id="form">
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-11">
               
                <!-- <div class="form-group">
                    <label class="control-label">Email</label>
                    <input  maxlength="100" type="email" required class="form-control" placeholder="Enter Email Address" id="firstName"/>
                </div>
                <div class="form-group">
                    <label class="control-label">Last Name</label>
                    <input maxlength="100" type="text" required="required" class="form-control" placeholder="Enter Last Name" />
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div> -->
            <div class="table100 ver5 m-b-110 form-group">
					<div class="table100-head form-control">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Name</th>
									<th class="cell100 column2">Price</th>
									
									<th class="cell100 column4">Image</th>
									<th class="cell100 column5">Counter</th>
									
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll form-control">
						<table>
							<tbody>
							<c:forEach items="${goodlist}" var="goods">
							<tr class="row100 body">
								<td class="cell100 column1">${goods.name}</td>
								<td class="cell100 column2" id="price${goods.id}">${goods.price}</td>
								
								<td class="cell100 column4"><img name="pic" alt="" src="static/images/${goods.img }" style="width:20%;height:auto"></td>
								<td class="cell100 column5">
								<div class="gw_num">
								   <em class="jian" id="jian${goods.id}">-</em>
								   <input id="counter${goods.id}" type="text" value="${goods.num }" class="num"/>
								   <em class="add" id="add${goods.id}">+</em>
								</div>
								
								
								</td>
								
								
							</tr>
							</c:forEach>
							</tbody>
							</table>
							
							
        </div>
        <h1>总价</h1><div id="s">${sum}</div>
        
        </div>
        </div>
         <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
        </div>
        
    </div>
    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-11"> 
               
                <div class="form-group">
                    <label class="control-label">收货地址</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Address"  />
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-14">
               
                <p>输入用户密码，成功购物</p>
                <button class="btn btn-success pull-right" type="submit">Finish!</button>
            </div>
        </div>
    </div>
    </form></div>

</body>
	 <script src="static/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/tooltipster/3.3.0/js/jquery.tooltipster.min.js'></script>
<script src='https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js'></script>
	<script src="static/vendor/select2/select2.min.js"></script>
	
	
	<script src="static/js/main.js"></script>
<script  src="static/js/index.js"></script>
<script>



$(document).ready(function(){
	
      
	 //加的效果
	 $(".add").click(function(event){
		 var Id = event.target.id;
		
		 var reg = /\d+/g;
	     var ms = Id.match(reg)
	     
	     var id = ms[0];
	     if(id!=null){
	     var price =  document.getElementById("price"+id).innerHTML;
	     var num = $('#counter'+id).val()+1;
	     
	     document.getElementById("s").innerHTML = parseInt(document.getElementById("s").innerHTML)+parseInt(price);
	     }
	   var n=$(this).prev().val();
	   var num=parseInt(n)+1;
	   if(num==0){ return;}
	      $(this).prev().val(num);
	     
	 });
	 //减的效果
	 $(".jian").click(function(event){
		 var Id = event.target.id;
		
		 var reg = /\d+/g;
	     var ms = Id.match(reg)
	     
	     var id = ms[0];
	    
	     if(id!=null){
		     
	     var price =  document.getElementById("price"+id).innerHTML;
	   
	     var num = $('#counter'+id).val()-1;
	    
	     document.getElementById("s").innerHTML = parseInt(document.getElementById("s").innerHTML)-parseInt(price);
		    
	     }
	   var n=$(this).next().val();
	   var num=parseInt(n)-1;
	   if(num==0){ return}
	   $(this).next().val(num);
	  });
	  });
</script>
</html>