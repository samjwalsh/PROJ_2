// C. Quinn, Created class for filter screen, 11:30, 29/03/2024

class CheckBox {
  int x, y, count, changingY, selectAllXPos;
  color selectedColour;
  boolean selectAll;
  boolean multiSelect;
  boolean[] selected;
  String title;
  String[] lables;
  int[] xValues;
  int countTrue;


  CheckBox(int x, int y, int count, color selectedColour, String title, String[] lables, boolean multiSelect) {
    this.x = x;
    this.y = y;
    this.count = count;
    this.selectedColour = selectedColour;
    this.title = title;
    this.lables = lables;
    this.multiSelect =multiSelect;
    selected = new boolean[count];
    xValues = new int[count];
    changingY = y+20;
    for (int i = 0; i < selected.length; i++) {
      if (multiSelect) {
        selected[i] = true;
      } else {
        selected[i] = false;
        selected[0] = true;
      }
      xValues[i] = changingY;
      changingY+=30;
    }
    if (multiSelect) {
      selectAll = true;
    } else {
      selectAll = true;
    }

    if (title.equals("Airlines")) {
      selectAllXPos = x+115;
    } else {
      selectAllXPos = x+125;
    }
    countTrue = count;
  }

  void draw() {
    if (countTrue == count) {
      selectAll = true;
    } else {
      selectAll = false;
    }
    fill(255);
    if (multiSelect) {
      ellipse(selectAllXPos+80, y-5, 15, 15);
      if (selectAll) {
        fill(selectedColour);
        ellipse(selectAllXPos+80, y-5, 10, 10);
      }
    }
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(title, x, y);
    textSize(15);
    if (multiSelect) {
      text("Select All", selectAllXPos, y);
    }
    for (int i = 0; i<selected.length; i++) {
      fill(255);
      ellipse(x, xValues[i], 15, 15);
      fill(0);
      text(lables[i], x+20, xValues[i]+4);
      if (selected[i]) {
        fill(selectedColour);
        ellipse(x, xValues[i], 10, 10);
      }
    }
  }



  void runMousePressed(int mx, int my) {
    if (multiSelect) {
      if (dist(mx, my, selectAllXPos+80, y-5)<8) {
        countTrue = count;
        for (int i = 0; i<selected.length; i++) {
          selected[i] = true;
        }
      }
    }
    for (int i = 0; i<selected.length; i++) {

      if (dist(mx, my, x, xValues[i])<8) {
        if (!multiSelect) {
          for (int j = 0; j<selected.length; j++) {
            selected[j] = false;
            countTrue--;
          }
        }
        if (selected[i] && multiSelect) {
          selected[i]=false;
          countTrue--;
        } else {
          selected[i]=true;
          countTrue++;
        }
      }
    }
  }
}
