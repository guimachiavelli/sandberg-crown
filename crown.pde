int dotWidth = 10;
Enlightenment dot;
Noise noise;
Shape rect1;
Shape rect2;

void setup() {
    size(600, 600, P2D);
    pixelDensity(displayDensity());
    //frameRate(0.5);
    dot = new Enlightenment(random(width - dotWidth), random(height - dotWidth));

    rect1 = new Shape(10, 10, 20, 30);
    rect2 = new Shape(20, 20, 20, 30);

    rect1.setup();
    rect2.setup();
}

void draw() {
    background(255,255,255);

    dot.draw();

    if (mousePressed && dot.isOver(mouseX, mouseY)) {
        dot.grow();
    } else {
        dot.shrink();
    }

    rect1.draw();
    rect2.draw();

}
