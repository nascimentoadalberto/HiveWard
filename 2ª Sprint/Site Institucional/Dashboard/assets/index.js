var context = document.getElementById("chart").getContext("2d");
		context.canvas.width = 1000;
		context.canvas.height = 300;
        
        var configuration = {
			type: 'line',
			data: {
				datasets: [{
					label: "Temperatura x Tempo",
					type: 'line',
					borderColor: ['#ff3232'],
					backgroundColor: ['#ff7f7f']
				}]
			},
			options: {
				scales: {
					xAxes: [{
						distribution: 'series',
                        ticks: {
                            beginAtZero:true
                        }
					}],
					yAxes: [{
						scaleLabel: {
							display: true,
							labelString: 'Temperature'
                        },
                        ticks: {
                            beginAtZero:true
                        }
					}]
				},
				animation: {
					duration: 0
				}
			}
        };
        
		var chart = new Chart(context, configuration);

        //Função para obter os dados de temperatura do server
               
        //Esse atributo dentro do contexto serve para saber qual foi o último índice processado, assim eliminado os outros elementos na
        //hora de montar/atualizar o gráfico
        this.lastIndexTemp = 0;
        this.time = 0;

        function get_data(){
			
            var http = new XMLHttpRequest();
            http.open('GET', 'http://localhost:3000/api/temperature', false);
            http.send(null);        
			
            var obj = JSON.parse(http.responseText);
            if (obj.data.length == 0){
                return;
            }

            var _lastIndexTemp = this.lastIndexTemp;
            this.lastIndexTemp = obj.data.length;
            listTemp = obj.data.slice(_lastIndexTemp);
		
            listTemp.forEach(data => {
                //Máximo de 60 itens exibidos no gráfico
                if (chart.data.labels.length == 10 && chart.data.datasets[0].data.length == 10){
                    chart.data.labels.shift();
                    chart.data.datasets[0].data.shift();
                }
                chart.data.labels.push(this.time++);
                chart.data.datasets[0].data.push(parseFloat(data));
                chart.update();
			});
			
			document.getElementById('average').textContent = obj.average;
		} 

		//Second Graphic

		var context2 = document.getElementById("chart-humidity").getContext("2d");
		context2.canvas.width = 1000;
		context2.canvas.height = 300;
        
        var humidity = {
			type: 'line',
			data: {
				datasets: [{
					label: "Umidade x Tempo",
					type: 'line',
					borderColor: ['#3232ff'],
					backgroundColor: ['#9999ff']
				}]
			},
			options: {
				scales: {
					xAxes: [{
						distribution: 'series',
                        ticks: {
                            beginAtZero:true
                        }
					}],
					yAxes: [{
						scaleLabel: {
							display: true,
							labelString: 'Humidity'
                        },
                        ticks: {
                            beginAtZero:true
                        }
					}]
				},
				animation: {
					duration: 0
				}
			}
        };
        
		var chartHumidity = new Chart(context2, humidity);

        //Função para obter os dados de temperatura do server
        
        
        //Esse atributo dentro do contexto serve para saber qual foi o último índice processado, assim eliminado os outros elementos na
        //hora de montar/atualizar o gráfico
        this.lastIndexTempHumidity = 0;
        this.timeHumidity = 0;

        function get_dataHumidity(){

            var http = new XMLHttpRequest();
            http.open('GET', 'http://localhost:3000/api/humidity', false);
            http.send(null);        
			
            var obj = JSON.parse(http.responseText);
            if (obj.data.length == 0){
                return;
            }

            var _lastIndexTemp = this.lastIndexTempHumidity;
            this.lastIndexTempHumidity = obj.data.length;
            listTemp = obj.data.slice(_lastIndexTemp);

            listTemp.forEach(data => {
                //Máximo de 60 itens exibidos no gráfico
                if (chartHumidity.data.labels.length == 10 && chartHumidity.data.datasets[0].data.length == 10){
                    chartHumidity.data.labels.shift();
                    chartHumidity.data.datasets[0].data.shift();
                }

                chartHumidity.data.labels.push(this.time++);
                chartHumidity.data.datasets[0].data.push(parseFloat(data));
                chartHumidity.update();
			});
			
			document.getElementById('averageHumidity').textContent = obj.average;
		} 
		
		get_dataHumidity();

        setInterval(() => {
			get_data();
			get_dataHumidity();
		}, 1000);