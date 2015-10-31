int dotWidth = 10;
Enlightenment dot;
Noise noise;

void setup() {
    size(600, 600, P2D);
    pixelDensity(displayDensity());
    //frameRate(0.5);
    dot = new Enlightenment(random(width - dotWidth), random(height - dotWidth));
    noise = new Noise(width, height);
    noise.setup();
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
