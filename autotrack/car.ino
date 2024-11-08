#include <SoftwareSerial.h>

SoftwareSerial BT(10, 11);

const int pinENA = 5;
const int pinENB = 6;
const int pinIN4 = 7;
const int pinIN3 = 8;
const int pinIN2 = 9;
const int pinIN1 = 10;
const int pinMotorA[3] = {pinENA, pinIN1, pinIN2};
const int pinMotorB[3] = {pinENB, pinIN3, pinIN4};

const double kp = 4;
const double Ti = 1;
const double Tm = 0.3;
const double Td = 0;
double error,salida,sum_ek;
double prev_error = 0;
const double max_integral = 100;
static int speed=200;
int vec_cny70[5];
static int anga;

void setup() {
  pinMode(pinIN1, OUTPUT);
  pinMode(pinIN2, OUTPUT);
  pinMode(pinENA, OUTPUT);
  pinMode(pinIN3, OUTPUT);
  pinMode(pinIN4, OUTPUT);
  pinMode(pinENB, OUTPUT);
  BT.begin(9600);
  
}

void loop() {
  int angulo= get_ang();
  int d = pid_control(0, angulo);
  set_speed(speed,d);
  BT.println(angulo);

/*
  if (error == 36 || error == -36)
    set_speed(180, 0);
  else if (error == 0)
    set_speed(255, d);
  else if (error == 5 || error == -5)
    set_speed(240, d);
  else if (error == 10 || error == -10)
    set_speed(220, d);
  else if (error == 15 || error == -15)
    set_speed(215, d);
  else if (error == 20 || error == -20)
    set_speed(210, d);
  else if (error == 25 || error == -25)
    set_speed(205, d);
*/
  delay(2);
}

int pid_control(double ref, double phi) {
  error = ref - phi;
  sum_ek+=error;
if (sum_ek > 150)
    sum_ek = 150;  
  else if (sum_ek < -150)
    sum_ek = -150;
  if(error<25&&error>-25)
  salida = kp*(error-sum_ek*Tm/Ti);
  else {
  
  
  salida = kp*(error+sum_ek*Tm/Ti);
  }
  return salida;
}

void move(const int pinMotor[3], int speed) {
  if (speed < 0) {
    digitalWrite(pinMotor[1], HIGH);
    digitalWrite(pinMotor[2], LOW);
    analogWrite(pinMotor[0], -speed);
  } else if (speed > 0) {
    digitalWrite(pinMotor[1], LOW);
    digitalWrite(pinMotor[2], HIGH);
    analogWrite(pinMotor[0], speed);
  } else {
    digitalWrite(pinMotor[1], LOW);
    digitalWrite(pinMotor[2], LOW);
    analogWrite(pinMotor[0], 0);
  }
}

void set_speed(int v, int d) {
  int vi = constrain(v - d, -255, 255);
  int vd = constrain(v + d + 50, -255, 255);
if(vi<0)
vi=0;
if(vd<0)
vd=0;

  move(pinMotorA, vd);
  move(pinMotorB, vi);
}

