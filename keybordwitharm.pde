

//with keybord
//with sharp turn and stop with serial communication wih arduino
// Project work from santosh 
import processing.serial.*;
import processing.io.*;
import gohai.glvideo.*;
import processing.serial.*;

GLCapture video;

color trackColor;
SoftwareServo servo;

float angle1=175;
float angle2=101;
float angle3=190;
float angle4=175;
int y=31;
int z=1;

Serial myPort;
String val;

void setup() { 
 size(320, 220, P2D);

  video = new GLCapture(this);

  video.start();
  
  trackColor = color(255, 0, 0);
  
  GPIO.pinMode(4, GPIO.OUTPUT);//left motors 
  GPIO.pinMode(14, GPIO.OUTPUT);//left motors 
  GPIO.pinMode(17, GPIO.OUTPUT);//Right motors
  GPIO.pinMode(18, GPIO.OUTPUT);//Right motors 
   servo= new SoftwareServo(this);
  servo.attach(21);//base0-180
  servo.attach(26);//arm 0-180
  servo.attach(19);//90-175 rotat
  servo.attach(13);//100-175 hand
  
 
  String portName=Serial.list()[1];
   //size(200,200);
  myPort= new Serial(this,portName,9600);
}
  
  
  


void draw() {
   background(0);
  
  println (y);
   println (angle1);
  println (angle2);
  println (angle3);
  println (angle4);
}





void keyPressed(){
  if (keyPressed){
   if(key == '9'){sright();
    delay(10);
    println("turn right");}
    else if(key == '7'){sleft();
    delay(10);
    println("turn left");}
     else if(key == '8'){fwd();
    delay(10);
    println("fwd");}
      else if(key == '2'){back();
    delay(10);
    println("back");}
      else if(key == '6'){left();
    delay(10);
    println("right");}
      else if(key == '4'){right();
    delay(10);
    println("left");}
    
    
    if (key == 'a' || key =='A') {

      
        myPort.write('a');
      }
     else if (key == 'q' || key =='Q') {

     
        myPort.write('q');
      }
     else if (key == 'w' || key =='W') {
      
        myPort.write('w');
      
    } else if (key == 'S' || key =='s') {
      
        myPort.write('s');
      
    } else if (key == 'E' || key =='e') {
      
        myPort.write('d');
       
      
    } else if (key == 'D' || key =='d') {
     
        myPort.write('c');
       
    } else if (key == 'r' || key =='R') {
      
      
        myPort.write('f');
       
    } else if (key == 'F' || key =='f') {
    
     
        myPort.write('v');
      
    }
      else if (key == 'o' || key =='O') {

      if (y<=200) {
        y+= y;
      }
    } else if (key == 'l' || key =='L') {
      if (y>=0) {
        y -= y;
      }
    }
  }
  
  if( key == CODED){
    if(keyCode == UP){fwd();
    delay(10);
    println("fwd");}
    else if(keyCode == DOWN){back();
    delay(10);
    println("back");}
    
    else if(keyCode == LEFT){right();
    delay(10);
    println("left");}
    else if(keyCode == RIGHT){left();
    delay(10);
    println("right");}
    
    
  else{stp();
    delay(10);
    println("STOP");}
  }
}


void keyReleased(){
  stp();
  delay(10);
}















void sright (){                //sudden right rotation 
  GPIO.digitalWrite(4, GPIO.HIGH);
 GPIO.digitalWrite(14, GPIO.LOW);
 GPIO.digitalWrite(17, GPIO.LOW);
 GPIO.digitalWrite(18, GPIO.HIGH);
 delay(10);}
void sleft()                       //sudden left rotation
{GPIO.digitalWrite(4, GPIO.LOW);
 GPIO.digitalWrite(14, GPIO.HIGH);
 GPIO.digitalWrite(17, GPIO.HIGH);
 GPIO.digitalWrite(18, GPIO.LOW);
 delay(10);
}
void right()                          //right turn 
{GPIO.digitalWrite(4, GPIO.LOW);
 GPIO.digitalWrite(14, GPIO.LOW);
 GPIO.digitalWrite(17, GPIO.HIGH);
 GPIO.digitalWrite(18, GPIO.LOW);
 delay(10);}
void left()                          //left turn 
{GPIO.digitalWrite(4, GPIO.HIGH);
 GPIO.digitalWrite(14, GPIO.LOW);
 GPIO.digitalWrite(17, GPIO.LOW);
 GPIO.digitalWrite(18, GPIO.LOW);
 delay(10);
}
void back(){                            //back
 GPIO.digitalWrite(4, GPIO.LOW);
 GPIO.digitalWrite(14, GPIO.HIGH);
 GPIO.digitalWrite(17, GPIO.LOW);
 GPIO.digitalWrite(18, GPIO.HIGH);
 delay(10);} 
void stp(){                               //stop
  GPIO.digitalWrite(4, GPIO.LOW);
 GPIO.digitalWrite(14, GPIO.LOW);
 GPIO.digitalWrite(17, GPIO.LOW);
 GPIO.digitalWrite(18, GPIO.LOW);
 delay(10);}
  void fwd(){                               //forward
  GPIO.digitalWrite(4, GPIO.HIGH);
 GPIO.digitalWrite(14, GPIO.LOW);
 GPIO.digitalWrite(17, GPIO.HIGH);
 GPIO.digitalWrite(18, GPIO.LOW);
 delay(10);}
