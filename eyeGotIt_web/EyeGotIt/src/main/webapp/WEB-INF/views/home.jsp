<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<div class="my-3 p-3 bg-white rounded shadow-sm">
   
   <p class="border-bottom border-gray pb-2 mb-0">현재 사용자</p>

   <div id="rootDiv">
      <!-- 동적 생성하는 부분 -->
   </div>
      
   <small class="d-block text-right mt-3"> 
      <a href="#">All updates</a>
   </small>
   <!-- 아 뭐야앙~ -->
</div>

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
            newDiv.setAttribute('onclick',"location.href='http://localhost:8080/eyeGotIt/map/"+currentUserArray[i].key+"'");
            console.log("for문 "+i+"번 째, 배열은 "+currentUserArray.length);
            rootDiv.appendChild(newDiv);
         }
         currentUserArray.length = 0;
         
      });
   </script>

   
