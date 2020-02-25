<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wine Project Main</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Playball&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header" style="font-family: 'Playball' ; font-weight: bold;">
			<a class="navbar-brand" href="/">Red & White</a>
		</div>
		<ul class="nav navbar-nav">
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<li><a href="#">REVIEW</a></li>
			<li><a href="#">QnA</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
        	<li><a href="#">LOGIN</a></li>
        	<li><a href="#">JOIN US</a></li>
        	<li><a href="#">CART</a></li>
        	<li><a href="#">ORDER</a></li>
        	<li><a href="#">MY PAGE</a></li>
        	<li>
				<form class="navbar-form navbar-right" action="/action_page.php">
      				<div class="input-group">
        				<input type="text" class="form-control" placeholder="Search" name="search">
		        		<div class="input-group-btn">
		          			<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
						</div>
      				</div>
    			</form>        	
        	</li>
    	</ul>
	</div>
</nav>

<div class="container-fluid"> 
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="/resources/image/1.jpg" alt="Wine1" style="width:100%; height: 900px;">
			</div>
			<div class="item">
				<img src="/resources/image/2.jpg" alt="Wine2" style="width:100%; height: 900px;">
			</div>
			<div class="item">
				<img src="/resources/image/3.jpeg" alt="Wine3" style="width:100%; height: 900px;">
			</div>
			<div class="item">
				<img src="/resources/image/4.jpg" alt="Wine4" style="width:100%; height: 900px;">
			</div>
		</div>
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>

<div class="container">
	<div class="jumbotron">
		<div class="btn-group btn-group-justified">
			<a href="#" class="btn btn-default">Red</a>
			<a href="#" class="btn btn-default">White</a>
			<a href="#" class="btn btn-default">Rose</a>
		</div>
	</div>     
</div>



	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="page-header">
					<h1 style="margin: 75px 0px 0px 0px;">컨텐츠 표시</h1>
					<h2>Wine Bar</h2>
				</div>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
			</div>
		</div>
	</div>
	<div class="container">

		<div class="row">
			<div class="col-xs-4">
				<p>nike</p>
			</div>
			<div class="col-xs-4">
				<p>nike</p>
			</div>
			<div class="col-xs-4">
				<p>nike</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="page-header">
					<h1 style="margin: 75px 0px 0px 0px;">컨텐츠 표시</h1>
					<h2>Wine Bar</h2>
				</div>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
				<p>this is content.</p>
			</div>
		</div>
	</div>

</body>
</html>