PImage referencia;

int columnas = 12;
int filas = 10;

float tamX;
float tamY;

float rotacion = 0;


void setup() {

  size(800, 400);

  referencia = loadImage("foto.jpeg");

  tamX = 400 / columnas;
  tamY = 400 / filas;
}


void draw() {

  background(120);

  // Imagen de referencia a la izquierda
  image(referencia, 0, 0, 400, 400);

  // mi trabajo
  for (int j = 0; j < filas; j++) {

    for (int i = 0; i < columnas; i++) {

      float x = 400 + i * tamX;
      float y = j * tamY;

      float brillo;

      if (mousePressed) {

        brillo = calcularBrillo(x, y);
 } 
      else {
      brillo = 255;
    }

      pushMatrix();

      translate(x + tamX/2, y + tamY/2);

      rotate(rotacion);

      dibujarCelda(
        -tamX/2,
        -tamY/2,
        tamX,
        tamY,
        brillo,
        j
      );

      popMatrix();
    }
  }
}


// funcion que retorna valor

float calcularBrillo(float x, float y) {

  float distancia;

  distancia = dist(mouseX, mouseY, x, y);

  return map(distancia, 0, 200, 255, 50);
}


// funcion que no retorna valor

void dibujarCelda(
  float x,
  float y,
  float ancho,
  float alto,
  float brilloBase,
  int fila
) {

  for (int k = 0; k < ancho; k++) {

    float colorLinea;

    if (fila % 2 == 0) {

      colorLinea =
        map(k, 0, ancho, brilloBase, 0);

    } else {

      colorLinea =
        map(k, 0, ancho, 0, brilloBase);
    }

    stroke(colorLinea);

    line(
      x + k,
      y,
      x + k,
      y + alto
    );
  }

  noFill();
  stroke(0);
  rect(x, y, ancho, alto);
}


// con teclado

void keyPressed() {

  if (key == 'a' || key == 'A') {

    rotacion = rotacion + 0.05;
  }

  else if (key == 'd' || key == 'D') {

    rotacion = rotacion - 0.05;
  }

  else if (key == ' ') {

    rotacion = random(-0.2, 0.2);
  }

  else if (key == 'r' || key == 'R') {

    rotacion = 0;
  }
}
