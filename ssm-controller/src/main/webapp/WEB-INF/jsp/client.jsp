<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goosList</title>
<link rel="stylesheet" type="text/css" href="static/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="static/css/util3.css">
	<link rel="stylesheet" type="text/css" href="static/css/main3.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet" type="text/css">
	<style>
	a:link,a:visited{color:#444;text-decoration:none;}
a:hover{color:#555555;}
	</style>
	 <style>
  
  .carousel-inner img {
     width: 100%;
      height: 100%;
     
     
  }
  .gw_num{border: 1px solid #dbdbdb;width: 110px;line-height: 26px;overflow: hidden;}
.gw_num em{display: block;height: 26px;width: 26px;float: left;color: #7A7979;border-right: 1px solid #dbdbdb;text-align: center;cursor: pointer;}
.gw_num .num{display: block;float: left;text-align: center;width: 52px;font-style: normal;font-size: 14px;line-height: 24px;border: 0;}
.gw_num em.add{float: right;border-right: 0;border-left: 1px solid #dbdbdb;}
  </style>
</head>

<body>
 
   
    


<nav class="navbar navbar-light" style="background-color: #D3D3D3;">
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-outline-dark" id="cart" >购物车<span class="badge-info" id="ba">0</span></button>


 <!-- <button type="button" class="btn btn-outline-dark"data-toggle="modal" data-target="#myModal_change">Right</button> -->
	<button  class="btn "><span id="uname" class="badge badge-dark">${user.name}</span> </button>
</div>
 

    <!-- <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" id="condition" type="text" placeholder="Search">
      <button class="btn btn-outline-dark my-2 my-sm-0" id="search" type="button" >Search</button>
    
    </form> -->
   

</nav>
<div>
<div id="demo" class="carousel slide" data-ride="carousel" style="">
 
  <!-- 指示符 -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  
   
  </ul>
 
  <!-- 轮播图片 -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="static/images/co1.jpg" class="img-responsive center-block">
    </div>
    <div class="carousel-item">
      <img src="static/images/co2.jpg" class="img-responsive center-block">
    </div>
    <div class="carousel-item">
      <img src="static/images/co3.jpg" class="img-responsive center-block"> 
    </div>
 
   
  </div>
 
  <!-- 左右切换按钮 -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
 
</div>
</div>

<div class="table100 ver5 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Name</th>
									<th class="cell100 column2">Price</th>
									<th class="cell100 column3">amount</th>
									<th class="cell100 column4">Image</th>
									<th class="cell100 column5">Counter</th>
									<th class="cell100 column6">Operation</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
							<c:forEach items="${ls.list}" var="goods">
							<tr class="row100 body">
								<td class="cell100 column1">${goods.name}</td>
								<td class="cell100 column2">${goods.price}</td>
								<td class="cell100 column3">${goods.num }</td>
								<td class="cell100 column4"><img name="pic" alt="" src="static/images/${goods.img }" style="width:20%;height:auto"></td>
								<td class="cell100 column5">
								<div class="gw_num">
								   <em class="jian">-</em>
								   <input id="counter${goods.id}" type="text" value="1" class="num"/>
								   <em class="add">+</em>
								</div>
								
								</td>
								<td>
								<button id="acc${goods.id}"type="button" class="btn btn-default btn-xs">
								<span class="glyphicon glyphicon-user">
								</span> Accede
								</button>
								</td>
								
							</tr>
						</c:forEach>
							<!-- <tr class="row100 body"> -->
							<td colspan="6" class="cell100 column1">
								<nav aria-label="...">
									<ul class="pagination">
									    <c:choose>
									      <c:when test="${ls.isFirstPage}">
									      <li class="page-item disabled"><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3;"  href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
									      </c:when>
									      <c:otherwise>
									      <li class="page-item"><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3;" href="usergoods?pageNum=${ls.pageNum-1}" tabindex="-1" aria-disabled="true">Previous</a></li>
									      </c:otherwise>
									    </c:choose>
										
										<c:forEach begin="1" end="${ls.pages }" var="i">
										  <c:choose>
										    <c:when test="${i==ls.pageNum }">
										    <li class="page-item active" aria-current="page"><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3;" href="usergoods?pageNum=${i}">${i} <span class="sr-only">(current)</span></a></li>
										    </c:when>
										    <c:otherwise>
										    <li class="page-item"><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3;" href="usergoods?pageNum=${i}">${i }</a></li>
										    </c:otherwise>
										  </c:choose>
										</c:forEach>
										
										<c:choose>
										  <c:when test="${ls.isLastPage}">
										  <li class="page-item  disabled"><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3;" href="#">Next</a></li>
										  </c:when>
										  <c:otherwise>
										  <li class="page-item "><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3; " href="goodsList?pageNum=${ls.pageNum+1}">Next</a></li>
										  </c:otherwise>
										</c:choose>
										
									</ul>
								</nav>
							</td>
						<!-- </tr> -->
								

							</tbody>
						</table>
					</div>
				</div>
	<script src="static/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="static/vendor/bootstrap/js/popper.js"></script>
	<script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="static/vendor/select2/select2.min.js"></script>
	
	
	<script src="static/js/main.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
	
        <script>

        $("#cart").click(function(){
        	 var uname = document.getElementById("uname").innerHTML;

        	 window.location = "cart?name="+uname;
            
            })
        $(document).ready(function(){
        	 //加的效果
        	 $(".add").click(function(){
        	   var n=$(this).prev().val();
        	   var num=parseInt(n)+1;
        	   if(num==0){ return;}
        	      $(this).prev().val(num);
        	 });
        	 //减的效果
        	 $(".jian").click(function(){
        	   var n=$(this).next().val();
        	   var num=parseInt(n)-1;
        	   if(num==0){ return}
        	   $(this).next().val(num);
        	  });});
        </script>
        <script>
        $("button").click(function(event){
        	var Id = event.target.id;
           
            var reg = /\d+/g;
            var ms = Id.match(reg)
            
            var id = ms[0];
            var name = document.getElementById("uname").innerHTML;
           
            if(id!=null){
            	
            
            $.ajax({
                url:'addcart',
                    type:'POST',
                    data:{
                        "name":name,
                        "gid":id,
                        "num":$('#counter'+id).val()
                        },
                     
                        cache:false,
                    success:function(data){

                        if (data.success){
                           toastr.success("已加入购物车!");
                           $("#ba").attr("class","badge-danger");
                          
                           var t =  document.getElementById("ba").innerHTML;
                           var num = parseInt(t)+1
                           $('#ba').html(num);
                           //$('#ba').val(t);
                           //window.location.reload();
                          // window.location = "goodsList";
                          // $('#myModal_add').modal('hide');
                        } else
                        {
                            toastr.error("加入购物车失败!");
                            
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                      	 toastr.error("ajax异常:"+errorThrown);

                       }
       	 })
            }
        })
        </script>
    
   
	
</body>
</html>