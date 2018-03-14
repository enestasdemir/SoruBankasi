<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sınav</title>
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
		<div class="row" style="margin:1%">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">

		
<c:if test="${not empty sonuclar }">

		<table class="table table-hover">
		 <thead>
    		<tr>
      			<th scope="col">Soru Numarası</th>
      			<th scope="col">Yanıtınız</th>
      			<th scope="col">Sonuç</th>
      			<th scope="col">Doğru Yanıt</th>
   			</tr>
  </thead>
<c:forEach var="item" items="${sonuclar}">

		<tr>
		<td>${item.getSayi()}</td>
		<td>${item.getYanit()}</td>
		<td>${item.getSonuc()}</td>
		<td>${item.getDogruYanit()}</td>
		</tr>
 		
  
</c:forEach></table>
<h6>Doğru Sayınız:</h6>${sayacDogru}<br>
<h6>Yanlış Sayınız:</h6>${sayacYanlis}<br>
<h6>Yanlış Sayınız:</h6>${sayacBos}<br>
</c:if>

<c:if test="${not empty i }">
			<div class="card" style="width: 18rem;">
  <div class="card-body">
   <h4> ${ sn }. Soru</h4>
   <b>
   <c:forEach var="item" items="${soru}">
   </b><br>Soru iceriği:<br>
	<b><p>${ item.getSoru()}
	</p></b>
  </div></div></c:forEach><br>
  
	 <div class="card" style="width: 18rem;">
  <div class="card-body">
	<form action='<s:url value="/sinav/${i}"></s:url>' method="post">

	<c:forEach var="item" items="${secenek}">
	
	<div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="${item.getSeid()}" name="yanit" class="custom-control-input" value="${item.getSecenek()}">
  <label class="custom-control-label" for="${item.getSeid()}">${item.getSecenek()}</label>
	</div><br>
	
	</c:forEach>
		<c:if test="${not empty secenek }">
	<input type="submit" value="Sonraki" class="btn btn-primary float-right">
	</c:if>
			<c:if test="${empty secenek }">
	<p>lütfen bu soruya seçenekler ekleyip sonra çözmeye devam edin.</p>
	</c:if>
	</form>
  </div>  </div>	
  
</c:if>	

   </div>
  
  <div class="col-sm-4">
 
</div>

</div>
</div>
</body>
</html>
