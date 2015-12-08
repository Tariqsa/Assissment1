//Tariq Almulhim - DT228-2 - D13125313
// Assessment 1


// call the menu
menu menu;
int menuLocation =0;
PImage b;

void setup(){
  size(1024,768);
  // background Image
  b=loadImage("Cloud.png");
  
  //Menu System
  menu = new menu();
}
void draw(){
  //Background cloud
  background(b);
  
  //The Menu
  
  if(menuLocation==0){
    menuLocation=menu.mainMenu();
  }// Load the data
  if(menuLocation == 1){ 
    menuLocation=menu.loadData();
  }//show the linechart by date
  if(menuLocation == 2) {
    menuLocation=menu.plot_date(this);
  }//show the linechart in Avg
  if(menuLocation == 3){ 
    menuLocation=menu.plot_lat(this);
  }//show the linechart in Future
  if(menuLocation == 4){ 
    menuLocation=menu.plot_long(this);
  }
}