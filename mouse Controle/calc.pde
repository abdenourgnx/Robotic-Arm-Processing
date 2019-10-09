import java.math.*;

class Calc {
double lawOfCos( double a , double b , double c ){
  return Math.acos( (a*a + b*b - c*c ) / (2* a *b ) );  
}

double distance(float x, float y){
  return(Math.sqrt(x*x + y*y));
}

}
