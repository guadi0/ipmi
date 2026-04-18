PImage miImagen;

void setup(){
  size(800, 400);
  miImagen = loadImage("arco.png");
}
void draw() { 
  background(255);
  
  //imagen original
  image(miImagen, 0, 0, 400, 400);


// DIBUJO (DERECHA)
// 
pushMatrix();
translate(400, 0);

//  CIELO 
noStroke();
fill(135, 206, 235);
rect(0, 0, 400, 400);

//  SUELO
fill(60);
rect(0, 310, 400, 90);

// COLOR BASE DEL ARCO 
fill(235, 215, 170);
stroke(200, 180, 140);
strokeWeight(2);

//  CUERPO PRINCIPAL 
rect(100, 120, 200, 190);

//  COLUMNAS 
rect(100, 150, 40, 160);
rect(260, 150, 40, 160);

// TECHO 
rect(90, 95, 220, 30);
rect(100, 70, 200, 25); // alineado
rect(100, 50, 200, 20);

// SOMBRA BAJO EL TECHO 
noStroke();
fill(200, 180, 140, 120);
rect(100, 120, 200, 10);

// DETALLES HORIZONTALES 
stroke(210, 190, 150);
line(110, 140, 290, 140);
line(115, 110, 285, 110);
line(120, 80, 280, 80);

// HUECO DEL ARCO
noStroke();
fill(135, 206, 235);
arc(200, 240, 100, 140, PI, TWO_PI);
rect(150, 240, 100, 70);



popMatrix();
}
