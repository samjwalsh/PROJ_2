DataPoint dataPoint;
void setup() {
    size(800,600);
    DataReader dataReader = new DataReader("flights2k.csv");
    dataPoint = new DataPoint("01/01/2022","AA",1,"JFK","New York City","NY",22,"LAX","Los Angeles","CA",91,
      "700","657","1029","1012",false,false,2475);
}

void draw() {
    rect(50,50,50,50);
    //String longString = dataPoint.toString();
    //print(longString);
    
    //print(dataPoint.getFlightDate());
}
