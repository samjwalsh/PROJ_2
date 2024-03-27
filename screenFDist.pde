// S. Walsh, Created screen class for showing flights by distance, 22:00 26/03/2024

class ScreenFDist extends Screen {
  Histogram histogram;
  ScreenFDist(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));

    String airport = "JFK";
    data = Filter.isLateLeaving(data);
    int[] flightDistances = query.flightDistances(data, airport);
    histogram = new Histogram(250, 10, 600, 600, parent);
    histogram.setData(flightDistances, "Flight From "+airport, "Distance Flown", "Number of Flights");
  }
  void draw() {
    background(120, 0, 255);
    drawWidgets();
          histogram.draw();

  }
}