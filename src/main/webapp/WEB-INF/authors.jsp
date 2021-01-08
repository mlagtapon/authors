<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
	body{
		background-color: white;
		padding: 20px;
		margin: auto;
	}
	#wrapper {
		display: flex;
		justify-content: space-evenly;
	}
	h1 {
		text-align: center;
		border: 1px solid;
		border-radius: 10px;
		background-color: #66b3ff;
	}
	#sub {
		margin-left: 10px;
	}
	#label {
		margin-right: 40px;
	}
	#booktitle {
		font-weight: bold;
	}
	#marginleft {
		margin-left: 30px;
	}
</style>
<meta charset="ISO-8859-1">
<title>New Author</title>
</head>
<body>
	<div id="wrapper">
		<div class="box">
			<h1>All Authors</h1>
			<ul>
				<c:forEach items="${authorsall}" var="one">
					<li>${one.name}</li>
						<ul>
							<c:forEach items="${one.book}" var="book">
								<li>${book.title}</li>
							</c:forEach>
						</ul>
				</c:forEach>
			</ul>
			
			<h1>New Author</h1>
			<form:form action="/authors" method="post" modelAttribute="author">
		    <div class="form-group row" >
		        <form:label path="name" id="label" class="col-sm-1 col-form-label">Name: </form:label>
		        <form:errors path="name"/>
		        <form:input path="name"/>
		        <button type="submit" id="sub" class="btn btn-primary">Submit</button>
		    </div>   
			</form:form>
		</div>
		
		<div class="box">
			<h1>All Books</h1>
			<ul>
				<c:forEach items="${books}" var="book">
					<p id="booktitle">${book.title}</p>
					<p id="marginleft"> written by: ${book.author.name}</p>
				</c:forEach>
			</ul>
			
			<h1>New Book</h1>
			<form:form action="/books" method="post" modelAttribute="book">
		    <div class="form-group row">
		        <form:label path="title" id="label" class="col-sm-1 col-form-label">Title: </form:label>
		        <div class="col-sm-4">
			        <form:errors path="title"/>
			        <form:input path="title"/>
			    </div>
		    </div>   
		    
		     <div class="form-group row">
		        <form:label path="author" id="label" class="col-sm-1 col-form-label">Author: </form:label>
		        	<div class="col-sm-4">
				        <form:errors path="author"/>
				        <form:select path="author">
				        	<form:options items="${authorsall}" itemValue="id" itemLabel="name" />
						</form:select>
					</div>
				<div class="form-group row">
		    		<div class="col-sm-10 offset-sm-2">
		              <button type="submit" class="btn btn-primary">Submit</button>
		    		</div>
		  		</div>
		    </div>
			</form:form>
		</div>
	</div> 
</body>
</html>