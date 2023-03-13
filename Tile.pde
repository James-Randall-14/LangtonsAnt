public class Tile {

  // Variable Declaration
  private int x, y, w, h;
  private int status;
  
  // Parameterized Contructor
  public Tile (int x, int y, int w, int h) {
    this.x = x; this.y = y; this.w = w; this.h = h; status = 0;
    noStroke(); }

  // Getters
  public int getX () { return x + w / 2; }
  public int getY () { return y + h / 2; }
  public int getStatus () { return status; }

  // Cycles tile status
  public void changeStatus() {
    status += 1; if (status > 3) { status = 0; } } 

  public void render() { 
    if (status == 0) { fill(255); }
    else if (status == 1) { fill(136, 192, 208); }
    else if (status == 2) { fill(129, 161, 193); }
    else { fill(94, 129, 172); }
    rect(x, y, w, h); }
}
