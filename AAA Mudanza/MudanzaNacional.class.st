Class {
	#name : 'MudanzaNacional',
	#superclass : 'Mudanza',
	#instVars : [
		'salidaInterior',
		'valorMercaderiaFragil',
		'valorDistanciaAcordada'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'class' }
MudanzaNacional class >> crear: desc conNombre: nombre conValorBase: valorBase conValorAdicional: valorAdicional conDistanciaMax: distanciaMax salida: unaSalida valorMercaderiaFragil: unValorMer valorDistancia: unValorDist [
| mudanzaNacional |

mudanzaNacional := self new.
mudanzaNacional iniciar: desc conNombre: nombre conValorBase: valorBase conValorAdicional: valorAdicional yDistanciaMax: distanciaMax conSalida: unaSalida conValorMercaderia: unValorMer conValorDistancia: unValorDist .

^ mudanzaNacional 
]

{ #category : 'as yet unclassified' }
MudanzaNacional >> calcularMonto [
^ (valorBase * 0.1)
]

{ #category : 'as yet unclassified' }
MudanzaNacional >> devolverListaDatos [
| listado textoSeguro textoValorTramite textoValorTransporte|
listado := super devolverListaDatos .
textoSeguro := 'salida al interior:' asString ,salidaInterior asString.
textoValorTramite := 'valor de mercaderia fragil: ' asString , valorMercaderiaFragil asString.
textoValorTransporte := 'valor de la distancia:' asString ,  valorDistanciaAcordada asString.
listado add: textoSeguro  .
listado add: textoValorTramite  .
listado add: textoValorTransporte  .
^ listado
]

{ #category : 'as yet unclassified' }
MudanzaNacional >> esInternacional [
^false
]

{ #category : 'as yet unclassified' }
MudanzaNacional >> esLocal [
^ false
]

{ #category : 'as yet unclassified' }
MudanzaNacional >> esNacional [
^ true
]

{ #category : 'initialization' }
MudanzaNacional >> iniciar: desc conNombre: unnombre conValorBase: unvalorBase conValorAdicional: unvalorAdicional yDistanciaMax: undistanciaMax conSalida: unaSalida conValorMercaderia: unValorMer conValorDistancia: unValorDist [
self iniciar: desc conNombre: unnombre conValorBase: unvalorBase conValorAdicional: unvalorAdicional yDistanciaMax: undistanciaMax.
salidaInterior := unaSalida .
valorMercaderiaFragil := unValorMer .
valorDistanciaAcordada := unValorDist .
]

{ #category : 'initialization' }
MudanzaNacional >> iniciar: unaSalida conValorMercaderia: unValorMer conValorDistancia: unValorDist [
salidaInterior := unaSalida .
valorMercaderiaFragil := unValorMer .
valorDistanciaAcordada := unValorDist .
]

{ #category : 'initialization' }
MudanzaNacional >> mostrarDatos [

	^ super mostrarDatos , ', salida del interior: ' asString
	  , salidaInterior asString , ', valor mercaderia fragil: ' asString
	  , valorMercaderiaFragil asString
	  , ', valor distancia acordada: ' asString
	  , valorDistanciaAcordada asString, ', tipo: mudanza nacional |' asString
]

{ #category : 'as yet unclassified' }
MudanzaNacional >> vefCancelacion: unaFecha [
	| dias |
	dias := unaFecha subtractDate: Date today.
	^ dias >= 7
]

{ #category : 'initialization' }
MudanzaNacional >> verificarTipoTransporte [
]
