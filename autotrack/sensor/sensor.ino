void setup( ) {
Serial.begin(9600) ; // I ni ci am o s e l pue r t o s e r i e a 9600 b audi o s
pinMode ( 2 , INPUT) ;
pinMode ( 3 , INPUT) ;
}
void loop( ) {
Serial.print(digitalRead(2));
Serial.print(',');
Serial.println (digitalRead(3));
delay(100);
}