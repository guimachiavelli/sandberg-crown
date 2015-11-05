import java.util.Collections;
import java.lang.reflect.Method;

class Shape {
    float x;
    float y;
    float width;
    float height;
    int vBlocks;
    int hBlocks;
    int thickness = 2;
    float unitSize = 10;
    int rotation = 0;
    ArrayList<Pixel> units = new ArrayList<Pixel>();
    String arrangeType;
    Noise noise;


    Shape(float init_x, float init_y, float init_w, float init_h, String type) {
        x = init_x;
        y = init_y;
        width = init_w;
        height = init_h;
        arrangeType = type;
        vBlocks = int(height/unitSize);
        hBlocks = int(width/unitSize);
    }

    Shape(float init_x, float init_y, float init_w, float init_h) {
        this(init_x, init_y, init_w, init_h, "");
    }

    void setup() {
        noise = new Noise();
        noise.setup();

        int i = 0;
        while (i < 50) {
            units.add(new Pixel(noise.pic()));
            i += 1;
        }
    }

    void draw() {
        float pos_x;
        float pos_y;
        int maxIndex = units.size();
        int counter = 0;

        pushMatrix();

        if (arrangeType == "random") {
            randomise();
        }

        if (arrangeType == "advance") {
            advance();
        }

        if (arrangeType == "rewind") {
            rewind();
        }

        if (arrangeType == "rotation") {
            rotation();
        }

        if (rotation != 0) {
            //translate(500/(2 + ((15/15) % 3)), height/-2);
            //println(width/(2 + ((rotation/15) % 3)));
            //translate((600/(2 + (15/15 % 3))), height/-2);
            translate(300, 300);
            rotate(radians(rotation));
        }

        for (int column = 0; column < vBlocks; column += 1) {
            for (int row = 0; row < hBlocks; row += 1) {
                if (isDrawableEdge(column, row)) {
                    pos_x = column * unitSize + x;
                    pos_y = row * unitSize + y;

                    units.get(counter).draw(pos_x, pos_y);
                    counter = incrementCounter(counter, maxIndex);
                }
            }
        }
        popMatrix();
    }

    int incrementCounter(int counter, int maxIndex) {
        //reset counter if max index has been reached
        return counter < maxIndex - 1 ? (counter + 1) : 0;
    }

    boolean isDrawableEdge(int column, int row) {
        return (column < thickness) ||
               (column >= hBlocks - thickness) ||
               (row < thickness) ||
               (row >= vBlocks - thickness);
    }

    void randomise() {
        Collections.shuffle(units);
    }

    void advance() {
        Collections.rotate(units, 1);
    }

    void rewind() {
        Collections.rotate(units, -1);
    }

    void grow() {
        thickness += 1;
    }

    void grow(int increment) {
        thickness += increment;
    }

    void rotation() {
        updateRotation(15);
    }

    void updateRotation(int increment) {
        rotation += increment;
    }
}
