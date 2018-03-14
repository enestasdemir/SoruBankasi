<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seçenek Ekle</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">

		<div class="row" style="margin-top: 20px">
			<div class="col-sm-6">

				<div class="card">
					<div class="card-header">Soru Ekle</div>
					<div class="card-body">
						<h5 class="card-title">Yeni soruyu aşağıya yazarak 'Kaydet'
							butonuna basınız.</h5>

						<form action='<s:url value="/sorual"></s:url>' method="post">
							<div class="form-group">
								<input type="text" class="form-control" name="soru"
									placeholder="Soru">
							</div>
							<button type="submit" class="btn btn-primary">Kaydet</button>
						</form>

					</div>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="card" style="max-width: 30rem;">
					<div class="card-header">Sorular</div>
					<div class="card-body">
						<c:if test="${ not empty ls }"></c:if>

						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Soru</th>
									<th scope="col"></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${ ls }">
									<tr>
										<th scope="row">${ item.getSid() }</th>
										<td>${ item.getSoru() }</td>
										<td><a href='<s:url value="/secenekekle/${ item.getSid() }"></s:url>'>
												<span class="badge badge-info">Seçenek Ekle</span></a>
										</td>
										<td>
											<a href='<s:url value="/sorusil/${ item.getSid() }"></s:url>'>
											<span class="badge badge-danger">Sil</span>
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>

	</div>
</body>
</html>
