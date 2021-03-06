int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first.
 Then you can make a method that changes the values each time the update is called.
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  int rectWidth;
  int rectHeight;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    int a = (int)random(40);
    values = new float[a];
    speeds = new float[a];
    for (int i = 0; i < values.length; i++) {
      values[i] = random((rectHeight/-2)+1, (rectHeight/2)-1);
      speeds[i] = random(2);
    }
    rectWidth = (int)random(width - x);
    rectHeight = (int)random(height - y);
  }

  void display() {
    //rectMode(CORNERS);
    //draw the bars equally spaced inside this box.
    //You can assume 10, but it would be even better
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, rectWidth, rectHeight);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+(rectHeight/2), x+rectWidth, y+(rectHeight/2));

    //You need to use a loop. You need to make the HEIGHT of the bars
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    for (int i = 0;i < values.length;i += 1){
      int w = rectWidth/(values.length);
      if (values[i] < 0 && values[i] > rectHeight/-4) {
        fill(255,165,0);
      }
      if (values[i] <= rectHeight/-4) {
        fill(255,0,0);
      }
      if (values[i] >= 0 && values[i] < rectHeight/4) {
        fill(255,255,0);
      }
      if (values[i] >= rectHeight/4) {
        fill(0,255,0);
      }
      rect(x+(i*w),y+(rectHeight/2)-values[i],
           w,values[i]);
    }


    //Width of the visualizer is 400!


  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      if(values[i] < (rectHeight/-2) || values[i] > (rectHeight/2)) {
        speeds[i] = speeds[i] * -1;
      }
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min


    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
