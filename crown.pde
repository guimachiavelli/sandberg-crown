int dotWidth = 3;
Enlightenment dot;
Noise noise;

void setup() {
    size(400, 400);
    pixelDensity(displayDensity());
    frameRate(24);
    dot = new Enlightenment(random(width - dotWidth), random(height - dotWidth));
    noise = new Noise(width, height);
}

void draw() {
    background(255,255,255);
    
    noise.draw();
    dot.draw();
    
    if (mousePressed && dot.isOver(mouseX, mouseY)) {
        dot.grow();
    } else {
        dot.shrink();   
    }
   
}

void mousePressed() {

}