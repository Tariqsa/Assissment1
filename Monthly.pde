class monthly
{
  String station;
  String station_name;
  Float elevation;
  Float lattitude;
  Float longitude;
  int date;
  int mly_tmin_normal;
  int mly_tmax_normal;
  

  monthly(String line)
  {
    String[] parts = line.split("\t");
    
    station=parts[0];
    station_name=parts[1];
    elevation=Float.parseFloat(parts[2]);
    lattitude=Float.parseFloat(parts[3]);
    longitude=Float.parseFloat(parts[4]);
    date=Integer.parseInt(parts[5]);
    mly_tmin_normal=Integer.parseInt(parts[6]);
    mly_tmax_normal=Integer.parseInt(parts[7]);
    
  }
}