<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.6">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1377koc3ce"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script src="http://www.helenhard.no/assets/js/site.js"
	type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Eye Got It!</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.4/examples/blog/">

<!-- Bootstrap core   -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/4.4/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg"
	color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config"
	content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/blog.css"/>" rel="stylesheet">
</head>
<body>
	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/7.14.4/firebase-app.js"></script>

	<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
	<script
		src="https://www.gstatic.com/firebasejs/7.14.4/firebase-database.js"></script>
	<script>
		// Your web app's Firebase configuration
		var firebaseConfig = {
			apiKey : "AIzaSyBWYIfhCcO87NZVyTrm8Q4R_4CUaRhS0C8",
			authDomain : "answertoyou-2a6c5.firebaseapp.com",
			databaseURL : "https://answertoyou-2a6c5.firebaseio.com",
			projectId : "answertoyou-2a6c5",
			storageBucket : "answertoyou-2a6c5.appspot.com",
			messagingSenderId : "879719861256",
			appId : "1:879719861256:web:16e6c23f538040fd2315bd",
			measurementId : "G-PDE2KDK3GD"
		};
		// Initialize Firebase
		firebase.initializeApp(firebaseConfig);
		firebase.analytics();
	</script>

	<script>
		var databaseRoot = firebase.database().ref();

		console.log("databaseRoot = " + databaseRoot);

		//현재 사용자의 이름(key), 위도, 경도 저장하는 User객체
		function currentUser(key, latitude, longitude) {
			this.key = key;
			this.latitude = latitude;
			this.longitude = longitude;
		}

		//currentUser객체를 저장하는 배열
		var currentUserArray = new Array();

		databaseRoot.on('value', function(snapshot) {
			snapshot.forEach(function(childSnapshot) {
				var childKey = childSnapshot.key;
				var childData = childSnapshot.val();

				childSnapshot.forEach(function(grandchildSnapshot) {

					var grandchildKey = grandchildSnapshot.key;
					var c = new String("currentLocation");

					if (grandchildKey == c) {
						console.log("T.T ");

						console.log("childKey : " + childKey);
						console.log("grandchildKey : " + grandchildKey);

						var latitude = grandchildSnapshot.val().sLatitude;
						var longitude = grandchildSnapshot.val().sLongitude;

						console.log("latitude = " + latitude);
						console.log("longitude = " + longitude);

						var newUser = new currentUser(childKey, latitude,longitude)
						currentUserArray.push(newUser);

					}
				});

			});

			console.log("This is currentUser Objects");
			console.log("num = " + currentUserArray.length);

			var rootDiv = document.getElementById("rootDiv");
			while (rootDiv.hasChildNodes()){ 
				rootDiv.removeChild(rootDiv.firstChild); 
			}
			
			
			for (var i = 0; i < currentUserArray.length; i++) {
				
				var r = Math.round(Math.random() * 255); 
			    var g = Math.round(Math.random() * 255);
			    var b = Math.round(Math.random() * 255);
				
				var newDiv = document.createElement("div");
				newDiv.setAttribute('class','media text-muted pt-3');
				
				var svg = document.createElementNS('http://www.w3.org/2000/svg','svg');
				svg.setAttribute('width','40');
				svg.setAttribute('height','40');
				svg.setAttribute('preserveAspectRatio','xMidYMid slice');
				svg.setAttribute('role','img');
				svg.setAttribute('class','bd-placeholder-img mr-2 rounded');
				svg.setAttribute('aria-label','Placeholder: 32x32');
				
				var title = document.createElementNS(
						'http://www.w3.org/2000/svg', 'title');
				svg.appendChild(title);
				
				
				var rect = document.createElementNS(
						'http://www.w3.org/2000/svg', 'rect');
				rect.setAttribute('width', '100%');
				rect.setAttribute('height', '100%');
				rect.setAttribute('fill', 'rgb('+ r + ',' + g + ','+ b +')');
				svg.appendChild(rect);

				var text = document.createElementNS(
						'http://www.w3.org/2000/svg', 'text');
				text.setAttribute("x", "50%");
				text.setAttribute("y", "50%");
				text.setAttribute('fill', '#007bff');
				text.setAttribute('dy','.3em');
				svg.appendChild(text);
				
				newDiv.appendChild(svg);

				var newP = document.createElement("p");
				newP.setAttribute('class','media-body pb-3 mb-0 small lh-125 border-bottom border-gray');
				var newStrong = document.createElement("strong");
				newP.innerHTML = "<strong class='d-block text-gray-dark'>" + currentUserArray[i].key
						+ "</strong>" + "<b>latitude: </b>"
						+ currentUserArray[i].latitude+ ", <b>longitude: </b>"+currentUserArray[i].latitude
						+"<br>";

				newDiv.appendChild(newP);
				console.log("for문 "+i+"번 째, 배열은 "+currentUserArray.length);
				rootDiv.appendChild(newDiv);
			}
			currentUserArray.length = 0;
			
		});
	</script>


	<div class="container">
		<tiles:insertAttribute name="menu" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script src="<c:url value = "/resources/js/bootstrap.bundle.min.js"/>"
		integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm"
		crossorigin="anonymous"></script>



	<script src="<c:url value = "/resources/js/firebase_function.js"/>"></script>

</body>
</html>
