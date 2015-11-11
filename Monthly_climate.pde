ArrayList<String> NORMAL_MLY ;

void setup()
{
   size(800,800);
   smooth();
   loaddata();
}

void loaddata()
{
  String[] lines = loadStrings("NORMAL_MLY.csv");
  for (int i=0; i<lines.length; i++)
  {
    NORMAL_MLY = new ArrayList<String>();
    println(lines[i]);
  }
}