import ddf.minim.*;
Minim minim;
AudioPlayer groove;
float moveDist;
boolean isPlaying;
ArrayList<String> model;

void setup() {
  //size(500, 500, P3D);
  fullScreen(P3D);
  //rotateX(radians(45));
  //rotateY(radians(45));
  colorMode(HSB, 100);

  moveDist = 0;
  //strokeWeight(3);
  minim = new Minim(this);
  groove = minim.loadFile("song.mp3", width);
  groove.loop();
  isPlaying = true;
  model = new ArrayList<String>();
}

void draw() {
  if (moveDist==0) {
    background(0, 0, 0, 100);
  }
  lights();
  rotateX(radians(45));
  //rotateY(radians(5));
  translate(0, -moveDist, - sqrt(1.5)/2*height);
  if (isPlaying) {
    String line = "[ ";
    line += moveDist + ", ";
    for (int i = 0; i < width - 1; i++)
    {
      line += groove.mix.get(i)*height/5 + ", ";
      strokeWeight(7*pow(groove.mix.get(i), 1.5));
      stroke(100-(100*abs(groove.mix.get(i))), 100, 100, 75);
      //ellipse(i, 3*height/4, groove.mix.get(i)*height/5, groove.mix.get(i)*height/5);
      line( i, 3*height/4, groove.mix.get(i)*height/5, i, 3*height/4, groove.mix.get(i+1)*height/5 );
    }
    line = line.substring(0, line.length()-2) + " ]";
    model.add(line);
    moveDist += pow(5 * groove.mix.level(), 2);
    if (moveDist > height / sqrt(1.5) * 2) { 
      model = new ArrayList<String>();
      moveDist = 0;
      background(0, 0, 0, 100);
    }
  }
}

void keyPressed() {
  if (key==' ') {
    if (groove.isPlaying()) { 
      groove.pause();
      saveStrings("model.txt", model.toArray(new String[model.size()]));
    } else { 
      groove.play();
    }
    isPlaying = !isPlaying;
  }
}