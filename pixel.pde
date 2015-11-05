class Pixel {
    float size = 10;
    PImage img;

    Pixel(PImage init_img) {
        img = init_img;
    }

    Pixel(PImage init_img, float init_size) {
        img = init_img;
        size = init_size;
    }

    void update(float new_size) {
        size = new_size;
    }

    void draw(float x, float y) {
        image(img, x, y, size, size);
    }
}
