import processing.serial.*;

enum State { TRASMITTING , IDLE };

Serial myPort;  // Create object from Serial class
String x,y,z;     // Data received from the serial port
PrintWriter output;
Button startButton;
State state;
int counter = 0;

void setup()
{
  size(500,300);
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[32]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 4800);
  println(Serial.list()[32]);
  //output = createWriter("data.txt"); 
  //output.println("Your data:");
  startButton = new Button(100 , 50 , 300 , 100);
  state = State.TRASMITTING;
}

void draw()
{
  
  //if(state == State.TRASMITTING){
  //  println("We are getting results!");
  //}else{
  //  println("Idle");
  //}
  if ( myPort.available() > 0) 
  {  // If data is available,
  x = myPort.readStringUntil(' ');         // read it and store it in val
  y = myPort.readStringUntil(' ');  
  z = myPort.readStringUntil('\n');
  //f(x != null && y != null && z !=null) output.print(x + "." + y + "." + z); //print it out in the console
  }
  
  if(x != null) print(x + " ");
  if(y != null) print(y + " ");
  if(z != null) print(z);
  
  //rect(startButton.x ,  startButton.y , startButton.Width , startButton.Height); 
  //if(startButton.isPressed()){
  //  counter++;
  //  delay(200);
  //}
  
  //if(counter%2 == 0){
  //  fill(255, 0 , 0);
  //  state = State.TRASMITTING;
  //}
  //  else{
  //    fill(0 , 255 , 0);
  //    state = State.IDLE;
  //  }
}

void keyPressed(){
  output.println("We are done!");
  output.flush();
  output.close();
  exit();
}