Class {
	#name : 'MudanzaLocal',
	#superclass : 'Mudanza',
	#instVars : [
		'distancia',
		'realizarCarga',
		'realizarDescarga'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'class' }
MudanzaLocal class >> crear: desc conNombre: nombre conValorBase: valorBase conValorAdicional: valorAdicional conDistanciaMax: distanciaMax conDistancia:distancia realizarCarga: carga realizarDescarga:descarga [
| mudanzaLocal |

mudanzaLocal := self new.
mudanzaLocal iniciar: desc conNombre: nombre conValorBase: valorBase conValorAdicional: valorAdicional  yDistanciaMax: distanciaMax conDistancia: distancia realizarCarga: carga realizarDescarga: descarga .

^ mudanzaLocal 
]

{ #category : 'as yet unclassified' }
MudanzaLocal >> calcularMonto [
^0
]

{ #category : 'as yet unclassified' }
MudanzaLocal >> devolverListaDatos [
| listado textoSeguro textoValorTramite textoValorTransporte|
listado := super devolverListaDatos .
textoSeguro := 'distancia:' asString , distancia asString.
textoValorTramite := 'se realiza carga: ' asString , realizarCarga  asString.
textoValorTransporte := 'se realiza descarga:' asString ,  realizarDescarga asString.
listado add: textoSeguro  .
listado add: textoValorTramite  .
listado add: textoValorTransporte  .
^ listado
]

{ #category : 'as yet unclassified' }
MudanzaLocal >> esInternacional [
^false 
]

{ #category : 'as yet unclassified' }
MudanzaLocal >> esLocal [
^true
]

{ #category : 'as yet unclassified' }
MudanzaLocal >> esNacional [
^false
]

{ #category : 'initialization' }
MudanzaLocal >> iniciar: desc conNombre:  unnombre conValorBase: unvalorBase conValorAdicional: unvalorAdicional  yDistanciaMax: unadistanciaMax conDistancia: unadistancia realizarCarga: carga realizarDescarga: descarga [
self iniciar: desc conNombre: unnombre conValorBase: unvalorBase conValorAdicional: unvalorAdicional  yDistanciaMax: unadistanciaMax.
distancia := unadistancia.
realizarCarga := carga .
realizarDescarga := descarga .
]

{ #category : 'initialization' }
MudanzaLocal >> mostrarDatos [

	^ super mostrarDatos , ', distancia: ' asString , distancia asString
	  , ', realizan carga: ' asString , realizarCarga asString
	  , ', realizan descarga:' asString , realizarDescarga asString
	  , ', tipo: mudanza local |' asString
]

{ #category : 'as yet unclassified' }
MudanzaLocal >> vefCancelacion: unaFecha [
|rta fecha|
fecha:= Date today.
rta:= (unaFecha subtractDate: fecha).
^ rta >= 1.
]

{ #category : 'initialization' }
MudanzaLocal >> verificarTipoTransporte [

]
