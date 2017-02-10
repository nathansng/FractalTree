private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .1;

private int beginX = 320;
public int beginY = 300;
private int length = 50;

public void setup() 
{   
	size(640,480);    
} 

public void draw() 
{   
	beginY = mouseY;  
	length = (height - mouseY) / 3;

	background(255);   
	stroke(100);   
	line(320,480,beginX,beginY);   
	drawBranches(beginX, beginY, length, 4*Math.PI/2);
	drawBranches(beginX, beginY, length, 3.5*Math.PI/2);
	drawBranches(beginX, beginY, length, 3*Math.PI/2);
	drawBranches(beginX, beginY, length, 2.5*Math.PI/2);
	drawBranches(beginX, beginY, length, 2*Math.PI/2);
	//drawBranches(beginX, beginY, 50, 1.5*Math.PI/2);
} 

public void keyPressed () {
	if (key == 38) {
		branchAngle += 0.1;
	}
	if (key == 40) {
		branchAngle -= 0.1;
	}
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;

	int endX1 = (int)(branchLength * Math.cos(angle1) + x);
	int endY1 = (int)(branchLength * Math.sin(angle1) + y);
	int endX2 = (int)(branchLength * Math.cos(angle2) + x);
	int endY2 = (int)(branchLength * Math.sin(angle2) + y);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if (branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
