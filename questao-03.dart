/* 3) Dado um vetor que guarda o valor de faturamento diário de uma distribuidora de todos os dias de um ano, faça um programa, na linguagem que desejar, que calcule e retorne:

- O menor valor de faturamento ocorrido em um dia do ano;
- O maior valor de faturamento ocorrido em um dia do ano;
- Número de dias no ano em que o valor de faturamento diário foi superior à média anual.

a) Considerar o vetor já carregado com as informações de valor de faturamento.

b) Podem existir dias sem faturamento, como nos finais de semana e feriados. Estes dias devem ser ignorados no cálculo da média.

c) Utilize o algoritmo mais veloz que puder definir. */

void main() {
  List<double> faturamentoDiario = [
    1500.0, 2000.0, 0.0, 1800.0, 2200.0, 0.0, 0.0, 
  ];
  
  var resultado = calcularEstatisticas(faturamentoDiario);
  
  print('Menor faturamento: R\$ ${resultado.menor.toStringAsFixed(2)}');
  print('Maior faturamento: R\$ ${resultado.maior.toStringAsFixed(2)}');
  print('Dias acima da média: ${resultado.diasAcimaMedia}');
}

class ResultadoEstatisticas {
  final double menor;
  final double maior;
  final int diasAcimaMedia;

  ResultadoEstatisticas(this.menor, this.maior, this.diasAcimaMedia);
}

ResultadoEstatisticas calcularEstatisticas(List<double> faturamento) {
  double menor = faturamento.firstWhere((valor) => valor > 0);
  double maior = menor;
  double soma = 0;
  int diasComFaturamento = 0;
  
  for (var valor in faturamento) {
    if (valor > 0) { 
      if (valor < menor) menor = valor;
      if (valor > maior) maior = valor;
      soma += valor;
      diasComFaturamento++;
    }
  }
  
  double media = soma / diasComFaturamento;
  
  int diasAcimaMedia = 0;
  for (var valor in faturamento) {
    if (valor > media) diasAcimaMedia++;
  }
  
  return ResultadoEstatisticas(menor, maior, diasAcimaMedia);
}
