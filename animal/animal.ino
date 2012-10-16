int ledPWM[3] = {
  11,9,6};  


int val = 0;
int old_val = 0;
int state = 0;
int buttonState = 0;   
void setup() { 



} 

void loop () { 

  for(int j=0;j<3;j++){

    for(int i=0;i<255;i+=5){ 

      analogWrite(ledPWM[j],i);

      delay(3.5);

    }

  }

  for(int j=0;j<3;j++){

    for(int i=255;i>=0;i-=5){ 

      analogWrite(ledPWM[j],i);

      delay(3.5);
 
  }
   }
 
}





