int dotWidth = 10;
Enlightenment dot;
Shape rect1;
Shape rect2;
ArrayList<Shape> rects = new ArrayList<Shape>();

void setup() {
    size(600, 600, P2D);
    pixelDensity(displayDensity());
    //frameRate(0.5);
    dot = new Enlightenment(random(width - dotWidth), random(height - dotWidth));

    int i = 0;

    while (i < 20) {
        rects.add(new Shape(20 * i, 20 * i, (width - (40 * i)), height - (40 * i), randomType()));
        rects.get(i).setup();
        i += 1;
    }
    rect1 = new Shape(-150, -150, 300, 300, "rotation");
    rect1.setup();


    rect2 = new Shape(-100, -100, 200, 200, "rotation");
    rect2.setup();
}

String randomType() {
    int rand = int(random(7));

    switch (rand) {
        case 1:
            return "advance";
        case 2:
            return "rewind";
        default:
            return "random";
    }
}


void draw() {
    background(255,255,255);

    for (Shape rectangle : rects) {
        rectangle.draw();
    }

    rect1.draw();
    rect2.draw();

    dot.draw();

    if (mousePressed && dot.isOver(mouseX, mouseY)) {
        dot.grow();
    } else {
        dot.shrink();
    }
}

void mousePressed() {
    //rect1.grow();
    //rect1.updateRotation(10);
}
