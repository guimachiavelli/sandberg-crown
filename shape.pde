import java.util.Collections;
import java.lang.reflect.Method;

class Shape {
    float x;
    float y;
    float width;
    float height;
    int thickness = 2;
    float unitSize = 10;
    ArrayList<PImage> units = new ArrayList<PImage>();
    String arrangeType;
    Noise noise;


    Shape(float init_x, float init_y, float init_w, float init_h, String type) {
        x = init_x;
        y = init_y;
        width = init_w;
        height = init_h;
        arrangeType = type;
    }

    Shape(float init_x, float init_y, float init_w, float init_h) {
        this(init_x, init_y, init_w, init_h, "");
    }

    void setup() {
        noise = new Noise();
        noise.setup();

        int i = 0;
        while (i < 20) {
            units.add(noise.pic());
            i += 1;
        }
    }

    void draw() {
        float pos_x;
        float pos_y;
        int unitsLength = units.size();
        int counter = 0;

        if (arrangeType == "random") {
            randomise();
        }

        if (arrangeType == "advance") {
            advance();
        }

        for (int i = 0; i < width; i += 1) {
            for (int o = 0; o < height; o += 1) {
                if ((i < thickness) || (i >= width - thickness) ||
                    (o < thickness) || (o >= height - thickness)) {
                    pos_x = i * unitSize + x;
                    pos_y = o * unitSize + y;

                    image(units.get(counter), pos_x, pos_y, unitSize, unitSize);
                    counter = counter < unitsLength - 1 ? (counter + 1) : 0;
                }
            }
        }
    }

    void randomise() {
        Collections.shuffle(units);
    }

    void advance() {
        Collections.rotate(units, 1);
    }

    void grow() {
        thickness += 1;
    }

    void grow(int increment) {
        thickness += increment;
    }
}
