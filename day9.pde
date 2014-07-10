import java.util.Calendar;

int size = (int)(random(14, 40));
boolean isDrawing = true;

void setup(){
   size(800, 800); 
   background(255);
   smooth();
   noStroke();
}

void draw(){
  if(isDrawing){
    for(int x = 0; x < width; x+=size){
      for(int y = 0; y < height; y+=size){
         fill(random(size, 100) + sqrt(mouseX*2), random(size, 100) + sqrt(mouseY), size+sqrt(x));
         ellipse(x, y, size, size);
         rect(x, y, size, size);
         fill(random(size, 100) + sqrt(mouseX), random(size, 100) + sqrt(y), size-sqrt(y)*sqrt(y));
         ellipse(x, y, size/2, size/2);
      }
    }
  }
}

void mousePressed() {
  if (isDrawing)
    isDrawing = false;
  else
    isDrawing = true;

  println(isDrawing);
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

