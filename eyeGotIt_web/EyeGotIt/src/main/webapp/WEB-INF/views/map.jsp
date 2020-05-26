<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<p id="user_id">${id}</p>
<div id="map" style="width: 100%; height: 800px;"></div>
<script>
   var user_id = document.getElementById("user_id").innerText
   console.log("userid"+ user_id);
   var database = firebase.database();
   var rootRef = database.ref(user_id);
   var routeName = new String();
   //마커 이미지 경로 
   var HOME_PATH = window.HOME_PATH || '.';   
   var cur_latitude, cur_longitude;
   
   function point(name, latitude, longitude) {
      this.name = name;
      this.latitude = latitude;
      this.longitude = longitude;
   }
   
   var pointArray = new Array();
   
   rootRef.on('value', function(snapshot){
      	snapshot.forEach(function(childSnapshot){
         	console.log("Key = "+childSnapshot.key);
         	if(childSnapshot.key == "currentLocation"){
        	 	cur_latitude = childSnapshot.val().sLatitude;
        	 	cur_longitude = childSnapshot.val().sLongitude;
    		
            	routeName = childSnapshot.val().routeName;
            	console.log("routeName : "+routeName);
         	}
         	if(childSnapshot.key == "location"){
            
            	childSnapshot.forEach(function(grandChildSnapshot){
               		if(grandChildSnapshot.key == routeName){
                  		console.log("도착했다."+grandChildSnapshot.key);
                  
                  		grandChildSnapshot.forEach(function(grandGrandChildSnapshot){
                     	var latitude = grandGrandChildSnapshot.val().sLatitude;
                     	var longitude = grandGrandChildSnapshot.val().sLongitude;
                     	var pointName = grandGrandChildSnapshot.key;
                     	var newPoint = new point(pointName, latitude,longitude);
                     	pointArray.push(newPoint);
                     	console.log("grandGrandChildSnapshot"+grandGrandChildSnapshot.key);
                     	console.log("latitude : "+latitude);
                    	});
            		}
        		});            
        	}
		});
        //지도 불러오기  
		var mapOptions = {
				center : new naver.maps.LatLng(cur_latitude, cur_longitude),
				zoom : 18
		};

		var map = new naver.maps.Map('map', mapOptions);			
		//현재위치 마커 
		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(cur_latitude, cur_longitude),
			map : map,
			icon :{
				url : 'http://static.naver.com/maps2/icons/pin_spot2.png'
			}
		});
		
		var latlngs = [];
		for(var i=0; i<pointArray.length; i++){
	         latlngs.push(new naver.maps.LatLng(pointArray[i].latitude, pointArray[i].longitude));
	      }
		var markerList = [];

		for (var i=0, ii=latlngs.length; i<ii; i++) {
		    var icon = {
		            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
		            size: new naver.maps.Size(24, 37),
		            anchor: new naver.maps.Point(12, 37),
		            origin: new naver.maps.Point(i * 29, 0)
		        },
		        marker = new naver.maps.Marker({
		            position: latlngs[i],
		            map: map,
		            icon: icon
		        });

		    marker.set('seq', i);
		    markerList.push(marker);
		}
				
		//polyline 경로 
		var path = [];
		for (var i=0, ii=latlngs.length; i<ii; i++) {
			path.push(latlngs[i]);
		}
		//경로 선 
		var polyline = new naver.maps.Polyline({

		    map: map,
		    path: path,
		    clickable: true,
	        strokeColor: '#E51D1A',
	        strokeStyle: 'solid',
	        strokeOpacity: 1,
		    strokeWeight: 5
		});
		
   });
 
</script>
