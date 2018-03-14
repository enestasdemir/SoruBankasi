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
					<div class="card-header">Seçenek Ekle</div>
					<div class="card-body">
						<h5 class="card-title">${ soru }</h5>

						<form action='<s:url value="/secenekal"></s:url>' method="post">
							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="secenekfor">Seçenek</label> <input type="text"
										class="form-control" id="secenekfor" name="secenek"
										placeholder="Seçenek giriniz...">
								</div>
								<div class="form-group col-md-4">
									<label for="yanitfor">Yanıt</label> <select id="yanitfor"
										class="form-control" name="yanit">
										<option selected value="0">Yanlış</option>
										<option value="1">Doğru</option>
									</select>
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Ekle</button>
						</form>

					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card" style="max-width: 30rem;">
					<div class="card-header">Seçenekler</div>
					<div class="card-body">
						<c:if test="${ not empty sls }"></c:if>

						<table class="table table-hover table-sm">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Seçenek</th>
									<th scope="col">Durum</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${ sls }">
									<tr>
										<th scope="row">${ item.getSeid() }</th>
										<td>${ item.getSecenek() }</td>
										<td>${ item.getDurum() }</td>
										<td><a
											href='<s:url value="/seceneksil/${ item.getSeid() }"></s:url>'>
												<span class="badge badge-danger">Sil</span>
										</a></td>
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