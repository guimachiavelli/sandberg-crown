class Enlightenment {
   float posX;
   float posY;
   int min = 3;
   float size = 3.0;
   
   Enlightenment(float x, float y) {
       posX = x;
       posY = y;
   }
   
   void draw() {
       noStroke();
       fill(255,255,255);
       rectMode(CENTER);
       rect(posX, posY, size, size);
   }
   
   void grow() {
       size = size * 1.15;
   }
   
   void shrink() {
       if (size <= min) {
           size = min;
           return; 
       }
       
       if (size > width * 2 && size > height * 2) {
           return;
       }
       
       size = size * 0.5;
   }
   
   boolean isOver(float x, float y) {
       if (x >= (posX - size/2) && x <= (posX + size/2) &&
           y >= (posY - size/2) && y <= (posY + size)) {
           return true;   
       }
       
       return false;
   }
   
   
}