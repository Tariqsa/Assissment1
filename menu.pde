//import gicenter library
import org.gicentre.utils.stat.*;
//declear a class Menu
class menu {
  Table table;
  BarChart barChart;
  XYChart lineChart;

  menu() {
    
    textAlign(CENTER);
    imageMode(CENTER);
  }

  int mainMenu() {
    fill(0);
    textSize(50);
    text("Weather Analyzer!", width/2, 200);
    text("You Must Load The Data First", width/2, 547);
    textSize(40);
    fill(50);

    //load data
    if (mouseX>((width/2)-100) && mouseY >280 && mouseX < ((width/2)+100) && mouseY < 320) {
      fill(255);
      if (mousePressed) return 1;
    } else { 
      fill(50);
    }
    text("Load Data", width/2, 300);

    //by date
    if (mouseX>((width/2)-100) && mouseY >320 && mouseX < ((width/2)+100) && mouseY < 360) {
      fill(255);
      if (mousePressed) return 2;
    } else { 
      fill(50);
    }
    text("Temp By Date", width/2, 340);

    //by latitude
    if (mouseX>((width/2)-100) && mouseY >360 && mouseX < ((width/2)+100) && mouseY < 400) {
      fill(255);
      if (mousePressed) return 3;
    } else { 
      fill(50);
    }
    text("Avrage Temp ", width/2, 380);

    //by longitude
    if (mouseX>((width/2)-100) && mouseY >400 && mouseX < ((width/2)+100) && mouseY < 440) {
      fill(255);
      if (mousePressed) return 4;
    } else { 
      fill(50);
    }
    text("Future Temp", width/2, 420);
    return 0;
  }
  // Load Data From The File
  int loadData() {
    table = loadTable("NORMAL_MLY.csv", "header");
    fill(0,255,0);
    text("Data has been Loaded", width/2, 600);
    return 0;
  }
  //Plot the Date Data
  int plot_date(PApplet r) {
    fill(2);
    text("The Temp For 2012 in USA", width/2, 74); 
    text("Back", width/2, 700);
    //To Make sure the Data load First before Draw
    if (table==null) {
      fill(252,5,5);
      text("Please load the data first!!!", width/2, height/2);
    } else {
      fill(255);
      lineChart = new XYChart(r);
      float[] mintempdata=new float[table.getRowCount()];
      float[] maxtempdata=new float[table.getRowCount()];
      float[] longdata=new float[table.getRowCount()];
      int i=0;
      float min_temp=9999999, max_temp=-9999999;
      float min_date=9999999, max_date=-9999999;
      for (TableRow row : table.rows()) {
        mintempdata[i]=row.getInt("MLY-TMIN-NORMAL");
        maxtempdata[i]=row.getInt("MLY-TMAX-NORMAL");
        longdata[i]=row.getFloat("DATE");

        if (longdata[i]>max_date) {
          max_date=longdata[i];
        }
        if (longdata[i]<min_date) {
          min_date=longdata[i];
        }

        if (maxtempdata[i]>max_temp) {
          max_temp=maxtempdata[i];
        }
        if (mintempdata[i]<min_temp) {
          min_temp=mintempdata[i];
        }
        i++;
      }
      // Axis formatting and labels.
      //noStroke();
      rect(10, 150, width-15, height-334);
      
      textSize(20);
      lineChart.showXAxis(true); 
      lineChart.showYAxis(true);
      
      lineChart.setMinX(min_date);
      lineChart.setMaxX(max_date);
      

      lineChart.setMinY(min_temp);
      lineChart.setMaxY(max_temp);
      // Symbol colours
      
      lineChart.setData(longdata, mintempdata);
      lineChart.setPointColour(color(23, 24, 35, 100));
      lineChart.setLineColour(color(51, 54, 189, 100));
      lineChart.setPointSize(10);
      lineChart.setLineWidth(10);
      
      lineChart.draw(20, 150, width-24, height-345);
      
      lineChart.setData(longdata, maxtempdata);
      lineChart.setPointColour(color(52, 25, 29, 100));
      lineChart.setLineColour(color(248, 9, 43, 100));
      lineChart.setPointSize(10);
      lineChart.setLineWidth(11);

      lineChart.draw(20, 150, width-24, height-345);
    }

    if (mouseX>((width/2)-100) && mouseY>680 && mouseX < ((width/2)+100) && mouseY < 720) {
      fill(150);
      if (mousePressed) return 0;
    }
    return 2;
  }

  int plot_lat(PApplet r) {
    fill(0);
    text("The Avrage Temp In 2012 In USA", width/2, 74);
    text("Back", width/2, 700);
    if (table==null) {
      fill(254,5,5);
      text("Please load the data first!!!", width/2, height/2);
    } else {
      fill(11);
      lineChart = new XYChart(r);
      float[] mintempdata=new float[table.getRowCount()];
      float[] maxtempdata=new float[table.getRowCount()];
      float[] longdata=new float[table.getRowCount()];
      int i=0;
      float min_temp=9999999, max_temp=-9999999;
      float min_date=9999999, max_date=-9999999;
      for (TableRow row : table.rows()) {
        mintempdata[i]=row.getInt("MLY_AVG");
        maxtempdata[i]=row.getInt("MLY_AVG");
        longdata[i]=row.getFloat("MONTHS");

        if (longdata[i]>max_date) {
          max_date=longdata[i];
        }
        if (longdata[i]<min_date) {
          min_date=longdata[i];
        }

        if (maxtempdata[i]>max_temp) {
          max_temp=maxtempdata[i];
        }
        if (mintempdata[i]<min_temp) {
          min_temp=mintempdata[i];
        }
        i++;
      }
      // Axis formatting and labels.
      noStroke();
      rect(8, 139, width-19, height-326);
      
      textSize(20);
      lineChart.showXAxis(true); 
      lineChart.showYAxis(true);
      lineChart.setMinX(min_date);
      lineChart.setMaxX(max_date);
      

      lineChart.setMinY(min_temp);
      lineChart.setMaxY(max_temp);
      // Symbol colours
      lineChart.setData(longdata, mintempdata);
      lineChart.setPointColour(color(240, 203, 219, 100));
      lineChart.setLineColour(color(51, 54, 189, 100));
      lineChart.setPointSize(28);
      lineChart.setLineWidth(6);
      
      lineChart.draw(20, 150, width-100, height-351);
      

      lineChart.setData(longdata, maxtempdata);

      lineChart.setPointColour(color(244, 234, 236, 100));
      lineChart.setLineColour(color(248, 9, 43, 100));
      lineChart.setPointSize(10);
      lineChart.setLineWidth(11);

      lineChart.draw(20, 150, width-100, height-351);
    }

    if (mouseX>((width/2)-100) && mouseY>680 && mouseX < ((width/2)+100) && mouseY < 720) {
      fill(150);
      if (mousePressed) return 0;
    }
    return 3;
  }

  int plot_long(PApplet r) {
    fill(0);
    text("The Future Temp In 2013 In USA", width/2, 74);
    text("Back", width/2, 700);
    if (table==null) {
      fill(247,11,11);
      text("Please load the data first!!!", width/2, height/2);
    } else {
      fill(209,198,198);
      lineChart = new XYChart(r);
      float[] mintempdata=new float[table.getRowCount()];
      float[] maxtempdata=new float[table.getRowCount()];
      float[] longdata=new float[table.getRowCount()];
      int i=0;
      float min_temp=9999999, max_temp=-9999999;
      float min_date=9999999, max_date=-9999999;
      for (TableRow row : table.rows()) {
        mintempdata[i]=row.getInt("MLY_FUTURE");
        maxtempdata[i]=row.getInt("MLY_FUTURE");
        longdata[i]=row.getFloat("MONTHS-F");

        if (longdata[i]>max_date) {
          max_date=longdata[i];
        }
        if (longdata[i]<min_date) {
          min_date=longdata[i];
        }

        if (maxtempdata[i]>max_temp) {
          max_temp=maxtempdata[i];
        }
        if (mintempdata[i]<min_temp) {
          min_temp=mintempdata[i];
        }
        i++;
      }
      // Axis formatting and labels.
      noStroke();
      rect(10, 150, width-14, height-345);
      
      textSize(20);
      lineChart.showXAxis(true); 
      lineChart.showYAxis(true);
      lineChart.setMinX(min_date);
      lineChart.setMaxX(max_date);
      

      lineChart.setMinY(min_temp);
      lineChart.setMaxY(max_temp);
      // Symbol colours
      lineChart.setData(longdata, mintempdata);
      lineChart.setPointColour(color(35, 220, 56, 100));
      lineChart.setLineColour(color(189, 187, 51, 100));
      lineChart.setPointSize(34);
      lineChart.setLineWidth(32);
      
      lineChart.draw(20, 150, width-100, height-351);
      

      lineChart.setData(longdata, maxtempdata);

      lineChart.setPointColour(color(14, 13, 13, 100));
      lineChart.setLineColour(color(186, 27, 53, 100));
      lineChart.setPointSize(34);
      lineChart.setLineWidth(32);

      lineChart.draw(20, 150, width-100, height-351);
    }

    if (mouseX>((width/2)-100) && mouseY>680 && mouseX < ((width/2)+100) && mouseY < 720) {
      fill(150);
      if (mousePressed) return 0;
    }
    return 4;
  }
}