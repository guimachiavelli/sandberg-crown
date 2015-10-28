class Noise {
    int width;
    int height;
    int pixelWidth = 3;
    
    PImage base1;
    PImage base2;
    PImage base3;
    PImage base4;
    ArrayList<PImage> base = new ArrayList<PImage>();
    IntList pics = new IntList();
    
    Noise(int w, int h) {
       width = w;
       height = h;
       base.add(loadImage("imgs/a.jpg"));
       base.add(loadImage("imgs/s.jpg"));
       base.add(loadImage("imgs/d.jpg"));
       base.add(loadImage("imgs/f.png"));
    }
    
    
    void draw() {
        for (int i = 0; i < width; i += pixelWidth) {
           for (int o = 0; o < height; o += pixelWidth) {
               int rand = int(random(0, base.size()));
               int x = int(random(width));
               int y = int(random(height));
               image(base.get(rand), i, o, pixelWidth, pixelWidth, x, y, pixelWidth, pixelWidth);
           }
        }
    }
}