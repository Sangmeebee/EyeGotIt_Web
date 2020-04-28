
const database = firebase.database();
const rootRef = database.ref('aaa');


var num;
rootRef.child('currentLocation').on('value', snapshot =>{
	num =  snapshot.val().sLatitude;
	num_text.innerHTML = num;
});

