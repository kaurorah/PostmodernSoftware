//var locX, locY;
function setup(){
	createCanvas(1000, 1000);

}

function drawRotations( locX,  locY){
	translate(width/2, height/2);

	for (var i = 1; i < 360; i++) {
		rotate(radians(frameCount % i *0.05 ));
		//locX= ;
		//locY =  ;
		strokeWeight(.5);
		line(locX, locY,  cos(i)*50, sin(i)*100);
	}
}

function draw(){
	fill(255, 50);
	rect(0, 0, width, height);
	stroke(0);
	rect(0,0,100,100);

	//translate(width/2, height/2);

	// for (var i = 1; i < 360; i++) {
	// 	rotate(radians(frameCount % i *0.05 ));
	// 	locX= cos(i)*150;
	// 	locY =  sin(i)*100;
	// 	strokeWeight(.5);
	// 	line(locX, locY,  cos(i)*50, sin(i)*100);
	// }

	drawRotations(cos(i)*150,sin(i)*100);
}


    
