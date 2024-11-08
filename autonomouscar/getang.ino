int get_ang()
{
  int umbral = 700;
  vec_cny70[0] =analogRead(A5);
  vec_cny70[1] =analogRead(A4);
  vec_cny70[2] =analogRead(A3);
  vec_cny70[3] =analogRead(A2);
  vec_cny70[4] =analogRead(A1);
  vec_cny70[5] =analogRead(A0);
  
  int valor [] = {0,1};
  
  for(int i = 0; i <6 ; i++ ){
  if (vec_cny70[i] < umbral){
     vec_cny70[i]=valor[0];
  }
  else if(vec_cny70[i] >= umbral){
    vec_cny70[i]=valor[1];
    }
  }
int ang=0;
int n=0;  
for(int i=0; i<6; i++){
 ang+=vec_cny70[i]*10*(i+1);
 n+=vec_cny70[i];
}
ang=ang/n;
ang=ang-35;

if(n==0){
 if(anga>=25){
  ang=30;
 }
 else if(anga<=-25){
  ang=-30;
 }
}
return(ang);
}
