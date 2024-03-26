import java.util.Calendar;
import java.text.SimpleDateFormat;
import grafica.*;
import java.util.Random;
import javax.swing.JOptionPane;

Histogram theHistogram;
GPlot histogram;
Query query = new Query();
Filter newFilter = new Filter();

void setup() {
  size(1000, 660);
  DataReader dataReader = new DataReader("flights2k.csv");
  ArrayList<DataPoint> data = dataReader.readFile();
  println(data.size());
  //String airport = JOptionPane.showInputDialog("Enter Airport");
  String airport = "HNL";
  data = newFilter.isLateLeaving(data);
  int[] flightDistances = query.flightDistances(data, airport);
  Table table = query.flightsByDoW(data);
  saveTable(table, "data/new.csv");
  
  histogram = new GPlot(this);
  theHistogram = new Histogram(10,10,500,500, histogram);
  theHistogram.setData(flightDistances, "Flight From "+airport, "Distance Flown", "Number of Flights"); //<>//
  

}

void draw() {
  theHistogram.draw();
}
