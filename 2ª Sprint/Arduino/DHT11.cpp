// comandos de inclusão da biblioteca e configuração dos sensores
#include "DHT.h" // inclui a biblioteca com os sensores DHT
#define dht_type DHT11 // define o sensor como o DHT11
int dht_pin = A2;
DHT dht_1 = DHT(dht_pin, dht_type);

// definição e execução do código
void setup() {
    Serial.begin(9600); // inicia o sistema
    dht_1.begin(); // inicia o sensor
}

// código de repetição
void loop() {
    float umidade = dht_1.readHumidity(); // variável que faz a leitura da umidade
    float temperatura = dht_1.readTemperature(); // variável que faz a leitura da temperatura

    if (isnan(temperatura) or isnan(umidade)) { 
                // operação condicional, para conferir se há erro nas leituras de dados
        Serial.println("Erro!!!");
    } else {
        Serial.print("Umidade: ");
        Serial.print(umidade);
        Serial.print("% // ");
        Serial.print("Temperatura: ");
        Serial.print(temperatura);
        Serial.println("ºC");
          // impressão de strings e dados na tela
    }
    delay(1000); // tempo de re-execução da function loop()
}