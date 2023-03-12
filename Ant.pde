public class Ant{
  
  // Variable Declaration
  private int x, y, w, h, dxn; // dxn is the orientation
  private boolean on;
  private Tile tile;
  private PImage[] icon;

  public Ant(int w, int h) {
    imageMode(CENTER);
    x = b.getTile(width / 2, height / 2).getX();
    y = b.getTile(width / 2, height / 2).getY(); 
    this.w = w; this.h = h;
    dxn = 1; 
    on = false; 
    tile = b.getTile(x, y); 
    icon = new PImage[4];
    for (int i = 0; i < icon.length; i++) {
      icon[i] = loadImage(i + ".png"); } }
  
  // Starts the ant running
  public void start() { on = true; }

  // Determines ant behavior
  public void run() { 
    if (!on) { return; } // End function if not running

    // If white --> clockwise. If black --> counter-clockwise.
    if (tile.getStatus()) { rotateCW(); }
    else { rotateXCW(); }
    tile.changeStatus();
    move();
    tile = b.getTile(x, y);

  }

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
}
