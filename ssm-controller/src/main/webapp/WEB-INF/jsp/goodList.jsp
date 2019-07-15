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
	<link rel="stylesheet" type="text/css" href="static/css/jquery-confirm.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet" type="text/css">
	<style>
	a:link,a:visited{color:#444;text-decoration:none;}
a:hover{color:#555555;}
	</style>
	 <style>
  /* Make the image fully responsive */
  .carousel-inner img {
     width: 100%;
      height: 100%;
     
     
  }
  </style>
</head>

<body>
  <!-- 模态框 -->
  <div class="modal fade" id="myModal_add">
    <div class="modal-dialog">
      <div class="modal-content">
   
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 id="tc" class="modal-title">增加</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body">
          <form role="form">
	<div class="form-group">
		<label for="name">商品名称</label>
		<input type="text" class="form-control" id="cname" 
			   placeholder="请输入商品名称">
	</div>
	<div class="form-group">
		<label for="name">商品价格</label>
		<input type="number" class="form-control" id="cprice" 
			   placeholder="请输入商品价格">
	</div>
	<div class="form-group">
		<label for="name">商品数量</label>
		<input type="number" class="form-control" id="cnum" 
			   placeholder="请输入商品数量">
	</div>
	<div class="form-group">
		<label for="inputfile">上传图片</label>
		<input type="file" id="inputfileimg">
	</div>
</form>
        </div>
   
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="button" id="commit" class="btn btn-secondary" data-dismiss="modal">提交增加</button>
           <button type="button" id="commit1" class="btn btn-secondary" data-dismiss="modal">提交修改</button>
        </div>
   
      </div>
    </div>
  </div>
<div class="modal fade" id="myModal_search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">查询结果</h4>
            </div>
            <div class="modal-body">
         <div id="shead"></div>
         <div id="scontent"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-dark">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<nav class="navbar navbar-light" style="background-color: #D3D3D3;">
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-outline-dark" data-toggle="modal" id="add">增加</button>
<!--   <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal_delete">Middle</button>
  <button type="button" class="btn btn-outline-dark"data-toggle="modal" data-target="#myModal_change">Right</button> -->
	<button  class="btn "><span class="badge badge-dark">${user.name}</span> </button>
</div>
 

    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" id="condition" type="text" placeholder="Search">
      <button class="btn btn-outline-dark my-2 my-sm-0" id="search" type="button" >Search</button>
    
    </form>
   

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
									<th class="cell100 column5">Operation</th>
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
								<td class="cell100 column4"><img name="pic" alt="" src="http://localhost:8080/ssm-controller/static/images/${goods.img }" style="width:20%;height:auto"></td>
								<td class="cell100 column5"><button id="acc${goods.id}"type="button" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-user"></span> Modify</button>
								<button id="delete${goods.id}" type="button" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-user"></span> Delete</button></td>
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
									      <li class="page-item"><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3;" href="goodsList?pageNum=${ls.pageNum-1}" tabindex="-1" aria-disabled="true">Previous</a></li>
									      </c:otherwise>
									    </c:choose>
										
										<c:forEach begin="1" end="${ls.pages }" var="i">
										  <c:choose>
										    <c:when test="${i==ls.pageNum }">
										    <li class="page-item active" aria-current="page"><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3;" href="goodsList?pageNum=${i}">${i} <span class="sr-only">(current)</span></a></li>
										    </c:when>
										    <c:otherwise>
										    <li class="page-item"><a class="page-link btn btn-outline-dark" style="background-color: #D3D3D3;" href="goodsList?pageNum=${i}">${i }</a></li>
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
	 <script src="static/js/jquery-confirm.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
	 <script type="text/javascript">
    $('#search').click(function(){
        var content = $("#condition").val();
        var tempAreaHtmlhead='';
        var temAreaContent='';
        $.ajax({
            url:'fuzzySearch',
                type:'POST',
                data:{
                    "condition":content
                },
               
                cache:false,
                success:function(data){

                    if (data.success){
                       toastr.success("查询成功!");
                       tempAreaHtmlhead=' <div class="table100-head">'+
   						'<table>'+
						'<thead>'+
							'<tr class="row100 head">'+
								'<th class="cell100 column1">Name</th>'+
								'<th class="cell100 column2">Price</th>'+
								'<th class="cell100 column3">amount</th>'+
								'<th class="cell100 column4">Image</th>'+
							'</tr>'+
						'</thead>'+
					'</table>'+
				'</div></br>';
				var i=0;
				var List = data.goodlist;
				temAreaContent+='<div class="table100-body js-pscroll">'+'<table><tbody>';
                       data.goodlist.map(function(item,index) {
                           
                    	   temAreaContent+='<tr class="row100 body">'+'<td class="cell150 column1">'+
                           item.name+'</td><td class="cell100 column2">'+item.price+'</td><td class="cell100 column3">'+
                           item.num+'</td><td class="cell100 column4"><img name="pic" alt="" src="static/images/'+item.img+
                           '" style="width:40%;height:auto"></td></tr>';
                            }); 
                       temAreaContent+="</tbody></table></div>";
                     /*   jQuery.each(data.goodlist, function (i, item) {
                           alert(item.name);
                       }); */
                      
                       $('#shead').html(tempAreaHtmlhead);
                       $('#scontent').html(temAreaContent);
                       $('#myModal_search').modal("show");
                       //window.location = "success";
                    } else
                    {
                        toastr.error("查询失败!");
                        
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
               	 toastr.error("ajax异常:"+errorThrown);

                }
    })
        })
        
        $('#commit').click(function(){
            //alert("!!");
            var info={};
            //$('#tc').text("增加");
            info.name=$('#cname').val();
            info.price=$('#cprice').val();
            info.num=$('#cnum').val();
            var shopimg = $('#inputfileimg')[0].files[0];
            var formData = new FormData();
            formData.append('img',shopimg);
            formData.append('good',info);
        	 $.ajax({
                 url:'insertShop?name='+info.name+'&price='+info.price+'&num='+info.num,
                     type:'POST',
                     data:formData,
                     dataType:'json',
                     contentType:false,
                     processData:false,
                     cache:false,
                     success:function(data){

                         if (data.success){
                            toastr.success("增加成功!");
                           // window.location = "goodsList";
                            $('#myModal_add').modal('hide');
                         } else
                         {
                             toastr.error("增加失败!");
                             
                         }
                     },
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                       	 toastr.error("ajax异常:"+errorThrown);

                        }
        	 })
            })
    </script>
    <script>
    $("#add").click(function(event){
    	  $('#commit1').attr('disabled','disabled');
    	  $('#commit').attr('disabled',false);
        $('#tc').text("增加");
    	 $('#myModal_add').modal('show');
    	 $('#cname').val("");
         $('#cprice').val("");
         $('#cnum').val("");
        })
    $("button").click(function(event){
        var Id = event.target.id;
       //alert("通过 " + event.target.id + " 元素触发。");
       var reg = /\d+/g;
       var ms = Id.match(reg)
       //alert(ms[0])
       var id = ms[0];
       if(id!=null){
       if(Id.indexOf("delete")!=-1)
           {
    	   $.confirm({
    		   icon: 'fa fa-spinner fa-spin',
    		    title: '确认删除?',
    		    buttons: {
    		        confirm: function () {
    		            // here the button key 'hey' will be used as the text.
    		            $.ajax({
                 url:'deleteGood',
                     type:'POST',
                     data:{
                         "id":ms[0]
                         },
                     cache:false,
                     success:function(data){

                         if (data.success){
                            
                            
                            //window.location.reload();
                            toastr.success("删除成功!");
                           // window.location = "goodsList";
                           // $('#myModal_add').modal('hide');
                         } else
                         {
                             toastr.error("删除失败!");
                             
                         }
                     },
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                       	 toastr.error("ajax异常:"+errorThrown);

                        }
        	 })
    		          
    		        },
    		        cancel: {
    		            text: 'cancel', // With spaces and symbols
    		            action: function () {
    		                $.alert('取消删除');
    		            }
    		        }
    		    }
    		});
          
           
         
           
           }
       if(Id.indexOf("acc")!=-1)
           {
           var k=0;
          // alert("修改")
           $.getJSON("initgoods?id="+ms[0]+"&name",function(data){

            if(data.success){
                k=1;
                var good = data.good;
                $('#tc').text("修改")
               
                $('#cname').val(good.name);
                $('#cprice').val(good.price);
                $('#cnum').val(good.num);
                $('#commit1').attr('disabled',false);
                $('#commit').attr('disabled','disabled');
            }
            else {
                alert('fail ')
            }

        });
          $('#myModal_add').modal('show');
          
        	  $('#commit1').click(function(){
            	 // alert("修改");
        	  var info={};
        	  
             
              info.name=$('#cname').val();
              info.price=$('#cprice').val();
              info.num=$('#cnum').val();
              var shopimg = $('#inputfileimg')[0].files[0];
              var formData = new FormData();
              if(shopimg!=null){
              formData.append('img',shopimg);
              }
              formData.append('good',JSON.stringify(info));
              if(k==1){
           $.ajax({
                 url:'updateGoods?id='+ms[0]+'&name='+info.name+'&price='+info.price+'&num='+info.num,
                     type:'POST',
                     data:formData,
                         dataType:'json',
                         contentType:false,
                         processData:false,
                         cache:false,
                     success:function(data){

                         if (data.success){
                            toastr.success("修改成功!");
                            window.location.reload();
                           // window.location = "goodsList";
                           // $('#myModal_add').modal('hide');
                         } else
                         {
                             toastr.error("修改失败!");
                             
                         }
                     },
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                       	 toastr.error("ajax异常:"+errorThrown);

                        }
        	 })
              }
        	  })
          
           }
       }
    });
    </script>
	
</body>
</html>