class Button {
  int x;
  int y;
  int Width;
  int Height;
  
   Button(int x , int y , int Width , int Height){
     this.x = x;
     this.y = x;
     this.Width = Width;
     this.Height = Height;
   }
   
   private boolean isOn(){
     if((mouseX >= x && mouseX <= x + Width) && (mouseY >= y && mouseY <= y + Height)){
       return true;
     }else {
       return false;
     }
   }
   
   boolean isPressed(){
     if(isOn() && mousePressed) return true;
     return false;
   }
}