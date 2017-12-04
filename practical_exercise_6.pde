/**
  * Code build as a demo for the multimodal course at Aarhus University
  */

import ddf.minim.*;
import ddf.minim.ugens.*;


//Textstuff
String[] lines;
int index = 0;

//STD Values
final int NO_VALUE = -200; //The value in the set representing no reading 
final int[] DATA_COLUMNS = {6, 3, 10}; ////The columns from the data that we want to play 
final String DATASET = "AirQualityUCI.csv"; // Name of thje csv file
final int MAX_VALUE = 2214;
final int MIN_VALUE = 383;
final int UNCERTAIN = 800;



void setup()
{
  size(512, 200, P3D);
 
  
}

void draw()
{
 
  playSoundFOrAllColumns();

}



void playSoundFOrAllColumns() { 
 
  
    for(int i = 0; i < DATA_COLUMNS.length; i++) {
    
      loadLineAndGenrateSound(DATA_COLUMNS[i]);
      //println(DATA_COLUMNS[i]);
 
      
    }
}
  
  void loadLineAndGenrateSound(int column) {
   
    String[] pieces = split(lines[index], ';');
    String datapoint = pieces[column];
        
    int datanumber = int(datapoint);
    
    if(datanumber == NO_VALUE) {
    
      //Do stuff with no value
      println("SKIPPED");
    
  } else {
    
      println(datapoint);
      
      
      float sound =  map(datanumber, 383, 2214, 10, 5000); 
    
      checkSoundSetVolume(datanumber);
      
      wave.setFrequency(sound);
   
    
    
    }
  }
  