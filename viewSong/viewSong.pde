String[][] model;

void setup() {
  size(500, 500, P3D);
  colorMode(HSB, 100);
  String[] lines = loadStrings("model.txt");
  String[] lineArray = new String[split(lines[0], ", ").length];
  model = new String[lines.length][lineArray.length];
  for (int i = 0 ; i < model.length ; i++)
  {
    model[i] = [] 
    
  }
}

void draw() {
  lights();
  background(0);
  rotateX(radians(45));
}