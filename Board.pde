public class Board {
  
  // Variable Declaration
  private int rows, cols;
  private Tile[][] grid;

  // Constructor
  public Board(int rows, int cols) {
    grid = new Tile[rows][cols];
    this.rows = rows; this.cols = cols; 
    this.populate(); }

  // Fill With Tiles
  public void populate() {
    int tileW = width / cols; 
    int tileH = height / rows;
    int tileX = 0; int tileY = 0;
    for (int r = 0; r < grid.length; r++) {
      tileX = 0;
      for (int c = 0; c < grid[r].length; c++) {
        grid[r][c] = new Tile(tileX, tileY, tileW, tileH);
        tileX += tileW; }
      tileY += tileH; } }
  
  // Display the Board
  public void render(){
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        grid[r][c].render(); } } }

  // Returns tile at given cordinates
  public Tile getTile(int x, int y) {
    return grid[y / (height / rows)][x / (width / cols)]; }

  // Getters
  public int getRows() { return this.rows; }
  public int getCols() { return this.cols; }
}
