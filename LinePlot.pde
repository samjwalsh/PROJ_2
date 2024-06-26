// M.Murphy, LinePlot class created to create and draw a Line Plot for flight dates, 23:00, 03/04/2024

class LinePlot {
  int x;
  int y;
  int pWidth;
  int pHeight;
  GPlot linePlot;
  GPointsArray pPoints;
  int[] data;
  int[] dataRange;
  String chartTitle;
  String xTitle;
  String yTitle;

  LinePlot(int x, int y, int pWidth, int pHeight, PApplet parent) {
    this.x = x;
    this.y = y;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    this.linePlot = new GPlot(parent);
  }

// Takes data filtered in range that was counted in data[] to create the line plot.
  void setData(int[] data, int[] dataRange, String chartTitle, String xTitle, String yTitle) {
    int max = dataRange[1];
    int min = dataRange[0];
// Ticks on x-axis chosen based on points     
    int ticks = data.length;
    String[] days = new String[ticks];
// Ticks changed to String in date format    
    for (int i = 0; i < ticks; i++) {
      if (dataRange[0]+i < 10) {
        days[i] = "0"+String.valueOf(dataRange[0]+i);
      } else days[i] = String.valueOf(dataRange[0]+i);
    }
    pPoints = new GPointsArray(ticks);
    int maxHeight = 0;
// Points added using grafica and the already counted data array    
    for (int i = 0; i < ticks; i++) {
      pPoints.add(dataRange[0]+i, data[i]);
      if (maxHeight < data[i]) maxHeight = data[i];
    }
// Ticks reformatted so they can be used by .setTicks(float[]) function later    
    float[] xAxisTicks = new float[ticks];
    for (int i = min; i <= max; i++) {
      xAxisTicks[-min+i] = i;
    }
// grafica used to set points and format line plot
    linePlot.setPos(x, y);
    linePlot.setDim(pWidth, pHeight);
    linePlot.setXLim(min, max);
    linePlot.setYLim(0, maxHeight+(int)maxHeight/10);
    linePlot.getXAxis().setTicks(xAxisTicks);
    linePlot.getYAxis().setNTicks(10);
    linePlot.getTitle().setText(chartTitle);
    linePlot.getXAxis().getAxisLabel().setText(xTitle);
    linePlot.getYAxis().getAxisLabel().setText(yTitle);
    linePlot.setPoints(pPoints);
  }

  public void draw() {
    linePlot.beginDraw();
    linePlot.drawBox();
    linePlot.drawXAxis();
    linePlot.drawYAxis();
    linePlot.drawTitle();
    linePlot.drawGridLines(GPlot.BOTH);
    linePlot.drawPoints();
    linePlot.drawLines();
    linePlot.endDraw();
  }
}
