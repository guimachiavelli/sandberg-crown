class Shape {
    float x;
    float y;
    float width;
    float height;
    float unitSize = 10;
    Noise units;

    Shape(float init_x, float init_y, float init_w, float init_h) {
        x = init_x;
        y = init_y;
        width = init_w;
        height = init_h;
    }

    void setup() {
        units = new Noise();
        units.setup();
    }

    void draw() {
        float pos_x;
        float pos_y;

        for (int i = 0; i < width; i += 1) {
            for (int o = 0; o < height; o += 1) {
                if ((i == 0) || (i == width - 1) || (o == 0) || (o == height - 1)) {
                    pos_x = i * unitSize + x;
                    pos_y = o * unitSize + y;

                    units.drawUnit(pos_x, pos_y, unitSize);
                }
            }
        }
    }
}
