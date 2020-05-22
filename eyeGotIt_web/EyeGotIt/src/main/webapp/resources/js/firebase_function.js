var database = firebase.database();
var rootRef = database.ref('aaa');

var latitude;
var longitude;
rootRef.child('currentLocation').on('value', snapshot =>{
	latitude =  snapshot.val().sLatitude;
	longitude =  snapshot.val().sLongitude;
	
	num_text.innerHTML = latitude+" , "+longitude;
});
