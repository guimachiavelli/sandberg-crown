int dotWidth = 10;
Enlightenment dot;
Noise noise;
Shape rect1;
Shape rect2;
Shape rect3;
Shape rect4;
Shape rect5;

void setup() {
    size(600, 600, P2D);
    pixelDensity(displayDensity());
    //frameRate(0.5);
    dot = new Enlightenment(random(width - dotWidth), random(height - dotWidth));

    rect1 = new Shape(10, 10, 58, 58, "random");
    rect2 = new Shape(20, 20, 56, 56, "advance");
    rect3 = new Shape(30, 30, 54, 54, "random");
    rect4 = new Shape(40, 40, 52, 52, "advance");
    rect5 = new Shape(50, 50, 50, 50, "random");

    rect1.setup();
    rect2.setup();
    rect3.setup();
    rect4.setup();
    rect5.setup();
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
    rect3.draw();
    rect4.draw();
    rect5.draw();


}
