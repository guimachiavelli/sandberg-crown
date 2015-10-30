class Noise {
    int width;
    int height;
    int pixelWidth = 10;
    int cropSize = 20;

    ArrayList<PImage> base = new ArrayList<PImage>();
    ArrayList<PImage> pics = new ArrayList<PImage>();

    Noise(int w, int h) {
       width = w;
       height = h;

       loadBaseImages();
    }

    void loadBaseImages() {
        ArrayList<File> filesList = new ArrayList<File>();
        File file = new File(dataPath("imgs"));
        File[] files = file.listFiles();
        for (int i = 0; i < files.length; i++) {
            String path = files[i].getAbsolutePath();

            if (!path.endsWith(".jpg") && !path.endsWith(".gif") && !path.endsWith(".png")) {
                continue;
            }
            base.add(loadImage(files[i].getAbsolutePath()));
        }
    }

    void setup() {
        int i = 100;
        int imgAmount = base.size();

        setupPics(imgAmount);

        while (i > 0) {
            int rand = int(random(0, imgAmount));
            PImage img = base.get(rand);

            int x = int(random(width));
            x = max(0, x);
            x = min(x, width - cropSize);

            int y = int(random(height));
            y = max(0, y);
            y = min(y, height - cropSize);

            pics.add(img.get(y, x, cropSize, cropSize));
            i -= 1;
        }
    }

    void setupPics(int amount) {
        for (int i = 0; i < amount; i += 1) {
            base.get(i).resize(width, height);
        }
    }

    void draw() {
        for (int i = 0; i < width; i += pixelWidth) {
           for (int o = 0; o < height; o += pixelWidth) {
               int rand = int(random(0, pics.size()));
               image(pics.get(rand), i, o, pixelWidth, pixelWidth);
           }
        }
    }
}
