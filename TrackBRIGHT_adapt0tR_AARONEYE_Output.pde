

import processing.video.*;
Movie mov;
int threshold = 240;  //255 is white, 0 is black
PrintWriter output;
       
void setup() {
  size(640, 480);
  background (0);
  mov = new Movie (this, "eyetest.mov");
  mov.loop();
  output = createWriter ("data.txt");

}
void movieEvent (Movie movie){
  mov.read();
  //println(mov);
}
void draw() {
image(mov, 0, 0);

    float brightestPixel=0, brightestX=0,brightestY=0;
    for (int x=0;x< mov.width; x++) {
      for (int y=0;y< mov.height; y++) {
        int thisPixel= (x+ y*mov.width);
        color ColorFromImage= mov.pixels[thisPixel];
        float pixelBrightness=brightness(ColorFromImage);
        if (pixelBrightness>brightestPixel && pixelBrightness> threshold ){
          brightestPixel=pixelBrightness;
          brightestX=x;
          brightestY=y;
          
        }
      }
      
    }
     
    image(mov, 0,0);
    ellipse(brightestX,brightestY,20,20);
    output.print(brightestX);
   output.println(brightestX);
   
  }
  void keyPressed(){
    output.flush();
    output.close();
    exit();  }

