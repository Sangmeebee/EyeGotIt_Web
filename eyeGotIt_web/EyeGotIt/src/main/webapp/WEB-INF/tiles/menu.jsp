<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- The Modal -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<div style="font-size:20px;">알림 목록</div>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">Modal body..</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>


<header class="blog-header py-3">
	<div class="row flex-nowrap justify-content-between align-items-center">
		<div class="col-4 pt-1">
			<button data-toggle="modal" data-target="#myModal">
				<img src="<c:url value="/resources/bell.png"/>" alt="alarmImg"
					width="25px" style="cursor: pointer">
			</button>

		</div>
		<div class="col-4 text-center">
			<a class="blog-header-logo text-dark" href="#">EyeGotIt</a>
		</div>
		<div class="col-4 d-flex justify-content-end align-items-center">
			<a class="text-muted" href="#" aria-label="Search"> <svg
					xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					fill="none" stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
					viewBox="0 0 24 24" focusable="false">
							<title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
							
							<path d="M21 21l-5.2-5.2" /></svg>
			</a> <a class="btn btn-sm btn-outline-secondary" href="#">Sign up</a>
		</div>
	</div>


</header>