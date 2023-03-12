public class Ant{
  
  // Variable Declaration
  private int x, y, w, h, dxn; // dxn is the orientation
  private boolean on;
  private Tile tile;
  private PImage[] icon;

  public Ant(int x, int y, int w, int h) {
    imageMode(CENTER);
    this.x = x; this.y = y; 
    this.w = w; this.h = h;
    dxn = 1; 
    icon = new PImage[4];
    for (int i = 0; i < icon.length; i++) {
      icon[i] = loadImage(i + ".png"); } }

  // Rotate clockwise or counter-clockwise
  public void rotateCW() { dxn += 1; if (dxn > 3) { dxn = 0; } }
  public void rotateXCW() { dxn -= 1; if (dxn < 0) { dxn = 3 ; } }

  // Move in the direction faced
  public void move() {
    if (dxn == 0) { y += h; }
    else if (dxn == 1) { x += w; }
    else if (dxn == 2) { y -= h; }
    else if (dxn == 3) {  x -= w; }
  }

  // Draws the ant with correct rotation
  public void render() {
    fill(150);
    image(icon[dxn], x, y, w, h); }

  // Getters
  public int getX() { return x; }
  public int getY() { return y; }
}
