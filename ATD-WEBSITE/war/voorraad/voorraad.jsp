<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page
	import="atd.backend.*, atd.database.OnderdelenDAO, atd.domein.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Voorraad beheer</title>
<!--  alle stylesheets  -->
<jsp:include page="/include/style.jsp" />
</head>

<body>
	<!--   main container -->
	<jsp:include page="/include/header.jsp" />
	<form action="/ATD-WEBSITE/Voorraad.do" method="POST">
		<h2>Onderdeel toevoegen</h2>
		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">Naam</span> <input
				type="text" class="form-control" placeholder="Naam van het product"
				aria-describedby="basic-addon1" name="nieuwOnderdeelNaam">
		</div>
		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">Type</span> <input
				type="text" class="form-control" placeholder="Type product"
				aria-describedby="basic-addon1" name="nieuwOnderdeelType">
		</div>
		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">Prijs</span> <input
				type="text" class="form-control" placeholder="Verkoop prijs"
				aria-describedby="basic-addon1" name="nieuwOnderdeelPrijs">
		</div>
		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">Aantal</span> <input
				type="text" class="form-control"
				placeholder="hoeveelheid in voorraad"
				aria-describedby="basic-addon1" name="nieuwOnderdeelAantal">
		</div>

		<button type="submit" name="run" value="nieuwOnderdeel"
			class="btn btn-success pull-right ">Nieuw onderdeel</button>


		<h2>Onderdeel aanpassen</h2>
		<p>Click op een onderdeel om te bestellen en aanpassing te kunnen
			maken</p>

		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">Aantal</span> <input
				type="text" class="form-control"
				placeholder="Hoeveelheid in voorraad"
				aria-describedby="basic-addon1" id="aantal" name="aantal"> <span
				class="input-group-btn">
				<button name="run" class="btn btn-success" type="submit"
					value="updaten">updaten</button>
			</span>
		</div>


		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">Naam</span> <input
				type="text" class="form-control" placeholder="Naam van het product"
				aria-describedby="basic-addon1" id="naam" readonly>
		</div>
		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">Prijs</span> <input
				type="text" class="form-control" placeholder="Verkoop prijs"
				aria-describedby="basic-addon1" id="prijs" readonly>
		</div>
		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">ID</span> <input
				type="text" class="form-control" placeholder="Product ID"
				aria-describedby="basic-addon1" id="ID" name="ID" readonly>
		</div>
		${requestScope.error}
		<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6">
				<div class="input-group">
					<input type="text" name="bestelAantal" class="form-control"
						placeholder="geef aantal op"> <span
						class="input-group-btn">
						<button name="run" class="btn btn-success" type="submit"
							value="bestellen">bestellen</button>

					</span>
				</div>

			</div>
	</form>

	<table class="table table-default" id="voorraad-table">

		<thead>
			<tr>
				<th>ID</th>
				<th>Naam</th>
				<th>Aantal</th>
				<th>Prijs</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="Onderdeel"
				items="${OnderdelenDAO.getAllOnderdelen()}">
				<tr onclick="toggleClass(this,'highlight-table');">
					<td>${Onderdeel.ID}</td>
					<td>${Onderdeel.naam}</td>
					<td>${Onderdeel.voorraad }</td>
					<td id="prijs">${Onderdeel.prijs}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<!--  footer  -->
	<jsp:include page="/include/footer.jsp" />
	<!-- alle javascript files -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/accounting.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>

</html>
