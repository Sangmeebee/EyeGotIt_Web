<!-- 지도  -->
<div id="map" style="width: 100%; height: 800px;"></div>
<script>
	
	var database = firebase.database();
	var rootRef = database.ref('aaa');
	rootRef.child('currentLocation').on('value', snapshot =>{
		
		var latitude =  snapshot.val().sLatitude;
		var longitude =  snapshot.val().sLongitude;
		
		var mapOptions = {
				center : new naver.maps.LatLng(latitude, longitude),
				zoom : 18
			};

		var map = new naver.maps.Map('map', mapOptions);			
		
		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(latitude, longitude),
			map : map
		});
	});
	
	

	//마커 
	
</script>
<label id="num_text">Loading...</label>




