Filter newFilter;
void setup() {
    size(1200,800);
    DataReader dataReader = new DataReader("flights2k.csv");
    ArrayList<DataPoint> data = dataReader.filterData("");
}

void draw() {
    rect(50,50,50,50);    
}
