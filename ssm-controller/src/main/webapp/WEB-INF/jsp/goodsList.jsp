<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">

					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active"><a class="nav-link" href="#">Link <span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else
										here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="text" />
							<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
						</form>
						<ul class="navbar-nav ml-md-auto">
							<li class="nav-item active"><a class="nav-link" href="#">Link <span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
									link</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else
										here</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Separated link</a>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-sm table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>名字</th>
							<th>价格</th>
							<th>数量</th>
							<th>图片</th>
							<th>类型</th>
						</tr>
					</thead>
					<tbody>


						<c:forEach items="${ls.list}" var="goods">
							<tr>
								<td>${goods.id}</td>
								<td>${goods.name }</td>
								<td>${goods.price }</td>
								<td>${goods.num }</td>
								<td><img alt="" src="static/images/${goods.img }"></td>
								<td>${goods.type }</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6">
								<nav aria-label="...">
									<ul class="pagination">
									    <c:choose>
									      <c:when test="${ls.isFirstPage}">
									      <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
									      </c:when>
									      <c:otherwise>
									      <li class="page-item"><a class="page-link" href="goodsList?pageNum=${ls.pageNum-1}" tabindex="-1" aria-disabled="true">Previous</a></li>
									      </c:otherwise>
									    </c:choose>
										
										<c:forEach begin="1" end="${ls.pages }" var="i">
										  <c:choose>
										    <c:when test="${i==ls.pageNum }">
										    <li class="page-item active" aria-current="page"><a class="page-link" href="goodsList?pageNum=${i}">${i} <span class="sr-only">(current)</span></a></li>
										    </c:when>
										    <c:otherwise>
										    <li class="page-item"><a class="page-link" href="goodsList?pageNum=${i}">${i }</a></li>
										    </c:otherwise>
										  </c:choose>
										</c:forEach>
										
										<c:choose>
										  <c:when test="${ls.isLastPage}">
										  <li class="page-item  disabled"><a class="page-link" href="#">Next</a></li>
										  </c:when>
										  <c:otherwise>
										  <li class="page-item "><a class="page-link" href="goodsList?pageNum=${ls.pageNum+1}">Next</a></li>
										  </c:otherwise>
										</c:choose>
										
									</ul>
								</nav>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			   
			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/jquery/jquery-3.3.1.slim.min.js"></script>
	<script src="static/popper/popper.min.js"></script>
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>