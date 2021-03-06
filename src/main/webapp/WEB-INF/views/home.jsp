<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Anasayfa</title>
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
<body style="background-image: url(https://news.efinancialcareers.com/wp-content/uploads/2012/08/exam_multiplechoice.jpg);">

<div class="container" align="center">
<div style="margin-top: 10%">

<div class="row">
<div class="col-sm-2"></div>

<div class="col-sm-3">
<div class="card border-info mb-3" style="width: 18rem;">
  <img class="card-img-top" src="https://studyportals-cdn2.imgix.net/555efdd9ee48c.jpg" height="160" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Sınava Başla</h5>
    <p class="card-text">Yeni bir sınav başlat.</p>
    <form action='<s:url value="/sinav/1"></s:url>' method="post">
  <input type="submit" value="Sınav Ol" class="btn btn-success">
</form>
  </div>
</div>
</div>

<div class="col-sm-2"></div>

<div class="col-sm-3">
<div class="card border-info mb-3" style="width: 18rem;">
  <img class="card-img-top" src="https://www.thechairmansbao.com/wp-content/uploads/2018/01/How-to-Study-for-an-Exam.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Soru Ekle</h5>
    <p class="card-text">Sınava yeni soru ekle.</p>
    <a href='<s:url value="soruekle"></s:url>'><button type="button" class="btn btn-primary">Soru Ekle</button></a><br/><br/>
  </div>
</div>
</div>

<div class="col-sm-2"></div>
</div>
</div>
</div>

</body>
</html>
