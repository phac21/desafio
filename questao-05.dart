/*
5) Dois veículos, um carro e um caminhão, saem respectivamente de cidades opostas pela mesma rodovia. O carro, de Ribeirão Preto em direção a Barretos, a uma velocidade constante de 90 km/h, e o caminhão, de Barretos em direção a Ribeirão Preto, a uma velocidade constante de 80 km/h. Quando eles se cruzarem no percurso, qual estará mais próximo da cidade de Ribeirão Preto?

a) Considerar a distância de 125km entre a cidade de Ribeirão Preto <-> Barretos.
b) Considerar 3 pedágios como obstáculo e que o carro leva 5 minutos a mais para passar em cada um deles, pois ele não possui dispositivo de cobrança de pedágio.
c)Explique como chegou no resultado.

Os veículos estarão à mesma distância de Ribeirão Preto no momento do encontro. Isso ocorre porque:
O ponto de encontro é determinado pela razão entre as velocidades efetivas
As paradas nos pedágios afetam a velocidade média do caminhão
Como os veículos partem de pontos opostos e se movem um em direção ao outro, eles se encontrarão exatamente no meio do caminho
Portanto, quando se cruzarem, ambos os veículos estarão à mesma distância de Ribeirão Preto.
*/

void main() {
  double distanciaTotal = 125.0;  // km
  double velocidadeCarro = 90.0;  // km/h
  double velocidadeCaminhao = 80.0;  // km/h
  int numeroPedagios = 3;
  double tempoPedagioEmHoras = 5.0 / 60;
  
  double tempoTotalPedagios = numeroPedagios * tempoPedagioEmHoras;
  
  double tempoViagem = distanciaTotal / velocidadeCaminhao + tempoTotalPedagios;
  double velocidadeEfetivaCaminhao = distanciaTotal / tempoViagem;
  
  double velocidadeRelativa = velocidadeCarro + velocidadeEfetivaCaminhao;
  
  double tempoAteEncontro = distanciaTotal / velocidadeRelativa;
  
  double distanciaCarro = velocidadeCarro * tempoAteEncontro;
  double distanciaCaminhao = velocidadeEfetivaCaminhao * tempoAteEncontro;
  
  double distanciaCarroAteRP = distanciaCarro;
  double distanciaCaminhaoAteRP = distanciaTotal - distanciaCaminhao;
  
  print('Distância do carro até Ribeirão Preto: ${distanciaCarroAteRP.toStringAsFixed(2)} km');
  print('Distância do caminhão até Ribeirão Preto: ${distanciaCaminhaoAteRP.toStringAsFixed(2)} km');
}

